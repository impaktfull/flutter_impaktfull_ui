// Fails when the public API of impaktfull_ui uses a type of the package that
// apps can not import, or when the README lists something else than what is
// exported.
//
// Everything exported from `lib/impaktfull_ui.dart` is public API. Three
// things are reported:
//
// 1. A type of this package that is used in a signature of the public API (a
//    constructor parameter, a field, a getter, a method, a supertype, a
//    typedef, a type argument, ...) but is not exported. Apps can not name
//    such a type: they can not pass a value, declare a variable or write a
//    callback for it. Types that are only reachable through another missing
//    type are reported in the same run.
// 2. A public class of this package that extends, implements or mixes in an
//    exported abstract class or mixin, but is not exported itself. The
//    abstract type is only useful when apps can use its implementations
//    (for example `ImpaktfullUiImageCropOverlay`).
// 3. `README.md` out of sync with the exports: every name in the
//    "Component List" and "Building Blocks" lists must be exported (and a
//    `Name.constructor` entry must be a constructor of it), the entries must be
//    alphabetical, and every exported widget must be mentioned in the README.
//
// Usage, from the repository root after `flutter pub get`:
//
//   (cd tool/public_api && dart pub get)
//   dart run tool/public_api/bin/check_public_api.dart
//
// Options:
//   <path>               the package root (defaults to the repository root)
//   --list-unexported    also print every public declaration under `lib/src`
//                        that is not exported (informational, never fails)
import 'dart:io';

import 'package:analyzer/dart/analysis/analysis_context.dart';
import 'package:analyzer/dart/analysis/analysis_context_collection.dart';
import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:path/path.dart' as p;

const _packageName = 'impaktfull_ui';
const _barrel = 'lib/impaktfull_ui.dart';

Future<void> main(List<String> args) async {
  final paths = args.where((arg) => !arg.startsWith('--')).toList();
  final root = p.normalize(p.absolute(
    paths.isNotEmpty
        ? paths.first
        : p.join(p.dirname(Platform.script.toFilePath()), '..', '..', '..'),
  ));
  final barrelPath = p.join(root, _barrel);
  if (!File(barrelPath).existsSync()) {
    stderr.writeln('$barrelPath not found, pass the package root as argument.');
    exit(2);
  }

  final collection = AnalysisContextCollection(includedPaths: [barrelPath]);
  final context = collection.contextFor(barrelPath);
  final barrel = await _resolve(context, barrelPath);
  final exportedElements = barrel.exportNamespace.definedNames2.values;
  final exported = exportedElements.map(_key).toSet();

  // 1. Types used by the public API.
  final checker = _SignatureChecker(exported);
  for (final element in exportedElements) {
    checker.visitDeclaration(element);
  }
  checker.drain();

  // 2. Implementations of exported abstract types, and the informational list.
  final implementations = <String, String>{};
  final unexported = <String>[];
  final files = Directory(p.join(root, 'lib', 'src'))
      .listSync(recursive: true)
      .whereType<File>()
      .map((file) => file.path)
      .where((path) => path.endsWith('.dart'))
      .toList()
    ..sort();
  for (final file in files) {
    final library = await _resolve(context, file);
    for (final child in library.children) {
      if (!child.isPublic || child.name == null) continue;
      if (exported.contains(_key(child))) continue;
      unexported.add('${p.relative(file, from: root)}: ${child.name}');
      if (child is! InterfaceElement) continue;
      for (final supertype in [
        child.supertype,
        ...child.interfaces,
        ...child.mixins,
      ]) {
        final superElement = supertype?.element;
        if (superElement == null) continue;
        if (!_isOwnPackage(superElement)) continue;
        if (!exported.contains(_key(superElement))) continue;
        final isAbstract = switch (superElement) {
          ClassElement() => superElement.isAbstract,
          MixinElement() => true,
          _ => false,
        };
        if (!isAbstract) continue;
        implementations[child.name!] =
            '${_source(child)}, a subtype of ${superElement.name}';
      }
    }
  }

  if (args.contains('--list-unexported')) {
    stdout.writeln('Public declarations under lib/src that are not exported '
        '(informational):\n');
    for (final line in unexported) {
      stdout.writeln('  $line');
    }
    stdout.writeln();
  }

  // 3. The README.
  final readme = _checkReadme(
    File(p.join(root, 'README.md')).readAsStringSync(),
    barrel.exportNamespace.definedNames2,
  );

  final problems = <String, List<String>>{
    'Types of package:$_packageName that the public API uses, but $_barrel '
        'does not export them. Export them (from the file of the component, '
        'or from $_barrel), or make them private:': [
      for (final name in checker.missing.keys.toList()..sort()) ...[
        '$name (${checker.missing[name]!.source})',
        for (final usedBy in checker.missing[name]!.usedBy.take(3))
          '    used by $usedBy',
      ],
    ],
    'Implementations of exported abstract types that $_barrel does not '
        'export. Export them, or make them private:': [
      for (final name in implementations.keys.toList()..sort())
        '$name (${implementations[name]})',
    ],
    'README.md does not match the exports:': readme,
  };
  problems.removeWhere((_, lines) => lines.isEmpty);
  if (problems.isEmpty) {
    stdout.writeln('Every type of package:$_packageName that the public API '
        'uses is exported, and README.md matches the exports.');
    return;
  }
  for (final MapEntry(key: title, value: lines) in problems.entries) {
    stderr.writeln(title);
    stderr.writeln();
    for (final line in lines) {
      stderr.writeln('  $line');
    }
    stderr.writeln();
  }
  exit(1);
}

/// The lists in README.md that must only contain exported names.
const _readmeLists = ['### Component List', '### Building Blocks'];

List<String> _checkReadme(String readme, Map<String, Element> exports) {
  final problems = <String>[];
  final entry = RegExp(r'^( *)- (ImpaktfullUi\w+)(?:\.(\w+))?\s*$');
  final lines = readme.split('\n');
  for (final list in _readmeLists) {
    final start = lines.indexOf(list);
    if (start == -1) {
      problems.add('The "$list" heading is missing.');
      continue;
    }
    // The previous entry per indentation, to check the alphabetical order of
    // siblings.
    final previous = <int, String>{};
    for (var i = start + 1; i < lines.length; i++) {
      final line = lines[i];
      if (line.startsWith('#')) break;
      final match = entry.firstMatch(line);
      if (match == null) continue;
      final indent = match.group(1)!.length;
      final name = match.group(2)!;
      final constructor = match.group(3);
      final label = constructor == null ? name : '$name.$constructor';
      final where = 'README.md:${i + 1} ($list)';

      previous.removeWhere((key, _) => key > indent);
      final before = previous[indent];
      if (before != null && before.compareTo(label) > 0) {
        problems.add('$where: $label must come before $before.');
      }
      previous[indent] = label;

      final element = exports[name];
      if (element == null || !_isOwnPackage(element)) {
        problems.add('$where: $name is not exported.');
      } else if (_isDeprecated(element)) {
        problems.add('$where: $name is deprecated, list its replacement.');
      } else if (constructor != null &&
          (element is! InterfaceElement ||
              element.constructors.every((c) => c.name != constructor))) {
        problems.add('$where: $name has no constructor $constructor.');
      }
    }
  }

  final mentioned = RegExp(r'ImpaktfullUi\w+')
      .allMatches(readme)
      .map((match) => match.group(0))
      .toSet();
  for (final element in exports.values) {
    if (element is! ClassElement) continue;
    if (!_isOwnPackage(element) || _isDeprecated(element)) continue;
    final isWidget = element.allSupertypes.any((type) =>
        type.element.name == 'Widget' &&
        type.element.library.uri.toString() ==
            'package:flutter/src/widgets/framework.dart');
    if (!isWidget || mentioned.contains(element.name)) continue;
    problems.add('${element.name} (${_source(element)}) is an exported widget '
        'that README.md does not mention.');
  }
  return problems;
}

bool _isDeprecated(Element element) => element.metadata.hasDeprecated;

Future<LibraryElement> _resolve(AnalysisContext context, String path) async {
  final result = await context.currentSession.getResolvedLibrary(path);
  if (result is! ResolvedLibraryResult) {
    stderr.writeln('Could not resolve $path: $result');
    exit(2);
  }
  return result.element;
}

String _key(Element element) => '${element.library?.uri}#${element.name}';

bool _isOwnPackage(Element element) {
  final uri = element.library?.uri;
  return uri != null &&
      uri.scheme == 'package' &&
      uri.pathSegments.first == _packageName;
}

String _source(Element element) =>
    'lib/${element.library!.uri.pathSegments.skip(1).join('/')}';

class _Usage {
  _Usage(this.source);

  final String source;
  final Set<String> _byExported = {};
  final Set<String> _byOthers = {};

  /// Usages by exported declarations first: they are why the type is public.
  List<String> get usedBy => [..._byExported, ..._byOthers];

  void add(String where, {required bool byExported}) =>
      (byExported ? _byExported : _byOthers).add(where);
}

class _SignatureChecker {
  _SignatureChecker(this._exported);

  final Set<String> _exported;
  final Map<String, _Usage> missing = {};
  final Set<String> _visited = {};
  final List<Element> _queue = [];
  Element? _owner;

  /// Walks the declarations that are reachable from the public API but are
  /// not exported themselves, so one run reports every missing type.
  void drain() {
    while (_queue.isNotEmpty) {
      visitDeclaration(_queue.removeLast());
    }
  }

  void visitDeclaration(Element element) {
    if (!_visited.add(_key(element))) return;
    _owner = element;
    final name = element.name ?? '?';
    switch (element) {
      case TypeAliasElement():
        _typeParameters(element.typeParameters, name);
        _type(element.aliasedType, name);
      case ExtensionElement():
        _typeParameters(element.typeParameters, name);
        _type(element.extendedType, name);
        _members(element, name);
      case InterfaceElement():
        _typeParameters(element.typeParameters, name);
        _type(element.supertype, name);
        for (final type in [...element.interfaces, ...element.mixins]) {
          _type(type, name);
        }
        if (element is MixinElement) {
          for (final type in element.superclassConstraints) {
            _type(type, name);
          }
        }
        for (final constructor in element.constructors) {
          if (!constructor.isPublic) continue;
          final constructorName =
              constructor.name == 'new' ? name : '$name.${constructor.name}';
          _parameters(constructor.formalParameters, constructorName);
        }
        _members(element, name);
      case ExecutableElement():
        _executable(element, name);
      case VariableElement():
        _type(element.type, name);
      default:
        break;
    }
    _owner = null;
  }

  void _members(InstanceElement element, String owner) {
    for (final member in [
      ...element.getters,
      ...element.setters,
      ...element.methods,
    ]) {
      if (!member.isPublic) continue;
      _executable(member, '$owner.${member.displayName}');
    }
  }

  void _executable(ExecutableElement element, String where) {
    _typeParameters(element.typeParameters, where);
    _type(element.returnType, where);
    _parameters(element.formalParameters, where);
  }

  void _parameters(List<FormalParameterElement> parameters, String where) {
    for (final parameter in parameters) {
      _type(parameter.type, '$where(${parameter.displayName})');
    }
  }

  void _typeParameters(List<TypeParameterElement> parameters, String where) {
    for (final parameter in parameters) {
      _type(parameter.bound, where);
    }
  }

  void _type(DartType? type, String where) {
    if (type == null) return;
    final alias = type.alias;
    if (alias != null) {
      _reference(alias.element, where);
      for (final argument in alias.typeArguments) {
        _type(argument, where);
      }
    }
    switch (type) {
      case InterfaceType():
        _reference(type.element, where);
        for (final argument in type.typeArguments) {
          _type(argument, where);
        }
      case FunctionType():
        _type(type.returnType, where);
        for (final parameter in type.formalParameters) {
          _type(parameter.type, where);
        }
        for (final parameter in type.typeParameters) {
          _type(parameter.bound, where);
        }
      case RecordType():
        for (final field in [...type.positionalFields, ...type.namedFields]) {
          _type(field.type, where);
        }
      default:
        break;
    }
  }

  void _reference(Element element, String where) {
    if (!_isOwnPackage(element)) return;
    // Private types in a public API are reported by the
    // `library_private_types_in_public_api` lint, they can not be exported.
    if (!element.isPublic) return;
    final key = _key(element);
    if (_exported.contains(key)) return;
    final owner = _owner;
    // A type that refers to itself (enum values, `copyWith`) says nothing.
    if (owner != null && _key(owner) == key) return;
    missing.putIfAbsent(element.name!, () => _Usage(_source(element))).add(
          where,
          byExported: owner != null && _exported.contains(_key(owner)),
        );
    if (!_visited.contains(key)) _queue.add(element);
  }
}

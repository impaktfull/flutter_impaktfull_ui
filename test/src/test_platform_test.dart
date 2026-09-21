// Guards tool/test_web.sh, which runs the tests in Chrome: a test file that
// needs the Dart VM must be left out of that run, or the whole web run fails
// to compile or crashes.
//
// A test file needs the VM when it, or a test helper it imports:
// - uses alchemist (golden tests), which does not compile for the web. Name
//   the file `*_golden_test.dart` (tool/test_web.sh skips those), and keep
//   golden helpers in their own `*_golden_helpers.dart` file.
// - uses `dart:io`. Annotate the file with `@TestOn('vm')` (followed by
//   `library;`), or read files with test/util/test_file/test_file.dart.
//
// See "Tests on every platform" in AGENTS.md.
@TestOn('vm')
library;

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

const _vmOnlyImports = <String, String>{
  'package:alchemist/': 'alchemist does not compile for the web',
  'dart:io': 'dart:io is not available on the web',
};

/// `import '...'` and `export '...'`, without a conditional
/// (`if (dart.library.x)`): a conditional import picks a web implementation.
final _directive = RegExp(
  r'''^(?:import|export)\s+['"]([^'"]+)['"]\s*(if\s*\()?''',
  multiLine: true,
);

/// The imports of [file] that only work on the VM, including the ones of the
/// test helpers it imports (relative imports), with the path that leads to
/// them.
List<String> _vmOnlyImportsOf(File file, [Set<String>? visited]) {
  visited ??= {};
  if (!visited.add(file.absolute.path)) return const [];
  final problems = <String>[];
  for (final match in _directive.allMatches(file.readAsStringSync())) {
    if (match.group(2) != null) continue;
    final uri = match.group(1)!;
    for (final entry in _vmOnlyImports.entries) {
      if (uri.startsWith(entry.key)) {
        problems.add('imports $uri (${entry.value})');
      }
    }
    if (uri.contains(':')) continue;
    final imported = File.fromUri(file.absolute.uri.resolve(uri));
    if (!imported.existsSync()) continue;
    for (final problem in _vmOnlyImportsOf(imported, visited)) {
      problems.add('imports $uri, which $problem');
    }
  }
  return problems;
}

void main() {
  final testFiles = Directory('test')
      .listSync(recursive: true)
      .whereType<File>()
      .where((file) => file.path.endsWith('_test.dart'))
      .toList()
    ..sort((a, b) => a.path.compareTo(b.path));

  test('there are test files', () {
    expect(testFiles, isNotEmpty);
  });

  test('every test file that needs the Dart VM is skipped on the web', () {
    final problems = <String>[];
    for (final file in testFiles) {
      if (file.path.endsWith('_golden_test.dart')) continue;
      final source = file.readAsStringSync();
      if (source.contains("@TestOn('vm')")) continue;
      for (final problem in _vmOnlyImportsOf(file)) {
        problems.add('${file.path} $problem');
      }
      if (source.contains('goldenTest(') ||
          source.contains('runComponentTest(')) {
        problems.add('${file.path} runs golden tests');
      }
    }
    expect(
      problems,
      isEmpty,
      reason: 'Rename golden tests to *_golden_test.dart, move golden helpers '
          "to a *_golden_helpers.dart file and annotate test files that need "
          "dart:io with @TestOn('vm'):\n${problems.join('\n')}",
    );
  });
}

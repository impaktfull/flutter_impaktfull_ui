// Scans the source of every theme class under `lib/src`, for the tests that
// guard what a theme class must have: `theme_copy_with_source_test.dart` and
// `theme_equality_source_test.dart`.
//
// Reads the sources with dart:io, so every test file that imports it is
// annotated with `@TestOn('vm')`.
library;

import 'dart:io';

/// Classes named `ImpaktfullUi*Theme` that only hold static members and are
/// never instantiated, so they have nothing to copy or compare.
const staticOnlyThemeClasses = {
  'ImpaktfullUiDefaultTheme',
};

/// The value classes a theme is built from that are not named `*Theme`. They
/// are a token of a theme class, so a theme can only compare by value when
/// they do too.
const themeValueClasses = {
  'ImpaktfullUiAsset',
  'ImpaktfullUiButtonConfig',
  'ImpaktfullUiFluidPaddingBreakPoint',
};

/// A class of `lib/src` that is part of the theme.
class ThemeClass {
  final String name;
  final String path;

  /// The public final instance fields of the class: its value. A private
  /// field is left out, it is not part of the API this guards.
  final Set<String> fields;

  /// `copyWith`, or null when the class does not declare one.
  final ThemeMethod? copyWith;

  /// `operator ==`, or null when the class does not declare one.
  final ThemeMethod? equals;

  /// Whether the class declares `hashCode`.
  final bool hasHashCode;

  const ThemeClass({
    required this.name,
    required this.path,
    required this.fields,
    required this.copyWith,
    required this.equals,
    required this.hasHashCode,
  });
}

/// A method of a [ThemeClass], split in its parameter list and everything
/// after it.
class ThemeMethod {
  final String parameters;
  final String body;

  const ThemeMethod({
    required this.parameters,
    required this.body,
  });
}

final _classRegExp = RegExp(
  r'\b((?:abstract|base|final|interface|sealed|mixin)\s+)*class\s+'
  r'(ImpaktfullUi\w+)\b',
);
final _fieldRegExp = RegExp(
  r'(?:(?<=[;{}])|^)\s*(?:@\w+(?:\([^)]*\))?\s*)*(static\s+)?(late\s+)?final\s+'
  r'([^;=]+?)\s+([A-Za-z]\w*)\s*(;|=)',
);
final _copyWithRegExp = RegExp(r'\bcopyWith\s*\(');
final _equalsRegExp = RegExp(r'\boperator\s*==\s*\(');
final _hashCodeRegExp = RegExp(r'\bint\s+get\s+hashCode\b');

/// Every class of [directory] that is part of the theme: a
/// `class ImpaktfullUi*Theme` or one of [themeValueClasses].
List<ThemeClass> findThemeClasses(Directory directory) {
  final files = directory
      .listSync(recursive: true)
      .whereType<File>()
      .where((file) => file.path.endsWith('.dart'))
      .toList()
    ..sort((a, b) => a.path.compareTo(b.path));
  final result = <ThemeClass>[];
  for (final file in files) {
    final source = stripCommentsAndStrings(file.readAsStringSync());
    for (final match in _classRegExp.allMatches(source)) {
      final modifiers = match.group(1) ?? '';
      final name = match.group(2)!;
      if (!name.endsWith('Theme') && !themeValueClasses.contains(name)) {
        continue;
      }
      if (match.group(0)!.contains('abstract')) continue;
      if (modifiers.contains('mixin')) continue;
      if (staticOnlyThemeClasses.contains(name)) continue;
      final bodyStart = source.indexOf('{', match.end);
      final bodyEnd = matchingBrace(source, bodyStart);
      final body = source.substring(bodyStart + 1, bodyEnd);
      final topLevel = _topLevelOnly(body);
      final fields = {
        for (final field in _fieldRegExp.allMatches(topLevel))
          // Not a static field, and not a value that is derived from the
          // fields (`late final ... = ...`), which is not part of the value.
          if (field.group(1) == null &&
              !(field.group(2) != null && field.group(5) == '='))
            field.group(4)!,
      };
      result.add(ThemeClass(
        name: name,
        path: file.path,
        fields: fields,
        copyWith: _findMethod(body, _copyWithRegExp),
        equals: _findMethod(body, _equalsRegExp),
        hasHashCode: _hashCodeRegExp.hasMatch(body),
      ));
    }
  }
  return result;
}

ThemeMethod? _findMethod(String body, RegExp header) {
  final match = header.firstMatch(body);
  if (match == null) return null;
  final parametersStart = match.end - 1;
  final parametersEnd = matchingBrace(body, parametersStart);
  var end = parametersEnd + 1;
  var depth = 0;
  // The method ends at the first `;` (expression body) or at the closing `}`
  // of a block body, outside of nested brackets.
  while (end < body.length) {
    final char = body[end];
    if (char == '(' || char == '[' || char == '{') {
      depth++;
    } else if (char == ')' || char == ']' || char == '}') {
      depth--;
      if (depth == 0 && char == '}' && _isBlockBody(body, parametersEnd)) {
        break;
      }
    } else if (char == ';' && depth == 0) {
      break;
    }
    end++;
  }
  return ThemeMethod(
    parameters: body.substring(parametersStart, parametersEnd + 1),
    body: body.substring(parametersEnd + 1, end),
  );
}

bool _isBlockBody(String body, int parametersEnd) =>
    !body.substring(parametersEnd + 1).trimLeft().startsWith('=>');

/// Returns the index of the bracket that closes the one at [start].
int matchingBrace(String source, int start) {
  const pairs = {'(': ')', '[': ']', '{': '}'};
  final open = source[start];
  final close = pairs[open]!;
  var depth = 0;
  for (var i = start; i < source.length; i++) {
    if (source[i] == open) depth++;
    if (source[i] == close) {
      depth--;
      if (depth == 0) return i;
    }
  }
  throw StateError('No matching $close for $open at $start');
}

/// Replaces everything nested in braces with spaces, so only the members of
/// the class body are left.
String _topLevelOnly(String body) {
  final buffer = StringBuffer();
  var depth = 0;
  for (var i = 0; i < body.length; i++) {
    final char = body[i];
    if (char == '{') {
      depth++;
      buffer.write(depth == 1 ? '{' : ' ');
    } else if (char == '}') {
      buffer.write(depth == 1 ? '}' : ' ');
      depth--;
    } else {
      buffer.write(depth == 0 ? char : ' ');
    }
  }
  return buffer.toString();
}

/// Replaces comments and the content of string literals with spaces, so
/// brackets and keywords in them are not mistaken for code.
String stripCommentsAndStrings(String source) {
  final buffer = StringBuffer();
  var i = 0;
  while (i < source.length) {
    if (source.startsWith('//', i)) {
      final end = source.indexOf('\n', i);
      i = end == -1 ? source.length : end;
      continue;
    }
    if (source.startsWith('/*', i)) {
      final end = source.indexOf('*/', i + 2);
      final stop = end == -1 ? source.length : end + 2;
      buffer.write(' ' * (stop - i));
      i = stop;
      continue;
    }
    final char = source[i];
    if (char == "'" || char == '"') {
      final isRaw = i > 0 && source[i - 1] == 'r';
      final quote =
          source.startsWith(char * 3, i) ? char * 3 : char; // multi-line
      var j = i + quote.length;
      while (j < source.length && !source.startsWith(quote, j)) {
        if (!isRaw && source[j] == r'\') j++;
        j++;
      }
      buffer
        ..write(quote)
        ..write(' ' * (j - i - quote.length))
        ..write(quote);
      i = j + quote.length;
      continue;
    }
    buffer.write(char);
    i++;
  }
  return buffer.toString();
}

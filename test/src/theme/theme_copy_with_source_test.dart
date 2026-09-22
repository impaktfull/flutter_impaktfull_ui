// Every theme class must be partially customisable: a user changes one token
// with `copyWith` instead of rebuilding the whole theme.
//
// This test scans the source of every theme class under `lib/src` and fails
// when a `class ImpaktfullUi*Theme`:
// - has no `copyWith(` method, or
// - has a `copyWith` that does not accept or forward one of its public final
//   fields (`field: field ?? this.field`).
//
// Fix a failure by adding the missing `copyWith` (parameters in alphabetical
// order, see .claude/skills/create_component/SKILL.md).

// Reads the sources with dart:io, so it only runs on the Dart VM.
@TestOn('vm')
library;

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

/// Classes named `ImpaktfullUi*Theme` that only hold static members and are
/// never instantiated, so they have nothing to copy.
const _staticOnlyClasses = {
  'ImpaktfullUiDefaultTheme',
};

void main() {
  final classes = _findThemeClasses(Directory('lib/src'));

  test('the source scan finds the theme classes', () {
    // Guards the scan itself: if it breaks, it would find nothing and every
    // other test in this file would pass without checking anything.
    expect(classes.length, greaterThan(400));
    final names = classes.map((c) => c.name).toSet();
    expect(
      names,
      containsAll([
        'ImpaktfullUiTheme',
        'ImpaktfullUiComponentsTheme',
        'ImpaktfullUiColorTheme',
        'ImpaktfullUiButtonTheme',
        'ImpaktfullUiCardTheme',
        'ImpaktfullUiCardDimensTheme',
      ]),
    );
    final cardDimens =
        classes.firstWhere((c) => c.name == 'ImpaktfullUiCardDimensTheme');
    expect(cardDimens.fields, {'borderRadius', 'borderWidth', 'padding'});
  });

  for (final themeClass in classes) {
    group('${themeClass.name} (${themeClass.path})', () {
      test('declares copyWith', () {
        expect(
          themeClass.copyWith,
          isNotNull,
          reason: '${themeClass.name} has no copyWith. Every theme class must '
              'have a copyWith with a nullable named parameter per field.',
        );
      });

      final copyWith = themeClass.copyWith;
      if (copyWith == null) return;
      for (final field in themeClass.fields) {
        test('copyWith keeps $field', () {
          expect(
            RegExp('[?\\s]$field\\s*[,)}]').hasMatch(copyWith.parameters),
            isTrue,
            reason: '${themeClass.name}.copyWith has no `$field` parameter.',
          );
          expect(
            RegExp('(\\b$field\\s*:\\s*|[(,]\\s*)$field\\s*\\?\\?[^,]*'
                    '\\bthis\\.$field\\b')
                .hasMatch(copyWith.body),
            isTrue,
            reason: '${themeClass.name}.copyWith does not forward `$field` '
                'as `$field: $field ?? this.$field`.',
          );
        });
      }
    });
  }
}

class _ThemeClass {
  final String name;
  final String path;
  final Set<String> fields;
  final _CopyWith? copyWith;

  const _ThemeClass({
    required this.name,
    required this.path,
    required this.fields,
    required this.copyWith,
  });
}

class _CopyWith {
  final String parameters;
  final String body;

  const _CopyWith({
    required this.parameters,
    required this.body,
  });
}

final _classRegExp = RegExp(
  r'\b((?:abstract|base|final|interface|sealed|mixin)\s+)*class\s+'
  r'(ImpaktfullUi\w*Theme)\b',
);
final _fieldRegExp = RegExp(
  r'(?:(?<=[;{}])|^)\s*(?:@\w+(?:\([^)]*\))?\s*)*(static\s+)?(?:late\s+)?final\s+'
  r'([^;=]+?)\s+([A-Za-z]\w*)\s*;',
);

List<_ThemeClass> _findThemeClasses(Directory directory) {
  final files = directory
      .listSync(recursive: true)
      .whereType<File>()
      .where((file) => file.path.endsWith('.dart'))
      .toList()
    ..sort((a, b) => a.path.compareTo(b.path));
  final result = <_ThemeClass>[];
  for (final file in files) {
    final source = _stripCommentsAndStrings(file.readAsStringSync());
    for (final match in _classRegExp.allMatches(source)) {
      final modifiers = match.group(1) ?? '';
      final name = match.group(2)!;
      if (match.group(0)!.contains('abstract')) continue;
      if (modifiers.contains('mixin')) continue;
      if (_staticOnlyClasses.contains(name)) continue;
      final bodyStart = source.indexOf('{', match.end);
      final bodyEnd = _matchingBrace(source, bodyStart);
      final body = source.substring(bodyStart + 1, bodyEnd);
      final topLevel = _topLevelOnly(body);
      final fields = {
        for (final field in _fieldRegExp.allMatches(topLevel))
          if (field.group(1) == null) field.group(3)!,
      };
      result.add(_ThemeClass(
        name: name,
        path: file.path,
        fields: fields,
        copyWith: _findCopyWith(body),
      ));
    }
  }
  return result;
}

_CopyWith? _findCopyWith(String body) {
  final match = RegExp(r'\bcopyWith\s*\(').firstMatch(body);
  if (match == null) return null;
  final parametersStart = match.end - 1;
  final parametersEnd = _matchingBrace(body, parametersStart);
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
  return _CopyWith(
    parameters: body.substring(parametersStart, parametersEnd + 1),
    body: body.substring(parametersEnd + 1, end),
  );
}

bool _isBlockBody(String body, int parametersEnd) =>
    !body.substring(parametersEnd + 1).trimLeft().startsWith('=>');

/// Returns the index of the bracket that closes the one at [start].
int _matchingBrace(String source, int start) {
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
String _stripCommentsAndStrings(String source) {
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

// Reads the sources with dart:io, so it only runs on the Dart VM.
@TestOn('vm')
library;

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

/// Directories whose widgets must support right-to-left layouts.
const _directories = [
  'lib/src/components',
  'lib/src/building_block',
  'lib/src/widget',
];

/// A line that contains this marker allows physical (left/right) layout code
/// on that line and the [_ignoreRange] lines below it. Always explain why,
/// e.g. `// rtl-ignore: the follower is positioned in physical coordinates`.
const _ignoreMarker = 'rtl-ignore';
const _ignoreRange = 5;

/// Named arguments that position something on the left or the right.
final _physicalArgument = RegExp(
  r'^\s*(left|right|topLeft|topRight|bottomLeft|bottomRight)\s*:',
);

class _Violation {
  final String file;
  final int line;
  final String message;

  const _Violation(this.file, this.line, this.message);

  @override
  String toString() => '$file:$line: $message';
}

/// A call whose named arguments must not be [_physicalArgument]s.
class _Call {
  final String name;
  final RegExp pattern;
  final String replacement;

  _Call(this.name, this.replacement)
      : pattern = RegExp('(?<![\\w.])${RegExp.escape(name)}\\(');
}

final _calls = [
  _Call('EdgeInsets.only', 'EdgeInsetsDirectional.only (start/end)'),
  _Call('Positioned', 'PositionedDirectional (start/end)'),
  _Call('Positioned.fill', 'PositionedDirectional (start/end)'),
  _Call('BorderRadius.only', 'BorderRadiusDirectional.only'),
  _Call('Border', 'BorderDirectional (start/end)'),
];

/// Tokens that are always physical.
final _tokens = <RegExp, String>{
  RegExp(r'\bAlignment\.(top|center|bottom)(Left|Right)\b'):
      'use AlignmentDirectional (start/end)',
  RegExp(r'(?<![\w.])Alignment\('): 'use AlignmentDirectional(start, y)',
  RegExp(r'\bEdgeInsets\.fromLTRB\('): 'use EdgeInsetsDirectional.fromSTEB',
  RegExp(r'\bTextAlign\.(left|right)\b'): 'use TextAlign.start/end',
  // Comparing with, or falling back to, left-to-right is fine.
  RegExp(r'(?<!(==|!=|\?\?)\s*)\bTextDirection\.ltr\b'):
      'use Directionality.of(context)',
};

/// Returns the arguments of the call that opens at [openParen], without the
/// content of nested calls, split per line.
List<String> _topLevelArgumentLines(String source, int openParen) {
  final buffer = StringBuffer();
  var depth = 0;
  for (var i = openParen; i < source.length; i++) {
    final char = source[i];
    if (char == '(' || char == '[' || char == '{') {
      depth++;
      if (depth == 1) continue;
    } else if (char == ')' || char == ']' || char == '}') {
      depth--;
      if (depth == 0) break;
    }
    if (depth == 1 || char == '\n') buffer.write(char);
  }
  return buffer.toString().split(RegExp(r'[,\n]'));
}

List<_Violation> _findRtlViolations(String file, String source) {
  final lines = source.split('\n');
  final ignored = <int>{};
  for (var i = 0; i < lines.length; i++) {
    if (!lines[i].contains(_ignoreMarker)) continue;
    for (var j = i; j <= i + _ignoreRange && j < lines.length; j++) {
      ignored.add(j);
    }
  }
  int lineOf(int offset) => '\n'.allMatches(source.substring(0, offset)).length;
  bool isComment(int line) => lines[line].trimLeft().startsWith('//');

  final violations = <_Violation>[];
  void add(int offset, String message) {
    final line = lineOf(offset);
    if (ignored.contains(line) || isComment(line)) return;
    violations.add(_Violation(file, line + 1, message));
  }

  for (final call in _calls) {
    for (final match in call.pattern.allMatches(source)) {
      final arguments = _topLevelArgumentLines(source, match.end - 1);
      if (arguments.any(_physicalArgument.hasMatch)) {
        add(match.start,
            '${call.name} with left/right, use ${call.replacement}');
      }
    }
  }
  for (final MapEntry(key: pattern, value: message) in _tokens.entries) {
    for (final match in pattern.allMatches(source)) {
      add(match.start, '${match.group(0)}: $message');
    }
  }
  return violations;
}

void main() {
  test('components only use directional (start/end) layout APIs', () {
    final violations = <_Violation>[];
    for (final directory in _directories) {
      final files = Directory(directory)
          .listSync(recursive: true)
          .whereType<File>()
          .where((file) => file.path.endsWith('.dart'));
      for (final file in files) {
        violations
            .addAll(_findRtlViolations(file.path, file.readAsStringSync()));
      }
    }
    expect(
      violations,
      isEmpty,
      reason: 'Components must work in right-to-left layouts (see README, '
          '"Right-to-left"). Use the directional (start/end) API, or add a '
          '`// $_ignoreMarker: <reason>` comment when the physical side is '
          'intended.\n${violations.join('\n')}',
    );
  });

  group('findRtlViolations', () {
    List<String> check(String source) =>
        _findRtlViolations('file.dart', source).map((e) => e.message).toList();

    test('finds physical layout code', () {
      expect(check('EdgeInsets.only(left: 8)'), hasLength(1));
      expect(
          check('EdgeInsets.only(\n  top: 8,\n  right: 8,\n)'), hasLength(1));
      expect(check('Positioned(left: 0, child: SizedBox())'), hasLength(1));
      expect(
          check('Positioned.fill(right: 0, child: SizedBox())'), hasLength(1));
      expect(check('BorderRadius.only(topLeft: radius)'), hasLength(1));
      expect(check('Border(left: side)'), hasLength(1));
      expect(check('Alignment.centerLeft'), hasLength(1));
      expect(check('Alignment(x, 0)'), hasLength(1));
      expect(check('EdgeInsets.fromLTRB(1, 2, 3, 4)'), hasLength(1));
      expect(check('TextAlign.right'), hasLength(1));
      expect(check('textDirection: TextDirection.ltr'), hasLength(1));
    });

    test('allows directional and vertical layout code', () {
      expect(check('EdgeInsetsDirectional.only(start: 8)'), isEmpty);
      expect(check('EdgeInsets.only(top: 8, bottom: 8)'), isEmpty);
      expect(check('Positioned(top: 0, child: Padding(padding: x))'), isEmpty);
      expect(
        check('Positioned(top: 0, child: Foo(left: 1))'),
        isEmpty,
        reason: 'arguments of nested calls are not checked',
      );
      expect(check('PositionedDirectional(start: 0, child: x)'), isEmpty);
      expect(check('AlignmentDirectional.centerStart'), isEmpty);
      expect(check('AlignmentDirectional(x, 0)'), isEmpty);
      expect(check('Alignment.center'), isEmpty);
      expect(check('direction == TextDirection.ltr'), isEmpty);
      expect(check('Directionality.maybeOf(context) ?? TextDirection.ltr'),
          isEmpty);
      expect(check('Border.all(width: 1)'), isEmpty);
      expect(check('// Alignment.centerLeft in a comment'), isEmpty);
    });

    test('allows physical layout code after an rtl-ignore comment', () {
      expect(
        check('// rtl-ignore: physical on purpose\nAlignment.topLeft'),
        isEmpty,
      );
    });
  });
}

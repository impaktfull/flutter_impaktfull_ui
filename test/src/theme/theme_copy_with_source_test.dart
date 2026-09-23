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

import '_theme_source_scan.dart';

void main() {
  final classes = findThemeClasses(Directory('lib/src'))
      .where((themeClass) => themeClass.name.endsWith('Theme'))
      .toList();

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

// Every theme class must compare by value: an app that builds its theme again
// with the same tokens gets an equal theme, and
// `ImpaktfullUiThemeConfigurator.updateShouldNotify` rebuilds nothing. One
// class that only compares by identity is enough to make every theme that
// holds it unequal, so this is checked for all of them.
//
// This test scans the source of every theme class under `lib/src` and fails
// when a `class ImpaktfullUi*Theme` (or a value class it is built from, see
// `themeValueClasses`):
// - does not declare `operator ==`,
// - does not declare `hashCode`, or
// - has an `operator ==` that does not compare one of its public final fields
//   (`other.<field>` does not appear in it).
//
// Fix a failure by adding the missing members at the end of the class:
//
// ```dart
//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is ImpaktfullUiCardDimensTheme &&
//           borderRadius == other.borderRadius &&
//           padding == other.padding;
//
//   @override
//   int get hashCode => Object.hash(borderRadius, padding);
// ```
//
// A `List` is compared with `listEquals(field, other.field)` and hashed with
// `Object.hashAll(field)`; a class with more than 20 fields hashes them with
// `Object.hashAll([...])`, because `Object.hash` takes at most 20 arguments.

// Reads the sources with dart:io, so it only runs on the Dart VM.
@TestOn('vm')
library;

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

import '_theme_source_scan.dart';

void main() {
  final classes = findThemeClasses(Directory('lib/src'));

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
        'ImpaktfullUiShadowsTheme',
        'ImpaktfullUiButtonTheme',
        'ImpaktfullUiCardDimensTheme',
        ...themeValueClasses,
      ]),
    );
    final asset = classes.firstWhere((c) => c.name == 'ImpaktfullUiAsset');
    expect(asset.fields, contains('svgAsset'));
    expect(asset.equals, isNotNull);
  });

  for (final themeClass in classes) {
    group('${themeClass.name} (${themeClass.path})', () {
      test('declares operator == and hashCode', () {
        expect(
          themeClass.equals,
          isNotNull,
          reason: '${themeClass.name} has no `operator ==`, so it is only '
              'equal to itself and every theme that holds it rebuilds the '
              'widgets that read it.',
        );
        expect(
          themeClass.hasHashCode,
          isTrue,
          reason: '${themeClass.name} has no `hashCode`. A class that '
              'overrides `==` must override `hashCode` too.',
        );
      });

      final equals = themeClass.equals;
      if (equals == null) return;
      for (final field in themeClass.fields) {
        test('operator == compares $field', () {
          expect(
            RegExp('\\bother\\.$field\\b').hasMatch(equals.body),
            isTrue,
            reason: '${themeClass.name}.operator == does not compare '
                '`$field`: two themes with a different `$field` would be '
                'equal. Compare it with `$field == other.$field` '
                '(`listEquals($field, other.$field)` for a list).',
          );
        });
      }
    });
  }
}

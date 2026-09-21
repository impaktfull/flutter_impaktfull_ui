import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/src/util/extension/list_extension.dart';

class _Item {
  final String? name;
  final int? age;

  const _Item(this.name, this.age);

  @override
  String toString() => '$name-$age';
}

void main() {
  group('firstWhereOrNull', () {
    test('returns the first match', () {
      expect([1, 2, 3, 4].firstWhereOrNull((e) => e.isEven), 2);
    });

    test('returns null without a match or on an empty list', () {
      expect([1, 3].firstWhereOrNull((e) => e.isEven), isNull);
      expect(<int>[].firstWhereOrNull((e) => true), isNull);
    });
  });

  group('all', () {
    test('is true when every element matches', () {
      expect([2, 4].all((e) => e.isEven), isTrue);
    });

    test('is false when one element does not match', () {
      expect([2, 3].all((e) => e.isEven), isFalse);
    });

    test('is true for an empty list', () {
      expect(<int>[].all((e) => false), isTrue);
    });
  });

  group('sortBy', () {
    test('sorts ascending by default', () {
      final list = [3, 1, 2]..sortBy((e) => e);
      expect(list, [1, 2, 3]);
    });

    test('sorts descending', () {
      final list = [3, 1, 2]..sortBy((e) => e, ascending: false);
      expect(list, [3, 2, 1]);
    });

    test('sorts by a property', () {
      final list = ['ccc', 'a', 'bb']..sortBy((e) => e.length);
      expect(list, ['a', 'bb', 'ccc']);
    });

    test('puts null values first ascending and last descending', () {
      final items = [
        const _Item('b', 1),
        const _Item(null, 2),
        const _Item('a', 3),
      ];
      expect((List.of(items)..sortBy((e) => e.name)).map((e) => e.name),
          [null, 'a', 'b']);
      expect(
          (List.of(items)..sortBy((e) => e.name, ascending: false))
              .map((e) => e.name),
          ['b', 'a', null]);
    });
  });

  group('sortBy2', () {
    const items = [
      _Item('b', 2),
      _Item('a', 2),
      _Item('b', 1),
      _Item('a', 1),
    ];

    test('sorts by the first and then the second value', () {
      final list = List.of(items)..sortBy2((e) => e.name, (e) => e.age);
      expect(list.map((e) => '$e'), ['a-1', 'a-2', 'b-1', 'b-2']);
    });

    test('sorts both values descending', () {
      final list = List.of(items)
        ..sortBy2((e) => e.name, (e) => e.age,
            ascending: false, ascending2: false);
      expect(list.map((e) => '$e'), ['b-2', 'b-1', 'a-2', 'a-1']);
    });

    test('mixes ascending and descending', () {
      final list = List.of(items)
        ..sortBy2((e) => e.name, (e) => e.age, ascending2: false);
      expect(list.map((e) => '$e'), ['a-2', 'a-1', 'b-2', 'b-1']);
    });

    test('puts null values first when ascending', () {
      final list = [
        const _Item('a', null),
        const _Item(null, 1),
        const _Item('a', 1),
      ]..sortBy2((e) => e.name, (e) => e.age);
      expect(list.map((e) => '$e'), ['null-1', 'a-null', 'a-1']);
    });

    test('puts null values last when descending', () {
      final list = [
        const _Item(null, 1),
        const _Item('a', null),
        const _Item('a', 1),
      ]..sortBy2((e) => e.name, (e) => e.age,
          ascending: false, ascending2: false);
      expect(list.map((e) => '$e'), ['a-1', 'a-null', 'null-1']);
    });

    test('keeps elements that are equal on both values', () {
      final list = [const _Item(null, null), const _Item(null, null)]
        ..sortBy2((e) => e.name, (e) => e.age);
      expect(list.length, 2);
    });
  });
}

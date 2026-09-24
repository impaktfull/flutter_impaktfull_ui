import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../_core_test_helpers.dart';

/// Proves that the per size tokens of [ImpaktfullUiBadgeDimensTheme] change
/// what is rendered. Before they existed the values lived on the
/// [ImpaktfullUiBadgeSize] enum, which an app can not change.

const _testAsset = ImpaktfullUiAsset.icon(Icons.home);

ImpaktfullUiBadgeTheme get _base =>
    ImpaktfullUiTheme.getDefault().components.badge;

/// The theme with [small] as the geometry of a small badge.
ImpaktfullUiBadgeTheme _sizeTheme({
  double? horizontalPadding,
  double? verticalPadding,
  double? paddingOffset,
  double? spacing,
  double? widgetSize,
}) {
  final base = _base;
  return base.copyWith(
    dimens: base.dimens.copyWith(
      sizes: base.dimens.sizes.copyWith(
        small: base.dimens.sizes.small.copyWith(
          horizontalPadding: horizontalPadding,
          verticalPadding: verticalPadding,
          paddingOffset: paddingOffset,
          spacing: spacing,
          widgetSize: widgetSize,
        ),
      ),
    ),
  );
}

/// Pumps [child] with loose constraints in the top left corner, so the badge
/// takes the size it asks for.
Future<void> _pumpLoose(WidgetTester tester, Widget child) =>
    pumpImpaktfullUiApp(
      tester,
      Material(
        child: Align(
          alignment: Alignment.topLeft,
          child: child,
        ),
      ),
    );

Widget _badge({
  ImpaktfullUiBadgeTheme? theme,
  bool withLeading = false,
}) =>
    ImpaktfullUiBadge(
      type: ImpaktfullUiBadgeType.primary,
      title: 'Tag',
      leadingAsset: withLeading ? _testAsset : null,
      theme: theme,
    );

Rect _badgeRect(WidgetTester tester) =>
    tester.getRect(find.byType(ImpaktfullUiBadge));

void main() {
  group('ImpaktfullUiBadgeSizeDimensTheme', () {
    testWidgets('horizontalPadding is the space before and after the title',
        (tester) async {
      double padding(WidgetTester tester) =>
          tester.getRect(find.text('Tag')).left - _badgeRect(tester).left;

      await _pumpLoose(tester, _badge());
      expect(padding(tester), 8);

      await _pumpLoose(tester, _badge(theme: _sizeTheme(horizontalPadding: 4)));
      // Ant Design's tag padding.
      expect(padding(tester), 4);
    });

    testWidgets('verticalPadding is the space above and below the title',
        (tester) async {
      double padding(WidgetTester tester) =>
          tester.getRect(find.text('Tag')).top - _badgeRect(tester).top;

      await _pumpLoose(tester, _badge());
      expect(padding(tester), 2);

      await _pumpLoose(tester, _badge(theme: _sizeTheme(verticalPadding: 12)));
      expect(padding(tester), 12);
    });

    testWidgets(
        'paddingOffset pulls in the padding of a side with a leading '
        'widget', (tester) async {
      double padding(WidgetTester tester) =>
          tester.getRect(find.byType(ImpaktfullUiAssetWidget)).left -
          _badgeRect(tester).left;

      // A side with a widget uses `horizontalPadding / 2 - paddingOffset`.
      await _pumpLoose(tester, _badge(withLeading: true));
      expect(padding(tester), 8 / 2 - 0);

      await _pumpLoose(
        tester,
        _badge(withLeading: true, theme: _sizeTheme(paddingOffset: 3)),
      );
      expect(padding(tester), 8 / 2 - 3);
    });

    testWidgets('spacing is the space between the leading widget and the title',
        (tester) async {
      double spacing(WidgetTester tester) =>
          tester.getRect(find.text('Tag')).left -
          tester.getRect(find.byType(ImpaktfullUiAssetWidget)).right;

      await _pumpLoose(tester, _badge(withLeading: true));
      expect(spacing(tester), 4);

      await _pumpLoose(
        tester,
        _badge(withLeading: true, theme: _sizeTheme(spacing: 16)),
      );
      expect(spacing(tester), 16);
    });

    testWidgets('widgetSize is the size of the leading asset', (tester) async {
      await _pumpLoose(tester, _badge(withLeading: true));
      expect(
        tester.getSize(find.byType(ImpaktfullUiAssetWidget)),
        const Size(16, 16),
      );

      await _pumpLoose(
        tester,
        _badge(withLeading: true, theme: _sizeTheme(widgetSize: 12)),
      );
      expect(
        tester.getSize(find.byType(ImpaktfullUiAssetWidget)),
        const Size(12, 12),
      );
    });

    testWidgets('every size keeps the geometry it had on the enum',
        (tester) async {
      final sizes = _base.dimens.sizes;
      for (final size in ImpaktfullUiBadgeSize.values) {
        final dimens = sizes.bySize(size);
        expect(dimens.horizontalPadding, size.horizontalPadding);
        expect(dimens.verticalPadding, size.verticalPadding);
        expect(dimens.paddingOffset, size.paddingOffset);
        expect(dimens.spacing, size.spacing);
        expect(dimens.widgetSize, size.widgetSize);
      }
    });
  });
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../_core_test_helpers.dart';

/// Proves that every size and state token of [ImpaktfullUiButtonTheme] changes
/// what is rendered, and that the defaults render like they always did.

const _testAsset = ImpaktfullUiAsset.icon(Icons.home);

ImpaktfullUiButtonTheme get _base =>
    ImpaktfullUiTheme.getDefault().components.button;

/// The theme with [medium] as the geometry of a medium button.
ImpaktfullUiButtonTheme _sizeTheme(ImpaktfullUiButtonSizeDimensTheme medium) {
  final base = _base;
  return base.copyWith(
    dimens: base.dimens.copyWith(
      sizes: base.dimens.sizes.copyWith(medium: medium),
    ),
  );
}

/// The geometry of a medium button with [height], [padding], [spacing],
/// [iconSize] and [loadingSize] on top of the defaults.
ImpaktfullUiButtonSizeDimensTheme _mediumDimens({
  double? height,
  EdgeInsetsGeometry? padding,
  double? spacing,
  double? iconSize,
  double? loadingSize,
}) =>
    _base.dimens.sizes.medium.copyWith(
      height: height,
      padding: padding,
      spacing: spacing,
      iconSize: iconSize,
      loadingSize: loadingSize,
    );

/// Pumps [child] with loose constraints in the top left corner, so the button
/// takes the size it asks for instead of the size of the screen.
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

Size _buttonSize(WidgetTester tester) =>
    tester.getSize(find.byType(ImpaktfullUiButton));

/// The container the touch feedback of the button paints: its background and
/// its border.
ImpaktfullUiContainer _container(WidgetTester tester) =>
    tester.widget<ImpaktfullUiContainer>(
      find
          .descendant(
            of: find.byType(ImpaktfullUiButton),
            matching: find.byType(ImpaktfullUiContainer),
          )
          .first,
    );

Color? _borderColor(WidgetTester tester) {
  final border = _container(tester).border;
  if (border == null) return null;
  return border.top.color;
}

Color? _titleColor(WidgetTester tester) =>
    tester.widget<Text>(find.text('Save')).style?.color;

/// Moves a mouse pointer over the button, runs [body] and removes the pointer
/// again, so the next pumped widget starts without a pointer over it.
Future<void> _withHover(
  WidgetTester tester,
  Future<void> Function() body,
) async {
  final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
  await gesture.addPointer(location: Offset.zero);
  await tester.pump();
  await gesture.moveTo(tester.getCenter(find.byType(ImpaktfullUiButton)));
  await tester.pumpAndSettle();
  try {
    await body();
  } finally {
    await gesture.removePointer();
    await tester.pumpAndSettle();
  }
}

void main() {
  group('ImpaktfullUiButtonSizeDimensTheme', () {
    testWidgets('height is the height of the button', (tester) async {
      await _pumpLoose(
        tester,
        ImpaktfullUiButton(
          type: ImpaktfullUiButtonType.primary,
          title: 'Save',
          onTap: () {},
        ),
      );
      // Without a height the height follows from the padding and the line box
      // of the title, like it always did.
      final emergentHeight = _buttonSize(tester).height;
      expect(emergentHeight, greaterThan(32));

      await _pumpLoose(
        tester,
        ImpaktfullUiButton(
          type: ImpaktfullUiButtonType.primary,
          title: 'Save',
          onTap: () {},
          theme: _sizeTheme(_mediumDimens(height: 32)),
        ),
      );
      // Ant Design's `controlHeight`, with the default vertical padding of 12
      // still in the theme: a height wins over it.
      expect(_buttonSize(tester).height, 32);
    });

    testWidgets('height centers the content of the button', (tester) async {
      await _pumpLoose(
        tester,
        ImpaktfullUiButton(
          type: ImpaktfullUiButtonType.primary,
          title: 'Save',
          onTap: () {},
          theme: _sizeTheme(_mediumDimens(height: 80)),
        ),
      );
      expect(_buttonSize(tester).height, 80);
      expect(
        tester.getCenter(find.text('Save')).dy,
        tester.getCenter(find.byType(ImpaktfullUiButton)).dy,
      );
    });

    testWidgets('a title that wraps grows a button with a height',
        (tester) async {
      await _pumpLoose(
        tester,
        SizedBox(
          width: 100,
          child: ImpaktfullUiButton(
            type: ImpaktfullUiButtonType.primary,
            title: 'A title that does not fit on one line',
            onTap: () {},
            theme: _sizeTheme(_mediumDimens(height: 32)),
          ),
        ),
      );
      // The height is exact for content that fits and a minimum for content
      // that does not: the button grows instead of overflowing.
      expect(_buttonSize(tester).height, greaterThan(32));
      expect(tester.takeException(), isNull);
    });

    testWidgets('padding is the space around the content', (tester) async {
      await _pumpLoose(
        tester,
        ImpaktfullUiButton(
          type: ImpaktfullUiButtonType.primary,
          title: 'Save',
          onTap: () {},
        ),
      );
      expect(tester.getTopLeft(find.text('Save')).dx, 16);

      await _pumpLoose(
        tester,
        ImpaktfullUiButton(
          type: ImpaktfullUiButtonType.primary,
          title: 'Save',
          onTap: () {},
          theme: _sizeTheme(
            _mediumDimens(padding: const EdgeInsets.symmetric(horizontal: 40)),
          ),
        ),
      );
      expect(tester.getTopLeft(find.text('Save')).dx, 40);
    });

    testWidgets('linkPadding is the padding of a link button', (tester) async {
      await _pumpLoose(
        tester,
        ImpaktfullUiButton(
          type: ImpaktfullUiButtonType.link,
          title: 'Save',
          onTap: () {},
        ),
      );
      expect(tester.getTopLeft(find.text('Save')).dx, 4);

      final base = _base;
      await _pumpLoose(
        tester,
        ImpaktfullUiButton(
          type: ImpaktfullUiButtonType.link,
          title: 'Save',
          onTap: () {},
          theme: base.copyWith(
            dimens: base.dimens.copyWith(
              linkPadding: const EdgeInsets.symmetric(horizontal: 24),
            ),
          ),
        ),
      );
      expect(tester.getTopLeft(find.text('Save')).dx, 24);
    });

    testWidgets('spacing is the space between the icon and the title',
        (tester) async {
      double spacing(WidgetTester tester) =>
          tester.getRect(find.text('Save')).left -
          tester.getRect(find.byType(ImpaktfullUiAssetWidget)).right;

      await _pumpLoose(
        tester,
        ImpaktfullUiButton(
          type: ImpaktfullUiButtonType.primary,
          title: 'Save',
          leadingAsset: _testAsset,
          onTap: () {},
        ),
      );
      expect(spacing(tester), 4);

      await _pumpLoose(
        tester,
        ImpaktfullUiButton(
          type: ImpaktfullUiButtonType.primary,
          title: 'Save',
          leadingAsset: _testAsset,
          onTap: () {},
          theme: _sizeTheme(_mediumDimens(spacing: 20)),
        ),
      );
      expect(spacing(tester), 20);
    });

    testWidgets('iconSize is the size of the leading asset', (tester) async {
      await _pumpLoose(
        tester,
        ImpaktfullUiButton(
          type: ImpaktfullUiButtonType.primary,
          title: 'Save',
          leadingAsset: _testAsset,
          onTap: () {},
        ),
      );
      expect(
        tester.getSize(find.byType(ImpaktfullUiAssetWidget)),
        const Size(20, 20),
      );

      await _pumpLoose(
        tester,
        ImpaktfullUiButton(
          type: ImpaktfullUiButtonType.primary,
          title: 'Save',
          leadingAsset: _testAsset,
          onTap: () {},
          theme: _sizeTheme(_mediumDimens(iconSize: 16)),
        ),
      );
      expect(
        tester.getSize(find.byType(ImpaktfullUiAssetWidget)),
        const Size(16, 16),
      );
    });

    testWidgets('loadingSize is the height of the loading indicator',
        (tester) async {
      double loadingHeight(WidgetTester tester) => tester
          .getSize(find
              .ancestor(
                of: find.byType(ImpaktfullUiLoadingIndicator),
                matching: find.byType(SizedBox),
              )
              .first)
          .height;

      await pumpImpaktfullUiApp(
        tester,
        const Material(
          child: Align(
            alignment: Alignment.topLeft,
            child: ImpaktfullUiButton(
              type: ImpaktfullUiButtonType.primary,
              title: 'Save',
              isLoading: true,
            ),
          ),
        ),
        // The loading indicator animates forever.
        settle: false,
      );
      expect(loadingHeight(tester), 32);

      await pumpImpaktfullUiApp(
        tester,
        Material(
          child: Align(
            alignment: Alignment.topLeft,
            child: ImpaktfullUiButton(
              type: ImpaktfullUiButtonType.primary,
              title: 'Save',
              isLoading: true,
              theme: _sizeTheme(_mediumDimens(loadingSize: 12)),
            ),
          ),
        ),
        settle: false,
      );
      expect(loadingHeight(tester), 12);
    });

    testWidgets('every size has its own geometry', (tester) async {
      final sizes = _base.dimens.sizes;
      expect(
        [
          for (final size in ImpaktfullUiButtonSize.values)
            sizes.bySize(size).padding,
        ],
        const [
          EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        ],
      );
      // The default of every size is the value the widget hardcoded before.
      expect(
        [
          for (final size in ImpaktfullUiButtonSize.values)
            sizes.bySize(size).iconSize,
        ],
        const [20.0, 20.0, 20.0, 20.0, 24.0],
      );
      expect(
        [
          for (final size in ImpaktfullUiButtonSize.values)
            sizes.bySize(size).loadingSize,
        ],
        const [24.0, 32.0, 32.0, 40.0, 48.0],
      );
      expect(
        [
          for (final size in ImpaktfullUiButtonSize.values)
            sizes.bySize(size).height,
        ],
        const [null, null, null, null, null],
      );
    });
  });

  group('ImpaktfullUiButtonStateColorTheme', () {
    ImpaktfullUiButtonTheme colorTheme({
      ImpaktfullUiButtonStateColorTheme? hover,
      ImpaktfullUiButtonStateColorTheme? pressed,
      ImpaktfullUiButtonStateColorTheme? disabled,
    }) {
      final base = _base;
      return base.copyWith(
        colors: base.colors.copyWith(
          primaryHover: hover,
          primaryPressed: pressed,
          primaryDisabled: disabled,
        ),
      );
    }

    Widget button({
      required ImpaktfullUiButtonTheme theme,
      VoidCallback? onTap,
    }) =>
        ImpaktfullUiButton(
          type: ImpaktfullUiButtonType.primary,
          title: 'Save',
          onTap: onTap,
          theme: theme,
        );

    testWidgets('a button without state colours does not track the pointer',
        (tester) async {
      await _pumpLoose(
        tester,
        ImpaktfullUiButton(
          type: ImpaktfullUiButtonType.primary,
          title: 'Save',
          onTap: () {},
        ),
      );
      // The hover feedback is only added when the theme has a hovered colour,
      // so the default button renders exactly like it did before.
      expect(find.byType(ImpaktfullUiHoverFeedback), findsNothing);
    });

    testWidgets('hover changes the background, the border and the title',
        (tester) async {
      final theme = colorTheme(
        hover: const ImpaktfullUiButtonStateColorTheme(
          background: Color(0xFF4096FF),
          border: Color(0xFF69B1FF),
          text: Color(0xFF002766),
        ),
      );
      await _pumpLoose(tester, button(theme: theme, onTap: () {}));
      expect(find.byType(ImpaktfullUiHoverFeedback), findsOneWidget);
      expect(_container(tester).color, theme.colors.primary);

      await _withHover(tester, () async {
        expect(_container(tester).color, const Color(0xFF4096FF));
        expect(_borderColor(tester), const Color(0xFF69B1FF));
        expect(_titleColor(tester), const Color(0xFF002766));
      });
    });

    testWidgets('a hover colour can change the title only, like Ant Design',
        (tester) async {
      final theme = colorTheme(
        hover: const ImpaktfullUiButtonStateColorTheme(
          text: Color(0xFF4096FF),
          border: Color(0xFF4096FF),
        ),
      );
      await _pumpLoose(tester, button(theme: theme, onTap: () {}));
      await _withHover(tester, () async {
        // Every field of the state falls back to the normal colour: the
        // background does not move.
        expect(_container(tester).color, theme.colors.primary);
        expect(_borderColor(tester), const Color(0xFF4096FF));
        expect(_titleColor(tester), const Color(0xFF4096FF));
      });
    });

    testWidgets('pressed applies while the pointer is down', (tester) async {
      final theme = colorTheme(
        hover: const ImpaktfullUiButtonStateColorTheme(
          background: Color(0xFF4096FF),
        ),
        pressed: const ImpaktfullUiButtonStateColorTheme(
          background: Color(0xFF0958D9),
        ),
      );
      await _pumpLoose(tester, button(theme: theme, onTap: () {}));
      final gesture =
          await tester.startGesture(tester.getCenter(find.text('Save')));
      await tester.pump();
      expect(_container(tester).color, const Color(0xFF0958D9));

      await gesture.up();
      await tester.pumpAndSettle();
      expect(_container(tester).color, theme.colors.primary);
    });

    testWidgets('disabled colours a disabled button instead of fading it',
        (tester) async {
      Opacity opacity(WidgetTester tester) => tester.widget<Opacity>(
            find
                .descendant(
                  of: find.byType(ImpaktfullUiButton),
                  matching: find.byType(Opacity),
                )
                .first,
          );

      await _pumpLoose(tester, button(theme: _base));
      // Without a disabled colour the whole button is faded, like before.
      expect(opacity(tester).opacity, 0.5);

      final theme = colorTheme(
        disabled: const ImpaktfullUiButtonStateColorTheme(
          background: Color(0xFFF5F5F5),
          border: Color(0xFFD9D9D9),
          text: Color(0x40000000),
        ),
      );
      await _pumpLoose(tester, button(theme: theme));
      expect(opacity(tester).opacity, 1);
      expect(_container(tester).color, const Color(0xFFF5F5F5));
      expect(_borderColor(tester), const Color(0xFFD9D9D9));
      expect(_titleColor(tester), const Color(0x40000000));
    });

    testWidgets('a disabled button does not use its hovered colour',
        (tester) async {
      final theme = colorTheme(
        hover: const ImpaktfullUiButtonStateColorTheme(
          background: Color(0xFF4096FF),
        ),
      );
      await _pumpLoose(tester, button(theme: theme));
      expect(find.byType(ImpaktfullUiHoverFeedback), findsNothing);
      expect(_container(tester).color, theme.colors.primary);
    });

    testWidgets('every variant has its own state colours', (tester) async {
      final base = _base;
      // The secondary state colours are used by every button with the
      // secondary background, the tertiary ones by every button without one.
      final theme = base.copyWith(
        colors: base.colors.copyWith(
          secondaryHover: const ImpaktfullUiButtonStateColorTheme(
            text: Color(0xFF00FF00),
          ),
          tertiaryHover: const ImpaktfullUiButtonStateColorTheme(
            text: Color(0xFF0000FF),
          ),
          destructiveHover: const ImpaktfullUiButtonStateColorTheme(
            text: Color(0xFFFF0000),
          ),
        ),
      );
      const expected = {
        ImpaktfullUiButtonType.secondary: Color(0xFF00FF00),
        ImpaktfullUiButtonType.secondaryGrey: Color(0xFF00FF00),
        ImpaktfullUiButtonType.destructiveSecondary: Color(0xFF00FF00),
        ImpaktfullUiButtonType.tertiary: Color(0xFF0000FF),
        ImpaktfullUiButtonType.tertiaryGrey: Color(0xFF0000FF),
        ImpaktfullUiButtonType.link: Color(0xFF0000FF),
        ImpaktfullUiButtonType.linkGrey: Color(0xFF0000FF),
        ImpaktfullUiButtonType.destructiveTertiary: Color(0xFF0000FF),
        ImpaktfullUiButtonType.destructiveLink: Color(0xFF0000FF),
        ImpaktfullUiButtonType.destructivePrimary: Color(0xFFFF0000),
      };
      for (final entry in expected.entries) {
        await _pumpLoose(
          tester,
          ImpaktfullUiButton(
            type: entry.key,
            title: 'Save',
            onTap: () {},
            theme: theme,
          ),
        );
        await _withHover(tester, () async {
          expect(
            _titleColor(tester),
            entry.value,
            reason: '${entry.key} hovers to ${entry.value}',
          );
        });
      }
    });
  });
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../_layout_test_helpers.dart';

/// Freezes what the size and the state tokens of the button make possible: a
/// control height like Ant Design's `controlHeight` and a hover, pressed and
/// disabled ramp that changes the background, the border and the text.

const _hoveredKey = Key('hovered');
const _pressedKey = Key('pressed');

ImpaktfullUiButtonTheme get _base =>
    ImpaktfullUiTheme.getDefault().components.button;

/// The geometry of an Ant Design control: an explicit height, no vertical
/// padding and a 16 px icon.
ImpaktfullUiButtonSizeDimensTheme _antSize(double height) =>
    ImpaktfullUiButtonSizeDimensTheme(
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      loadingSize: height,
      iconSize: 16,
      spacing: 8,
    );

/// A button theme in the style of Ant Design 5: `controlHeight` 32 (24 small,
/// 40 large), a 6 px radius, and the blue-5 / blue-7 hover and active ramp
/// where a default button only changes its text and its border.
ImpaktfullUiButtonTheme _antButtonTheme() {
  final base = _base;
  return base.copyWith(
    colors: base.colors.copyWith(
      primary: const Color(0xFF1677FF),
      primaryBorder: const Color(0xFF1677FF),
      secondary: const Color(0xFFFFFFFF),
      secondaryBorder: const Color(0xFFD9D9D9),
      primaryHover: const ImpaktfullUiButtonStateColorTheme(
        background: Color(0xFF4096FF),
        border: Color(0xFF4096FF),
      ),
      primaryPressed: const ImpaktfullUiButtonStateColorTheme(
        background: Color(0xFF0958D9),
        border: Color(0xFF0958D9),
      ),
      primaryDisabled: const ImpaktfullUiButtonStateColorTheme(
        background: Color(0xFFF5F5F5),
        border: Color(0xFFD9D9D9),
        text: Color(0x40000000),
      ),
      secondaryHover: const ImpaktfullUiButtonStateColorTheme(
        border: Color(0xFF4096FF),
        text: Color(0xFF4096FF),
      ),
      secondaryPressed: const ImpaktfullUiButtonStateColorTheme(
        border: Color(0xFF0958D9),
        text: Color(0xFF0958D9),
      ),
      secondaryDisabled: const ImpaktfullUiButtonStateColorTheme(
        background: Color(0xFFF5F5F5),
        border: Color(0xFFD9D9D9),
        text: Color(0x40000000),
      ),
    ),
    dimens: base.dimens.copyWith(
      borderRadius: BorderRadius.circular(6),
      sizes: ImpaktfullUiButtonSizesDimensTheme(
        extraSmall: _antSize(24),
        small: _antSize(24),
        medium: _antSize(32),
        large: _antSize(40),
        extraLarge: _antSize(40),
      ),
    ),
  );
}

/// A button theme in the style of shadcn/ui: `h-8` / `h-9` / `h-10` with
/// `px-3` / `px-4` / `px-6` and a 16 px icon.
ImpaktfullUiButtonTheme _shadcnButtonTheme() {
  final base = _base;
  return base.copyWith(
    dimens: base.dimens.copyWith(
      borderRadius: BorderRadius.circular(8),
      sizes: const ImpaktfullUiButtonSizesDimensTheme(
        extraSmall: ImpaktfullUiButtonSizeDimensTheme(
          height: 32,
          padding: EdgeInsets.symmetric(horizontal: 12),
          loadingSize: 24,
          iconSize: 16,
          spacing: 8,
        ),
        small: ImpaktfullUiButtonSizeDimensTheme(
          height: 32,
          padding: EdgeInsets.symmetric(horizontal: 12),
          loadingSize: 24,
          iconSize: 16,
          spacing: 8,
        ),
        medium: ImpaktfullUiButtonSizeDimensTheme(
          height: 36,
          padding: EdgeInsets.symmetric(horizontal: 16),
          loadingSize: 28,
          iconSize: 16,
          spacing: 8,
        ),
        large: ImpaktfullUiButtonSizeDimensTheme(
          height: 40,
          padding: EdgeInsets.symmetric(horizontal: 24),
          loadingSize: 32,
          iconSize: 16,
          spacing: 8,
        ),
        extraLarge: ImpaktfullUiButtonSizeDimensTheme(
          height: 40,
          padding: EdgeInsets.symmetric(horizontal: 24),
          loadingSize: 32,
          iconSize: 16,
          spacing: 8,
        ),
      ),
    ),
  );
}

/// A row of a primary and a secondary button in [theme].
Widget _buttonRow(
  ImpaktfullUiButtonTheme theme, {
  ImpaktfullUiButtonSize size = ImpaktfullUiButtonSize.medium,
}) =>
    ImpaktfullUiAutoLayout.horizontal(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 8,
      children: [
        for (final type in [
          ImpaktfullUiButtonType.primary,
          ImpaktfullUiButtonType.secondary,
        ])
          ImpaktfullUiButton(
            type: type,
            title: 'Button',
            size: size,
            theme: theme,
            onTap: () {},
          ),
      ],
    );

/// Hovers the button with [_hoveredKey] and holds the pointer down on the one
/// with [_pressedKey], so the golden freezes both states.
Future<void> _hoverAndPress(WidgetTester tester) async {
  await tester.pumpAndSettle();
  final mouse = await tester.createGesture(kind: PointerDeviceKind.mouse);
  await mouse.addPointer(location: Offset.zero);
  addTearDown(mouse.removePointer);
  await mouse.moveTo(tester.getCenter(find.byKey(_hoveredKey)));
  await tester.pumpAndSettle();
  final press = await tester.startGesture(
    tester.getCenter(find.byKey(_pressedKey)),
  );
  addTearDown(press.cancel);
  await tester.pumpAndSettle();
}

void main() {
  setUp(() => setupComponentTest());

  runComponentTest(
    fileName: 'impaktfull_ui_button_size_tokens',
    columns: 2,
    goldenTests: () => [
      for (final size in [
        ImpaktfullUiButtonSize.small,
        ImpaktfullUiButtonSize.medium,
        ImpaktfullUiButtonSize.large,
      ]) ...[
        layoutGoldenCase(
          'Ant ${size.name}',
          _buttonRow(_antButtonTheme(), size: size),
        ),
        layoutGoldenCase(
          'shadcn ${size.name}',
          _buttonRow(_shadcnButtonTheme(), size: size),
        ),
      ],
      layoutGoldenCase(
        'Ant 32 with an icon',
        ImpaktfullUiButton(
          type: ImpaktfullUiButtonType.primary,
          title: 'Button',
          leadingAsset: const ImpaktfullUiAsset.icon(Icons.add),
          theme: _antButtonTheme(),
          onTap: () {},
        ),
      ),
      layoutGoldenCase(
        'Ant 32 with a title that wraps',
        SizedBox(
          width: 120,
          child: ImpaktfullUiButton(
            type: ImpaktfullUiButtonType.primary,
            title: 'A title that wraps to two lines',
            theme: _antButtonTheme(),
            onTap: () {},
          ),
        ),
      ),
    ],
  );

  runComponentTest(
    fileName: 'impaktfull_ui_button_state_tokens',
    columns: 2,
    pumpBeforeTest: _hoverAndPress,
    goldenTests: () => [
      layoutGoldenCase('Ant normal', _buttonRow(_antButtonTheme())),
      layoutGoldenCase(
        'Ant disabled',
        ImpaktfullUiAutoLayout.horizontal(
          mainAxisSize: MainAxisSize.min,
          spacing: 8,
          children: [
            for (final type in [
              ImpaktfullUiButtonType.primary,
              ImpaktfullUiButtonType.secondary,
            ])
              ImpaktfullUiButton(
                type: type,
                title: 'Button',
                theme: _antButtonTheme(),
              ),
          ],
        ),
      ),
      layoutGoldenCase(
        'Ant hovered',
        ImpaktfullUiAutoLayout.horizontal(
          mainAxisSize: MainAxisSize.min,
          spacing: 8,
          children: [
            ImpaktfullUiButton(
              key: _hoveredKey,
              type: ImpaktfullUiButtonType.primary,
              title: 'Button',
              theme: _antButtonTheme(),
              onTap: () {},
            ),
          ],
        ),
      ),
      layoutGoldenCase(
        'Ant pressed',
        ImpaktfullUiAutoLayout.horizontal(
          mainAxisSize: MainAxisSize.min,
          spacing: 8,
          children: [
            ImpaktfullUiButton(
              key: _pressedKey,
              type: ImpaktfullUiButtonType.primary,
              title: 'Button',
              theme: _antButtonTheme(),
              onTap: () {},
            ),
          ],
        ),
      ),
    ],
  );
}

import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

/// An [ImpaktfullUiTheme] in the style of Ant Design 5.
///
/// This is not a port of Ant Design and it is not affiliated with it: the
/// components of this package are built differently, so a few details cannot
/// be reached from a theme. `doc/design-system-themes.md` lists what differs.
///
/// ```dart
/// ImpaktfullUiThemeBuilder(
///   theme: ImpaktfullUiAntDesignTheme.light(),
///   builder: (context) => const MyApp(),
/// )
/// ```
///
/// Sources of the tokens, on the `5.x-stable` branch of `ant-design/ant-design`
/// and at <https://5x.ant.design>:
/// - `components/theme/themes/seed.ts` for the seed tokens.
/// - `components/theme/util/alias.ts` and
///   `components/theme/themes/dark/colorAlgorithm.ts` for the map and alias
///   tokens of both algorithms.
/// - the "Design Token" table of each component page, e.g.
///   <https://5x.ant.design/components/button#design-token>.
///
/// Ant Design's `fontFamily` is a stack that starts at the font of the
/// platform, which in Flutter is no family at all, so this theme sets none.
abstract final class ImpaktfullUiAntDesignTheme {
  /// `colorPrimary`, blue-6.
  static const colorPrimary = Color(0xFF1677FF);

  /// `colorPrimaryHover`, blue-5.
  static const colorPrimaryHover = Color(0xFF4096FF);

  /// `colorPrimaryActive`, blue-7.
  static const colorPrimaryActive = Color(0xFF0958D9);

  /// `colorPrimaryBorder`, blue-3: the `outline` of a focused control.
  static const colorPrimaryBorder = Color(0xFF91CAFF);

  /// `colorSuccess`, green-6.
  static const colorSuccess = Color(0xFF52C41A);

  /// `colorWarning`, gold-6.
  static const colorWarning = Color(0xFFFAAD14);

  /// `colorError`, red-5.
  static const colorError = Color(0xFFFF4D4F);

  /// `colorErrorHover`, red-4.
  static const colorErrorHover = Color(0xFFFF7875);

  /// `colorErrorActive`, red-6.
  static const colorErrorActive = Color(0xFFD9363E);

  /// `colorText`: `rgba(0, 0, 0, 0.88)`.
  static const colorText = Color(0xE0000000);

  /// `colorTextSecondary`: `rgba(0, 0, 0, 0.65)`.
  static const colorTextSecondary = Color(0xA6000000);

  /// `colorTextTertiary`: `rgba(0, 0, 0, 0.45)`.
  static const colorTextTertiary = Color(0x73000000);

  /// `colorTextDisabled`: `rgba(0, 0, 0, 0.25)`.
  static const colorTextDisabled = Color(0x40000000);

  /// `colorBorder`.
  static const colorBorder = Color(0xFFD9D9D9);

  /// `colorBorderSecondary`: the border of a card and between table rows.
  static const colorBorderSecondary = Color(0xFFF0F0F0);

  /// `colorBgContainer`: the background of a card, a table and an input.
  static const colorBgContainer = Color(0xFFFFFFFF);

  /// `colorBgLayout`: the background of a page.
  static const colorBgLayout = Color(0xFFF5F5F5);

  /// `colorFillAlter`: the header of a table and a hovered row.
  static const colorFillAlter = Color(0xFFFAFAFA);

  /// `colorBgContainerDisabled`: `rgba(0, 0, 0, 0.04)`.
  static const colorBgContainerDisabled = Color(0x0A000000);

  /// `colorFillSecondary`, the hover of a text button: `rgba(0, 0, 0, 0.06)`.
  static const colorFillSecondary = Color(0x0F000000);

  /// `controlOutline`: the 2px ring of a focused input,
  /// `rgba(5, 145, 255, 0.1)`.
  static const controlOutline = Color(0x1A0591FF);

  /// `colorPrimary` of the dark algorithm.
  static const colorPrimaryDark = Color(0xFF1668DC);

  /// `colorPrimaryHover` of the dark algorithm.
  static const colorPrimaryHoverDark = Color(0xFF3C89E8);

  /// `colorPrimaryActive` of the dark algorithm.
  static const colorPrimaryActiveDark = Color(0xFF1554AD);

  /// `colorPrimaryBorder` of the dark algorithm.
  static const colorPrimaryBorderDark = Color(0xFF15325B);

  /// `colorText` of the dark algorithm: `rgba(255, 255, 255, 0.85)`.
  static const colorTextDark = Color(0xD9FFFFFF);

  /// `colorTextSecondary` of the dark algorithm.
  static const colorTextSecondaryDark = Color(0xA6FFFFFF);

  /// `colorTextTertiary` of the dark algorithm.
  static const colorTextTertiaryDark = Color(0x73FFFFFF);

  /// `colorTextDisabled` of the dark algorithm.
  static const colorTextDisabledDark = Color(0x40FFFFFF);

  /// `colorBorder` of the dark algorithm.
  static const colorBorderDark = Color(0xFF424242);

  /// `colorBorderSecondary` of the dark algorithm.
  static const colorBorderSecondaryDark = Color(0xFF303030);

  /// `colorBgContainer` of the dark algorithm.
  static const colorBgContainerDark = Color(0xFF141414);

  /// `colorBgElevated` of the dark algorithm: a modal and a popover.
  static const colorBgElevatedDark = Color(0xFF1F1F1F);

  /// `colorBgLayout` of the dark algorithm.
  static const colorBgLayoutDark = Color(0xFF000000);

  /// `colorFillAlter` of the dark algorithm.
  static const colorFillAlterDark = Color(0xFF1D1D1D);

  /// `colorError` of the dark algorithm.
  static const colorErrorDark = Color(0xFFDC4446);

  /// `colorErrorHover` of the dark algorithm.
  static const colorErrorHoverDark = Color(0xFFE86E6B);

  /// `colorErrorActive` of the dark algorithm.
  static const colorErrorActiveDark = Color(0xFFAD393A);

  /// `colorFillSecondary` of the dark algorithm:
  /// `rgba(255, 255, 255, 0.08)`.
  static const colorFillSecondaryDark = Color(0x14FFFFFF);

  /// `colorBgContainerDisabled` of the dark algorithm:
  /// `rgba(255, 255, 255, 0.08)`.
  static const colorBgContainerDisabledDark = Color(0x14FFFFFF);

  /// `colorSuccess` of the dark algorithm.
  static const colorSuccessDark = Color(0xFF49AA19);

  /// `colorWarning` of the dark algorithm.
  static const colorWarningDark = Color(0xFFD89614);

  /// `borderRadius`: the radius of a button, an input and a tag.
  static const borderRadius = 6.0;

  /// `borderRadiusLG`: the radius of a card and a modal.
  static const borderRadiusLarge = 8.0;

  /// `controlHeight`, the single most recognizable measurement of Ant Design.
  static const controlHeight = 32.0;

  /// `controlHeightSM`.
  static const controlHeightSmall = 24.0;

  /// `controlHeightLG`.
  static const controlHeightLarge = 40.0;

  /// `controlInteractiveSize`: the size of a checkbox.
  static const controlInteractiveSize = 16.0;

  /// `fontSize` (14) times `lineHeight` (22 / 14) is a line box of 22.
  static const lineHeight = 22 / 14;

  /// `boxShadowTertiary`: the shadow of a card.
  static const shadowCard = [
    BoxShadow(color: Color(0x08000000), offset: Offset(0, 1), blurRadius: 2),
    BoxShadow(
      color: Color(0x05000000),
      offset: Offset(0, 1),
      blurRadius: 6,
      spreadRadius: -1,
    ),
    BoxShadow(color: Color(0x05000000), offset: Offset(0, 2), blurRadius: 4),
  ];

  /// `boxShadowSecondary`: the shadow of a modal and a dropdown.
  static const shadowElevated = [
    BoxShadow(color: Color(0x14000000), offset: Offset(0, 6), blurRadius: 16),
    BoxShadow(
      color: Color(0x1F000000),
      offset: Offset(0, 3),
      blurRadius: 6,
      spreadRadius: -4,
    ),
    BoxShadow(color: Color(0x0D000000), offset: Offset(0, 9), blurRadius: 28),
  ];

  /// Ant Design with its default algorithm.
  static ImpaktfullUiTheme<T> light<T extends Object>({
    String? fontFamily,
    T? customTheme,
  }) =>
      _build(
        brightness: Brightness.light,
        fontFamily: fontFamily,
        customTheme: customTheme,
      );

  /// Ant Design with `theme.darkAlgorithm`.
  static ImpaktfullUiTheme<T> dark<T extends Object>({
    String? fontFamily,
    T? customTheme,
  }) =>
      _build(
        brightness: Brightness.dark,
        fontFamily: fontFamily,
        customTheme: customTheme,
      );

  static ImpaktfullUiTheme<T> _build<T extends Object>({
    required Brightness brightness,
    String? fontFamily,
    T? customTheme,
  }) {
    final isDark = brightness == Brightness.dark;
    final primary = isDark ? colorPrimaryDark : colorPrimary;
    final primaryHover = isDark ? colorPrimaryHoverDark : colorPrimaryHover;
    final primaryActive = isDark ? colorPrimaryActiveDark : colorPrimaryActive;
    final primaryBorder = isDark ? colorPrimaryBorderDark : colorPrimaryBorder;
    final text = isDark ? colorTextDark : colorText;
    final textSecondary = isDark ? colorTextSecondaryDark : colorTextSecondary;
    final textTertiary = isDark ? colorTextTertiaryDark : colorTextTertiary;
    final textDisabled = isDark ? colorTextDisabledDark : colorTextDisabled;
    final border = isDark ? colorBorderDark : colorBorder;
    final borderSecondary =
        isDark ? colorBorderSecondaryDark : colorBorderSecondary;
    final bgContainer = isDark ? colorBgContainerDark : colorBgContainer;
    final bgElevated = isDark ? colorBgElevatedDark : colorBgContainer;
    final bgLayout = isDark ? colorBgLayoutDark : colorBgLayout;
    final fillAlter = isDark ? colorFillAlterDark : colorFillAlter;
    final error = isDark ? colorErrorDark : colorError;
    final fillSecondary = isDark ? colorFillSecondaryDark : colorFillSecondary;
    final bgDisabled =
        isDark ? colorBgContainerDisabledDark : colorBgContainerDisabled;
    final errorHover = isDark ? colorErrorHoverDark : colorErrorHover;
    final errorActive = isDark ? colorErrorActiveDark : colorErrorActive;

    final base = ImpaktfullUiDefaultTheme.withMinimalChanges<T>(
      label: isDark ? 'Ant Design (dark)' : 'Ant Design',
      brightness: brightness,
      // `colorPrimary` is the background of a primary button, which this
      // package takes from `accent`.
      accent: primary,
      textOnAccent: Colors.white,
      primary: primary,
      textOnPrimary: Colors.white,
      secondary: bgContainer,
      textSecondary: textSecondary,
      tertiary: textTertiary,
      textTertiary: textTertiary,
      canvas: bgLayout,
      card: bgContainer,
      card2: fillAlter,
      border: border,
      text: text,
      shadow: Colors.black,
      destructive: error,
      error: error,
      warning: isDark ? colorWarningDark : colorWarning,
      success: isDark ? colorSuccessDark : colorSuccess,
      info: primary,
      // `borderRadius: 6`, and `borderRadiusLG: 8` instead of the `+ 4` of the
      // seed.
      radius: borderRadius,
      borderRadiusLarge: BorderRadius.circular(borderRadiusLarge),
      borderRadiusExtraLarge: BorderRadius.circular(borderRadiusLarge),
      // `fontSize: 14` with `lineHeight: 22 / 14`, so `small` is Ant's
      // `fontSizeSM` (12) and `large` its `fontSizeLG` (16).
      fontSizeText: 14,
      heightText: lineHeight,
      heightDisplay: lineHeight,
      fontFamilyDisplay: fontFamily,
      fontFamilyText: fontFamily,
      package: null,
      customTheme: customTheme,
    );
    final components = base.components;
    return base.copyWith(
      components: components.copyWith(
        button: components.button.copyWith(
          // `controlHeightSM: 24`, `controlHeight: 32` and
          // `controlHeightLG: 40`, with `paddingInline` 7, 15 and 15. Ant
          // Design has three control heights; the two sizes of this package
          // that it has no answer for continue the same scale.
          dimens: components.button.dimens.copyWith(
            sizes: const ImpaktfullUiButtonSizesDimensTheme(
              extraSmall: ImpaktfullUiButtonSizeDimensTheme(
                height: controlHeightSmall,
                padding: EdgeInsets.symmetric(horizontal: 7),
                spacing: 8,
                iconSize: 14,
                loadingSize: 14,
              ),
              small: ImpaktfullUiButtonSizeDimensTheme(
                height: 28,
                padding: EdgeInsets.symmetric(horizontal: 11),
                spacing: 8,
                iconSize: 14,
                loadingSize: 14,
              ),
              medium: ImpaktfullUiButtonSizeDimensTheme(
                height: controlHeight,
                padding: EdgeInsets.symmetric(horizontal: 15),
                spacing: 8,
                iconSize: 16,
                loadingSize: 16,
              ),
              large: ImpaktfullUiButtonSizeDimensTheme(
                height: controlHeightLarge,
                padding: EdgeInsets.symmetric(horizontal: 15),
                spacing: 8,
                iconSize: 16,
                loadingSize: 16,
              ),
              extraLarge: ImpaktfullUiButtonSizeDimensTheme(
                height: 48,
                padding: EdgeInsets.symmetric(horizontal: 20),
                spacing: 8,
                iconSize: 18,
                loadingSize: 18,
              ),
            ),
          ),
          // The `hover` and `active` ramp that makes a button feel like Ant:
          // a solid button goes lighter on hover and darker while pressed,
          // the default (outline) and the text button turn blue.
          // The `default` button of Ant is a white button with a
          // `colorBorder` border and `colorText` text, which turns blue on
          // hover; only `type="primary"` is filled.
          textStyles: ImpaktfullUiButtonTextStyleTheme(
            primary:
                components.button.textStyles.primary.copyWith(fontSize: 14),
            alternative: components.button.textStyles.alternative
                .copyWith(color: text, fontSize: 14),
            grey: components.button.textStyles.grey
                .copyWith(color: text, fontSize: 14),
            destructivePrimary: components.button.textStyles.destructivePrimary
                .copyWith(fontSize: 14),
            destructiveAlternative: components
                .button.textStyles.destructiveAlternative
                .copyWith(fontSize: 14),
          ),
          colors: components.button.colors.copyWith(
            secondary: bgContainer,
            secondaryBorder: border,
            primaryHover:
                ImpaktfullUiButtonStateColorTheme(background: primaryHover),
            primaryPressed:
                ImpaktfullUiButtonStateColorTheme(background: primaryActive),
            primaryDisabled: ImpaktfullUiButtonStateColorTheme(
              background: bgDisabled,
              border: border,
              text: textDisabled,
            ),
            secondaryHover: ImpaktfullUiButtonStateColorTheme(
              border: primaryHover,
              text: primaryHover,
            ),
            secondaryPressed: ImpaktfullUiButtonStateColorTheme(
              border: primaryActive,
              text: primaryActive,
            ),
            secondaryDisabled: ImpaktfullUiButtonStateColorTheme(
              background: bgDisabled,
              border: border,
              text: textDisabled,
            ),
            tertiaryHover:
                ImpaktfullUiButtonStateColorTheme(background: fillSecondary),
            tertiaryPressed: ImpaktfullUiButtonStateColorTheme(
              background: fillSecondary,
              text: primaryActive,
            ),
            tertiaryDisabled:
                ImpaktfullUiButtonStateColorTheme(text: textDisabled),
            destructiveHover:
                ImpaktfullUiButtonStateColorTheme(background: errorHover),
            destructivePressed:
                ImpaktfullUiButtonStateColorTheme(background: errorActive),
            destructiveDisabled: ImpaktfullUiButtonStateColorTheme(
              background: bgDisabled,
              border: border,
              text: textDisabled,
            ),
          ),
          // Ant Design 5 dropped the shadow of a solid button
          // (`primaryShadow` is `0 2px 0 rgba(5, 145, 255, 0.1)`, which is a
          // line under it rather than a shadow).
          shadows: const ImpaktfullUiButtonShadowsTheme(
            primary: [],
            secondary: [],
            destructive: [],
          ),
        ),
        // `controlHeight: 32`, `paddingInline: 11`, `paddingBlock: 4`, a
        // `colorPrimaryHover` border on hover and on focus, and
        // `controlOutline` as a 2px ring while focused.
        inputField: components.inputField.copyWith(
          colors: components.inputField.colors.copyWith(
            borderHover: primaryHover,
            borderFocused: primaryHover,
            focusRing: controlOutline,
          ),
          dimens: components.inputField.dimens.copyWith(
            minHeight: controlHeight,
            padding: const EdgeInsetsDirectional.only(start: 11, end: 11),
            paddingWithActions:
                const EdgeInsetsDirectional.only(start: 11, end: 4),
            contentPadding: const EdgeInsets.symmetric(vertical: 4),
            borderWidth: 1,
            focusRingWidth: 2,
          ),
        ),
        // `&:focus-visible { outline: 4px solid colorPrimaryBorder;
        // outline-offset: 1px; }`.
        touchFeedback: components.touchFeedback.copyWith(
          focusRing: ImpaktfullUiFocusRingTheme(
            color: primaryBorder,
            width: 4,
            offset: 1,
          ),
          colors: ImpaktfullUiTouchFeedbackColorTheme(
            hover: fillSecondary,
            highlight: fillSecondary,
            splash: Colors.transparent,
          ),
        ),
        // `borderRadiusLG` with `padding: 24` and `boxShadowTertiary`, over a
        // `colorBorderSecondary` border.
        card: components.card.copyWith(
          colors: components.card.colors.copyWith(border: borderSecondary),
          dimens: components.card.dimens.copyWith(
            borderRadius: BorderRadius.circular(borderRadiusLarge),
            padding: const EdgeInsets.all(24),
          ),
          shadows: const ImpaktfullUiCardShadowsTheme(card: shadowCard),
        ),
        // `colorBgMask` is `rgba(0, 0, 0, 0.45)`, without a blur, and a modal
        // is `colorBgElevated` with `borderRadiusLG`.
        modal: components.modal.copyWith(
          colors: components.modal.colors.copyWith(
            background: bgElevated,
            barrier: Colors.black.withValues(alpha: 0.45),
          ),
          dimens: components.modal.dimens.copyWith(
            borderRadius: BorderRadius.circular(borderRadiusLarge),
            padding: const EdgeInsets.all(20),
            barrierBlurSigma: 0,
          ),
        ),
        // `controlInteractiveSize: 16` with `borderRadiusSM: 4`.
        checkbox: components.checkbox.copyWith(
          dimens: components.checkbox.dimens.copyWith(
            size: controlInteractiveSize,
            iconSize: 12,
            borderRadius: BorderRadius.circular(4),
            borderWidth: 1,
            activeBorderWidth: 1,
          ),
        ),
        // A 44 x 22 track with an 18 thumb and 2 around it.
        switchTheme: components.switchTheme.copyWith(
          colors: components.switchTheme.colors.copyWith(
            inactiveBackground: isDark ? colorBorderDark : textTertiary,
            activeBackground: primary,
            active: Colors.white,
            inactive: Colors.white,
          ),
          dimens: components.switchTheme.dimens.copyWith(
            thumbSize: 18,
            verticalPadding: 2,
            horizontalPadding: 24,
            borderRadius: BorderRadius.circular(
              ImpaktfullUiDimensTheme.borderRadiusCircleMax,
            ),
            thumbBorderRadius: BorderRadius.circular(
              ImpaktfullUiDimensTheme.borderRadiusCircleMax,
            ),
          ),
        ),
        // `headerBg: colorFillAlter`, `rowHoverBg: colorFillAlter`,
        // `borderColor: colorBorderSecondary`, and cells of
        // `cellPaddingBlock: 16` by `cellPaddingInline: 16`.
        tableRow: components.tableRow.copyWith(
          colors: components.tableRow.colors.copyWith(
            background: bgContainer,
            backgroundHover: fillAlter,
            backgroundSelected: isDark
                ? colorPrimaryBorderDark
                : const Color(0xFFE6F4FF), // `controlItemBgActive`, blue-1
            border: borderSecondary,
          ),
        ),
        tableHeader: components.tableHeader.copyWith(
          colors: components.tableHeader.colors.copyWith(
            background: fillAlter,
            border: borderSecondary,
          ),
        ),
        tableRowItem: components.tableRowItem.copyWith(
          dimens: components.tableRowItem.dimens.copyWith(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          ),
        ),
        tableHeaderItem: components.tableHeaderItem.copyWith(
          dimens: components.tableHeaderItem.dimens.copyWith(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          ),
        ),
      ),
    );
  }
}

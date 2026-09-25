import 'package:flutter/material.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';
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

  /// `colorSplit`, the line between two things: `rgba(5, 5, 5, 0.06)`.
  static const colorSplit = Color(0x0F050505);

  /// `colorBgSpotlight`, the background of a tooltip:
  /// `rgba(0, 0, 0, 0.85)`.
  static const colorBgSpotlight = Color(0xD9000000);

  /// `colorBgSpotlight` of the dark algorithm.
  static const colorBgSpotlightDark = Color(0xFF424242);

  /// `borderRadiusSM`.
  static const borderRadiusSmall = 4.0;

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
        // A tooltip is `colorBgSpotlight` (`rgba(0, 0, 0, 0.85)`) with white
        // text in `6px 8px`, at `borderRadius`.
        tooltip: components.tooltip.copyWith(
          colors: components.tooltip.colors.copyWith(
            background: isDark ? colorBgSpotlightDark : colorBgSpotlight,
          ),
          textStyles: components.tooltip.textStyles.copyWith(
            text: const TextStyle(fontSize: 14, color: Colors.white),
          ),
          dimens: components.tooltip.dimens.copyWith(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          ),
        ),
        // A dropdown menu is `padding: 4px` at `borderRadiusLG`, with items
        // of `padding: 5px 12px` at `borderRadiusSM`.
        dropdown: components.dropdown.copyWith(
          dimens: components.dropdown.dimens.copyWith(
            borderRadius: BorderRadius.circular(borderRadiusLarge),
            padding: const EdgeInsets.all(4),
            spacing: 4,
          ),
        ),
        simpleListItem: components.simpleListItem.copyWith(
          dimens: components.simpleListItem.dimens.copyWith(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            borderRadius: BorderRadius.circular(borderRadiusSmall),
            spacing: 8,
          ),
        ),
        listItem: components.listItem.copyWith(
          dimens: components.listItem.dimens.copyWith(leadingSize: 16),
        ),
        // A radio button is `controlInteractiveSize` (16) with a dot of half
        // of it, so the dot is `16 - 2 * 4`.
        radioButton: components.radioButton.copyWith(
          colors: components.radioButton.colors.copyWith(
            // A checked radio button is `radioBgColor` (`colorPrimary`) with a
            // `colorPrimary` border; an unchecked one is `colorBgContainer`
            // with `colorBorder`.
            borderSelected: primary,
            centerSelectedBackground: Colors.white,
          ),
          dimens: components.radioButton.dimens.copyWith(
            // `radioSize` is `fontSizeLG` (16) and the dot is
            // `radioSize - (dotPadding + lineWidth) * 2` = 6, so 5 is left
            // around it.
            size: controlInteractiveSize,
            borderWidth: 1,
            dotInset: 5,
          ),
        ),
        // A slider is a 4px rail with a 14px handle that has a 2px border.
        slider: components.slider.copyWith(
          colors: components.slider.colors.copyWith(
            track: isDark ? colorFillSecondaryDark : const Color(0xFFF5F5F5),
            activeTrack: primary,
            thumb: bgContainer,
            thumbBorder: primary,
          ),
          dimens: components.slider.dimens.copyWith(
            trackHeight: 4,
            thumbSize: 14,
            thumbBorderWidth: 2,
            height: 24,
            // Both design systems draw a round thumb on a round track.
            trackBorderRadius: BorderRadius.circular(
              ImpaktfullUiDimensTheme.borderRadiusCircleMax,
            ),
            thumbBorderRadius: BorderRadius.circular(
              ImpaktfullUiDimensTheme.borderRadiusCircleMax,
            ),
          ),
        ),
        // Tabs are an underline: no background behind them, a
        // `colorSplit` line under the bar and a 2px `colorPrimary` bar under
        // the active tab.
        tabBar: components.tabBar.copyWith(
          colors: components.tabBar.colors.copyWith(
            divider: isDark ? colorBorderSecondaryDark : colorSplit,
          ),
          dimens: components.tabBar.dimens.copyWith(
            height: 46,
            padding: EdgeInsets.zero,
            // `horizontalItemGutter`: a tab is as wide as its title, with 32
            // between two of them, instead of every tab taking the same part
            // of the bar.
            expandItems: false,
            spacing: 32,
            dividerHeight: 1,
            borderRadius: BorderRadius.zero,
          ),
        ),
        tabBarItem: components.tabBarItem.copyWith(
          colors: components.tabBarItem.colors.copyWith(
            // A tab is text with a bar under it, not a box.
            background: Colors.transparent,
            selectedBackground: Colors.transparent,
            selectedMarker: primary,
          ),
          dimens: components.tabBarItem.dimens.copyWith(
            borderRadius: BorderRadius.zero,
            // Ant Design draws the bar of the active tab over the bottom edge
            // of a 46 high tab; this package puts it under the title, so the
            // padding gives it its 2 pixels back: 10 + 22 + 2 + 2 + 10 = 46.
            padding: const EdgeInsets.symmetric(vertical: 10),
            spacing: 2,
            selectedMarkerHeight: 2,
            // The bar runs under the whole tab, not under a part of it.
            selectedMarkerWidth: double.infinity,
          ),
        ),
        // An alert with a description: `withDescriptionPadding` is
        // `20px 24px`, its icon is `withDescriptionIconSize` (24) with 16
        // after it, and 4 between the message and the description.
        notification: components.notification.copyWith(
          colors: components.notification.colors.copyWith(
            // `boxShadowSecondary` and no border: a notification of Ant
            // Design floats over the page instead of being outlined on it.
            border: Colors.transparent,
          ),
          shadows: components.notification.shadows.copyWith(
            card: shadowElevated,
          ),
          // `CheckCircleFilled`, `InfoCircleFilled`, `CloseCircleFilled` and
          // `ExclamationCircleFilled`: a notification of Ant Design has a
          // filled circle in the colour of its type, not an outline.
          assets: components.notification.assets.copyWith(
            info: ImpaktfullUiAsset.icon(PhosphorIcons.infoFill),
            success: ImpaktfullUiAsset.icon(PhosphorIcons.checkCircleFill),
            warning: ImpaktfullUiAsset.icon(PhosphorIcons.warningCircleFill),
            error: ImpaktfullUiAsset.icon(PhosphorIcons.xCircleFill),
          ),
          textStyles: components.notification.textStyles.copyWith(
            title: base.textStyles.onCard.text.large,
            subtitle: base.textStyles.onCard.text.medium,
          ),
          dimens: components.notification.dimens.copyWith(
            borderRadius: BorderRadius.circular(borderRadiusLarge),
            alignment: ImpaktfullUiNotificationAlignment.top,
            leadingPadding:
                const EdgeInsetsDirectional.fromSTEB(24, 20, 16, 20),
            contentPadding: const EdgeInsets.symmetric(vertical: 20),
            spacing: 24,
            titleSpacing: 4,
            iconSize: 24,
          ),
        ),
        // The pages of a pagination are 8 apart.
        pagination: components.pagination.copyWith(
          dimens: components.pagination.dimens.copyWith(spacing: 8),
        ),
        avatar: components.avatar.copyWith(
          dimens: components.avatar.dimens.copyWith(borderWidth: 0),
        ),
        // A drawer has `padding: 24` and the radius of a modal.
        bottomSheet: components.bottomSheet.copyWith(
          dimens: components.bottomSheet.dimens.copyWith(
            borderRadius: BorderRadius.circular(borderRadiusLarge),
            padding: const EdgeInsetsDirectional.all(24),
          ),
        ),
        // A segmented control: `controlHeight` with `padding: 2` and items at
        // `borderRadiusSM`.
        segmentedControl: components.segmentedControl.copyWith(
          colors: components.segmentedControl.colors.copyWith(
            // `trackBg` is `colorBgLayout`, `itemSelectedBg` is
            // `colorBgContainer`.
            background: bgLayout,
            activeBackground: bgContainer,
          ),
          dimens: components.segmentedControl.dimens.copyWith(
            borderRadius: BorderRadius.circular(borderRadius),
            height: controlHeight,
            padding: const EdgeInsets.all(2),
          ),
        ),
        // A progress bar is 8 high and fully round.
        progressIndicator: components.progressIndicator.copyWith(
          dimens: components.progressIndicator.dimens.copyWith(
            borderRadius: BorderRadius.circular(
              ImpaktfullUiDimensTheme.borderRadiusCircleMax,
            ),
            width: 8,
          ),
        ),
        // A skeleton is `colorFillSecondary` at `borderRadiusSM`.
        skeleton: components.skeleton.copyWith(
          colors: components.skeleton.colors.copyWith(
            background: fillSecondary,
            highlight: isDark ? colorBorderDark : colorBorder,
          ),
          dimens: components.skeleton.dimens.copyWith(
            borderRadius: BorderRadius.circular(borderRadiusSmall),
          ),
        ),
        // A divider is a 1px `colorSplit` line.
        divider: components.divider.copyWith(
          colors: components.divider.colors.copyWith(
            color: isDark ? colorBorderSecondaryDark : colorSplit,
          ),
          dimens: components.divider.dimens.copyWith(thickness: 1),
        ),
        // A table is `colorBorderSecondary` around and between its rows, at
        // `borderRadiusLG`.
        table: components.table.copyWith(
          colors: components.table.colors.copyWith(
            background: bgContainer,
            border: borderSecondary,
            divider: borderSecondary,
          ),
          dimens: components.table.dimens.copyWith(
            borderRadius: BorderRadius.circular(borderRadiusLarge),
            borderWidth: 1,
          ),
        ),
        // The scrolling tabs of this package are the same underline.
        horizontalTabs: components.horizontalTabs.copyWith(
          dimens: components.horizontalTabs.dimens.copyWith(
            // `horizontalItemGutter: 32` between two tabs. The tab nav of Ant
            // Design paints nothing behind its tabs, so the space at the
            // sides is a margin: the first tab lines up with the content
            // instead of touching the edge of the screen.
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: EdgeInsets.zero,
            height: 46,
            spacing: 32,
          ),
        ),
        horizontalTab: components.horizontalTab.copyWith(
          colors: components.horizontalTab.colors.copyWith(
            backgroundUnSelectedTab: Colors.transparent,
            backgroundSelectedTab: Colors.transparent,
          ),
          dimens: components.horizontalTab.dimens.copyWith(
            borderRadius: BorderRadius.zero,
            padding: const EdgeInsets.symmetric(vertical: 12),
          ),
        ),
        // An icon button is a `type="text"` button: `controlHeight` with
        // `borderRadius` and a 16px icon.
        iconButton: components.iconButton.copyWith(
          dimens: components.iconButton.dimens.copyWith(
            padding: const EdgeInsets.all(8),
            iconSize: 16,
            borderRadius: BorderRadius.circular(borderRadius),
            disabledOpacity: 0.25,
          ),
        ),
        // A command palette is a modal with a list in it.
        commandMenu: components.commandMenu.copyWith(
          dimens: components.commandMenu.dimens.copyWith(
            windowBorderRadius: BorderRadius.circular(borderRadiusLarge),
            spacing: 8,
            maxHeight: 300,
          ),
        ),
        // A menu: `itemBorderRadius` 4 with `itemPaddingInline` 16 and 4
        // between two items, in a menu of `padding: 4`.
        sidebarNavigation: components.sidebarNavigation.copyWith(
          dimens: components.sidebarNavigation.dimens.copyWith(
            padding: const EdgeInsets.all(4),
            spacing: 4,
            borderWidth: 1,
          ),
        ),
        sidebarNavigationItem: components.sidebarNavigationItem.copyWith(
          dimens: components.sidebarNavigationItem.dimens.copyWith(
            borderRadius: BorderRadius.circular(borderRadiusSmall),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            contentSpacing: 10,
            spacing: 4,
          ),
        ),
        // A message: `borderRadiusLG` with `boxShadowSecondary`.
        snackyConfigurator: components.snackyConfigurator.copyWith(
          dimens: components.snackyConfigurator.dimens.copyWith(
            borderRadius: BorderRadius.circular(borderRadiusLarge),
          ),
        ),
        // Every field is `controlHeight` with `paddingInline: 11`.
        dateInputField: components.dateInputField.copyWith(
          dimens: components.dateInputField.dimens.copyWith(
            minHeight: controlHeight,
            padding: const EdgeInsetsDirectional.only(start: 11, end: 11),
            contentPadding: const EdgeInsets.symmetric(vertical: 4),
            borderWidth: 1,
            iconSize: 16,
          ),
        ),
        colorInputField: components.colorInputField.copyWith(
          dimens: components.colorInputField.dimens.copyWith(
            borderRadius: BorderRadius.circular(borderRadius),
            swatchSize: controlHeight,
            borderWidth: 1,
          ),
        ),
        numberInput: components.numberInput.copyWith(
          dimens: components.numberInput.dimens.copyWith(
            spacing: 8,
            buttonSpacing: 4,
          ),
        ),
        // `Input.OTP`: boxes of `controlHeight` with 8 between them.
        pinCode: components.pinCode.copyWith(
          dimens: components.pinCode.dimens.copyWith(
            valueBorderRadius: BorderRadius.circular(borderRadius),
            fieldSpacing: 8,
            spacing: 8,
          ),
        ),
        // A date picker: cells at `borderRadiusSM`, a 1px line around the
        // day of today.
        datePicker: components.datePicker.copyWith(
          dimens: components.datePicker.dimens.copyWith(
            borderRadius: BorderRadius.circular(borderRadiusSmall),
            spacing: 8,
            selectedBorderWidth: 1,
          ),
        ),
        timePicker: components.timePicker.copyWith(
          dimens: components.timePicker.dimens.copyWith(
            spacing: 4,
            fieldSpacing: 8,
          ),
        ),
        // `Steps`: a round dot with the title next to it.
        stepper: components.stepper.copyWith(
          colors: components.stepper.colors.copyWith(
            activeStep: primary,
            inactiveStep: fillSecondary,
          ),
          dimens: components.stepper.dimens.copyWith(
            borderRadius: BorderRadius.circular(
              ImpaktfullUiDimensTheme.borderRadiusCircleMax,
            ),
            height: 8,
            titleSpacing: 8,
          ),
        ),
        // `Badge`: a dot of `colorError` with a 1px ring of the page behind
        // it.
        notificationBadge: components.notificationBadge.copyWith(
          colors: components.notificationBadge.colors.copyWith(
            background: error,
            border: bgContainer,
          ),
          dimens: components.notificationBadge.dimens.copyWith(
            borderWidth: 1,
            textPadding: const EdgeInsets.symmetric(horizontal: 6),
          ),
        ),
        // `Carousel`: the dots under it.
        carousel: components.carousel.copyWith(
          dimens: components.carousel.dimens.copyWith(
            indicatorBorderRadius: BorderRadius.circular(
              ImpaktfullUiDimensTheme.borderRadiusCircleMax,
            ),
            indicatorSize: 6,
            indicatorSpacing: const EdgeInsets.symmetric(horizontal: 2),
            indicatorPadding: const EdgeInsets.all(16),
          ),
        ),
        // `Spin`: 20 by default, with a thin stroke.
        loadingIndicator: components.loadingIndicator.copyWith(
          dimens: components.loadingIndicator.dimens.copyWith(
            size: 20,
            strokeWidth: 2,
          ),
        ),
        // `List`: items of `paddingContentVertical` 12 by `paddingLG` 24.
        listView: components.listView.copyWith(
          dimens: components.listView.dimens.copyWith(
            borderRadius: BorderRadius.circular(borderRadiusLarge),
            padding: const EdgeInsets.all(12),
          ),
        ),
        optionSelector: components.optionSelector.copyWith(
          dimens: components.optionSelector.dimens.copyWith(maxHeight: 256),
        ),
        // `AutoComplete`: the highlighted suggestion is `controlItemBgHover`.
        autoComplete: components.autoComplete.copyWith(
          colors: components.autoComplete.colors.copyWith(
            highlightedItem: fillSecondary,
          ),
          dimens: components.autoComplete.dimens.copyWith(spacing: 4),
        ),
        // `Empty`: an illustration of 40 with 8 under it.
        placeholder: components.placeholder.copyWith(
          dimens: components.placeholder.dimens.copyWith(
            spacing: 8,
            titleSpacing: 4,
            actionSpacing: 8,
            assetPlaceholderHeight: 40,
          ),
        ),
        // `Statistic`: a title of 14 with 4 under it, in a card of 24.
        metric: components.metric.copyWith(
          dimens: components.metric.dimens.copyWith(
            padding: const EdgeInsets.all(24),
            spacing: 4,
            contentSpacing: 8,
          ),
        ),
        // `Upload`: a drag area at `borderRadiusLG` with `padding: 16`.
        filePicker: components.filePicker.copyWith(
          dimens: components.filePicker.dimens.copyWith(
            borderRadius: BorderRadius.circular(borderRadiusLarge),
            padding: const EdgeInsets.all(16),
            spacing: 8,
            contentSpacing: 8,
            itemPadding: const EdgeInsets.all(8),
          ),
        ),
        // `Image`: a preview at `borderRadiusLG`.
        gallery: components.gallery.copyWith(
          dimens: components.gallery.dimens.copyWith(
            itemBorderRadius: BorderRadius.circular(borderRadiusLarge),
            padding: const EdgeInsets.all(16),
          ),
        ),
        // `FloatButton`: round, 40 by 40 with a 16 icon.
        floatingActionButton: components.floatingActionButton.copyWith(
          dimens: components.floatingActionButton.dimens.copyWith(
            borderRadius: BorderRadius.circular(
              ImpaktfullUiDimensTheme.borderRadiusCircleMax,
            ),
            padding: const EdgeInsets.all(12),
            iconSize: 16,
          ),
        ),
        // The title of a section: `marginXS` between it and its actions.
        sectionTitle: components.sectionTitle.copyWith(
          dimens: components.sectionTitle.dimens.copyWith(spacing: 8),
        ),
        // `Layout.Header`: 64 high with `padding: 0 50`, here the 24 of a
        // page of this package.
        navBar: components.navBar.copyWith(
          dimens: components.navBar.dimens.copyWith(
            minHeight: 64,
            sidePadding: 24,
            sidePaddingWithActions: 8,
            spacing: 8,
            borderWidth: 1,
            actionSize: controlHeight,
          ),
        ),
        gridView: components.gridView.copyWith(
          dimens: components.gridView.dimens.copyWith(imageSize: 40),
        ),
        // `Calendar`: cells of `padding: 4` with a line between the weeks.
        calendar: components.calendar.copyWith(
          dimens: components.calendar.dimens.copyWith(
            listPadding: const EdgeInsets.all(12),
            eventPadding: const EdgeInsets.all(4),
            eventSpacing: 4,
            eventContentSpacing: 8,
            listItemSpacing: 8,
            dividerHeight: 1,
          ),
        ),
        dateTimePicker: components.dateTimePicker.copyWith(
          dimens: components.dateTimePicker.dimens.copyWith(spacing: 8),
        ),
        // `ColorPicker`: swatches of 24 at `borderRadiusSM`.
        colorPicker: components.colorPicker.copyWith(
          dimens: components.colorPicker.dimens.copyWith(
            simpleColorPickerItemBorderRadius:
                BorderRadius.circular(borderRadiusSmall),
            simpleColorPickerItemSize: 24,
            spacing: 8,
            sectionSpacing: 24,
          ),
        ),
        // The control at the end of a list item is `controlInteractiveSize`.
        selectableListItem: components.selectableListItem.copyWith(
          dimens: components.selectableListItem.dimens.copyWith(
            leadingHeight: controlInteractiveSize,
            leadingWidth: controlInteractiveSize,
            trailingHeight: controlInteractiveSize,
            trailingWidth: controlInteractiveSize,
          ),
        ),
      ),
    );
  }
}

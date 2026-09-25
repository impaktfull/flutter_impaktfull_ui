import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

/// An [ImpaktfullUiTheme] in the style of shadcn/ui.
///
/// This is not a port of shadcn/ui and it is not affiliated with it: the
/// components of this package are built differently, so a few details cannot
/// be reached from a theme. `doc/design-system-themes.md` lists what differs.
///
/// ```dart
/// ImpaktfullUiThemeBuilder(
///   theme: ImpaktfullUiShadcnTheme.light(fontFamily: 'Geist'),
///   builder: (context) => const MyApp(),
/// )
/// ```
///
/// Sources of the tokens:
/// - <https://ui.shadcn.com/docs/theming> for the `default` base color. Every
///   hex below is a conversion of the published `oklch` value.
/// - the component sources of `shadcn-ui/ui` under
///   `apps/v4/registry/new-york-v4/ui/` for the classes of each component
///   (`h-9`, `px-4`, `rounded-md`, `ring-[3px]`, ...).
/// - the Tailwind v4 `theme.css` for the scale (`--spacing: 0.25rem`,
///   `--shadow-*`).
///
/// This package ships no fonts and does not bundle Geist. Declare the family
/// in the `pubspec.yaml` of the app and pass it as `fontFamily`; without one
/// the theme renders with the platform font.
abstract final class ImpaktfullUiShadcnTheme {
  /// `--background: oklch(1 0 0)`
  static const background = Color(0xFFFFFFFF);

  /// `--foreground: oklch(0.145 0 0)`
  static const foreground = Color(0xFF0A0A0A);

  /// `--card: oklch(1 0 0)`
  static const card = Color(0xFFFFFFFF);

  /// `--primary: oklch(0.205 0 0)`
  static const primary = Color(0xFF171717);

  /// `--primary-foreground: oklch(0.985 0 0)`
  static const primaryForeground = Color(0xFFFAFAFA);

  /// `--secondary`, `--muted` and `--accent`: `oklch(0.97 0 0)`
  static const muted = Color(0xFFF5F5F5);

  /// `--muted-foreground: oklch(0.556 0 0)`
  static const mutedForeground = Color(0xFF737373);

  /// `--destructive: oklch(0.577 0.245 27.325)`
  static const destructive = Color(0xFFE7000B);

  /// `--border` and `--input`: `oklch(0.922 0 0)`
  static const border = Color(0xFFE5E5E5);

  /// `--ring: oklch(0.708 0 0)`
  static const ring = Color(0xFFA1A1A1);

  /// `--background: oklch(0.145 0 0)` of `.dark`
  static const backgroundDark = Color(0xFF0A0A0A);

  /// `--foreground: oklch(0.985 0 0)` of `.dark`
  static const foregroundDark = Color(0xFFFAFAFA);

  /// `--card: oklch(0.205 0 0)` of `.dark`
  static const cardDark = Color(0xFF171717);

  /// `--primary: oklch(0.922 0 0)` of `.dark`
  static const primaryDark = Color(0xFFE5E5E5);

  /// `--primary-foreground: oklch(0.205 0 0)` of `.dark`
  static const primaryForegroundDark = Color(0xFF171717);

  /// `--muted: oklch(0.269 0 0)` of `.dark`
  static const mutedDark = Color(0xFF262626);

  /// `--muted-foreground: oklch(0.708 0 0)` of `.dark`
  static const mutedForegroundDark = Color(0xFFA1A1A1);

  /// `--destructive: oklch(0.704 0.191 22.216)` of `.dark`
  static const destructiveDark = Color(0xFFFF6467);

  /// `--border: oklch(1 0 0 / 10%)` of `.dark`
  static const borderDark = Color(0x1AFFFFFF);

  /// `--ring: oklch(0.556 0 0)` of `.dark`
  static const ringDark = Color(0xFF737373);

  /// The Tailwind colors the blocks of shadcn/ui reach for, since it has no
  /// warning, success or info token of its own: `amber-500`, `green-600` and
  /// `blue-600`.
  static const warning = Color(0xFFF0B100);

  /// See [warning].
  static const success = Color(0xFF00A63E);

  /// See [warning].
  static const info = Color(0xFF155DFC);

  /// `--radius-sm: calc(var(--radius) - 4px)`, with `--radius: 0.625rem`.
  static const radiusSmall = 6.0;

  /// `--radius-md: calc(var(--radius) - 2px)`: the radius of a button, an
  /// input field, a badge and a table.
  static const radiusMedium = 8.0;

  /// `--radius-lg: var(--radius)`: the radius of a dialog and of a tab list.
  static const radiusLarge = 10.0;

  /// `--radius-xl: calc(var(--radius) + 4px)`: the radius of a card.
  static const radiusExtraLarge = 14.0;

  /// `ring-[3px]`: the width of the focus ring, the most recognizable state
  /// of shadcn/ui.
  static const focusRingWidth = 3.0;

  /// `shadow-xs`: `0 1px 2px 0 rgb(0 0 0 / 0.05)`, on the outline button and
  /// on an input field.
  static const shadowExtraSmall = [
    BoxShadow(color: Color(0x0D000000), offset: Offset(0, 1), blurRadius: 2),
  ];

  /// `shadow-sm`: `0 1px 3px 0 rgb(0 0 0 / 0.1), 0 1px 2px -1px rgb(0 0 0 /
  /// 0.1)`, on a card. The negative spread of the second layer is
  /// `spreadRadius: -1`.
  static const shadowSmall = [
    BoxShadow(color: Color(0x1A000000), offset: Offset(0, 1), blurRadius: 3),
    BoxShadow(
      color: Color(0x1A000000),
      offset: Offset(0, 1),
      blurRadius: 2,
      spreadRadius: -1,
    ),
  ];

  /// `shadow-lg`: `0 10px 15px -3px rgb(0 0 0 / 0.1), 0 4px 6px -4px rgb(0 0 0
  /// / 0.1)`, on a dialog and a popover.
  static const shadowLarge = [
    BoxShadow(color: Color(0x1A000000), offset: Offset(0, 10), blurRadius: 15),
    BoxShadow(
      color: Color(0x1A000000),
      offset: Offset(0, 4),
      blurRadius: 6,
      spreadRadius: -4,
    ),
  ];

  /// The light theme of shadcn/ui: the `:root` block of its `default` base
  /// color.
  static ImpaktfullUiTheme<T> light<T extends Object>({
    String? fontFamily,
    T? customTheme,
  }) =>
      _build(
        brightness: Brightness.light,
        fontFamily: fontFamily,
        customTheme: customTheme,
      );

  /// The dark theme of shadcn/ui: the `.dark` block of its `default` base
  /// color.
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
    final primaryColor = isDark ? primaryDark : primary;
    final onPrimary = isDark ? primaryForegroundDark : primaryForeground;
    final mutedColor = isDark ? mutedDark : muted;
    final mutedText = isDark ? mutedForegroundDark : mutedForeground;
    final borderColor = isDark ? borderDark : border;
    final textColor = isDark ? foregroundDark : foreground;
    final destructiveColor = isDark ? destructiveDark : destructive;
    final ringColor = isDark ? ringDark : ring;
    // `focus-visible:ring-ring/50`.
    final focusRing = ringColor.withValues(alpha: 0.5);

    final base = ImpaktfullUiDefaultTheme.withMinimalChanges<T>(
      label: isDark ? 'shadcn/ui (dark)' : 'shadcn/ui',
      brightness: brightness,
      // `--primary` is the background of a primary button, which this package
      // takes from `accent`.
      accent: primaryColor,
      textOnAccent: onPrimary,
      primary: primaryColor,
      textOnPrimary: onPrimary,
      // `--secondary` is a surface, not a text color, so `textSecondary` has
      // to be passed too: it follows `secondary` otherwise.
      secondary: mutedColor,
      textSecondary: mutedText,
      tertiary: mutedText,
      textTertiary: mutedText,
      canvas: isDark ? backgroundDark : background,
      card: isDark ? cardDark : card,
      card2: mutedColor,
      border: borderColor,
      text: textColor,
      shadow: Colors.black,
      destructive: destructiveColor,
      error: destructiveColor,
      warning: warning,
      success: success,
      info: info,
      // `rounded-md` is the radius of a control, so it is the seed. The two
      // steps above it are shadcn's own `--radius-lg` and `--radius-xl`
      // instead of the `+ 4` / `+ 8` of the seed.
      radius: radiusMedium,
      borderRadiusLarge: BorderRadius.circular(radiusLarge),
      borderRadiusExtraLarge: BorderRadius.circular(radiusExtraLarge),
      // `--spacing: 0.25rem`, the same unit as the default theme.
      spacingUnit: 4,
      // `text-sm` with `font-medium` on a control, `leading-normal` (1.5) for
      // text. Tailwind's `-0.011em` tracking on `text-sm` is not applied by
      // shadcn itself.
      // `text-sm` (14) is the size of body text and of the text in a
      // control, so `small` is `text-xs` (12) and `large` `text-base`.
      fontSizeText: 14,
      heightText: 1.5,
      fontFamilyDisplay: fontFamily,
      fontFamilyText: fontFamily,
      package: null,
      customTheme: customTheme,
    );
    final components = base.components;
    return base.copyWith(
      components: components.copyWith(
        button: components.button.copyWith(
          // `font-medium` (500) on every button, instead of the bold of the
          // default theme. There is no font weight per component in the base
          // tokens, so the five styles are given it here.
          textStyles: ImpaktfullUiButtonTextStyleTheme(
            primary: components.button.textStyles.primary
                .copyWith(fontWeight: FontWeight.w500, fontSize: 14),
            alternative: components.button.textStyles.alternative
                .copyWith(fontWeight: FontWeight.w500, fontSize: 14),
            grey: components.button.textStyles.grey
                .copyWith(fontWeight: FontWeight.w500, fontSize: 14),
            destructivePrimary: components.button.textStyles.destructivePrimary
                .copyWith(fontWeight: FontWeight.w500, fontSize: 14),
            destructiveAlternative: components
                .button.textStyles.destructiveAlternative
                .copyWith(fontWeight: FontWeight.w500, fontSize: 14),
          ),
          // `size-4` icons, `gap-2`, and the heights of `button.tsx`:
          // `sm` is `h-8 px-3`, the default `h-9 px-4`, `lg` is `h-10 px-6`.
          // shadcn/ui has no size below `sm` or above `lg`; those two follow
          // the same step of 4.
          dimens: components.button.dimens.copyWith(
            sizes: const ImpaktfullUiButtonSizesDimensTheme(
              extraSmall: ImpaktfullUiButtonSizeDimensTheme(
                height: 28,
                padding: EdgeInsets.symmetric(horizontal: 10),
                spacing: 6,
                iconSize: 14,
                loadingSize: 14,
              ),
              small: ImpaktfullUiButtonSizeDimensTheme(
                height: 32,
                padding: EdgeInsets.symmetric(horizontal: 12),
                spacing: 6,
                iconSize: 16,
                loadingSize: 16,
              ),
              medium: ImpaktfullUiButtonSizeDimensTheme(
                height: 36,
                padding: EdgeInsets.symmetric(horizontal: 16),
                spacing: 8,
                iconSize: 16,
                loadingSize: 16,
              ),
              large: ImpaktfullUiButtonSizeDimensTheme(
                height: 40,
                padding: EdgeInsets.symmetric(horizontal: 24),
                spacing: 8,
                iconSize: 16,
                loadingSize: 16,
              ),
              extraLarge: ImpaktfullUiButtonSizeDimensTheme(
                height: 44,
                padding: EdgeInsets.symmetric(horizontal: 32),
                spacing: 8,
                iconSize: 18,
                loadingSize: 18,
              ),
            ),
          ),
          colors: components.button.colors.copyWith(
            // `hover:bg-primary/90` on a solid button, `hover:bg-accent` on
            // the outline and the ghost one. A disabled button is
            // `disabled:opacity-50`, which is what this package already does
            // when a state has no colors, so `*Disabled` stays null.
            primaryHover: ImpaktfullUiButtonStateColorTheme(
              background: primaryColor.withValues(alpha: 0.9),
            ),
            destructiveHover: ImpaktfullUiButtonStateColorTheme(
              background: destructiveColor.withValues(alpha: 0.9),
            ),
            secondaryHover: ImpaktfullUiButtonStateColorTheme(
              background: mutedColor,
              text: textColor,
            ),
            tertiaryHover: ImpaktfullUiButtonStateColorTheme(
              background: mutedColor,
              text: textColor,
            ),
          ),
          // Only the outline button carries `shadow-xs`; the solid ones have
          // no shadow.
          shadows: const ImpaktfullUiButtonShadowsTheme(
            primary: [],
            secondary: shadowExtraSmall,
            destructive: [],
          ),
        ),
        // `input.tsx`: `h-9 rounded-md border bg-transparent px-3 py-1
        // text-base shadow-xs md:text-sm`, and on focus
        // `border-ring ring-ring/50 ring-[3px]`.
        inputField: components.inputField.copyWith(
          colors: components.inputField.colors.copyWith(
            borderFocused: ringColor,
            focusRing: focusRing,
          ),
          dimens: components.inputField.dimens.copyWith(
            minHeight: 36,
            padding: const EdgeInsetsDirectional.only(start: 12, end: 12),
            paddingWithActions:
                const EdgeInsetsDirectional.only(start: 12, end: 4),
            contentPadding: const EdgeInsets.symmetric(vertical: 4),
            borderWidth: 1,
            focusRingWidth: focusRingWidth,
          ),
        ),
        // The ring of everything that is not an input field: `outline-none`
        // plus `focus-visible:ring-[3px]`, with no offset.
        touchFeedback: components.touchFeedback.copyWith(
          focusRing: ImpaktfullUiFocusRingTheme(
            color: focusRing,
            width: focusRingWidth,
            offset: 0,
          ),
          // `hover:bg-accent` is a solid surface, not an overlay, so the
          // overlay stays subtle and the components that own a hover color
          // use theirs.
          colors: ImpaktfullUiTouchFeedbackColorTheme(
            hover:
                (isDark ? Colors.white : Colors.black).withValues(alpha: 0.04),
            highlight:
                (isDark ? Colors.white : Colors.black).withValues(alpha: 0.08),
            splash: Colors.transparent,
          ),
        ),
        // `rounded-xl border py-6 shadow-sm`, with `px-6` on its content.
        card: components.card.copyWith(
          dimens: components.card.dimens.copyWith(
            borderRadius: BorderRadius.circular(radiusExtraLarge),
            padding: const EdgeInsets.all(24),
          ),
          shadows: const ImpaktfullUiCardShadowsTheme(card: shadowSmall),
        ),
        // `dialog.tsx`: `rounded-lg border p-6 shadow-lg`, over an overlay of
        // `bg-black/50` without a blur.
        modal: components.modal.copyWith(
          colors: components.modal.colors.copyWith(
            barrier: Colors.black.withValues(alpha: 0.5),
          ),
          dimens: components.modal.dimens.copyWith(
            borderRadius: BorderRadius.circular(radiusLarge),
            padding: const EdgeInsets.all(24),
            barrierBlurSigma: 0,
          ),
        ),
        // `size-4 rounded-[4px] border border-input`, with a `size-3.5` check.
        checkbox: components.checkbox.copyWith(
          dimens: components.checkbox.dimens.copyWith(
            size: 16,
            iconSize: 14,
            borderRadius: BorderRadius.circular(4),
            borderWidth: 1,
            activeBorderWidth: 1,
          ),
        ),
        // `switch.tsx`: a `h-[1.15rem] w-8` track with a `size-4` thumb, so
        // the track is the thumb plus 1.2 above and below it.
        switchTheme: components.switchTheme.copyWith(
          colors: components.switchTheme.colors.copyWith(
            inactiveBackground: isDark ? mutedDark : border,
            activeBackground: primaryColor,
            active: isDark ? primaryForegroundDark : background,
            inactive: isDark ? foregroundDark : background,
          ),
          dimens: components.switchTheme.dimens.copyWith(
            thumbSize: 16,
            verticalPadding: 1.2,
            horizontalPadding: 14.8,
            borderRadius: BorderRadius.circular(
                ImpaktfullUiDimensTheme.borderRadiusCircleMax),
            thumbBorderRadius: BorderRadius.circular(
                ImpaktfullUiDimensTheme.borderRadiusCircleMax),
          ),
        ),
        // `badge.tsx` paints a solid surface per variant, where the default
        // theme derives one from a single color (a 5 % tint with a 50 %
        // border), so every color is given here.
        badge: components.badge.copyWith(
          colors: ImpaktfullUiBadgeColorTheme(
            primaryText: onPrimary,
            primaryBorder: Colors.transparent,
            primaryBackground: primaryColor,
            secondaryText: isDark ? foregroundDark : primary,
            secondaryBorder: Colors.transparent,
            secondaryBackground: mutedColor,
            neutralText: textColor,
            neutralBorder: borderColor,
            neutralBackground: Colors.transparent,
            errorText: Colors.white,
            errorBorder: Colors.transparent,
            errorBackground: destructiveColor,
            warningText: Colors.white,
            warningBorder: Colors.transparent,
            warningBackground: warning,
            successText: Colors.white,
            successBorder: Colors.transparent,
            successBackground: success,
          ),
        ),
        // `table.tsx`: `hover:bg-muted/50` on a row,
        // `data-[state=selected]:bg-muted`, and a `border-b` under it.
        tableRow: components.tableRow.copyWith(
          colors: components.tableRow.colors.copyWith(
            backgroundHover: mutedColor.withValues(alpha: 0.5),
            backgroundSelected: mutedColor,
            border: borderColor,
          ),
        ),
        // `table.tsx`: `[&_th]:p-2`, `[&_td]:p-2` and a `text-muted-foreground`
        // header.
        tableHeader: components.tableHeader.copyWith(
          colors: components.tableHeader.colors.copyWith(border: borderColor),
        ),
        tableHeaderItem: components.tableHeaderItem.copyWith(
          dimens: components.tableHeaderItem.dimens.copyWith(
            padding: const EdgeInsets.all(8),
          ),
        ),
        tableRowItem: components.tableRowItem.copyWith(
          dimens: components.tableRowItem.dimens.copyWith(
            padding: const EdgeInsets.all(8),
          ),
        ),
        // `tooltip.tsx`: `bg-primary text-primary-foreground rounded-md px-3
        // py-1.5 text-xs`.
        tooltip: components.tooltip.copyWith(
          colors: components.tooltip.colors.copyWith(background: primaryColor),
          textStyles: components.tooltip.textStyles.copyWith(
            text: TextStyle(fontSize: 12, color: onPrimary),
          ),
          dimens: components.tooltip.dimens.copyWith(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          ),
        ),
        // `dropdown-menu.tsx`: `rounded-md border bg-popover p-1 shadow-md`
        // with `sideOffset={4}`, and `min-w-[8rem]`.
        dropdown: components.dropdown.copyWith(
          dimens: components.dropdown.dimens.copyWith(
            padding: const EdgeInsets.all(4),
            spacing: 4,
            minWidth: 128,
          ),
        ),
        // An item of that menu: `rounded-sm px-2 py-1.5 text-sm` with
        // `gap-2`, which is also what a list of this package looks like in
        // shadcn/ui.
        simpleListItem: components.simpleListItem.copyWith(
          dimens: components.simpleListItem.dimens.copyWith(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            borderRadius: BorderRadius.circular(radiusSmall),
            spacing: 8,
          ),
        ),
        listItem: components.listItem.copyWith(
          dimens: components.listItem.dimens.copyWith(leadingSize: 16),
        ),
        // `radio-group.tsx`: `size-4 rounded-full border` with a `size-2`
        // indicator, so the dot is `16 - 2 * 4`.
        radioButton: components.radioButton.copyWith(
          dimens: components.radioButton.dimens.copyWith(
            size: 16,
            borderWidth: 1,
            dotInset: 4,
          ),
        ),
        // `slider.tsx`: a `h-1.5` track with a `size-4` thumb.
        slider: components.slider.copyWith(
          dimens: components.slider.dimens.copyWith(
            trackHeight: 6,
            thumbSize: 16,
            thumbBorderWidth: 1,
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
        // `tabs.tsx`: a `bg-muted rounded-lg p-[3px] h-9` list with a
        // `rounded-md` trigger that gets `bg-background` while it is active.
        // There is no underline under an active tab.
        tabBar: components.tabBar.copyWith(
          colors: components.tabBar.colors.copyWith(background: mutedColor),
          dimens: components.tabBar.dimens.copyWith(
            borderRadius: BorderRadius.circular(radiusLarge),
            padding: const EdgeInsets.all(3),
            height: 36,
            spacing: 4,
          ),
        ),
        tabBarItem: components.tabBarItem.copyWith(
          colors: components.tabBarItem.colors.copyWith(
            // Only the active tab has a background of its own; the others let
            // the `bg-muted` of the list show through.
            background: Colors.transparent,
            selectedBackground: isDark ? cardDark : background,
          ),
          dimens: components.tabBarItem.dimens.copyWith(
            borderRadius: BorderRadius.circular(radiusMedium),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            // An active tab is a filled box, not an underline, so there is no
            // marker under the title and no space for one either.
            selectedMarkerHeight: 0,
            spacing: 0,
          ),
        ),
        // `alert.tsx`: `rounded-lg border px-4 py-3 text-sm` with a `gap-3`
        // icon and a `gap-1` between the title and the description.
        notification: components.notification.copyWith(
          dimens: components.notification.dimens.copyWith(
            borderRadius: BorderRadius.circular(radiusLarge),
            leadingPadding: const EdgeInsetsDirectional.fromSTEB(16, 12, 0, 12),
            contentPadding: const EdgeInsets.symmetric(vertical: 12),
            spacing: 16,
            titleSpacing: 4,
          ),
        ),
        // `pagination.tsx`: a row with `gap-1`.
        pagination: components.pagination.copyWith(
          dimens: components.pagination.dimens.copyWith(spacing: 4),
        ),
        // `avatar.tsx` has no border around it.
        avatar: components.avatar.copyWith(
          dimens: components.avatar.dimens.copyWith(borderWidth: 0),
        ),
        // `sheet.tsx`: `p-6`, with the radius of a dialog.
        bottomSheet: components.bottomSheet.copyWith(
          dimens: components.bottomSheet.dimens.copyWith(
            borderRadius: BorderRadius.circular(radiusLarge),
            padding: const EdgeInsetsDirectional.all(24),
          ),
        ),
        // `progress.tsx`: a `h-2 rounded-full` bar.
        progressIndicator: components.progressIndicator.copyWith(
          dimens: components.progressIndicator.dimens.copyWith(
            borderRadius: BorderRadius.circular(
              ImpaktfullUiDimensTheme.borderRadiusCircleMax,
            ),
            width: 8,
          ),
        ),
        // `skeleton.tsx`: `bg-accent animate-pulse rounded-md`.
        skeleton: components.skeleton.copyWith(
          colors: components.skeleton.colors.copyWith(
            background: mutedColor,
            highlight: isDark ? mutedForegroundDark : border,
          ),
          dimens: components.skeleton.dimens.copyWith(
            borderRadius: BorderRadius.circular(radiusMedium),
          ),
        ),
        // `separator.tsx`: a 1px line in `bg-border`.
        divider: components.divider.copyWith(
          colors: components.divider.colors.copyWith(color: borderColor),
          dimens: components.divider.dimens.copyWith(thickness: 1),
        ),
      ),
    );
  }
}

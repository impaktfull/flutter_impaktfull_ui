import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/button/button_size.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';
import 'package:impaktfull_ui/src/util/extension/text_style_extension.dart';

class ImpaktfullUiButtonTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiButtonColorTheme colors;
  final ImpaktfullUiButtonDimensTheme dimens;
  final ImpaktfullUiButtonDurationsTheme durations;
  final ImpaktfullUiButtonTextStyleTheme textStyles;
  final ImpaktfullUiButtonShadowsTheme? shadows;
  final ImpaktfullUiButtonConfig config;

  const ImpaktfullUiButtonTheme({
    required this.colors,
    required this.dimens,
    required this.durations,
    required this.textStyles,
    required this.config,
    ImpaktfullUiButtonShadowsTheme? shadows,
    @Deprecated('Use shadows instead. Will be removed in 1.0.0.')
    ImpaktfullUiButtonShadowsTheme? shadow,
  }) : shadows = shadows ?? shadow;

  @Deprecated('Use shadows instead. Will be removed in 1.0.0.')
  ImpaktfullUiButtonShadowsTheme? get shadow => shadows;

  ImpaktfullUiButtonTheme copyWith({
    ImpaktfullUiButtonColorTheme? colors,
    ImpaktfullUiButtonConfig? config,
    ImpaktfullUiButtonDimensTheme? dimens,
    ImpaktfullUiButtonDurationsTheme? durations,
    ImpaktfullUiButtonShadowsTheme? shadows,
    @Deprecated('Use shadows instead. Will be removed in 1.0.0.')
    ImpaktfullUiButtonShadowsTheme? shadow,
    ImpaktfullUiButtonTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiButtonTheme(
        colors: colors ?? this.colors,
        config: config ?? this.config,
        dimens: dimens ?? this.dimens,
        durations: durations ?? this.durations,
        shadows: shadows ?? shadow ?? this.shadows,
        textStyles: textStyles ?? this.textStyles,
      );

  static ImpaktfullUiButtonTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.button;

  static ImpaktfullUiButtonTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiButtonTheme(
        colors: ImpaktfullUiButtonColorTheme(
          primary: colors.accent,
          primaryBorder: colors.accent,
          secondary: colors.card,
          secondaryBorder: colors.border,
          tertiary: null,
          tertiaryBorder: null,
          destructive: colors.destructive,
          destructiveBorder: colors.destructive,
          raisedBackground: ImpaktfullUiRaisedButtonColorTheme(
            primary: Color.lerp(colors.secondary, Colors.black, 0.33),
            secondary: colors.border,
            destructive: Color.lerp(colors.destructive, Colors.black, 0.33),
            destructiveSecondary:
                Color.lerp(colors.destructive, Colors.black, 0.05),
          ),
        ),
        dimens: ImpaktfullUiButtonDimensTheme(
          borderRadius: dimens.borderRadius,
          borderWidth: 1,
        ),
        durations: ImpaktfullUiButtonDurationsTheme(
          loading: durations.short,
        ),
        textStyles: ImpaktfullUiButtonTextStyleTheme(
          primary: textStyles.onAccent.text.small.bold,
          alternative: textStyles.onCardAccent.text.small.bold,
          grey: textStyles.onCard.text.small.bold,
          destructivePrimary: textStyles.onDestructive.text.small.bold,
          destructiveAlternative: textStyles.onCardDestructive.text.small.bold,
        ),
        shadows: ImpaktfullUiButtonShadowsTheme(
          primary: [],
          secondary: [],
          destructive: [],
        ),
        config: const ImpaktfullUiButtonConfig(),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiButtonTheme &&
          colors == other.colors &&
          dimens == other.dimens &&
          durations == other.durations &&
          textStyles == other.textStyles &&
          shadows == other.shadows &&
          config == other.config;

  @override
  int get hashCode =>
      Object.hash(colors, dimens, durations, textStyles, shadows, config);
}

class ImpaktfullUiButtonColorTheme {
  final Color primary;
  final Color primaryBorder;
  final Color secondary;
  final Color secondaryBorder;
  final Color? tertiary;
  final Color? tertiaryBorder;
  final Color? destructive;
  final Color? destructiveBorder;
  final ImpaktfullUiRaisedButtonColorTheme? raisedBackground;

  /// The colours of a hovered primary button.
  ///
  /// `null` (the default) keeps the overlay of the touch feedback as the only
  /// hover feedback, like before these tokens existed. A non null value lets
  /// the button change its background, its border and its text on hover, which
  /// an overlay can not do: every field of the state falls back to the colour
  /// of the button in its normal state.
  final ImpaktfullUiButtonStateColorTheme? primaryHover;

  /// The colours of a pressed primary button, see [primaryHover].
  ///
  /// A raised button (`config.isRaised`) shows its press with the raised
  /// animation and ignores this token.
  final ImpaktfullUiButtonStateColorTheme? primaryPressed;

  /// The colours of a disabled primary button, see [primaryHover].
  ///
  /// `null` (the default) fades the whole button with `Opacity(0.5)`, like
  /// before these tokens existed. With a value the button is drawn at full
  /// opacity in these colours, so its border and its shadow stay crisp.
  final ImpaktfullUiButtonStateColorTheme? primaryDisabled;

  /// The colours of a hovered secondary button, see [primaryHover]. Used by
  /// the secondary, the secondary grey and the destructive secondary button,
  /// like [secondary] is.
  final ImpaktfullUiButtonStateColorTheme? secondaryHover;

  /// The colours of a pressed secondary button, see [primaryPressed].
  final ImpaktfullUiButtonStateColorTheme? secondaryPressed;

  /// The colours of a disabled secondary button, see [primaryDisabled].
  final ImpaktfullUiButtonStateColorTheme? secondaryDisabled;

  /// The colours of a hovered tertiary button, see [primaryHover]. Used by
  /// every button without a background: tertiary, tertiary grey, link, link
  /// grey, destructive tertiary and destructive link.
  final ImpaktfullUiButtonStateColorTheme? tertiaryHover;

  /// The colours of a pressed tertiary button, see [primaryPressed].
  final ImpaktfullUiButtonStateColorTheme? tertiaryPressed;

  /// The colours of a disabled tertiary button, see [primaryDisabled].
  final ImpaktfullUiButtonStateColorTheme? tertiaryDisabled;

  /// The colours of a hovered destructive primary button, see [primaryHover].
  final ImpaktfullUiButtonStateColorTheme? destructiveHover;

  /// The colours of a pressed destructive primary button, see
  /// [primaryPressed].
  final ImpaktfullUiButtonStateColorTheme? destructivePressed;

  /// The colours of a disabled destructive primary button, see
  /// [primaryDisabled].
  final ImpaktfullUiButtonStateColorTheme? destructiveDisabled;

  const ImpaktfullUiButtonColorTheme({
    required this.primary,
    required this.primaryBorder,
    required this.secondary,
    required this.secondaryBorder,
    required this.tertiary,
    required this.tertiaryBorder,
    required this.destructive,
    required this.destructiveBorder,
    required this.raisedBackground,
    this.primaryHover,
    this.primaryPressed,
    this.primaryDisabled,
    this.secondaryHover,
    this.secondaryPressed,
    this.secondaryDisabled,
    this.tertiaryHover,
    this.tertiaryPressed,
    this.tertiaryDisabled,
    this.destructiveHover,
    this.destructivePressed,
    this.destructiveDisabled,
  });

  ImpaktfullUiButtonColorTheme copyWith({
    Color? destructive,
    Color? destructiveBorder,
    ImpaktfullUiButtonStateColorTheme? destructiveDisabled,
    ImpaktfullUiButtonStateColorTheme? destructiveHover,
    ImpaktfullUiButtonStateColorTheme? destructivePressed,
    Color? primary,
    Color? primaryBorder,
    ImpaktfullUiButtonStateColorTheme? primaryDisabled,
    ImpaktfullUiButtonStateColorTheme? primaryHover,
    ImpaktfullUiButtonStateColorTheme? primaryPressed,
    ImpaktfullUiRaisedButtonColorTheme? raisedBackground,
    Color? secondary,
    Color? secondaryBorder,
    ImpaktfullUiButtonStateColorTheme? secondaryDisabled,
    ImpaktfullUiButtonStateColorTheme? secondaryHover,
    ImpaktfullUiButtonStateColorTheme? secondaryPressed,
    Color? tertiary,
    Color? tertiaryBorder,
    ImpaktfullUiButtonStateColorTheme? tertiaryDisabled,
    ImpaktfullUiButtonStateColorTheme? tertiaryHover,
    ImpaktfullUiButtonStateColorTheme? tertiaryPressed,
  }) =>
      ImpaktfullUiButtonColorTheme(
        destructive: destructive ?? this.destructive,
        destructiveBorder: destructiveBorder ?? this.destructiveBorder,
        destructiveDisabled: destructiveDisabled ?? this.destructiveDisabled,
        destructiveHover: destructiveHover ?? this.destructiveHover,
        destructivePressed: destructivePressed ?? this.destructivePressed,
        primary: primary ?? this.primary,
        primaryBorder: primaryBorder ?? this.primaryBorder,
        primaryDisabled: primaryDisabled ?? this.primaryDisabled,
        primaryHover: primaryHover ?? this.primaryHover,
        primaryPressed: primaryPressed ?? this.primaryPressed,
        raisedBackground: raisedBackground ?? this.raisedBackground,
        secondary: secondary ?? this.secondary,
        secondaryBorder: secondaryBorder ?? this.secondaryBorder,
        secondaryDisabled: secondaryDisabled ?? this.secondaryDisabled,
        secondaryHover: secondaryHover ?? this.secondaryHover,
        secondaryPressed: secondaryPressed ?? this.secondaryPressed,
        tertiary: tertiary ?? this.tertiary,
        tertiaryBorder: tertiaryBorder ?? this.tertiaryBorder,
        tertiaryDisabled: tertiaryDisabled ?? this.tertiaryDisabled,
        tertiaryHover: tertiaryHover ?? this.tertiaryHover,
        tertiaryPressed: tertiaryPressed ?? this.tertiaryPressed,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiButtonColorTheme &&
          primary == other.primary &&
          primaryBorder == other.primaryBorder &&
          secondary == other.secondary &&
          secondaryBorder == other.secondaryBorder &&
          tertiary == other.tertiary &&
          tertiaryBorder == other.tertiaryBorder &&
          destructive == other.destructive &&
          destructiveBorder == other.destructiveBorder &&
          raisedBackground == other.raisedBackground &&
          primaryHover == other.primaryHover &&
          primaryPressed == other.primaryPressed &&
          primaryDisabled == other.primaryDisabled &&
          secondaryHover == other.secondaryHover &&
          secondaryPressed == other.secondaryPressed &&
          secondaryDisabled == other.secondaryDisabled &&
          tertiaryHover == other.tertiaryHover &&
          tertiaryPressed == other.tertiaryPressed &&
          tertiaryDisabled == other.tertiaryDisabled &&
          destructiveHover == other.destructiveHover &&
          destructivePressed == other.destructivePressed &&
          destructiveDisabled == other.destructiveDisabled;

  @override
  int get hashCode => Object.hashAll([
        primary,
        primaryBorder,
        secondary,
        secondaryBorder,
        tertiary,
        tertiaryBorder,
        destructive,
        destructiveBorder,
        raisedBackground,
        primaryHover,
        primaryPressed,
        primaryDisabled,
        secondaryHover,
        secondaryPressed,
        secondaryDisabled,
        tertiaryHover,
        tertiaryPressed,
        tertiaryDisabled,
        destructiveHover,
        destructivePressed,
        destructiveDisabled,
      ]);
}

/// The colours of one state (hovered, pressed, disabled) of one variant of
/// `ImpaktfullUiButton`. A `null` field keeps the colour the button has in its
/// normal state, so a state can change only its text or only its border, like
/// Ant Design does on hover.
class ImpaktfullUiButtonStateColorTheme {
  /// The background of the button in this state. `null` keeps the background of
  /// the normal state (and keeps a button without one transparent).
  final Color? background;

  /// The border of the button in this state. `null` keeps the border of the
  /// normal state, and adds none to a button without a border.
  final Color? border;

  /// The colour of the title and the icons of the button in this state. `null`
  /// keeps the colour of the text style of the normal state.
  final Color? text;

  const ImpaktfullUiButtonStateColorTheme({
    this.background,
    this.border,
    this.text,
  });

  ImpaktfullUiButtonStateColorTheme copyWith({
    Color? background,
    Color? border,
    Color? text,
  }) =>
      ImpaktfullUiButtonStateColorTheme(
        background: background ?? this.background,
        border: border ?? this.border,
        text: text ?? this.text,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiButtonStateColorTheme &&
          background == other.background &&
          border == other.border &&
          text == other.text;

  @override
  int get hashCode => Object.hash(background, border, text);
}

class ImpaktfullUiRaisedButtonColorTheme {
  final Color? primary;
  final Color? secondary;
  final Color? destructive;
  final Color? destructiveSecondary;

  const ImpaktfullUiRaisedButtonColorTheme({
    required this.primary,
    required this.secondary,
    required this.destructive,
    required this.destructiveSecondary,
  });

  ImpaktfullUiRaisedButtonColorTheme copyWith({
    Color? primary,
    Color? secondary,
    Color? destructive,
    Color? destructiveSecondary,
  }) =>
      ImpaktfullUiRaisedButtonColorTheme(
        primary: primary ?? this.primary,
        secondary: secondary ?? this.secondary,
        destructive: destructive ?? this.destructive,
        destructiveSecondary: destructiveSecondary ?? this.destructiveSecondary,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiRaisedButtonColorTheme &&
          primary == other.primary &&
          secondary == other.secondary &&
          destructive == other.destructive &&
          destructiveSecondary == other.destructiveSecondary;

  @override
  int get hashCode =>
      Object.hash(primary, secondary, destructive, destructiveSecondary);
}

class ImpaktfullUiButtonDimensTheme {
  final BorderRadiusGeometry borderRadius;
  final double borderWidth;

  /// The geometry of the button per [ImpaktfullUiButtonSize].
  final ImpaktfullUiButtonSizesDimensTheme sizes;

  /// The padding of a button without a background: the link, the link grey and
  /// the destructive link type. It does not depend on the size of the button.
  final EdgeInsetsGeometry linkPadding;

  const ImpaktfullUiButtonDimensTheme({
    required this.borderRadius,
    required this.borderWidth,
    this.sizes = const ImpaktfullUiButtonSizesDimensTheme(),
    this.linkPadding = const EdgeInsets.symmetric(horizontal: 4),
  });

  ImpaktfullUiButtonDimensTheme copyWith({
    BorderRadiusGeometry? borderRadius,
    double? borderWidth,
    EdgeInsetsGeometry? linkPadding,
    ImpaktfullUiButtonSizesDimensTheme? sizes,
  }) =>
      ImpaktfullUiButtonDimensTheme(
        borderRadius: borderRadius ?? this.borderRadius,
        borderWidth: borderWidth ?? this.borderWidth,
        linkPadding: linkPadding ?? this.linkPadding,
        sizes: sizes ?? this.sizes,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiButtonDimensTheme &&
          borderRadius == other.borderRadius &&
          borderWidth == other.borderWidth &&
          sizes == other.sizes &&
          linkPadding == other.linkPadding;

  @override
  int get hashCode =>
      Object.hash(borderRadius, borderWidth, sizes, linkPadding);
}

/// The geometry of `ImpaktfullUiButton` per [ImpaktfullUiButtonSize].
class ImpaktfullUiButtonSizesDimensTheme {
  final ImpaktfullUiButtonSizeDimensTheme extraSmall;
  final ImpaktfullUiButtonSizeDimensTheme small;
  final ImpaktfullUiButtonSizeDimensTheme medium;
  final ImpaktfullUiButtonSizeDimensTheme large;
  final ImpaktfullUiButtonSizeDimensTheme extraLarge;

  const ImpaktfullUiButtonSizesDimensTheme({
    this.extraSmall = const ImpaktfullUiButtonSizeDimensTheme(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      loadingSize: 24,
    ),
    this.small = const ImpaktfullUiButtonSizeDimensTheme(
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      loadingSize: 32,
    ),
    this.medium = const ImpaktfullUiButtonSizeDimensTheme(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      loadingSize: 32,
    ),
    this.large = const ImpaktfullUiButtonSizeDimensTheme(
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      loadingSize: 40,
    ),
    this.extraLarge = const ImpaktfullUiButtonSizeDimensTheme(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      iconSize: 24,
      loadingSize: 48,
    ),
  });

  /// The geometry of [size].
  ImpaktfullUiButtonSizeDimensTheme bySize(ImpaktfullUiButtonSize size) {
    switch (size) {
      case ImpaktfullUiButtonSize.extraSmall:
        return extraSmall;
      case ImpaktfullUiButtonSize.small:
        return small;
      case ImpaktfullUiButtonSize.medium:
        return medium;
      case ImpaktfullUiButtonSize.large:
        return large;
      case ImpaktfullUiButtonSize.extraLarge:
        return extraLarge;
    }
  }

  ImpaktfullUiButtonSizesDimensTheme copyWith({
    ImpaktfullUiButtonSizeDimensTheme? extraLarge,
    ImpaktfullUiButtonSizeDimensTheme? extraSmall,
    ImpaktfullUiButtonSizeDimensTheme? large,
    ImpaktfullUiButtonSizeDimensTheme? medium,
    ImpaktfullUiButtonSizeDimensTheme? small,
  }) =>
      ImpaktfullUiButtonSizesDimensTheme(
        extraLarge: extraLarge ?? this.extraLarge,
        extraSmall: extraSmall ?? this.extraSmall,
        large: large ?? this.large,
        medium: medium ?? this.medium,
        small: small ?? this.small,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiButtonSizesDimensTheme &&
          extraSmall == other.extraSmall &&
          small == other.small &&
          medium == other.medium &&
          large == other.large &&
          extraLarge == other.extraLarge;

  @override
  int get hashCode => Object.hash(extraSmall, small, medium, large, extraLarge);
}

/// The geometry of one [ImpaktfullUiButtonSize].
class ImpaktfullUiButtonSizeDimensTheme {
  /// The height of the button.
  ///
  /// `null` (the default) lets the height follow from [padding] and the line
  /// box of the title, like before this token existed. Design systems that
  /// declare a control height (Ant Design's `controlHeight: 32`, shadcn/ui's
  /// `h-9`) set it here.
  ///
  /// With a height the content is centred in a box of that height and the
  /// vertical part of [padding] is ignored, so the button is exactly this
  /// tall. A title that wraps to more than one line still grows the button
  /// instead of overflowing: the height is exact for content that fits and a
  /// minimum for content that does not.
  final double? height;

  /// The padding around the content of the button. The vertical part is
  /// ignored when [height] is set.
  ///
  /// A button of the link, the link grey or the destructive link type uses
  /// [ImpaktfullUiButtonDimensTheme.linkPadding] instead.
  final EdgeInsetsGeometry padding;

  /// The space between the leading widget, the title and the trailing widget.
  final double spacing;

  /// The size of the leading and the trailing asset.
  final double iconSize;

  /// The height of the loading indicator that replaces the content while the
  /// button is loading.
  final double loadingSize;

  const ImpaktfullUiButtonSizeDimensTheme({
    required this.padding,
    required this.loadingSize,
    this.height,
    this.spacing = 4,
    this.iconSize = 20,
  });

  ImpaktfullUiButtonSizeDimensTheme copyWith({
    double? height,
    double? iconSize,
    double? loadingSize,
    EdgeInsetsGeometry? padding,
    double? spacing,
  }) =>
      ImpaktfullUiButtonSizeDimensTheme(
        height: height ?? this.height,
        iconSize: iconSize ?? this.iconSize,
        loadingSize: loadingSize ?? this.loadingSize,
        padding: padding ?? this.padding,
        spacing: spacing ?? this.spacing,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiButtonSizeDimensTheme &&
          height == other.height &&
          padding == other.padding &&
          spacing == other.spacing &&
          iconSize == other.iconSize &&
          loadingSize == other.loadingSize;

  @override
  int get hashCode =>
      Object.hash(height, padding, spacing, iconSize, loadingSize);
}

class ImpaktfullUiButtonDurationsTheme {
  final Duration loading;

  /// How long a raised button takes to move down when it is pressed.
  final Duration raisedPress;

  /// How long a raised button waits before it moves back up after a press.
  final Duration raisedRelease;

  const ImpaktfullUiButtonDurationsTheme({
    required this.loading,
    this.raisedPress = const Duration(milliseconds: 25),
    this.raisedRelease = const Duration(milliseconds: 30),
  });

  ImpaktfullUiButtonDurationsTheme copyWith({
    Duration? loading,
    Duration? raisedPress,
    Duration? raisedRelease,
  }) =>
      ImpaktfullUiButtonDurationsTheme(
        loading: loading ?? this.loading,
        raisedPress: raisedPress ?? this.raisedPress,
        raisedRelease: raisedRelease ?? this.raisedRelease,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiButtonDurationsTheme &&
          loading == other.loading &&
          raisedPress == other.raisedPress &&
          raisedRelease == other.raisedRelease;

  @override
  int get hashCode => Object.hash(loading, raisedPress, raisedRelease);
}

class ImpaktfullUiButtonTextStyleTheme {
  final TextStyle primary;
  final TextStyle alternative;
  final TextStyle grey;
  final TextStyle destructivePrimary;
  final TextStyle destructiveAlternative;

  const ImpaktfullUiButtonTextStyleTheme({
    required this.primary,
    required this.alternative,
    required this.grey,
    required this.destructivePrimary,
    required this.destructiveAlternative,
  });

  ImpaktfullUiButtonTextStyleTheme copyWith({
    TextStyle? primary,
    TextStyle? alternative,
    TextStyle? grey,
    TextStyle? destructivePrimary,
    TextStyle? destructiveAlternative,
  }) =>
      ImpaktfullUiButtonTextStyleTheme(
        primary: primary ?? this.primary,
        alternative: alternative ?? this.alternative,
        grey: grey ?? this.grey,
        destructivePrimary: destructivePrimary ?? this.destructivePrimary,
        destructiveAlternative:
            destructiveAlternative ?? this.destructiveAlternative,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiButtonTextStyleTheme &&
          primary == other.primary &&
          alternative == other.alternative &&
          grey == other.grey &&
          destructivePrimary == other.destructivePrimary &&
          destructiveAlternative == other.destructiveAlternative;

  @override
  int get hashCode => Object.hash(
      primary, alternative, grey, destructivePrimary, destructiveAlternative);
}

class ImpaktfullUiButtonShadowsTheme {
  final List<BoxShadow>? primary;
  final List<BoxShadow>? secondary;
  final List<BoxShadow>? destructive;

  const ImpaktfullUiButtonShadowsTheme({
    required this.primary,
    required this.secondary,
    required this.destructive,
  });

  ImpaktfullUiButtonShadowsTheme copyWith({
    List<BoxShadow>? primary,
    List<BoxShadow>? secondary,
    List<BoxShadow>? destructive,
  }) =>
      ImpaktfullUiButtonShadowsTheme(
        primary: primary ?? this.primary,
        secondary: secondary ?? this.secondary,
        destructive: destructive ?? this.destructive,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiButtonShadowsTheme &&
          listEquals(primary, other.primary) &&
          listEquals(secondary, other.secondary) &&
          listEquals(destructive, other.destructive);

  @override
  int get hashCode => Object.hash(
      Object.hashAll(primary ?? const []),
      Object.hashAll(secondary ?? const []),
      Object.hashAll(destructive ?? const []));
}

class ImpaktfullUiButtonConfig {
  final bool isRaised;
  final double elevation;
  final bool vibrateOnTap;

  const ImpaktfullUiButtonConfig({
    this.isRaised = false,
    this.elevation = 0,
    this.vibrateOnTap = false,
  });

  ImpaktfullUiButtonConfig copyWith({
    bool? isRaised,
    double? elevation,
    bool? vibrateOnTap,
  }) =>
      ImpaktfullUiButtonConfig(
        isRaised: isRaised ?? this.isRaised,
        elevation: elevation ?? this.elevation,
        vibrateOnTap: vibrateOnTap ?? this.vibrateOnTap,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiButtonConfig &&
          isRaised == other.isRaised &&
          elevation == other.elevation &&
          vibrateOnTap == other.vibrateOnTap;

  @override
  int get hashCode => Object.hash(isRaised, elevation, vibrateOnTap);
}

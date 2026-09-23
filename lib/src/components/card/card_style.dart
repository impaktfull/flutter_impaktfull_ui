import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiCardTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiCardColorTheme colors;
  final ImpaktfullUiCardDimensTheme dimens;
  final ImpaktfullUiCardShadowsTheme shadows;

  const ImpaktfullUiCardTheme({
    required this.colors,
    required this.dimens,
    required this.shadows,
  });

  ImpaktfullUiCardTheme copyWith({
    ImpaktfullUiCardColorTheme? colors,
    ImpaktfullUiCardDimensTheme? dimens,
    ImpaktfullUiCardShadowsTheme? shadows,
  }) =>
      ImpaktfullUiCardTheme(
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        shadows: shadows ?? this.shadows,
      );

  static ImpaktfullUiCardTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.card;

  static ImpaktfullUiCardTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiCardTheme(
        colors: ImpaktfullUiCardColorTheme(
          background: colors.card,
          border: colors.border,
          borderError: colors.error,
        ),
        dimens: ImpaktfullUiCardDimensTheme(
          borderRadius: dimens.borderRadius,
          padding: const EdgeInsets.all(16),
          borderWidth: 1,
        ),
        shadows: ImpaktfullUiCardShadowsTheme(
          card: shadows.small,
        ),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiCardTheme &&
          colors == other.colors &&
          dimens == other.dimens &&
          shadows == other.shadows;

  @override
  int get hashCode => Object.hash(colors, dimens, shadows);
}

class ImpaktfullUiCardColorTheme {
  final Color background;
  final Color? border;
  final Color? borderError;

  const ImpaktfullUiCardColorTheme({
    required this.background,
    required this.border,
    required this.borderError,
  });

  ImpaktfullUiCardColorTheme copyWith({
    Color? background,
    Color? border,
    Color? borderError,
  }) =>
      ImpaktfullUiCardColorTheme(
        background: background ?? this.background,
        border: border ?? this.border,
        borderError: borderError ?? this.borderError,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiCardColorTheme &&
          background == other.background &&
          border == other.border &&
          borderError == other.borderError;

  @override
  int get hashCode => Object.hash(background, border, borderError);
}

class ImpaktfullUiCardDimensTheme {
  final BorderRadiusGeometry borderRadius;
  final EdgeInsets padding;
  final double borderWidth;

  const ImpaktfullUiCardDimensTheme({
    required this.borderRadius,
    required this.padding,
    required this.borderWidth,
  });

  ImpaktfullUiCardDimensTheme copyWith({
    BorderRadiusGeometry? borderRadius,
    double? borderWidth,
    EdgeInsets? padding,
  }) =>
      ImpaktfullUiCardDimensTheme(
        borderRadius: borderRadius ?? this.borderRadius,
        borderWidth: borderWidth ?? this.borderWidth,
        padding: padding ?? this.padding,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiCardDimensTheme &&
          borderRadius == other.borderRadius &&
          padding == other.padding &&
          borderWidth == other.borderWidth;

  @override
  int get hashCode => Object.hash(borderRadius, padding, borderWidth);
}

class ImpaktfullUiCardShadowsTheme {
  final List<BoxShadow> card;

  const ImpaktfullUiCardShadowsTheme({
    required this.card,
  });

  ImpaktfullUiCardShadowsTheme copyWith({
    List<BoxShadow>? card,
  }) =>
      ImpaktfullUiCardShadowsTheme(
        card: card ?? this.card,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiCardShadowsTheme && listEquals(card, other.card);

  @override
  int get hashCode => Object.hashAll(card);
}

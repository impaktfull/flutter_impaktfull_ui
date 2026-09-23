import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';
import 'package:impaktfull_ui/src/util/extension/color_extensions.dart';
import 'package:impaktfull_ui/src/util/extension/text_style_extension.dart';

class ImpaktfullUiFloatingActionButtonTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiFloatingActionButtonAssetsTheme assets;
  final ImpaktfullUiFloatingActionButtonColorTheme colors;
  final ImpaktfullUiFloatingActionButtonDimensTheme dimens;
  final ImpaktfullUiFloatingActionButtonDurationsTheme durations;
  final ImpaktfullUiFloatingActionButtonTextStyleTheme textStyles;

  const ImpaktfullUiFloatingActionButtonTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    this.durations = const ImpaktfullUiFloatingActionButtonDurationsTheme(),
    required this.textStyles,
  });

  ImpaktfullUiFloatingActionButtonTheme copyWith({
    ImpaktfullUiFloatingActionButtonAssetsTheme? assets,
    ImpaktfullUiFloatingActionButtonColorTheme? colors,
    ImpaktfullUiFloatingActionButtonDimensTheme? dimens,
    ImpaktfullUiFloatingActionButtonDurationsTheme? durations,
    ImpaktfullUiFloatingActionButtonTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiFloatingActionButtonTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        durations: durations ?? this.durations,
        textStyles: textStyles ?? this.textStyles,
      );

  static ImpaktfullUiFloatingActionButtonTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.floatingActionButton;

  static ImpaktfullUiFloatingActionButtonTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiFloatingActionButtonTheme(
        assets: const ImpaktfullUiFloatingActionButtonAssetsTheme(),
        colors: ImpaktfullUiFloatingActionButtonColorTheme(
          background: colors.accent,
          backgroundDisabled: colors.accent.withOpacityPercentage(0.66),
          icon: colors.textOnAccent,
        ),
        dimens: ImpaktfullUiFloatingActionButtonDimensTheme(
          borderRadius: dimens.borderRadiusCircle,
        ),
        durations: const ImpaktfullUiFloatingActionButtonDurationsTheme(),
        textStyles: ImpaktfullUiFloatingActionButtonTextStyleTheme(
          label: textStyles.onAccent.text.small.bold,
        ),
      );
}

class ImpaktfullUiFloatingActionButtonAssetsTheme {
  const ImpaktfullUiFloatingActionButtonAssetsTheme();

  ImpaktfullUiFloatingActionButtonAssetsTheme copyWith() =>
      const ImpaktfullUiFloatingActionButtonAssetsTheme();
}

class ImpaktfullUiFloatingActionButtonColorTheme {
  final Color background;
  final Color backgroundDisabled;
  final Color icon;
  const ImpaktfullUiFloatingActionButtonColorTheme({
    required this.background,
    required this.backgroundDisabled,
    required this.icon,
  });

  ImpaktfullUiFloatingActionButtonColorTheme copyWith({
    Color? background,
    Color? backgroundDisabled,
    Color? icon,
  }) =>
      ImpaktfullUiFloatingActionButtonColorTheme(
        background: background ?? this.background,
        backgroundDisabled: backgroundDisabled ?? this.backgroundDisabled,
        icon: icon ?? this.icon,
      );
}

class ImpaktfullUiFloatingActionButtonDimensTheme {
  final BorderRadiusGeometry borderRadius;
  const ImpaktfullUiFloatingActionButtonDimensTheme({
    required this.borderRadius,
  });

  ImpaktfullUiFloatingActionButtonDimensTheme copyWith({
    BorderRadiusGeometry? borderRadius,
  }) =>
      ImpaktfullUiFloatingActionButtonDimensTheme(
        borderRadius: borderRadius ?? this.borderRadius,
      );
}

class ImpaktfullUiFloatingActionButtonDurationsTheme {
  /// How long the button takes to expand to its title and back.
  final Duration expand;

  const ImpaktfullUiFloatingActionButtonDurationsTheme({
    this.expand = const Duration(milliseconds: 200),
  });

  ImpaktfullUiFloatingActionButtonDurationsTheme copyWith({
    Duration? expand,
  }) =>
      ImpaktfullUiFloatingActionButtonDurationsTheme(
        expand: expand ?? this.expand,
      );
}

class ImpaktfullUiFloatingActionButtonTextStyleTheme {
  final TextStyle label;
  const ImpaktfullUiFloatingActionButtonTextStyleTheme({
    required this.label,
  });

  ImpaktfullUiFloatingActionButtonTextStyleTheme copyWith({
    TextStyle? label,
  }) =>
      ImpaktfullUiFloatingActionButtonTextStyleTheme(
        label: label ?? this.label,
      );
}

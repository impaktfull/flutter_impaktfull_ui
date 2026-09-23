import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiAvatarTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiAvatarAssetsTheme assets;
  final ImpaktfullUiAvatarColorTheme colors;
  final ImpaktfullUiAvatarDimensTheme dimens;
  final ImpaktfullUiAvatarTextStyleTheme textStyles;

  const ImpaktfullUiAvatarTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  ImpaktfullUiAvatarTheme copyWith({
    ImpaktfullUiAvatarAssetsTheme? assets,
    ImpaktfullUiAvatarColorTheme? colors,
    ImpaktfullUiAvatarDimensTheme? dimens,
    ImpaktfullUiAvatarTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiAvatarTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        textStyles: textStyles ?? this.textStyles,
      );

  static ImpaktfullUiAvatarTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.avatar;

  static ImpaktfullUiAvatarTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiAvatarTheme(
        assets: ImpaktfullUiAvatarAssetsTheme(
          placeholder: assets.icons.user,
        ),
        colors: ImpaktfullUiAvatarColorTheme(
          border: colors.border,
          background: colors.canvas,
          placeholder: colors.text,
        ),
        dimens: ImpaktfullUiAvatarDimensTheme(
          borderRadius: dimens.borderRadiusCircle,
        ),
        textStyles: const ImpaktfullUiAvatarTextStyleTheme(),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiAvatarTheme &&
          assets == other.assets &&
          colors == other.colors &&
          dimens == other.dimens &&
          textStyles == other.textStyles;

  @override
  int get hashCode => Object.hash(assets, colors, dimens, textStyles);
}

class ImpaktfullUiAvatarAssetsTheme {
  final ImpaktfullUiAsset? placeholder;
  const ImpaktfullUiAvatarAssetsTheme({
    required this.placeholder,
  });

  ImpaktfullUiAvatarAssetsTheme copyWith({
    ImpaktfullUiAsset? placeholder,
  }) =>
      ImpaktfullUiAvatarAssetsTheme(
        placeholder: placeholder ?? this.placeholder,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiAvatarAssetsTheme &&
          placeholder == other.placeholder;

  @override
  int get hashCode => placeholder.hashCode;
}

class ImpaktfullUiAvatarColorTheme {
  final Color border;
  final Color background;
  final Color placeholder;
  const ImpaktfullUiAvatarColorTheme({
    required this.border,
    required this.background,
    required this.placeholder,
  });

  ImpaktfullUiAvatarColorTheme copyWith({
    Color? background,
    Color? border,
    Color? placeholder,
  }) =>
      ImpaktfullUiAvatarColorTheme(
        background: background ?? this.background,
        border: border ?? this.border,
        placeholder: placeholder ?? this.placeholder,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiAvatarColorTheme &&
          border == other.border &&
          background == other.background &&
          placeholder == other.placeholder;

  @override
  int get hashCode => Object.hash(border, background, placeholder);
}

class ImpaktfullUiAvatarDimensTheme {
  final BorderRadiusGeometry borderRadius;
  const ImpaktfullUiAvatarDimensTheme({
    required this.borderRadius,
  });

  ImpaktfullUiAvatarDimensTheme copyWith({
    BorderRadiusGeometry? borderRadius,
  }) =>
      ImpaktfullUiAvatarDimensTheme(
        borderRadius: borderRadius ?? this.borderRadius,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiAvatarDimensTheme &&
          borderRadius == other.borderRadius;

  @override
  int get hashCode => borderRadius.hashCode;
}

class ImpaktfullUiAvatarTextStyleTheme {
  const ImpaktfullUiAvatarTextStyleTheme();

  ImpaktfullUiAvatarTextStyleTheme copyWith() =>
      const ImpaktfullUiAvatarTextStyleTheme();

  @override
  bool operator ==(Object other) => other is ImpaktfullUiAvatarTextStyleTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}

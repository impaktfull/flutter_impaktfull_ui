import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';
import 'package:impaktfull_ui/src/util/extension/border_radius_geometry_extension.dart';
import 'package:impaktfull_ui/src/util/extension/text_style_extension.dart';

class ImpaktfullUiBottomSheetTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiBottomSheetAssetsTheme assets;
  final ImpaktfullUiBottomSheetColorTheme colors;
  final ImpaktfullUiBottomSheetDimensTheme dimens;
  final ImpaktfullUiBottomSheetTextStyleTheme textStyles;

  const ImpaktfullUiBottomSheetTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  ImpaktfullUiBottomSheetTheme copyWith({
    ImpaktfullUiBottomSheetAssetsTheme? assets,
    ImpaktfullUiBottomSheetColorTheme? colors,
    ImpaktfullUiBottomSheetDimensTheme? dimens,
    ImpaktfullUiBottomSheetTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiBottomSheetTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        textStyles: textStyles ?? this.textStyles,
      );

  static ImpaktfullUiBottomSheetTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.bottomSheet;

  static ImpaktfullUiBottomSheetTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiBottomSheetTheme(
        assets: ImpaktfullUiBottomSheetAssetsTheme(
          close: assets.icons.close,
        ),
        colors: ImpaktfullUiBottomSheetColorTheme(
          background: colors.card,
          handle: colors.text,
          icons: colors.text,
        ),
        dimens: ImpaktfullUiBottomSheetDimensTheme(
          borderRadius: dimens.borderRadius.copyWith(
            bottomStart: Radius.zero,
            bottomEnd: Radius.zero,
          ),
          padding: const EdgeInsetsDirectional.all(16),
          closeIconButtonPadding: const EdgeInsetsDirectional.all(4),
          handleBorderRadius: dimens.borderRadiusExtraSmall,
        ),
        textStyles: ImpaktfullUiBottomSheetTextStyleTheme(
          title: textStyles.onCanvas.display.small.semiBold,
          subtitle: textStyles.onCanvas.text.small,
        ),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiBottomSheetTheme &&
          assets == other.assets &&
          colors == other.colors &&
          dimens == other.dimens &&
          textStyles == other.textStyles;

  @override
  int get hashCode => Object.hash(assets, colors, dimens, textStyles);
}

class ImpaktfullUiBottomSheetAssetsTheme {
  final ImpaktfullUiAsset close;

  const ImpaktfullUiBottomSheetAssetsTheme({
    required this.close,
  });

  ImpaktfullUiBottomSheetAssetsTheme copyWith({
    ImpaktfullUiAsset? close,
  }) =>
      ImpaktfullUiBottomSheetAssetsTheme(
        close: close ?? this.close,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiBottomSheetAssetsTheme && close == other.close;

  @override
  int get hashCode => close.hashCode;
}

class ImpaktfullUiBottomSheetColorTheme {
  final Color background;
  final Color handle;
  final Color icons;

  const ImpaktfullUiBottomSheetColorTheme({
    required this.background,
    required this.handle,
    required this.icons,
  });

  ImpaktfullUiBottomSheetColorTheme copyWith({
    Color? background,
    Color? handle,
    Color? icons,
  }) =>
      ImpaktfullUiBottomSheetColorTheme(
        background: background ?? this.background,
        handle: handle ?? this.handle,
        icons: icons ?? this.icons,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiBottomSheetColorTheme &&
          background == other.background &&
          handle == other.handle &&
          icons == other.icons;

  @override
  int get hashCode => Object.hash(background, handle, icons);
}

class ImpaktfullUiBottomSheetDimensTheme {
  final EdgeInsetsDirectional closeIconButtonPadding;
  final EdgeInsetsDirectional padding;
  final BorderRadiusGeometry borderRadius;
  final BorderRadiusGeometry handleBorderRadius;

  const ImpaktfullUiBottomSheetDimensTheme({
    required this.closeIconButtonPadding,
    required this.padding,
    required this.borderRadius,
    required this.handleBorderRadius,
  });

  ImpaktfullUiBottomSheetDimensTheme copyWith({
    BorderRadiusGeometry? borderRadius,
    EdgeInsetsDirectional? closeIconButtonPadding,
    BorderRadiusGeometry? handleBorderRadius,
    EdgeInsetsDirectional? padding,
  }) =>
      ImpaktfullUiBottomSheetDimensTheme(
        borderRadius: borderRadius ?? this.borderRadius,
        closeIconButtonPadding:
            closeIconButtonPadding ?? this.closeIconButtonPadding,
        handleBorderRadius: handleBorderRadius ?? this.handleBorderRadius,
        padding: padding ?? this.padding,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiBottomSheetDimensTheme &&
          closeIconButtonPadding == other.closeIconButtonPadding &&
          padding == other.padding &&
          borderRadius == other.borderRadius &&
          handleBorderRadius == other.handleBorderRadius;

  @override
  int get hashCode => Object.hash(
      closeIconButtonPadding, padding, borderRadius, handleBorderRadius);
}

class ImpaktfullUiBottomSheetTextStyleTheme {
  final TextStyle title;
  final TextStyle subtitle;

  const ImpaktfullUiBottomSheetTextStyleTheme({
    required this.title,
    required this.subtitle,
  });

  ImpaktfullUiBottomSheetTextStyleTheme copyWith({
    TextStyle? subtitle,
    TextStyle? title,
  }) =>
      ImpaktfullUiBottomSheetTextStyleTheme(
        subtitle: subtitle ?? this.subtitle,
        title: title ?? this.title,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiBottomSheetTextStyleTheme &&
          title == other.title &&
          subtitle == other.subtitle;

  @override
  int get hashCode => Object.hash(title, subtitle);
}

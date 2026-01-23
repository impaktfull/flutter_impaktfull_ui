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
}

class ImpaktfullUiBottomSheetAssetsTheme {
  final ImpaktfullUiAsset close;

  const ImpaktfullUiBottomSheetAssetsTheme({
    required this.close,
  });
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
}

class ImpaktfullUiBottomSheetTextStyleTheme {
  final TextStyle title;
  final TextStyle subtitle;

  const ImpaktfullUiBottomSheetTextStyleTheme({
    required this.title,
    required this.subtitle,
  });
}

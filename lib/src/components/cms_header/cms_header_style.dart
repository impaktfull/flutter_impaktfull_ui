import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';
import 'package:impaktfull_ui/src/util/extension/text_style_extension.dart';

class ImpaktfullUiCmsHeaderTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiCmsHeaderAssetsTheme assets;
  final ImpaktfullUiCmsHeaderColorTheme colors;
  final ImpaktfullUiCmsHeaderDimensTheme dimens;
  final ImpaktfullUiCmsHeaderShadowsTheme shadows;
  final ImpaktfullUiCmsHeaderTextStylesTheme textStyles;

  const ImpaktfullUiCmsHeaderTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.shadows,
    required this.textStyles,
  });

  static ImpaktfullUiCmsHeaderTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.cmsHeader;

  static ImpaktfullUiCmsHeaderTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiCmsHeaderTheme(
        assets: ImpaktfullUiCmsHeaderAssetsTheme(
          back: assets.icons.arrowLeft,
          drawerMenu: assets.icons.list,
        ),
        colors: ImpaktfullUiCmsHeaderColorTheme(
          background: colors.card,
          border: colors.border,
          icons: colors.text,
        ),
        dimens: const ImpaktfullUiCmsHeaderDimensTheme(),
        shadows: ImpaktfullUiCmsHeaderShadowsTheme(
          background: shadows.extraSmall,
        ),
        textStyles: ImpaktfullUiCmsHeaderTextStylesTheme(
          title: textStyles.onCard.text.large,
          subtitle: textStyles.onCard.text.small.light,
        ),
      );
}

class ImpaktfullUiCmsHeaderAssetsTheme {
  final ImpaktfullUiAsset back;
  final ImpaktfullUiAsset drawerMenu;

  const ImpaktfullUiCmsHeaderAssetsTheme({
    required this.back,
    required this.drawerMenu,
  });
}

class ImpaktfullUiCmsHeaderColorTheme {
  final Color background;
  final Color? border;
  final Color icons;

  const ImpaktfullUiCmsHeaderColorTheme({
    required this.background,
    required this.border,
    required this.icons,
  });
}

class ImpaktfullUiCmsHeaderDimensTheme {
  const ImpaktfullUiCmsHeaderDimensTheme();
}

class ImpaktfullUiCmsHeaderDurationsTheme {
  const ImpaktfullUiCmsHeaderDurationsTheme();
}

class ImpaktfullUiCmsHeaderShadowsTheme {
  final List<BoxShadow> background;
  const ImpaktfullUiCmsHeaderShadowsTheme({
    required this.background,
  });
}

class ImpaktfullUiCmsHeaderTextStylesTheme {
  final TextStyle title;
  final TextStyle subtitle;

  const ImpaktfullUiCmsHeaderTextStylesTheme({
    required this.title,
    required this.subtitle,
  });
}

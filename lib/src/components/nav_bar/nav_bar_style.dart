import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';
import 'package:impaktfull_ui/src/util/extension/text_style_extension.dart';

class ImpaktfullUiNavBarTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiNavBarAssetsTheme assets;
  final ImpaktfullUiNavBarColorTheme colors;
  final ImpaktfullUiNavBarDimensTheme dimens;
  final ImpaktfullUiNavBarShadowsTheme shadows;
  final ImpaktfullUiNavBarTextStyleTheme textStyles;

  const ImpaktfullUiNavBarTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.shadows,
    required this.textStyles,
  });

  static ImpaktfullUiNavBarTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.navBar;

  static ImpaktfullUiNavBarTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiNavBarTheme(
        assets: ImpaktfullUiNavBarAssetsTheme(
          back: assets.icons.arrowLeft,
          drawerMenu: assets.icons.list,
          close: assets.icons.close,
        ),
        colors: ImpaktfullUiNavBarColorTheme(
          background: colors.card,
          icons: colors.text,
          border: colors.border,
        ),
        dimens: const ImpaktfullUiNavBarDimensTheme(),
        textStyles: ImpaktfullUiNavBarTextStyleTheme(
          title: textStyles.onCard.text.medium,
          subtitle: textStyles.onCard.text.small.light.withOpacity(0.66),
        ),
        shadows: ImpaktfullUiNavBarShadowsTheme(
          shadow: shadows.small,
        ),
      );
}

class ImpaktfullUiNavBarAssetsTheme {
  final ImpaktfullUiAsset back;
  final ImpaktfullUiAsset drawerMenu;
  final ImpaktfullUiAsset close;
  const ImpaktfullUiNavBarAssetsTheme({
    required this.back,
    required this.drawerMenu,
    required this.close,
  });
}

class ImpaktfullUiNavBarColorTheme {
  final Color background;
  final Color icons;
  final Color? border;
  const ImpaktfullUiNavBarColorTheme({
    required this.background,
    required this.icons,
    required this.border,
  });
}

class ImpaktfullUiNavBarDimensTheme {
  const ImpaktfullUiNavBarDimensTheme();
}

class ImpaktfullUiNavBarShadowsTheme {
  final List<BoxShadow> shadow;
  const ImpaktfullUiNavBarShadowsTheme({
    required this.shadow,
  });
}

class ImpaktfullUiNavBarTextStyleTheme {
  final TextStyle title;
  final TextStyle subtitle;
  const ImpaktfullUiNavBarTextStyleTheme({
    required this.title,
    required this.subtitle,
  });
}

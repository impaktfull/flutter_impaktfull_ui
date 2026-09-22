import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';
import 'package:impaktfull_ui/src/util/extension/text_style_extension.dart';

class ImpaktfullUiIntroductionTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiIntroductionAssetsTheme assets;
  final ImpaktfullUiIntroductionColorTheme colors;
  final ImpaktfullUiIntroductionDimensTheme dimens;
  final ImpaktfullUiIntroductionTextStyleTheme textStyles;

  const ImpaktfullUiIntroductionTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  ImpaktfullUiIntroductionTheme copyWith({
    ImpaktfullUiIntroductionAssetsTheme? assets,
    ImpaktfullUiIntroductionColorTheme? colors,
    ImpaktfullUiIntroductionDimensTheme? dimens,
    ImpaktfullUiIntroductionTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiIntroductionTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        textStyles: textStyles ?? this.textStyles,
      );

  static ImpaktfullUiIntroductionTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.introduction;

  static ImpaktfullUiIntroductionTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiIntroductionTheme(
        assets: const ImpaktfullUiIntroductionAssetsTheme(),
        colors: ImpaktfullUiIntroductionColorTheme(
          asset: colors.accent,
        ),
        dimens: const ImpaktfullUiIntroductionDimensTheme(),
        textStyles: ImpaktfullUiIntroductionTextStyleTheme(
          title: textStyles.onCanvas.display.small.semiBold,
          subtitle: textStyles.onCanvasTertiary.text.medium,
        ),
      );
}

class ImpaktfullUiIntroductionAssetsTheme {
  const ImpaktfullUiIntroductionAssetsTheme();

  ImpaktfullUiIntroductionAssetsTheme copyWith() =>
      const ImpaktfullUiIntroductionAssetsTheme();
}

class ImpaktfullUiIntroductionColorTheme {
  /// The color of the asset of a page. When null, the asset keeps its own
  /// color.
  final Color? asset;

  const ImpaktfullUiIntroductionColorTheme({
    this.asset,
  });

  ImpaktfullUiIntroductionColorTheme copyWith({
    Color? asset,
  }) =>
      ImpaktfullUiIntroductionColorTheme(
        asset: asset ?? this.asset,
      );
}

class ImpaktfullUiIntroductionDimensTheme {
  /// The padding around the content of a page.
  final EdgeInsetsGeometry pagePadding;

  /// The padding around the buttons below the pages.
  final EdgeInsetsGeometry actionsPadding;

  /// The size of the asset of a page.
  final double assetSize;

  /// The space between the asset, the title, the subtitle and the child of a
  /// page.
  final double spacing;

  const ImpaktfullUiIntroductionDimensTheme({
    this.pagePadding = const EdgeInsets.all(24),
    this.actionsPadding = const EdgeInsets.all(16),
    this.assetSize = 120,
    this.spacing = 16,
  });

  ImpaktfullUiIntroductionDimensTheme copyWith({
    EdgeInsetsGeometry? pagePadding,
    EdgeInsetsGeometry? actionsPadding,
    double? assetSize,
    double? spacing,
  }) =>
      ImpaktfullUiIntroductionDimensTheme(
        pagePadding: pagePadding ?? this.pagePadding,
        actionsPadding: actionsPadding ?? this.actionsPadding,
        assetSize: assetSize ?? this.assetSize,
        spacing: spacing ?? this.spacing,
      );
}

class ImpaktfullUiIntroductionTextStyleTheme {
  /// The style of the title of a page. When null, the default text style is
  /// used.
  final TextStyle? title;

  /// The style of the subtitle of a page. When null, the default text style
  /// is used.
  final TextStyle? subtitle;

  const ImpaktfullUiIntroductionTextStyleTheme({
    this.title,
    this.subtitle,
  });

  ImpaktfullUiIntroductionTextStyleTheme copyWith({
    TextStyle? title,
    TextStyle? subtitle,
  }) =>
      ImpaktfullUiIntroductionTextStyleTheme(
        title: title ?? this.title,
        subtitle: subtitle ?? this.subtitle,
      );
}

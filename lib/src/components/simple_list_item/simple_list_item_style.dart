import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';
import 'package:impaktfull_ui/src/util/extension/text_style_extension.dart';

class ImpaktfullUiSimpleListItemTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiSimpleListItemAssetsTheme assets;
  final ImpaktfullUiSimpleListItemColorTheme colors;
  final ImpaktfullUiSimpleListItemDimensTheme dimens;
  final ImpaktfullUiSimpleListItemTextStyleTheme textStyles;

  const ImpaktfullUiSimpleListItemTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  static ImpaktfullUiSimpleListItemTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.simpleListItem;

  static ImpaktfullUiSimpleListItemTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiSimpleListItemTheme(
        assets: const ImpaktfullUiSimpleListItemAssetsTheme(),
        colors: ImpaktfullUiSimpleListItemColorTheme(
          background: colors.card,
        ),
        dimens: const ImpaktfullUiSimpleListItemDimensTheme(
          padding: EdgeInsets.all(16),
          borderRadius: BorderRadius.zero,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 8,
        ),
        textStyles: ImpaktfullUiSimpleListItemTextStyleTheme(
          title: textStyles.onCard.text.small.medium,
          titleDanger: textStyles.onCardDestructive.text.small.medium,
          subtitle: textStyles.onCard.text.small.light,
          subtitleDanger: textStyles.onCardDestructive.text.small.light,
        ),
      );
}

class ImpaktfullUiSimpleListItemAssetsTheme {
  const ImpaktfullUiSimpleListItemAssetsTheme();
}

class ImpaktfullUiSimpleListItemColorTheme {
  final Color background;

  const ImpaktfullUiSimpleListItemColorTheme({
    required this.background,
  });
}

class ImpaktfullUiSimpleListItemDimensTheme {
  final EdgeInsetsGeometry padding;
  final BorderRadiusGeometry borderRadius;
  final CrossAxisAlignment crossAxisAlignment;
  final double spacing;

  const ImpaktfullUiSimpleListItemDimensTheme({
    required this.padding,
    required this.borderRadius,
    required this.crossAxisAlignment,
    required this.spacing,
  });
}

class ImpaktfullUiSimpleListItemTextStyleTheme {
  final TextStyle title;
  final TextStyle titleDanger;
  final TextStyle subtitle;
  final TextStyle subtitleDanger;

  const ImpaktfullUiSimpleListItemTextStyleTheme({
    required this.title,
    required this.titleDanger,
    required this.subtitle,
    required this.subtitleDanger,
  });
}

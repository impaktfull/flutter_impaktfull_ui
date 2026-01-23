import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiListViewTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiListViewTextStylesTheme textStyles;
  final ImpaktfullUiListViewDimensTheme dimens;

  const ImpaktfullUiListViewTheme({
    required this.dimens,
    required this.textStyles,
  });

  static ImpaktfullUiListViewTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.listView;

  static ImpaktfullUiListViewTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiListViewTheme(
        dimens: ImpaktfullUiListViewDimensTheme(
          borderRadius: dimens.borderRadius,
          padding: const EdgeInsets.all(16),
        ),
        textStyles: ImpaktfullUiListViewTextStylesTheme(
          title: textStyles.onCanvas.display.small,
        ),
      );
}

class ImpaktfullUiListViewTextStylesTheme {
  final TextStyle title;

  const ImpaktfullUiListViewTextStylesTheme({
    required this.title,
  });
}

class ImpaktfullUiListViewDimensTheme {
  final BorderRadiusGeometry borderRadius;
  final EdgeInsets padding;

  const ImpaktfullUiListViewDimensTheme({
    required this.borderRadius,
    required this.padding,
  });
}

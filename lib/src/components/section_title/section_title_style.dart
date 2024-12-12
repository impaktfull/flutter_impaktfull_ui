import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';
import 'package:impaktfull_ui/src/util/extension/text_style_extension.dart';

class ImpaktfullUiSectionTitleTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiSectionTitleAssetsTheme assets;
  final ImpaktfullUiSectionTitleColorTheme colors;
  final ImpaktfullUiSectionTitleDimensTheme dimens;
  final ImpaktfullUiSectionTitleTextStyleTheme textStyles;

  const ImpaktfullUiSectionTitleTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  static ImpaktfullUiSectionTitleTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.sectionTitle;

  static ImpaktfullUiSectionTitleTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiSectionTitleTheme(
        assets: const ImpaktfullUiSectionTitleAssetsTheme(),
        colors: ImpaktfullUiSectionTitleColorTheme(
          icons: colors.text,
        ),
        dimens: const ImpaktfullUiSectionTitleDimensTheme(
          margin: EdgeInsetsDirectional.only(
            start: 16,
            end: 16,
            top: 16,
          ),
          marginWithIconButtonActions: EdgeInsetsDirectional.only(
            start: 16,
            end: 4,
          ),
        ),
        textStyles: ImpaktfullUiSectionTitleTextStyleTheme(
          title: textStyles.onCard.text.small.medium,
        ),
      );
}

class ImpaktfullUiSectionTitleAssetsTheme {
  const ImpaktfullUiSectionTitleAssetsTheme();
}

class ImpaktfullUiSectionTitleColorTheme {
  final Color icons;
  const ImpaktfullUiSectionTitleColorTheme({
    required this.icons,
  });
}

class ImpaktfullUiSectionTitleDimensTheme {
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry marginWithIconButtonActions;
  const ImpaktfullUiSectionTitleDimensTheme({
    required this.margin,
    required this.marginWithIconButtonActions,
  });
}

class ImpaktfullUiSectionTitleTextStyleTheme {
  final TextStyle title;
  const ImpaktfullUiSectionTitleTextStyleTheme({
    required this.title,
  });
}

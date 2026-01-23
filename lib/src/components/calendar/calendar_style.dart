import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';
import 'package:impaktfull_ui/src/util/extension/text_style_extension.dart';

class ImpaktfullUiCalendarTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiCalendarAssetsTheme assets;
  final ImpaktfullUiCalendarColorTheme colors;
  final ImpaktfullUiCalendarDimensTheme dimens;
  final ImpaktfullUiCalendarTextStyleTheme textStyles;

  const ImpaktfullUiCalendarTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  static ImpaktfullUiCalendarTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.calendar;

  static ImpaktfullUiCalendarTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiCalendarTheme(
        assets: ImpaktfullUiCalendarAssetsTheme(
          chevronLeft: assets.icons.chevronLeft,
          chevronRight: assets.icons.chevronRight,
        ),
        colors: ImpaktfullUiCalendarColorTheme(
          divider: colors.border,
          headerBackground: colors.card,
          eventBackground: colors.card,
        ),
        dimens: const ImpaktfullUiCalendarDimensTheme(
          dividerHeight: 1,
          sectionTitleWidth: 60,
          weekHourHeight: 75,
          weekEventMinHeightSmall: 40,
          weekEventMinHeightExtraSmall: 25,
        ),
        textStyles: ImpaktfullUiCalendarTextStyleTheme(
          sectionTitle: textStyles.onCanvas.text.small.semiBold,
          sectionSubtitle: textStyles.onCanvasTertiary.text.extraSmall.light,
          listItemTitle: textStyles.onCard.text.small,
          listItemTitleSmall: textStyles.onCard.text.extraSmall,
          listItemSubtitle: textStyles.onCanvasTertiary.text.small.light,
          listItemSubtitleSmall:
              textStyles.onCanvasTertiary.text.extraSmall.light,
          dayTitle: textStyles.onCanvas.text.extraSmall.semiBold,
          dayOfTheWeekTitle: textStyles.onCanvas.text.extraSmall,
        ),
      );
}

class ImpaktfullUiCalendarAssetsTheme {
  final ImpaktfullUiAsset chevronLeft;
  final ImpaktfullUiAsset chevronRight;

  const ImpaktfullUiCalendarAssetsTheme({
    required this.chevronLeft,
    required this.chevronRight,
  });
}

class ImpaktfullUiCalendarColorTheme {
  final Color divider;
  final Color eventBackground;
  final Color headerBackground;

  const ImpaktfullUiCalendarColorTheme({
    required this.divider,
    required this.eventBackground,
    required this.headerBackground,
  });
}

class ImpaktfullUiCalendarDimensTheme {
  final double dividerHeight;
  final double sectionTitleWidth;
  final double weekHourHeight;
  final double weekEventMinHeightSmall;
  final double weekEventMinHeightExtraSmall;

  const ImpaktfullUiCalendarDimensTheme({
    required this.dividerHeight,
    required this.sectionTitleWidth,
    required this.weekHourHeight,
    required this.weekEventMinHeightSmall,
    required this.weekEventMinHeightExtraSmall,
  });
}

class ImpaktfullUiCalendarTextStyleTheme {
  final TextStyle sectionTitle;
  final TextStyle sectionSubtitle;
  final TextStyle listItemTitle;
  final TextStyle listItemTitleSmall;
  final TextStyle listItemSubtitle;
  final TextStyle listItemSubtitleSmall;
  final TextStyle dayTitle;
  final TextStyle dayOfTheWeekTitle;

  const ImpaktfullUiCalendarTextStyleTheme({
    required this.sectionTitle,
    required this.sectionSubtitle,
    required this.listItemTitle,
    required this.listItemTitleSmall,
    required this.listItemSubtitle,
    required this.listItemSubtitleSmall,
    required this.dayTitle,
    required this.dayOfTheWeekTitle,
  });
}

import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/theme/theme.dart';

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

  static ImpaktfullUiCalendarTheme of(BuildContext context) => ImpaktfullUiTheme.of(context).components.calendar;
}

class ImpaktfullUiCalendarAssetsTheme {
  const ImpaktfullUiCalendarAssetsTheme();
}

class ImpaktfullUiCalendarColorTheme {
  final Color divider;
  final Color eventBackground;

  const ImpaktfullUiCalendarColorTheme({
    required this.divider,
    required this.eventBackground,
  });
}

class ImpaktfullUiCalendarDimensTheme {
  final double dividerHeight;
  final double sectionTitleWidth;
  final double weekHourHeight;

  const ImpaktfullUiCalendarDimensTheme({
    required this.dividerHeight,
    required this.sectionTitleWidth,
    required this.weekHourHeight,
  });
}

class ImpaktfullUiCalendarTextStyleTheme {
  final TextStyle sectionTitle;
  final TextStyle sectionSubtitle;
  final TextStyle listItemTitle;
  final TextStyle listItemTitleSmall;
  final TextStyle listItemSubtitle;
  final TextStyle listItemSubtitleSmall;

  const ImpaktfullUiCalendarTextStyleTheme({
    required this.sectionTitle,
    required this.sectionSubtitle,
    required this.listItemTitle,
    required this.listItemTitleSmall,
    required this.listItemSubtitle,
    required this.listItemSubtitleSmall,
  });
}

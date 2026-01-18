import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';
import 'package:impaktfull_ui/src/util/extension/border_radius_geometry_extension.dart';

class ImpaktfullUiTableHeaderTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiTableHeaderColorTheme colors;
  final ImpaktfullUiTableHeaderDimensTheme dimens;

  const ImpaktfullUiTableHeaderTheme({
    required this.colors,
    required this.dimens,
  });

  static ImpaktfullUiTableHeaderTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.tableHeader;

  static ImpaktfullUiTableHeaderTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiTableHeaderTheme(
        colors: ImpaktfullUiTableHeaderColorTheme(
          background: colors.card2,
        ),
        dimens: ImpaktfullUiTableHeaderDimensTheme(
          borderRadius: dimens.borderRadius.copyWith(
            bottomStart: Radius.zero,
            bottomEnd: Radius.zero,
          ),
        ),
      );
}

class ImpaktfullUiTableHeaderColorTheme {
  final Color background;

  const ImpaktfullUiTableHeaderColorTheme({
    required this.background,
  });
}

class ImpaktfullUiTableHeaderDimensTheme {
  final BorderRadiusGeometry borderRadius;
  const ImpaktfullUiTableHeaderDimensTheme({
    required this.borderRadius,
  });
}

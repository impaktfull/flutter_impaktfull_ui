import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiSkeletonTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiSkeletonAssetsTheme assets;
  final ImpaktfullUiSkeletonColorTheme colors;
  final ImpaktfullUiSkeletonDimensTheme dimens;
  final ImpaktfullUiSkeletonTextStyleTheme textStyles;

  const ImpaktfullUiSkeletonTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  static ImpaktfullUiSkeletonTheme of(BuildContext context) => ImpaktfullUiTheme.of(context).components.skeleton;
}

class ImpaktfullUiSkeletonAssetsTheme {
  const ImpaktfullUiSkeletonAssetsTheme();
}

class ImpaktfullUiSkeletonColorTheme {
  final Color background;
  const ImpaktfullUiSkeletonColorTheme({
    required this.background,
  });
}

class ImpaktfullUiSkeletonDimensTheme {
  final BorderRadiusGeometry borderRadius;
  const ImpaktfullUiSkeletonDimensTheme({
    required this.borderRadius,
  });
}

class ImpaktfullUiSkeletonTextStyleTheme {
  const ImpaktfullUiSkeletonTextStyleTheme();
}

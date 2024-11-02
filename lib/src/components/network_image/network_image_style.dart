import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/theme/theme.dart';

class ImpaktfullUiNetworkImageTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiNetworkImageAssetsTheme assets;
  final ImpaktfullUiNetworkImageColorTheme colors;
  final ImpaktfullUiNetworkImageDimensTheme dimens;
  final ImpaktfullUiNetworkImageTextStyleTheme textStyles;

  const ImpaktfullUiNetworkImageTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  static ImpaktfullUiNetworkImageTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.networkImage;
}

class ImpaktfullUiNetworkImageAssetsTheme {
  const ImpaktfullUiNetworkImageAssetsTheme();
}

class ImpaktfullUiNetworkImageColorTheme {
  const ImpaktfullUiNetworkImageColorTheme();
}

class ImpaktfullUiNetworkImageDimensTheme {
  const ImpaktfullUiNetworkImageDimensTheme();
}

class ImpaktfullUiNetworkImageTextStyleTheme {
  const ImpaktfullUiNetworkImageTextStyleTheme();
}

import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/models/asset.dart';
import 'package:impaktfull_ui_2/src/theme/theme.dart';

class ImpaktfullUiBottomSheetTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiBottomSheetAssetsTheme assets;
  final ImpaktfullUiBottomSheetColorTheme colors;
  final ImpaktfullUiBottomSheetDimensTheme dimens;
  final ImpaktfullUiBottomSheetTextStyleTheme textStyles;

  const ImpaktfullUiBottomSheetTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  static ImpaktfullUiBottomSheetTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.bottomSheet;
}

class ImpaktfullUiBottomSheetAssetsTheme {
  final ImpaktfullUiAsset close;

  const ImpaktfullUiBottomSheetAssetsTheme({
    required this.close,
  });
}

class ImpaktfullUiBottomSheetColorTheme {
  final Color background;
  final Color handle;
  final Color icon;

  const ImpaktfullUiBottomSheetColorTheme({
    required this.background,
    required this.handle,
    required this.icon,
  });
}

class ImpaktfullUiBottomSheetDimensTheme {
  final EdgeInsetsDirectional closeIconButtonPadding;
  final EdgeInsetsDirectional padding;
  final BorderRadius borderRadius;
  final BorderRadius handleBorderRadius;

  const ImpaktfullUiBottomSheetDimensTheme({
    required this.closeIconButtonPadding,
    required this.padding,
    required this.borderRadius,
    required this.handleBorderRadius,
  });
}

class ImpaktfullUiBottomSheetTextStyleTheme {
  final TextStyle title;
  final TextStyle subtitle;

  const ImpaktfullUiBottomSheetTextStyleTheme({
    required this.title,
    required this.subtitle,
  });
}

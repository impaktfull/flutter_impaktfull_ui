import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiFilePickerTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiFilePickerAssetsTheme assets;
  final ImpaktfullUiFilePickerColorTheme colors;
  final ImpaktfullUiFilePickerDimensTheme dimens;
  final ImpaktfullUiFilePickerTextStyleTheme textStyles;

  const ImpaktfullUiFilePickerTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  static ImpaktfullUiFilePickerTheme of(BuildContext context) => ImpaktfullUiTheme.of(context).components.filePicker;
}

class ImpaktfullUiFilePickerAssetsTheme {
  final ImpaktfullUiAsset delete;
  final ImpaktfullUiAsset file;
  final ImpaktfullUiAsset upload;
  const ImpaktfullUiFilePickerAssetsTheme({
    required this.delete,
    required this.file,
    required this.upload,
  });
}

class ImpaktfullUiFilePickerColorTheme {
  final Color background;
  final Color icons;
  final Color progressIndicator;
  final Color border;
  final Color borderDrop;
  final Color borderError;

  const ImpaktfullUiFilePickerColorTheme({
    required this.background,
    required this.icons,
    required this.progressIndicator,
    required this.border,
    required this.borderDrop,
    required this.borderError,
  });
}

class ImpaktfullUiFilePickerDimensTheme {
  final BorderRadiusGeometry borderRadius;
  const ImpaktfullUiFilePickerDimensTheme({
    required this.borderRadius,
  });
}

class ImpaktfullUiFilePickerTextStyleTheme {
  final TextStyle title;
  final TextStyle subtitle;

  const ImpaktfullUiFilePickerTextStyleTheme({
    required this.title,
    required this.subtitle,
  });
}

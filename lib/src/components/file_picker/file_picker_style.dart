import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';
import 'package:impaktfull_ui/src/util/extension/text_style_extension.dart';

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

  static ImpaktfullUiFilePickerTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.filePicker;

  static ImpaktfullUiFilePickerTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiFilePickerTheme(
        assets: ImpaktfullUiFilePickerAssetsTheme(
          delete: assets.icons.delete,
          file: assets.icons.file,
          upload: assets.icons.cloudUpload,
        ),
        colors: ImpaktfullUiFilePickerColorTheme(
          background: colors.card,
          icons: colors.text,
          progressIndicator: colors.accent,
          border: colors.border,
          borderDrop: colors.accent,
          borderError: colors.error,
        ),
        dimens: ImpaktfullUiFilePickerDimensTheme(
          borderRadius: dimens.borderRadius,
        ),
        textStyles: ImpaktfullUiFilePickerTextStyleTheme(
          title: textStyles.onCard.text.medium,
          subtitle: textStyles.onCard.text.small.light.withOpacity(0.66),
        ),
      );
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

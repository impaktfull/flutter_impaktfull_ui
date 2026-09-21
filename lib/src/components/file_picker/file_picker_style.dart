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

  ImpaktfullUiFilePickerTheme copyWith({
    ImpaktfullUiFilePickerAssetsTheme? assets,
    ImpaktfullUiFilePickerColorTheme? colors,
    ImpaktfullUiFilePickerDimensTheme? dimens,
    ImpaktfullUiFilePickerTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiFilePickerTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        textStyles: textStyles ?? this.textStyles,
      );

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

  ImpaktfullUiFilePickerAssetsTheme copyWith({
    ImpaktfullUiAsset? delete,
    ImpaktfullUiAsset? file,
    ImpaktfullUiAsset? upload,
  }) =>
      ImpaktfullUiFilePickerAssetsTheme(
        delete: delete ?? this.delete,
        file: file ?? this.file,
        upload: upload ?? this.upload,
      );
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

  ImpaktfullUiFilePickerColorTheme copyWith({
    Color? background,
    Color? border,
    Color? borderDrop,
    Color? borderError,
    Color? icons,
    Color? progressIndicator,
  }) =>
      ImpaktfullUiFilePickerColorTheme(
        background: background ?? this.background,
        border: border ?? this.border,
        borderDrop: borderDrop ?? this.borderDrop,
        borderError: borderError ?? this.borderError,
        icons: icons ?? this.icons,
        progressIndicator: progressIndicator ?? this.progressIndicator,
      );
}

class ImpaktfullUiFilePickerDimensTheme {
  final BorderRadiusGeometry borderRadius;
  const ImpaktfullUiFilePickerDimensTheme({
    required this.borderRadius,
  });

  ImpaktfullUiFilePickerDimensTheme copyWith({
    BorderRadiusGeometry? borderRadius,
  }) =>
      ImpaktfullUiFilePickerDimensTheme(
        borderRadius: borderRadius ?? this.borderRadius,
      );
}

class ImpaktfullUiFilePickerTextStyleTheme {
  final TextStyle title;
  final TextStyle subtitle;

  const ImpaktfullUiFilePickerTextStyleTheme({
    required this.title,
    required this.subtitle,
  });

  ImpaktfullUiFilePickerTextStyleTheme copyWith({
    TextStyle? subtitle,
    TextStyle? title,
  }) =>
      ImpaktfullUiFilePickerTextStyleTheme(
        subtitle: subtitle ?? this.subtitle,
        title: title ?? this.title,
      );
}

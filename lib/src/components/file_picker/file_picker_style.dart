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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiFilePickerTheme &&
          assets == other.assets &&
          colors == other.colors &&
          dimens == other.dimens &&
          textStyles == other.textStyles;

  @override
  int get hashCode => Object.hash(assets, colors, dimens, textStyles);
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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiFilePickerAssetsTheme &&
          delete == other.delete &&
          file == other.file &&
          upload == other.upload;

  @override
  int get hashCode => Object.hash(delete, file, upload);
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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiFilePickerColorTheme &&
          background == other.background &&
          icons == other.icons &&
          progressIndicator == other.progressIndicator &&
          border == other.border &&
          borderDrop == other.borderDrop &&
          borderError == other.borderError;

  @override
  int get hashCode => Object.hash(
      background, icons, progressIndicator, border, borderDrop, borderError);
}

class ImpaktfullUiFilePickerDimensTheme {
  final BorderRadiusGeometry borderRadius;

  /// The padding between the border of the file picker and its content.
  final EdgeInsetsGeometry padding;

  /// The space between the parts of a file.
  final double spacing;

  /// The space between the name of a file and its size.
  final double contentSpacing;

  /// The space between a file and the button that removes it.
  final double actionSpacing;

  /// The padding around one file in the list.
  final EdgeInsetsGeometry itemPadding;

  const ImpaktfullUiFilePickerDimensTheme({
    required this.borderRadius,
    this.padding = const EdgeInsets.all(16),
    this.spacing = 12,
    this.contentSpacing = 8,
    this.actionSpacing = 32,
    this.itemPadding = const EdgeInsets.all(4),
  });

  ImpaktfullUiFilePickerDimensTheme copyWith({
    double? actionSpacing,
    BorderRadiusGeometry? borderRadius,
    double? contentSpacing,
    EdgeInsetsGeometry? itemPadding,
    EdgeInsetsGeometry? padding,
    double? spacing,
  }) =>
      ImpaktfullUiFilePickerDimensTheme(
        actionSpacing: actionSpacing ?? this.actionSpacing,
        borderRadius: borderRadius ?? this.borderRadius,
        contentSpacing: contentSpacing ?? this.contentSpacing,
        itemPadding: itemPadding ?? this.itemPadding,
        padding: padding ?? this.padding,
        spacing: spacing ?? this.spacing,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiFilePickerDimensTheme &&
          borderRadius == other.borderRadius &&
          padding == other.padding &&
          spacing == other.spacing &&
          contentSpacing == other.contentSpacing &&
          actionSpacing == other.actionSpacing &&
          itemPadding == other.itemPadding;

  @override
  int get hashCode => Object.hash(borderRadius, padding, spacing,
      contentSpacing, actionSpacing, itemPadding);
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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiFilePickerTextStyleTheme &&
          title == other.title &&
          subtitle == other.subtitle;

  @override
  int get hashCode => Object.hash(title, subtitle);
}

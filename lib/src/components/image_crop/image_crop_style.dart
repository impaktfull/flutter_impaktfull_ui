import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiImageCropTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiImageCropAssetsTheme assets;
  final ImpaktfullUiImageCropColorTheme colors;
  final ImpaktfullUiImageCropDimensTheme dimens;
  final ImpaktfullUiImageCropDurationsTheme durations;
  final ImpaktfullUiImageCropTextStyleTheme textStyles;

  const ImpaktfullUiImageCropTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    this.durations = const ImpaktfullUiImageCropDurationsTheme(),
    required this.textStyles,
  });

  ImpaktfullUiImageCropTheme copyWith({
    ImpaktfullUiImageCropAssetsTheme? assets,
    ImpaktfullUiImageCropColorTheme? colors,
    ImpaktfullUiImageCropDimensTheme? dimens,
    ImpaktfullUiImageCropDurationsTheme? durations,
    ImpaktfullUiImageCropTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiImageCropTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        durations: durations ?? this.durations,
        textStyles: textStyles ?? this.textStyles,
      );

  static ImpaktfullUiImageCropTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.imageCrop;

  static ImpaktfullUiImageCropTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiImageCropTheme(
        assets: ImpaktfullUiImageCropAssetsTheme(
          delete: assets.icons.delete,
        ),
        colors: ImpaktfullUiImageCropColorTheme(
          deleteIcon: colors.card,
        ),
        dimens: const ImpaktfullUiImageCropDimensTheme(),
        durations: const ImpaktfullUiImageCropDurationsTheme(),
        textStyles: const ImpaktfullUiImageCropTextStyleTheme(),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiImageCropTheme &&
          assets == other.assets &&
          colors == other.colors &&
          dimens == other.dimens &&
          durations == other.durations &&
          textStyles == other.textStyles;

  @override
  int get hashCode =>
      Object.hash(assets, colors, dimens, durations, textStyles);
}

class ImpaktfullUiImageCropAssetsTheme {
  final ImpaktfullUiAsset delete;
  const ImpaktfullUiImageCropAssetsTheme({
    required this.delete,
  });

  ImpaktfullUiImageCropAssetsTheme copyWith({
    ImpaktfullUiAsset? delete,
  }) =>
      ImpaktfullUiImageCropAssetsTheme(
        delete: delete ?? this.delete,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiImageCropAssetsTheme && delete == other.delete;

  @override
  int get hashCode => delete.hashCode;
}

class ImpaktfullUiImageCropColorTheme {
  final Color deleteIcon;
  const ImpaktfullUiImageCropColorTheme({
    required this.deleteIcon,
  });

  ImpaktfullUiImageCropColorTheme copyWith({
    Color? deleteIcon,
  }) =>
      ImpaktfullUiImageCropColorTheme(
        deleteIcon: deleteIcon ?? this.deleteIcon,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiImageCropColorTheme &&
          deleteIcon == other.deleteIcon;

  @override
  int get hashCode => deleteIcon.hashCode;
}

class ImpaktfullUiImageCropDimensTheme {
  /// The space between the parts of the cropper.
  final double spacing;

  /// The space between the preview and what follows it.
  final double previewSpacing;

  /// The padding around the actions.
  final EdgeInsetsGeometry actionPadding;

  const ImpaktfullUiImageCropDimensTheme({
    this.spacing = 8,
    this.previewSpacing = 16,
    this.actionPadding = const EdgeInsets.all(8),
  });

  ImpaktfullUiImageCropDimensTheme copyWith({
    EdgeInsetsGeometry? actionPadding,
    double? previewSpacing,
    double? spacing,
  }) =>
      ImpaktfullUiImageCropDimensTheme(
        actionPadding: actionPadding ?? this.actionPadding,
        previewSpacing: previewSpacing ?? this.previewSpacing,
        spacing: spacing ?? this.spacing,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiImageCropDimensTheme &&
          spacing == other.spacing &&
          previewSpacing == other.previewSpacing &&
          actionPadding == other.actionPadding;

  @override
  int get hashCode => Object.hash(
        spacing,
        previewSpacing,
        actionPadding,
      );
}

class ImpaktfullUiImageCropDurationsTheme {
  /// How long the preview waits after a change before it crops again.
  final Duration cropDebounce;

  const ImpaktfullUiImageCropDurationsTheme({
    this.cropDebounce = const Duration(milliseconds: 300),
  });

  ImpaktfullUiImageCropDurationsTheme copyWith({
    Duration? cropDebounce,
  }) =>
      ImpaktfullUiImageCropDurationsTheme(
        cropDebounce: cropDebounce ?? this.cropDebounce,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiImageCropDurationsTheme &&
          cropDebounce == other.cropDebounce;

  @override
  int get hashCode => cropDebounce.hashCode;
}

class ImpaktfullUiImageCropTextStyleTheme {
  const ImpaktfullUiImageCropTextStyleTheme();

  ImpaktfullUiImageCropTextStyleTheme copyWith() =>
      const ImpaktfullUiImageCropTextStyleTheme();

  @override
  bool operator ==(Object other) =>
      other is ImpaktfullUiImageCropTextStyleTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}

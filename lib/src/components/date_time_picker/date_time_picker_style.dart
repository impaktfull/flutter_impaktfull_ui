import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiDateTimePickerTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiDateTimePickerAssetsTheme assets;
  final ImpaktfullUiDateTimePickerColorTheme colors;
  final ImpaktfullUiDateTimePickerDimensTheme dimens;
  final ImpaktfullUiDateTimePickerTextStyleTheme textStyles;

  const ImpaktfullUiDateTimePickerTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  ImpaktfullUiDateTimePickerTheme copyWith({
    ImpaktfullUiDateTimePickerAssetsTheme? assets,
    ImpaktfullUiDateTimePickerColorTheme? colors,
    ImpaktfullUiDateTimePickerDimensTheme? dimens,
    ImpaktfullUiDateTimePickerTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiDateTimePickerTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        textStyles: textStyles ?? this.textStyles,
      );

  static ImpaktfullUiDateTimePickerTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.dateTimePicker;

  static ImpaktfullUiDateTimePickerTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      const ImpaktfullUiDateTimePickerTheme(
        assets: ImpaktfullUiDateTimePickerAssetsTheme(),
        colors: ImpaktfullUiDateTimePickerColorTheme(),
        dimens: ImpaktfullUiDateTimePickerDimensTheme(),
        textStyles: ImpaktfullUiDateTimePickerTextStyleTheme(),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiDateTimePickerTheme &&
          assets == other.assets &&
          colors == other.colors &&
          dimens == other.dimens &&
          textStyles == other.textStyles;

  @override
  int get hashCode => Object.hash(assets, colors, dimens, textStyles);
}

class ImpaktfullUiDateTimePickerAssetsTheme {
  const ImpaktfullUiDateTimePickerAssetsTheme();

  ImpaktfullUiDateTimePickerAssetsTheme copyWith() =>
      const ImpaktfullUiDateTimePickerAssetsTheme();

  @override
  bool operator ==(Object other) =>
      other is ImpaktfullUiDateTimePickerAssetsTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}

class ImpaktfullUiDateTimePickerColorTheme {
  const ImpaktfullUiDateTimePickerColorTheme();

  ImpaktfullUiDateTimePickerColorTheme copyWith() =>
      const ImpaktfullUiDateTimePickerColorTheme();

  @override
  bool operator ==(Object other) =>
      other is ImpaktfullUiDateTimePickerColorTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}

class ImpaktfullUiDateTimePickerDimensTheme {
  /// The width of the picker.
  final double width;

  /// The width of the content, inside the margin.
  final double contentWidth;

  /// The space between the date picker and the time picker.
  final double spacing;

  const ImpaktfullUiDateTimePickerDimensTheme({
    this.width = 310,
    this.contentWidth = 280,
    this.spacing = 8,
  });

  ImpaktfullUiDateTimePickerDimensTheme copyWith({
    double? contentWidth,
    double? spacing,
    double? width,
  }) =>
      ImpaktfullUiDateTimePickerDimensTheme(
        contentWidth: contentWidth ?? this.contentWidth,
        spacing: spacing ?? this.spacing,
        width: width ?? this.width,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiDateTimePickerDimensTheme &&
          width == other.width &&
          contentWidth == other.contentWidth &&
          spacing == other.spacing;

  @override
  int get hashCode => Object.hash(width, contentWidth, spacing);
}

class ImpaktfullUiDateTimePickerTextStyleTheme {
  const ImpaktfullUiDateTimePickerTextStyleTheme();

  ImpaktfullUiDateTimePickerTextStyleTheme copyWith() =>
      const ImpaktfullUiDateTimePickerTextStyleTheme();

  @override
  bool operator ==(Object other) =>
      other is ImpaktfullUiDateTimePickerTextStyleTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}

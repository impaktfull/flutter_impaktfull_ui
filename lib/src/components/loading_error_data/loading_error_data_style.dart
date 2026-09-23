import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';
import 'package:impaktfull_ui/src/util/extension/text_style_extension.dart';

class ImpaktfullUiLoadingErrorDataTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiLoadingErrorDataAssetsTheme assets;
  final ImpaktfullUiLoadingErrorDataColorTheme colors;
  final ImpaktfullUiLoadingErrorDataDimensTheme dimens;
  final ImpaktfullUiLoadingErrorDataTextStyleTheme textStyles;

  const ImpaktfullUiLoadingErrorDataTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  ImpaktfullUiLoadingErrorDataTheme copyWith({
    ImpaktfullUiLoadingErrorDataAssetsTheme? assets,
    ImpaktfullUiLoadingErrorDataColorTheme? colors,
    ImpaktfullUiLoadingErrorDataDimensTheme? dimens,
    ImpaktfullUiLoadingErrorDataTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiLoadingErrorDataTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        textStyles: textStyles ?? this.textStyles,
      );

  static ImpaktfullUiLoadingErrorDataTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.loadingErrorData;

  static ImpaktfullUiLoadingErrorDataTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) {
    return ImpaktfullUiLoadingErrorDataTheme(
      assets: const ImpaktfullUiLoadingErrorDataAssetsTheme(),
      colors: const ImpaktfullUiLoadingErrorDataColorTheme(),
      dimens: const ImpaktfullUiLoadingErrorDataDimensTheme(),
      textStyles: ImpaktfullUiLoadingErrorDataTextStyleTheme(
        noDataTitle: textStyles.onCanvas.display.small.semiBold,
        noDataMessage: textStyles.onCanvas.text.small.light,
        errorTitle: textStyles.onCanvas.display.small.semiBold,
        errorMessage: textStyles.onCanvas.text.small.light,
      ),
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiLoadingErrorDataTheme &&
          assets == other.assets &&
          colors == other.colors &&
          dimens == other.dimens &&
          textStyles == other.textStyles;

  @override
  int get hashCode => Object.hash(assets, colors, dimens, textStyles);
}

class ImpaktfullUiLoadingErrorDataAssetsTheme {
  const ImpaktfullUiLoadingErrorDataAssetsTheme();

  ImpaktfullUiLoadingErrorDataAssetsTheme copyWith() =>
      const ImpaktfullUiLoadingErrorDataAssetsTheme();

  @override
  bool operator ==(Object other) =>
      other is ImpaktfullUiLoadingErrorDataAssetsTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}

class ImpaktfullUiLoadingErrorDataColorTheme {
  const ImpaktfullUiLoadingErrorDataColorTheme();

  ImpaktfullUiLoadingErrorDataColorTheme copyWith() =>
      const ImpaktfullUiLoadingErrorDataColorTheme();

  @override
  bool operator ==(Object other) =>
      other is ImpaktfullUiLoadingErrorDataColorTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}

class ImpaktfullUiLoadingErrorDataDimensTheme {
  const ImpaktfullUiLoadingErrorDataDimensTheme();

  ImpaktfullUiLoadingErrorDataDimensTheme copyWith() =>
      const ImpaktfullUiLoadingErrorDataDimensTheme();

  @override
  bool operator ==(Object other) =>
      other is ImpaktfullUiLoadingErrorDataDimensTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}

class ImpaktfullUiLoadingErrorDataTextStyleTheme {
  final TextStyle noDataTitle;
  final TextStyle noDataMessage;
  final TextStyle errorTitle;
  final TextStyle errorMessage;
  const ImpaktfullUiLoadingErrorDataTextStyleTheme({
    required this.noDataTitle,
    required this.noDataMessage,
    required this.errorTitle,
    required this.errorMessage,
  });

  ImpaktfullUiLoadingErrorDataTextStyleTheme copyWith({
    TextStyle? errorMessage,
    TextStyle? errorTitle,
    TextStyle? noDataMessage,
    TextStyle? noDataTitle,
  }) =>
      ImpaktfullUiLoadingErrorDataTextStyleTheme(
        errorMessage: errorMessage ?? this.errorMessage,
        errorTitle: errorTitle ?? this.errorTitle,
        noDataMessage: noDataMessage ?? this.noDataMessage,
        noDataTitle: noDataTitle ?? this.noDataTitle,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiLoadingErrorDataTextStyleTheme &&
          noDataTitle == other.noDataTitle &&
          noDataMessage == other.noDataMessage &&
          errorTitle == other.errorTitle &&
          errorMessage == other.errorMessage;

  @override
  int get hashCode =>
      Object.hash(noDataTitle, noDataMessage, errorTitle, errorMessage);
}

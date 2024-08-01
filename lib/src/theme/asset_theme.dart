import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ImpaktfullUiAssetTheme {
  final ImpaktfullUiIconTheme icons;
  final ImpaktfullUiImageTheme images;
  final ImpaktfullUiLottieTheme lotties;

  const ImpaktfullUiAssetTheme({
    required this.icons,
    required this.images,
    required this.lotties,
  });

  ImpaktfullUiAssetTheme copyWith({
    ImpaktfullUiIconTheme? icons,
    ImpaktfullUiImageTheme? images,
    ImpaktfullUiLottieTheme? lotties,
  }) =>
      ImpaktfullUiAssetTheme(
        icons: icons ?? this.icons,
        images: images ?? this.images,
        lotties: lotties ?? this.lotties,
      );

  static ImpaktfullUiAssetTheme getDefault({
    String? package = 'impaktfull_ui_2',
    ImpaktfullUiIconTheme? icons,
    ImpaktfullUiImageTheme? images,
    ImpaktfullUiLottieTheme? lotties,
  }) =>
      ImpaktfullUiAssetTheme(
        icons: icons ??
            ImpaktfullUiIconTheme(
              check: PhosphorIcons.check(),
              arrowBack: PhosphorIcons.arrowLeft(),
              close: PhosphorIcons.x(),
            ),
        images: images ??
            ImpaktfullUiImageTheme(
              logo: getImageAssetForPackage(
                package: package,
                assetFileName: 'logo.svg',
              ),
              splashLogo: getImageAssetForPackage(
                package: package,
                assetFileName: 'splash_logo.svg',
              ),
            ),
        lotties: lotties ??
            ImpaktfullUiLottieTheme(
              loading: getLottieAssetForPackage(
                package: package,
                assetFileName: 'loading.json',
              ),
            ),
      );

  static String getAssetForPackage({
    required String assetFileName,
    String? directory,
    String? package,
  }) {
    var fullAssetPath = directory ?? '';
    if (fullAssetPath.isNotEmpty) {
      fullAssetPath += "/";
    }
    fullAssetPath += assetFileName;
    fullAssetPath = 'assets/$fullAssetPath';

    if (package == null) {
      return fullAssetPath;
    }
    return 'packages/$package/$fullAssetPath';
  }

  static String getImageAssetForPackage({
    required String assetFileName,
    String? package,
  }) =>
      getAssetForPackage(assetFileName: assetFileName, package: package, directory: 'images');

  static String getLottieAssetForPackage({
    required String assetFileName,
    String? package,
  }) =>
      getAssetForPackage(assetFileName: assetFileName, package: package, directory: 'lottie');
}

class ImpaktfullUiIconTheme {
  final IconData arrowBack;
  final IconData check;
  final IconData close;

  const ImpaktfullUiIconTheme({
    required this.arrowBack,
    required this.check,
    required this.close,
  });

  ImpaktfullUiIconTheme copyWith({
    IconData? arrowBack,
    IconData? check,
    IconData? close,
  }) =>
      ImpaktfullUiIconTheme(
        arrowBack: arrowBack ?? this.arrowBack,
        check: check ?? this.check,
        close: close ?? this.close,
      );
}

class ImpaktfullUiImageTheme {
  final String logo;
  final String splashLogo;

  const ImpaktfullUiImageTheme({
    required this.logo,
    required this.splashLogo,
  });

  ImpaktfullUiImageTheme copyWith({
    String? logo,
    String? splashLogo,
  }) =>
      ImpaktfullUiImageTheme(
        logo: logo ?? this.logo,
        splashLogo: splashLogo ?? this.splashLogo,
      );
}

class ImpaktfullUiLottieTheme {
  final String loading;

  const ImpaktfullUiLottieTheme({
    required this.loading,
  });

  ImpaktfullUiLottieTheme copyWith({
    String? loading,
  }) =>
      ImpaktfullUiLottieTheme(
        loading: loading ?? this.loading,
      );
}

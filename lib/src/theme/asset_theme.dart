import 'package:impaktfull_ui_2/src/models/asset_models.dart';
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
              check: ImpaktfullUiAsset.icon(PhosphorIcons.check()),
              arrowBack: ImpaktfullUiAsset.icon(PhosphorIcons.arrowLeft()),
              minus: ImpaktfullUiAsset.icon(PhosphorIcons.minus()),
              close: ImpaktfullUiAsset.icon(PhosphorIcons.x()),
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

  static String _getFullAssetDirectory({
    String? directory,
  }) {
    var fullAssetPath = directory ?? '';
    if (fullAssetPath.isNotEmpty) {
      fullAssetPath += "/";
    }
    return 'assets/$fullAssetPath';
  }

  static ImpaktfullUiAsset getImageAssetForPackage({
    required String assetFileName,
    String? package,
  }) {
    final directory = _getFullAssetDirectory(
      directory: 'images',
    );
    if (assetFileName.endsWith('.svg')) {
      return ImpaktfullUiAsset.svg(
        assetFileName,
        directory: directory,
        package: package,
      );
    }
    return ImpaktfullUiAsset.pixel(
      assetFileName,
      directory: directory,
      package: package,
    );
  }

  static ImpaktfullUiAsset getLottieAssetForPackage({
    required String assetFileName,
    String? package,
  }) {
    final directory = _getFullAssetDirectory(
      directory: 'lottie',
    );
    return ImpaktfullUiAsset.lottie(
      assetFileName,
      directory: directory,
      package: package,
    );
  }
}

class ImpaktfullUiIconTheme {
  final ImpaktfullUiAsset arrowBack;
  final ImpaktfullUiAsset check;
  final ImpaktfullUiAsset minus;
  final ImpaktfullUiAsset close;

  const ImpaktfullUiIconTheme({
    required this.arrowBack,
    required this.check,
    required this.minus,
    required this.close,
  });

  ImpaktfullUiIconTheme copyWith({
    ImpaktfullUiAsset? arrowBack,
    ImpaktfullUiAsset? check,
    ImpaktfullUiAsset? minus,
    ImpaktfullUiAsset? close,
  }) =>
      ImpaktfullUiIconTheme(
        arrowBack: arrowBack ?? this.arrowBack,
        check: check ?? this.check,
        minus: minus ?? this.minus,
        close: close ?? this.close,
      );
}

class ImpaktfullUiImageTheme {
  final ImpaktfullUiAsset logo;
  final ImpaktfullUiAsset splashLogo;

  const ImpaktfullUiImageTheme({
    required this.logo,
    required this.splashLogo,
  });

  ImpaktfullUiImageTheme copyWith({
    ImpaktfullUiAsset? logo,
    ImpaktfullUiAsset? splashLogo,
  }) =>
      ImpaktfullUiImageTheme(
        logo: logo ?? this.logo,
        splashLogo: splashLogo ?? this.splashLogo,
      );
}

class ImpaktfullUiLottieTheme {
  final ImpaktfullUiAsset loading;

  const ImpaktfullUiLottieTheme({
    required this.loading,
  });

  ImpaktfullUiLottieTheme copyWith({
    ImpaktfullUiAsset? loading,
  }) =>
      ImpaktfullUiLottieTheme(
        loading: loading ?? this.loading,
      );
}

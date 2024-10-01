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
              dropUp: ImpaktfullUiAsset.icon(PhosphorIcons.caretUp()),
              dropDown: ImpaktfullUiAsset.icon(PhosphorIcons.caretDown()),
              chevronRight: ImpaktfullUiAsset.icon(PhosphorIcons.caretRight()),
              success: ImpaktfullUiAsset.icon(PhosphorIcons.checkCircle()),
              error: ImpaktfullUiAsset.icon(PhosphorIcons.warningDiamond()),
              warning: ImpaktfullUiAsset.icon(PhosphorIcons.warning()),
              info: ImpaktfullUiAsset.icon(PhosphorIcons.info()),
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
  final ImpaktfullUiAsset dropUp;
  final ImpaktfullUiAsset dropDown;
  final ImpaktfullUiAsset chevronRight;
  final ImpaktfullUiAsset success;
  final ImpaktfullUiAsset error;
  final ImpaktfullUiAsset warning;
  final ImpaktfullUiAsset info;

  const ImpaktfullUiIconTheme({
    required this.arrowBack,
    required this.check,
    required this.minus,
    required this.close,
    required this.dropUp,
    required this.dropDown,
    required this.chevronRight,
    required this.success,
    required this.error,
    required this.warning,
    required this.info,
  });

  ImpaktfullUiIconTheme copyWith({
    ImpaktfullUiAsset? arrowBack,
    ImpaktfullUiAsset? check,
    ImpaktfullUiAsset? minus,
    ImpaktfullUiAsset? close,
    ImpaktfullUiAsset? dropUp,
    ImpaktfullUiAsset? dropDown,
    ImpaktfullUiAsset? chevronRight,
    ImpaktfullUiAsset? success,
    ImpaktfullUiAsset? error,
    ImpaktfullUiAsset? warning,
    ImpaktfullUiAsset? info,
  }) =>
      ImpaktfullUiIconTheme(
        arrowBack: arrowBack ?? this.arrowBack,
        check: check ?? this.check,
        minus: minus ?? this.minus,
        close: close ?? this.close,
        dropUp: dropUp ?? this.dropUp,
        dropDown: dropDown ?? this.dropDown,
        chevronRight: chevronRight ?? this.chevronRight,
        success: success ?? this.success,
        error: error ?? this.error,
        warning: warning ?? this.warning,
        info: info ?? this.info,
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

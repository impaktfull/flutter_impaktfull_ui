import 'package:impaktfull_ui_2/src/models/asset.dart';
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
              add: ImpaktfullUiAsset.icon(PhosphorIcons.plus()),
              arrowLeft: ImpaktfullUiAsset.icon(PhosphorIcons.arrowLeft()),
              check: ImpaktfullUiAsset.icon(PhosphorIcons.check()),
              chevronDown: ImpaktfullUiAsset.icon(PhosphorIcons.caretDown()),
              chevronLeft: ImpaktfullUiAsset.icon(PhosphorIcons.caretLeft()),
              chevronRight: ImpaktfullUiAsset.icon(PhosphorIcons.caretRight()),
              chevronUp: ImpaktfullUiAsset.icon(PhosphorIcons.caretUp()),
              circle: ImpaktfullUiAsset.icon(PhosphorIcons.circle()),
              close: ImpaktfullUiAsset.icon(PhosphorIcons.x()),
              confetti: ImpaktfullUiAsset.icon(PhosphorIcons.confetti()),
              delete: ImpaktfullUiAsset.icon(PhosphorIcons.trash()),
              error: ImpaktfullUiAsset.icon(PhosphorIcons.warningDiamond()),
              edit: ImpaktfullUiAsset.icon(PhosphorIcons.pencilSimple()),
              home: ImpaktfullUiAsset.icon(PhosphorIcons.houseSimple()),
              info: ImpaktfullUiAsset.icon(PhosphorIcons.info()),
              lineVertical:
                  ImpaktfullUiAsset.icon(PhosphorIcons.lineVertical()),
              list: ImpaktfullUiAsset.icon(PhosphorIcons.list()),
              minus: ImpaktfullUiAsset.icon(PhosphorIcons.minus()),
              search: ImpaktfullUiAsset.icon(PhosphorIcons.magnifyingGlass()),
              settings: ImpaktfullUiAsset.icon(PhosphorIcons.gearSix()),
              success: ImpaktfullUiAsset.icon(PhosphorIcons.checkCircle()),
              warning: ImpaktfullUiAsset.icon(PhosphorIcons.warning()),
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
  final ImpaktfullUiAsset add;
  final ImpaktfullUiAsset arrowLeft;
  final ImpaktfullUiAsset check;
  final ImpaktfullUiAsset chevronDown;
  final ImpaktfullUiAsset chevronLeft;
  final ImpaktfullUiAsset chevronRight;
  final ImpaktfullUiAsset chevronUp;
  final ImpaktfullUiAsset circle;
  final ImpaktfullUiAsset close;
  final ImpaktfullUiAsset confetti;
  final ImpaktfullUiAsset delete;
  final ImpaktfullUiAsset edit;
  final ImpaktfullUiAsset error;
  final ImpaktfullUiAsset home;
  final ImpaktfullUiAsset info;
  final ImpaktfullUiAsset lineVertical;
  final ImpaktfullUiAsset list;
  final ImpaktfullUiAsset minus;
  final ImpaktfullUiAsset search;
  final ImpaktfullUiAsset settings;
  final ImpaktfullUiAsset success;
  final ImpaktfullUiAsset warning;

  const ImpaktfullUiIconTheme({
    required this.add,
    required this.arrowLeft,
    required this.check,
    required this.chevronDown,
    required this.chevronLeft,
    required this.chevronRight,
    required this.chevronUp,
    required this.circle,
    required this.close,
    required this.confetti,
    required this.delete,
    required this.edit,
    required this.error,
    required this.home,
    required this.info,
    required this.lineVertical,
    required this.list,
    required this.minus,
    required this.search,
    required this.settings,
    required this.success,
    required this.warning,
  });

  ImpaktfullUiIconTheme copyWith({
    ImpaktfullUiAsset? add,
    ImpaktfullUiAsset? arrowLeft,
    ImpaktfullUiAsset? check,
    ImpaktfullUiAsset? chevronDown,
    ImpaktfullUiAsset? chevronLeft,
    ImpaktfullUiAsset? chevronRight,
    ImpaktfullUiAsset? chevronUp,
    ImpaktfullUiAsset? circle,
    ImpaktfullUiAsset? close,
    ImpaktfullUiAsset? confetti,
    ImpaktfullUiAsset? delete,
    ImpaktfullUiAsset? error,
    ImpaktfullUiAsset? edit,
    ImpaktfullUiAsset? info,
    ImpaktfullUiAsset? home,
    ImpaktfullUiAsset? lineVertical,
    ImpaktfullUiAsset? list,
    ImpaktfullUiAsset? minus,
    ImpaktfullUiAsset? search,
    ImpaktfullUiAsset? settings,
    ImpaktfullUiAsset? success,
    ImpaktfullUiAsset? warning,
  }) =>
      ImpaktfullUiIconTheme(
        add: add ?? this.add,
        arrowLeft: arrowLeft ?? this.arrowLeft,
        check: check ?? this.check,
        chevronDown: chevronDown ?? this.chevronDown,
        chevronLeft: chevronLeft ?? this.chevronLeft,
        chevronRight: chevronRight ?? this.chevronRight,
        chevronUp: chevronUp ?? this.chevronUp,
        circle: circle ?? this.circle,
        close: close ?? this.close,
        confetti: confetti ?? this.confetti,
        delete: delete ?? this.delete,
        edit: edit ?? this.edit,
        error: error ?? this.error,
        home: home ?? this.home,
        info: info ?? this.info,
        lineVertical: lineVertical ?? this.lineVertical,
        list: list ?? this.list,
        minus: minus ?? this.minus,
        search: search ?? this.search,
        settings: settings ?? this.settings,
        success: success ?? this.success,
        warning: warning ?? this.warning,
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

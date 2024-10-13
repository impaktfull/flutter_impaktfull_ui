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
    String? package,
    String? assetSuffix,
    ImpaktfullUiIconTheme? icons,
    ImpaktfullUiImageTheme? images,
    ImpaktfullUiLottieTheme? lotties,
  }) =>
      ImpaktfullUiAssetTheme(
        icons: icons ??
            ImpaktfullUiIconTheme(
              add: ImpaktfullUiAsset.icon(PhosphorIcons.plus()),
              arrowLeft: ImpaktfullUiAsset.icon(PhosphorIcons.arrowLeft()),
              arrowRight: ImpaktfullUiAsset.icon(PhosphorIcons.arrowRight()),
              arrowUp: ImpaktfullUiAsset.icon(PhosphorIcons.arrowUp()),
              arrowDown: ImpaktfullUiAsset.icon(PhosphorIcons.arrowDown()),
              check: ImpaktfullUiAsset.icon(PhosphorIcons.check()),
              chevronDown: ImpaktfullUiAsset.icon(PhosphorIcons.caretDown()),
              chevronLeft: ImpaktfullUiAsset.icon(PhosphorIcons.caretLeft()),
              chevronRight: ImpaktfullUiAsset.icon(PhosphorIcons.caretRight()),
              chevronUp: ImpaktfullUiAsset.icon(PhosphorIcons.caretUp()),
              circle: ImpaktfullUiAsset.icon(PhosphorIcons.circle()),
              close: ImpaktfullUiAsset.icon(PhosphorIcons.x()),
              cloudDownload:
                  ImpaktfullUiAsset.icon(PhosphorIcons.cloudArrowDown()),
              cloudUpload: ImpaktfullUiAsset.icon(PhosphorIcons.cloudArrowUp()),
              confetti: ImpaktfullUiAsset.icon(PhosphorIcons.confetti()),
              copy: ImpaktfullUiAsset.icon(PhosphorIcons.copy()),
              delete: ImpaktfullUiAsset.icon(PhosphorIcons.trashSimple()),
              edit: ImpaktfullUiAsset.icon(PhosphorIcons.pencilSimple()),
              error: ImpaktfullUiAsset.icon(PhosphorIcons.warningDiamond()),
              file: ImpaktfullUiAsset.icon(PhosphorIcons.file()),
              home: ImpaktfullUiAsset.icon(PhosphorIcons.houseSimple()),
              info: ImpaktfullUiAsset.icon(PhosphorIcons.info()),
              lineVertical:
                  ImpaktfullUiAsset.icon(PhosphorIcons.lineVertical()),
              list: ImpaktfullUiAsset.icon(PhosphorIcons.list()),
              logout: ImpaktfullUiAsset.icon(PhosphorIcons.signOut()),
              minus: ImpaktfullUiAsset.icon(PhosphorIcons.minus()),
              search: ImpaktfullUiAsset.icon(PhosphorIcons.magnifyingGlass()),
              settings: ImpaktfullUiAsset.icon(PhosphorIcons.gearSix()),
              success: ImpaktfullUiAsset.icon(PhosphorIcons.checkCircle()),
              user: ImpaktfullUiAsset.icon(PhosphorIcons.user()),
              warning: ImpaktfullUiAsset.icon(PhosphorIcons.warning()),
              wysiwygBold: ImpaktfullUiAsset.icon(PhosphorIcons.textB()),
              wysiwygItalic: ImpaktfullUiAsset.icon(PhosphorIcons.textItalic()),
              wysiwygOrderedList:
                  ImpaktfullUiAsset.icon(PhosphorIcons.listNumbers()),
              wysiwygUnorderedList:
                  ImpaktfullUiAsset.icon(PhosphorIcons.listBullets()),
              wysiwygUnorderedListItem:
                  ImpaktfullUiAsset.icon(PhosphorIcons.dot()),
              wysiwygLink: ImpaktfullUiAsset.icon(PhosphorIcons.link()),
              wysiwygPhoto: ImpaktfullUiAsset.icon(PhosphorIcons.image()),
            ),
        images: images ??
            ImpaktfullUiImageTheme(
              logo: getImageAssetForPackage(
                assetFileName: 'logo.svg',
                package: package,
                assetSuffix: assetSuffix,
              ),
              splashLogo: getImageAssetForPackage(
                assetFileName: 'splash_logo.svg',
                package: package,
                assetSuffix: assetSuffix,
              ),
            ),
        lotties: lotties ??
            ImpaktfullUiLottieTheme(
              loading: getLottieAssetForPackage(
                assetFileName: 'loading.json',
                package: package,
                assetSuffix: assetSuffix,
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
    String? assetSuffix,
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
    String? assetSuffix,
  }) {
    final directory = _getFullAssetDirectory(
      directory: 'lottie',
    );
    return ImpaktfullUiAsset.lottie(
      assetFileName,
      suffix: assetSuffix,
      directory: directory,
      package: package,
    );
  }
}

class ImpaktfullUiIconTheme {
  final ImpaktfullUiAsset add;
  final ImpaktfullUiAsset arrowLeft;
  final ImpaktfullUiAsset arrowRight;
  final ImpaktfullUiAsset arrowUp;
  final ImpaktfullUiAsset arrowDown;
  final ImpaktfullUiAsset check;
  final ImpaktfullUiAsset chevronDown;
  final ImpaktfullUiAsset chevronLeft;
  final ImpaktfullUiAsset chevronRight;
  final ImpaktfullUiAsset chevronUp;
  final ImpaktfullUiAsset circle;
  final ImpaktfullUiAsset close;
  final ImpaktfullUiAsset confetti;
  final ImpaktfullUiAsset copy;
  final ImpaktfullUiAsset delete;
  final ImpaktfullUiAsset cloudDownload;
  final ImpaktfullUiAsset edit;
  final ImpaktfullUiAsset error;
  final ImpaktfullUiAsset file;
  final ImpaktfullUiAsset home;
  final ImpaktfullUiAsset info;
  final ImpaktfullUiAsset lineVertical;
  final ImpaktfullUiAsset list;
  final ImpaktfullUiAsset logout;
  final ImpaktfullUiAsset minus;
  final ImpaktfullUiAsset cloudUpload;
  final ImpaktfullUiAsset user;
  final ImpaktfullUiAsset search;
  final ImpaktfullUiAsset settings;
  final ImpaktfullUiAsset success;
  final ImpaktfullUiAsset warning;
  final ImpaktfullUiAsset wysiwygBold;
  final ImpaktfullUiAsset wysiwygItalic;
  final ImpaktfullUiAsset wysiwygOrderedList;
  final ImpaktfullUiAsset wysiwygUnorderedList;
  final ImpaktfullUiAsset wysiwygUnorderedListItem;
  final ImpaktfullUiAsset wysiwygLink;
  final ImpaktfullUiAsset wysiwygPhoto;

  const ImpaktfullUiIconTheme({
    required this.add,
    required this.arrowLeft,
    required this.arrowRight,
    required this.arrowUp,
    required this.arrowDown,
    required this.check,
    required this.chevronDown,
    required this.chevronLeft,
    required this.chevronRight,
    required this.chevronUp,
    required this.circle,
    required this.close,
    required this.confetti,
    required this.copy,
    required this.delete,
    required this.cloudDownload,
    required this.edit,
    required this.error,
    required this.file,
    required this.home,
    required this.info,
    required this.lineVertical,
    required this.list,
    required this.logout,
    required this.minus,
    required this.search,
    required this.settings,
    required this.success,
    required this.cloudUpload,
    required this.user,
    required this.warning,
    required this.wysiwygBold,
    required this.wysiwygItalic,
    required this.wysiwygOrderedList,
    required this.wysiwygUnorderedList,
    required this.wysiwygUnorderedListItem,
    required this.wysiwygLink,
    required this.wysiwygPhoto,
  });

  ImpaktfullUiIconTheme copyWith({
    ImpaktfullUiAsset? add,
    ImpaktfullUiAsset? arrowLeft,
    ImpaktfullUiAsset? arrowRight,
    ImpaktfullUiAsset? arrowUp,
    ImpaktfullUiAsset? arrowDown,
    ImpaktfullUiAsset? check,
    ImpaktfullUiAsset? chevronDown,
    ImpaktfullUiAsset? chevronLeft,
    ImpaktfullUiAsset? chevronRight,
    ImpaktfullUiAsset? chevronUp,
    ImpaktfullUiAsset? circle,
    ImpaktfullUiAsset? close,
    ImpaktfullUiAsset? cloudDownload,
    ImpaktfullUiAsset? cloudUpload,
    ImpaktfullUiAsset? confetti,
    ImpaktfullUiAsset? copy,
    ImpaktfullUiAsset? delete,
    ImpaktfullUiAsset? edit,
    ImpaktfullUiAsset? error,
    ImpaktfullUiAsset? file,
    ImpaktfullUiAsset? home,
    ImpaktfullUiAsset? info,
    ImpaktfullUiAsset? lineVertical,
    ImpaktfullUiAsset? list,
    ImpaktfullUiAsset? logout,
    ImpaktfullUiAsset? minus,
    ImpaktfullUiAsset? search,
    ImpaktfullUiAsset? settings,
    ImpaktfullUiAsset? success,
    ImpaktfullUiAsset? user,
    ImpaktfullUiAsset? warning,
    ImpaktfullUiAsset? wysiwygBold,
    ImpaktfullUiAsset? wysiwygItalic,
    ImpaktfullUiAsset? wysiwygOrderedList,
    ImpaktfullUiAsset? wysiwygUnorderedList,
    ImpaktfullUiAsset? wysiwygUnorderedListItem,
    ImpaktfullUiAsset? wysiwygLink,
    ImpaktfullUiAsset? wysiwygPhoto,
  }) =>
      ImpaktfullUiIconTheme(
        add: add ?? this.add,
        arrowLeft: arrowLeft ?? this.arrowLeft,
        arrowRight: arrowRight ?? this.arrowRight,
        arrowUp: arrowUp ?? this.arrowUp,
        arrowDown: arrowDown ?? this.arrowDown,
        check: check ?? this.check,
        chevronDown: chevronDown ?? this.chevronDown,
        chevronLeft: chevronLeft ?? this.chevronLeft,
        chevronRight: chevronRight ?? this.chevronRight,
        chevronUp: chevronUp ?? this.chevronUp,
        circle: circle ?? this.circle,
        close: close ?? this.close,
        cloudDownload: cloudDownload ?? this.cloudDownload,
        cloudUpload: cloudUpload ?? this.cloudUpload,
        confetti: confetti ?? this.confetti,
        copy: copy ?? this.copy,
        delete: delete ?? this.delete,
        edit: edit ?? this.edit,
        error: error ?? this.error,
        file: file ?? this.file,
        home: home ?? this.home,
        info: info ?? this.info,
        lineVertical: lineVertical ?? this.lineVertical,
        list: list ?? this.list,
        logout: logout ?? this.logout,
        minus: minus ?? this.minus,
        search: search ?? this.search,
        settings: settings ?? this.settings,
        success: success ?? this.success,
        user: user ?? this.user,
        warning: warning ?? this.warning,
        wysiwygBold: wysiwygBold ?? this.wysiwygBold,
        wysiwygItalic: wysiwygItalic ?? this.wysiwygItalic,
        wysiwygOrderedList: wysiwygOrderedList ?? this.wysiwygOrderedList,
        wysiwygUnorderedList: wysiwygUnorderedList ?? this.wysiwygUnorderedList,
        wysiwygUnorderedListItem:
            wysiwygUnorderedListItem ?? this.wysiwygUnorderedListItem,
        wysiwygLink: wysiwygLink ?? this.wysiwygLink,
        wysiwygPhoto: wysiwygPhoto ?? this.wysiwygPhoto,
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

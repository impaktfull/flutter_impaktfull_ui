import 'package:flutter/material.dart';

class ImpaktfullUiAsset {
  final String? svgAsset;
  final String? pixelAsset;
  final String? lottieAsset;
  final String? riveAsset;

  /// The url of a network image, set by [ImpaktfullUiAsset.network].
  final String? networkUrl;
  final IconData? icon;
  final String? directory;
  final String? suffix;
  final String? package;

  /// Whether the asset is mirrored horizontally in a right-to-left layout
  /// (e.g. Arabic or Hebrew).
  ///
  /// Use it for directional assets such as back arrows and chevrons. An
  /// [icon] whose [IconData.matchTextDirection] is true is already mirrored by
  /// [Icon] and is not mirrored twice.
  final bool matchTextDirection;

  const ImpaktfullUiAsset.svg(
    String this.svgAsset, {
    this.directory,
    this.package,
    this.suffix,
    this.matchTextDirection = false,
  })  : pixelAsset = null,
        lottieAsset = null,
        icon = null,
        riveAsset = null,
        networkUrl = null;

  const ImpaktfullUiAsset.pixel(
    String this.pixelAsset, {
    this.directory,
    this.package,
    this.suffix,
    this.matchTextDirection = false,
  })  : svgAsset = null,
        lottieAsset = null,
        icon = null,
        riveAsset = null,
        networkUrl = null;

  /// An image that is loaded from the network.
  ///
  /// It is rendered with `ImpaktfullUiNetworkImage`, which shows a fallback
  /// when the image can not be loaded.
  const ImpaktfullUiAsset.network(
    String this.networkUrl, {
    this.matchTextDirection = false,
  })  : svgAsset = null,
        pixelAsset = null,
        lottieAsset = null,
        icon = null,
        riveAsset = null,
        package = null,
        directory = null,
        suffix = null;

  const ImpaktfullUiAsset.icon(
    IconData this.icon, {
    this.matchTextDirection = false,
  })  : pixelAsset = null,
        lottieAsset = null,
        svgAsset = null,
        riveAsset = null,
        networkUrl = null,
        package = null,
        directory = null,
        suffix = null;

  /// An asset that shows nothing.
  ///
  /// It is the default of [ImpaktfullUiImageTheme.logo] and
  /// [ImpaktfullUiImageTheme.splashLogo] when the theme reads its assets from
  /// the impaktfull_ui package: the package ships no logo. Set them to your
  /// own asset, or build the theme with `package: null` to read
  /// `assets/images/logo.svg` from your own app.
  ///
  /// `ImpaktfullUiAssetWidget` renders nothing for it, like it does for a
  /// null asset.
  const ImpaktfullUiAsset.none({
    this.matchTextDirection = false,
  })  : pixelAsset = null,
        lottieAsset = null,
        svgAsset = null,
        icon = null,
        riveAsset = null,
        networkUrl = null,
        package = null,
        directory = null,
        suffix = null;

  /// Whether this asset shows nothing ([ImpaktfullUiAsset.none]).
  bool get isNone =>
      svgAsset == null &&
      pixelAsset == null &&
      lottieAsset == null &&
      riveAsset == null &&
      networkUrl == null &&
      icon == null;

  const ImpaktfullUiAsset.lottie(
    String this.lottieAsset, {
    this.directory,
    this.package,
    this.suffix,
    this.matchTextDirection = false,
  })  : pixelAsset = null,
        svgAsset = null,
        icon = null,
        riveAsset = null,
        networkUrl = null;

  const ImpaktfullUiAsset.rive(
    String this.riveAsset, {
    this.directory,
    this.package,
    this.suffix,
    this.matchTextDirection = false,
  })  : pixelAsset = null,
        svgAsset = null,
        icon = null,
        lottieAsset = null,
        networkUrl = null;

  const ImpaktfullUiAsset._({
    required this.svgAsset,
    required this.pixelAsset,
    required this.lottieAsset,
    required this.riveAsset,
    required this.networkUrl,
    required this.icon,
    required this.directory,
    required this.suffix,
    required this.package,
    required this.matchTextDirection,
  });

  /// A copy of this asset with the given fields replaced.
  ImpaktfullUiAsset copyWith({
    bool? matchTextDirection,
  }) =>
      ImpaktfullUiAsset._(
        svgAsset: svgAsset,
        pixelAsset: pixelAsset,
        lottieAsset: lottieAsset,
        riveAsset: riveAsset,
        networkUrl: networkUrl,
        icon: icon,
        directory: directory,
        suffix: suffix,
        package: package,
        matchTextDirection: matchTextDirection ?? this.matchTextDirection,
      );

  String getAssetName() {
    if (svgAsset != null) return svgAsset!;
    if (pixelAsset != null) return pixelAsset!;
    if (lottieAsset != null) return lottieAsset!;
    if (riveAsset != null) return riveAsset!;
    if (networkUrl != null) return networkUrl!;
    return icon!.toString();
  }

  String? getFullPixelAsset() => _getFullPath(pixelAsset);

  String? getFullSvgAsset() => _getFullPath(svgAsset);

  String? getFullLottieAsset() => _getFullPath(lottieAsset);

  String? getFullRiveAsset() => _getFullPath(riveAsset, addPackage: true);

  String? _getFullPath(
    String? asset, {
    bool addPackage = false,
  }) {
    if (asset == null) return null;
    var path = '';
    if (addPackage && package != null) {
      path += 'packages/$package/';
    }
    if (directory != null) {
      path += '$directory';
    }
    if (path.isNotEmpty && !path.endsWith('/')) {
      path += '/';
    }
    path += _addSuffix(asset);
    return path;
  }

  /// Adds the [suffix] before the extension of the file name of [asset]. The
  /// directories of the path are never changed, even when they contain a dot.
  String _addSuffix(String asset) {
    final suffix = this.suffix;
    if (suffix == null) return asset;
    final fileNameStart = asset.lastIndexOf('/') + 1;
    final extensionStart = asset.lastIndexOf('.');
    if (extensionStart < fileNameStart) return asset;
    return '${asset.substring(0, extensionStart)}_$suffix'
        '${asset.substring(extensionStart)}';
  }
}

import 'package:flutter/material.dart';

class ImpaktfullUiAsset {
  final String? svgAsset;
  final String? pixelAsset;
  final String? lottieAsset;
  final String? riveAsset;
  final IconData? icon;
  final String? directory;
  final String? suffix;
  final String? package;

  const ImpaktfullUiAsset.svg(
    String this.svgAsset, {
    this.directory,
    this.package,
    this.suffix,
  })  : pixelAsset = null,
        lottieAsset = null,
        icon = null,
        riveAsset = null;

  const ImpaktfullUiAsset.pixel(
    String this.pixelAsset, {
    this.directory,
    this.package,
    this.suffix,
  })  : svgAsset = null,
        lottieAsset = null,
        icon = null,
        riveAsset = null;

  const ImpaktfullUiAsset.icon(
    IconData this.icon,
  )   : pixelAsset = null,
        lottieAsset = null,
        svgAsset = null,
        riveAsset = null,
        package = null,
        directory = null,
        suffix = null;

  const ImpaktfullUiAsset.lottie(
    String this.lottieAsset, {
    this.directory,
    this.package,
    this.suffix,
  })  : pixelAsset = null,
        svgAsset = null,
        icon = null,
        riveAsset = null;

  const ImpaktfullUiAsset.rive(
    String this.riveAsset, {
    this.directory,
    this.package,
    this.suffix,
  })  : pixelAsset = null,
        svgAsset = null,
        icon = null,
        lottieAsset = null;

  String getAssetName() {
    if (svgAsset != null) return svgAsset!;
    if (pixelAsset != null) return pixelAsset!;
    if (lottieAsset != null) return lottieAsset!;
    if (riveAsset != null) return riveAsset!;
    return icon!.toString();
  }

  String? getFullPixelAsset() => _getFullPath(pixelAsset);

  String? getFullSvgAsset() => _getFullPath(svgAsset);

  String? getFullLottieAsset() => _getFullPath(lottieAsset);

  String? getFullRiveAsset() => _getFullPath(riveAsset);

  String? _getFullPath(String? asset) {
    if (asset == null) return null;
    var path = '';
    if (package != null) {
      path += 'packages/$package/';
    }
    if (directory != null) {
      path += '$directory';
    }
    if (!path.endsWith('/')) {
      path += '/';
    }
    path += asset;
    if (suffix != null) {
      final parts = path.split('.');
      if (parts.length != 1) {
        final extension = '.${parts.last}';
        path = path.replaceAll(extension, '_$suffix$extension');
      }
    }
    return path;
  }
}

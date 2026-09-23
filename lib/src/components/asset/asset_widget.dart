import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:impaktfull_ui/src/components/asset/rive_asset.dart';
import 'package:impaktfull_ui/src/components/network_image/network_image.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:lottie/lottie.dart';

class ImpaktfullUiAssetWidget extends StatelessWidget {
  final ImpaktfullUiAsset? asset;
  final Color? color;
  final double? width;
  final double? height;
  final double? size;
  final BoxFit? fit;

  /// What screen readers announce for the asset. Only needed when the asset
  /// shows something that is not in a text next to it: leave it null for
  /// decorative assets and icons next to a label.
  final String? semanticLabel;

  /// Hides the asset from screen readers (e.g. a decorative illustration).
  final bool excludeFromSemantics;

  const ImpaktfullUiAssetWidget({
    required this.asset,
    this.color,
    this.width,
    this.height,
    this.size,
    this.fit,
    this.semanticLabel,
    this.excludeFromSemantics = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final asset = this.asset;
    if (asset == null) return const SizedBox();
    final child = SizedBox(
      width: width ?? size,
      height: height ?? size,
      child: Builder(
        builder: (context) {
          final color = this.color;
          final icon = asset.icon;
          final svgAsset = asset.getFullSvgAsset();
          final pixelAsset = asset.getFullPixelAsset();
          final lottieAsset = asset.getFullLottieAsset();
          final riveAsset = asset.getFullRiveAsset();
          final networkUrl = asset.networkUrl;
          if (icon != null) {
            double? size = this.size;
            if (size == null) {
              if (width != null && height != null) {
                size = max(width!, height!);
              } else if (width != null) {
                size = width;
              } else if (height != null) {
                size = height;
              }
            }
            return Icon(
              icon,
              color: color,
              size: size,
            );
          }
          if (pixelAsset != null) {
            return Image.asset(
              pixelAsset,
              color: color,
              width: width ?? size,
              height: height ?? size,
              package: asset.package,
              fit: fit,
            );
          }

          if (networkUrl != null) {
            // The semantics are added by `_withSemantics` below, so the image
            // itself never announces anything twice.
            return ImpaktfullUiNetworkImage(
              url: networkUrl,
              width: width ?? size,
              height: height ?? size,
              fit: fit ?? BoxFit.contain,
              excludeFromSemantics: true,
            );
          }

          if (svgAsset != null) {
            return SvgPicture.asset(
              svgAsset,
              colorFilter: color == null
                  ? null
                  : ColorFilter.mode(color, BlendMode.srcIn),
              width: width ?? size,
              height: height ?? size,
              package: asset.package,
              fit: fit ?? BoxFit.contain,
            );
          }
          if (lottieAsset != null) {
            return Lottie.asset(
              lottieAsset,
              width: width ?? size,
              height: height ?? size,
              package: asset.package,
              fit: fit,
            );
          }
          if (riveAsset != null) {
            return RiveAsset(
              asset: riveAsset,
              width: width ?? size,
              height: height ?? size,
              fit: fit ?? BoxFit.contain,
            );
          }
          throw Exception('No asset provided (or asset type not supported)');
        },
      ),
    );
    final mirrored = _shouldMirror(context, asset)
        ? Transform.flip(
            flipX: true,
            child: child,
          )
        : child;
    return _withSemantics(mirrored);
  }

  Widget _withSemantics(Widget child) {
    if (excludeFromSemantics) return ExcludeSemantics(child: child);
    final semanticLabel = this.semanticLabel;
    if (semanticLabel == null) return child;
    return Semantics(
      container: true,
      image: true,
      label: semanticLabel,
      child: ExcludeSemantics(child: child),
    );
  }

  static bool _shouldMirror(BuildContext context, ImpaktfullUiAsset asset) {
    if (!asset.matchTextDirection) return false;
    // Icon already mirrors IconData with matchTextDirection itself.
    if (asset.icon?.matchTextDirection == true) return false;
    return Directionality.maybeOf(context) == TextDirection.rtl;
  }

  ImpaktfullUiAssetWidget overrideColor(Color color) {
    if (this.color != null) return this;
    return ImpaktfullUiAssetWidget(
      asset: asset,
      color: color,
      width: width,
      height: height,
      size: size,
      fit: fit,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      key: key,
    );
  }
}

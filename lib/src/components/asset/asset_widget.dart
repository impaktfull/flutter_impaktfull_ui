import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:lottie/lottie.dart';
import 'package:rive/rive.dart' hide Image;

class ImpaktfullUiAssetWidget extends StatelessWidget {
  final ImpaktfullUiAsset? asset;
  final Color? color;
  final double? width;
  final double? height;
  final double? size;
  final BoxFit? fit;

  const ImpaktfullUiAssetWidget({
    required this.asset,
    this.color,
    this.width,
    this.height,
    this.size,
    this.fit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final asset = this.asset;
    if (asset == null) return const SizedBox();
    return SizedBox(
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
            return SizedBox(
              width: width ?? size,
              height: height ?? size,
              child: RiveAnimation.asset(
                riveAsset,
              ),
            );
          }
          throw Exception('No asset provided (or asset type not supported)');
        },
      ),
    );
  }

  ImpaktfullUiAssetWidget overrideColor(Color color) {
    if (this.color != null) return this;
    return ImpaktfullUiAssetWidget(
      asset: asset,
      color: color,
    );
  }
}

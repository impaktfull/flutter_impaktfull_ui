import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/models/asset_models.dart';
import 'package:lottie/lottie.dart';

class ImpaktfullUiAssetWidget extends StatelessWidget {
  final ImpaktfullUiAsset? asset;
  final Color? color;
  final double? width;
  final double? height;
  final double? size;

  const ImpaktfullUiAssetWidget({
    required this.asset,
    this.color,
    this.width,
    this.height,
    this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final asset = this.asset;
    if (asset == null) return const SizedBox();
    final icon = asset.icon;
    final svgAsset = asset.getFullSvgAsset();
    final pixelAsset = asset.getFullPixelAsset();
    final lottieAsset = asset.getFullLottieAsset();
    if (icon != null) {
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
        width: width,
        height: height,
      );
    }

    if (svgAsset != null) {
      // TODO switch to flutter_svg
      return Image.asset(
        svgAsset,
        color: color,
        width: width,
        height: height,
      );
    }
    if (lottieAsset != null) {
      return Lottie.asset(
        lottieAsset,
        width: width,
        height: height,
      );
    }
    throw Exception('No asset provided (or asset type not supported)');
  }
}

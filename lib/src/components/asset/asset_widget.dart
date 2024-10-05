import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:impaktfull_ui_2/src/models/asset.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';
import 'package:lottie/lottie.dart';
import 'package:rive/rive.dart' hide Image;

part 'asset_widget.describe.dart';

class ImpaktfullUiAssetWidget extends StatelessWidget
    with ComponentDescriptorMixin {
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
    final color = this.color;
    final icon = asset.icon;
    final svgAsset = asset.getFullSvgAsset();
    final pixelAsset = asset.getFullPixelAsset();
    final lottieAsset = asset.getFullLottieAsset();
    final riveAsset = asset.getFullRiveAsset();
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
        package: asset.package,
      );
    }

    if (svgAsset != null) {
      return SvgPicture.asset(
        svgAsset,
        colorFilter:
            color == null ? null : ColorFilter.mode(color, BlendMode.srcIn),
        width: width,
        height: height,
        package: asset.package,
      );
    }
    if (lottieAsset != null) {
      return Lottie.asset(
        lottieAsset,
        width: width,
        height: height,
        package: asset.package,
      );
    }
    if (riveAsset != null) {
      return SizedBox(
        width: width,
        height: height,
        child: RiveAnimation.asset(
          riveAsset,
        ),
      );
    }
    throw Exception('No asset provided (or asset type not supported)');
  }

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}

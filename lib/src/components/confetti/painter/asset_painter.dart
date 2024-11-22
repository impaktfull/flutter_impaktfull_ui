import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';

class AssetPainter {
  ImpaktfullUiAsset? asset;
  PictureInfo? _pictureInfo;
  IconData? _iconData;

  Future<void> load(ImpaktfullUiAsset? asset) async {
    if (asset == null) return;
    if (this.asset == asset) return;
    this.asset = asset;
    if (asset.svgAsset != null) {
      final data = await rootBundle.loadString(asset.svgAsset!);
      _pictureInfo = await vg.loadPicture(
        SvgStringLoader(data),
        null,
      );
    } else if (asset.icon != null) {
      _iconData = asset.icon;
    }
  }

  void paint(
    Canvas canvas,
    Paint paint,
    Offset position,
  ) {
    final pictureInfo = _pictureInfo;
    final iconData = _iconData;
    if (pictureInfo != null) {
      canvas.save();
      canvas.translate(position.dx, position.dy);
      canvas.drawPicture(pictureInfo.picture);
      canvas.restore();
    } else if (iconData != null) {
      final textPainter = TextPainter(
        text: TextSpan(
          text: String.fromCharCode(iconData.codePoint),
          style: TextStyle(
            fontSize: 24,
            fontFamily: iconData.fontFamily,
            package: iconData.fontPackage,
            color: paint.color,
          ),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(canvas,
          position.translate(-textPainter.width / 2, -textPainter.height / 2));
    }
  }
}

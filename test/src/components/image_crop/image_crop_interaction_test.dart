import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../util/network_image_util.dart';
import '../../../util/test_image.dart';
import '../../../util/test_util.dart';

class _FakeImageCropController extends ImpaktfullUiImageCropController {
  final cropInfos = <ImpaktfullUiImageCropInfo>[];

  @override
  Future<ui.Image> cropUrl({
    required ImpaktfullUiImageCropInfo cropInfo,
    required String imageUrl,
  }) async {
    cropInfos.add(cropInfo);
    return _createImage(4, 4);
  }
}

ui.Image _createImage(int width, int height) {
  final recorder = ui.PictureRecorder();
  Canvas(recorder).drawRect(
    Rect.fromLTWH(0, 0, width.toDouble(), height.toDouble()),
    Paint()..color = Colors.red,
  );
  return recorder.endRecording().toImageSync(width, height);
}

Finder get _zoomIn => find.byIcon(PhosphorIcons.magnifyingGlassPlus());

Finder get _zoomOut => find.byIcon(PhosphorIcons.magnifyingGlassMinus());

Finder get _crop => find.byIcon(PhosphorIcons.crop());

/// The transform that moves and scales the image.
Matrix4 _imageTransform(WidgetTester tester) => tester
    .widget<Transform>(
      find
          .descendant(
            of: find.byType(ImpaktfullUiImageCrop),
            matching: find.byType(Transform),
          )
          .first,
    )
    .transform;

double _scale(WidgetTester tester) =>
    _imageTransform(tester).getMaxScaleOnAxis();

Future<void> _pumpCrop(
  WidgetTester tester, {
  String? imageUrl,
  ImpaktfullUiImageCropController? controller,
  ValueChanged<Uint8List>? onCropped,
}) async {
  await pumpAndSettleComponent(
    tester,
    Center(
      child: ImpaktfullUiImageCrop(
        size: 200,
        imageUrl: imageUrl,
        controller: controller,
        onCropped: onCropped,
      ),
    ),
  );
  if (imageUrl != null) await waitForBrokenNetworkImage(tester, imageUrl);
}

/// Taps the crop button and waits until the (real async) cropping is done.
Future<void> _cropAndWait(WidgetTester tester) async {
  await tester.tap(_crop);
  // Encoding the PNG takes real time. The crop was started in the fake time
  // of the widget test, so in Chrome it only continues after a pump.
  for (var i = 0; i < 250 && _crop.evaluate().isNotEmpty; i++) {
    await tester.runAsync(
      () => Future<void>.delayed(const Duration(milliseconds: 20)),
    );
    await tester.pump();
  }
  await tester.pumpAndSettle();
}

void main() {
  setUpAll(warmUpImageEncoding);

  group('Zoom', () {
    testWidgets('zoom in and out scale the image by 10%', (tester) async {
      await _pumpCrop(tester);
      expect(_scale(tester), closeTo(1, 0.001));

      await tester.tap(_zoomIn);
      await tester.pump();
      expect(_scale(tester), closeTo(1.1, 0.001));

      await tester.tap(_zoomOut);
      await tester.tap(_zoomOut);
      await tester.pump();
      expect(_scale(tester), closeTo(1 / 1.1, 0.001));
    });

    testWidgets('zooming in stops at 3x', (tester) async {
      await _pumpCrop(tester);
      for (var i = 0; i < 20; i++) {
        await tester.tap(_zoomIn);
      }
      await tester.pump();
      expect(_scale(tester), closeTo(3, 0.001));
    });

    testWidgets('zooming out stops at 0.5x', (tester) async {
      await _pumpCrop(tester);
      for (var i = 0; i < 20; i++) {
        await tester.tap(_zoomOut);
      }
      await tester.pump();
      expect(_scale(tester), closeTo(0.5, 0.001));
    });

    testWidgets('dragging moves the image', (tester) async {
      await _pumpCrop(tester);
      final image = find
          .descendant(
            of: find.byType(ImpaktfullUiImageCrop),
            matching: find.byType(Transform),
          )
          .first;
      await tester.drag(image, const Offset(120, -80));
      await tester.pump();
      final translation = _imageTransform(tester).getTranslation();
      expect(translation.x, greaterThan(0));
      expect(translation.y, lessThan(0));
      expect(_scale(tester), closeTo(1, 0.001));
    });
  });

  group('Crop', () {
    testWidgets('without an imageUrl nothing is cropped', (tester) async {
      final controller = _FakeImageCropController();
      var cropped = 0;
      await _pumpCrop(
        tester,
        controller: controller,
        onCropped: (_) => cropped++,
      );

      await tester.tap(_crop);
      await tester.pumpAndSettle();
      expect(controller.cropInfos, isEmpty);
      expect(cropped, 0);
    });

    testWidgets('crops with the zoom and the crop rect', (tester) async {
      final controller = _FakeImageCropController();
      await _pumpCrop(
        tester,
        imageUrl: brokenImageUrl,
        controller: controller,
      );

      await tester.tap(_zoomIn);
      await tester.pump();
      await _cropAndWait(tester);
      final cropInfo = controller.cropInfos.single;
      expect(cropInfo.scale, closeTo(1.1, 0.001));
      expect(cropInfo.width, 200);
      expect(cropInfo.height, 200);
      // A padding of 1/8 of the size on every side.
      expect(cropInfo.cropRect, const Rect.fromLTWH(25, 25, 150, 150));
    });

    testWidgets('shows the result, back to editing keeps the zoom',
        (tester) async {
      final controller = _FakeImageCropController();
      await _pumpCrop(
        tester,
        imageUrl: brokenImageUrl,
        controller: controller,
      );
      await tester.tap(_zoomIn);
      await tester.pump();

      await _cropAndWait(tester);
      expect(_crop, findsNothing);
      expect(find.byType(Image), findsOneWidget);

      await tester.tap(find.byIcon(PhosphorIcons.arrowClockwise()));
      await tester.pumpAndSettle();
      tester.takeException();
      expect(_crop, findsOneWidget);
      expect(_scale(tester), closeTo(1.1, 0.001));
    });

    testWidgets('delete resets the zoom', (tester) async {
      final controller = _FakeImageCropController();
      await _pumpCrop(
        tester,
        imageUrl: brokenImageUrl,
        controller: controller,
      );
      await tester.tap(_zoomIn);
      await tester.pump();

      await _cropAndWait(tester);
      final theme = ImpaktfullUiImageCropTheme.of(
        tester.element(find.byType(ImpaktfullUiImageCrop)),
      );
      await tester.tap(find.byWidgetPredicate(
        (widget) =>
            widget is ImpaktfullUiIconButton &&
            widget.asset == theme.assets.delete,
      ));
      await tester.pumpAndSettle();
      tester.takeException();
      expect(_crop, findsOneWidget);
      expect(_scale(tester), closeTo(1, 0.001));
    });
  });

  group('ImpaktfullUiImageCropCropper', () {
    ImpaktfullUiImageCropInfo cropInfo({double width = 200}) =>
        ImpaktfullUiImageCropInfo(
          cropRect: const Rect.fromLTWH(25, 25, 150, 150),
          width: width,
          height: 200,
          scale: 1,
          position: Offset.zero,
        );

    testWidgets('a square crop of a landscape image uses its height',
        (tester) async {
      final result = await tester.runAsync(
        () => ImpaktfullUiImageCropCropper().cropImage(
          cropInfo: cropInfo(),
          image: _createImage(100, 50),
        ),
      );
      expect(result!.width, 50);
      expect(result.height, 50);
    });

    testWidgets('a square crop of a portrait image uses its width',
        (tester) async {
      final result = await tester.runAsync(
        () => ImpaktfullUiImageCropController().cropImage(
          cropInfo: cropInfo(),
          image: _createImage(40, 80),
        ),
      );
      expect(result!.width, 40);
      expect(result.height, 40);
    });

    test('throws without an image', () async {
      await expectLater(
        ImpaktfullUiImageCropCropper().cropImage(cropInfo: cropInfo()),
        throwsA(isA<Exception>()),
      );
    });
  });

  test('copyWith keeps the values that are not passed', () {
    const info = ImpaktfullUiImageCropInfo(
      cropRect: Rect.fromLTWH(1, 2, 3, 4),
      width: 10,
      height: 20,
      scale: 2,
      position: Offset(5, 6),
      backgroundColor: Colors.red,
    );
    final copy = info.copyWith(scale: 3);
    expect(copy.scale, 3);
    expect(copy.cropRect, info.cropRect);
    expect(copy.width, 10);
    expect(copy.height, 20);
    expect(copy.position, const Offset(5, 6));
    expect(copy.backgroundColor, Colors.red);
  });
}

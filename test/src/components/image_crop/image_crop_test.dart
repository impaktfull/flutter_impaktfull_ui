import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';

import '../../../util/network_image_util.dart';
import '../../../util/test_image.dart';
import '../../../util/test_util.dart';

class _FakeImageCropController extends ImpaktfullUiImageCropController {
  final Completer<ui.Image> result = Completer();
  var isDisposed = false;

  @override
  Future<ui.Image> cropUrl({
    required ImpaktfullUiImageCropInfo cropInfo,
    required String imageUrl,
  }) =>
      result.future;

  @override
  void dispose() => isDisposed = true;
}

ui.Image _createImage() {
  final recorder = ui.PictureRecorder();
  Canvas(recorder).drawRect(
    const Rect.fromLTWH(0, 0, 4, 4),
    Paint()..color = Colors.red,
  );
  return recorder.endRecording().toImageSync(4, 4);
}

Finder get _cropButton => find.byIcon(PhosphorIcons.crop);

void main() {
  setUpAll(warmUpImageEncoding);

  testWidgets('does not throw without an imageUrl', (tester) async {
    await pumpAndSettleComponent(
      tester,
      const ImpaktfullUiImageCrop(size: 200),
    );
    expect(tester.takeException(), isNull);
  });

  testWidgets('does not dispose the controller of the app', (tester) async {
    final controller = _FakeImageCropController();
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiImageCrop(size: 200, controller: controller),
    );
    await tester.pumpWidget(const SizedBox());
    expect(controller.isDisposed, isFalse);
  });

  testWidgets('passes the cropped image to onCropped', (tester) async {
    final controller = _FakeImageCropController();
    Uint8List? cropped;
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiImageCrop(
        size: 200,
        imageUrl: brokenImageUrl,
        controller: controller,
        onCropped: (bytes) => cropped = bytes,
      ),
    );
    await waitForBrokenNetworkImage(tester, brokenImageUrl);

    await tester.tap(_cropButton);
    controller.result.complete(_createImage());
    // Encoding the PNG takes real time. The crop was started in the fake time
    // of the widget test, so in Chrome it only continues after a pump.
    for (var i = 0; i < 250 && cropped == null; i++) {
      await tester.runAsync(
        () => Future<void>.delayed(const Duration(milliseconds: 20)),
      );
      await tester.pump();
    }
    expect(cropped, isNotNull);
    expect(cropped, isNotEmpty);
  });

  testWidgets('removing it while cropping does not throw or log errors',
      (tester) async {
    final controller = _FakeImageCropController();
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiImageCrop(
        size: 200,
        imageUrl: brokenImageUrl,
        controller: controller,
      ),
    );
    await waitForBrokenNetworkImage(tester, brokenImageUrl);

    await tester.tap(_cropButton);
    await tester.pump();
    await tester.pumpWidget(const SizedBox());

    // Errors of onAsyncTap are caught and printed by the button
    final logs = <String?>[];
    final originalDebugPrint = debugPrint;
    debugPrint = (message, {wrapWidth}) => logs.add(message);
    addTearDown(() => debugPrint = originalDebugPrint);
    await tester.runAsync(() async {
      controller.result.complete(_createImage());
      await Future<void>.delayed(const Duration(milliseconds: 200));
    });
    await tester.pump();
    debugPrint = originalDebugPrint;
    expect(tester.takeException(), isNull);
    expect(logs, isEmpty);
  });

  testWidgets('a broken imageUrl does not throw', (tester) async {
    await pumpAndSettleComponent(
      tester,
      const ImpaktfullUiImageCrop(size: 200, imageUrl: brokenImageUrl),
    );
    await waitForBrokenNetworkImage(tester, brokenImageUrl);
    expect(tester.takeException(), isNull);
    expect(_cropButton, findsOneWidget);
  });

  testWidgets('downloadImage completes with an error when loading fails',
      (tester) async {
    final result = await tester.runAsync(
      () => ImpaktfullUiImageCropCropper()
          .downloadImage(brokenImageUrl)
          .then((_) => 'image', onError: (Object _) => 'error')
          .timeout(const Duration(seconds: 5), onTimeout: () => 'timeout'),
    );
    expect(result, 'error');
  });
}

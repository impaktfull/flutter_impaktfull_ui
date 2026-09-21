// Runs on the Dart VM and in Chrome (tool/test_web.sh): cropping bytes and
// XFiles must work on every platform, including the web.

import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:cross_file/cross_file.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_image.dart';

const _cropInfo = ImpaktfullUiImageCropInfo(
  cropRect: Rect.fromLTWH(25, 25, 150, 150),
  width: 200,
  height: 200,
  scale: 1,
  position: Offset.zero,
);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late ImpaktfullUiImageCropController controller;
  late ui.Image decoded;
  late ui.Image expected;

  setUp(() async {
    controller = ImpaktfullUiImageCropController();
    decoded = await controller.cropper.decodeImage(testPngBytes);
    expected = await controller.cropImage(
      cropInfo: _cropInfo,
      image: decoded,
    );
  });

  tearDown(() => controller.dispose());

  test('decodeImage decodes an encoded image', () {
    expect(decoded.width, testPngWidth);
    expect(decoded.height, testPngHeight);
  });

  test('decodeImage fails for bytes that are not an image', () async {
    await expectLater(
      controller.cropper.decodeImage(Uint8List.fromList([1, 2, 3])),
      throwsA(anything),
    );
  });

  test('cropImageBytes crops the decoded image', () async {
    final cropped = await controller.cropImageBytes(
      cropInfo: _cropInfo,
      bytes: testPngBytes,
    );
    expect(cropped.width, expected.width);
    expect(cropped.height, expected.height);
  });

  test('cropXFile crops the image of the XFile', () async {
    final cropped = await controller.cropXFile(
      cropInfo: _cropInfo,
      xFile: XFile.fromData(testPngBytes, name: 'red.png'),
    );
    expect(cropped.width, expected.width);
    expect(cropped.height, expected.height);
  });

  test('the cropper accepts imageBytes and xFile', () async {
    final fromBytes = await controller.cropper.cropImage(
      cropInfo: _cropInfo,
      imageBytes: testPngBytes,
    );
    final fromXFile = await controller.cropper.cropImage(
      cropInfo: _cropInfo,
      xFile: XFile.fromData(testPngBytes),
    );
    expect(fromBytes.width, expected.width);
    expect(fromXFile.height, expected.height);
  });

  test('the cropper fails without an image', () async {
    await expectLater(
      controller.cropper.cropImage(cropInfo: _cropInfo),
      throwsException,
    );
  });
}

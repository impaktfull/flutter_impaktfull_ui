// The deprecated `dart:io` File APIs must keep working on every platform with
// `dart:io` until they are removed in 1.0.0. The web equivalent is
// test/src/util/io_file/io_file_test.dart.
//
// See doc/migrations/1.0.0.md.
// ignore_for_file: deprecated_member_use_from_same_package
@TestOn('vm')
library;

import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../util/test_image.dart';

const _cropInfo = ImpaktfullUiImageCropInfo(
  cropRect: Rect.fromLTWH(25, 25, 150, 150),
  width: 200,
  height: 200,
  scale: 1,
  position: Offset.zero,
);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Directory directory;
  late File file;

  setUp(() {
    directory = Directory.systemTemp.createTempSync('impaktfull_ui_io_file');
    file = File('${directory.path}/red.png')..writeAsBytesSync(testPngBytes);
  });

  tearDown(() => directory.deleteSync(recursive: true));

  test('ImpaktfullUiGalleryItem.file shows the file with Image.file', () {
    final item = ImpaktfullUiGalleryItem.file(
      file: file,
      imageFit: BoxFit.contain,
    );
    expect(item.file, same(file));
    expect(item.heroTag, file.path);
    final image = item.child() as Image;
    expect(image.image, isA<FileImage>());
    expect((image.image as FileImage).file, same(file));
    expect(image.fit, BoxFit.contain);
  });

  test('ImpaktfullUiImageCropController.cropImageFile crops the file',
      () async {
    // This threw "imageFile is not supported yet" before
    final controller = ImpaktfullUiImageCropController();
    final expected = await controller.cropImageBytes(
      cropInfo: _cropInfo,
      bytes: testPngBytes,
    );
    final cropped = await controller.cropImageFile(
      cropInfo: _cropInfo,
      file: file,
    );
    expect(cropped.width, expected.width);
    expect(cropped.height, expected.height);
  });

  test('ImpaktfullUiImageCropController.cropImageFile fails for a missing file',
      () async {
    await expectLater(
      ImpaktfullUiImageCropController().cropImageFile(
        cropInfo: _cropInfo,
        file: File('${directory.path}/missing.png'),
      ),
      throwsA(isA<FileSystemException>()),
    );
  });

  test('ImpaktfullUiImageCropCropper.cropImage(imageFile:)', () async {
    final cropped = await ImpaktfullUiImageCropCropper().cropImage(
      cropInfo: _cropInfo,
      imageFile: file,
    );
    expect(cropped.width, greaterThan(0));
  });
}

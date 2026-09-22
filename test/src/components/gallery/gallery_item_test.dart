// Runs on the Dart VM and in Chrome (tool/test_web.sh): the bytes and XFile
// gallery items must work on every platform, including the web.

import 'dart:async';
import 'dart:typed_data';

import 'package:cross_file/cross_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui/src/util/image/x_file_image.dart';

import '../../../util/test_image.dart';
import '../../../util/test_util.dart';

Finder _decodedImage(Finder image) => find.descendant(
      of: image,
      matching: find.byWidgetPredicate(
        (widget) => widget is RawImage && widget.image != null,
      ),
    );

/// Waits until [count] images are decoded.
///
/// Decoding happens in real time, the image of a widget is loaded in the fake
/// time of the widget test and only reports the decoded image after a pump
/// (in Chrome, not on the VM). So this waits a bit of real time and pumps.
Future<void> _decodeImages(WidgetTester tester, int count) async {
  final decoded = _decodedImage(find.byType(Image));
  for (var i = 0; i < 250 && decoded.evaluate().length < count; i++) {
    await tester.runAsync(
      () => Future<void>.delayed(const Duration(milliseconds: 20)),
    );
    await tester.pump();
  }
}

void main() {
  group('ImpaktfullUiGalleryItem.bytes', () {
    test('shows the bytes with Image.memory', () {
      final item = ImpaktfullUiGalleryItem.bytes(
        bytes: testPngBytes,
        imageFit: BoxFit.contain,
      );
      final image = item.child() as Image;
      expect(image.image, isA<MemoryImage>());
      expect((image.image as MemoryImage).bytes, same(testPngBytes));
      expect(image.fit, BoxFit.contain);
      expect(item.bytes, same(testPngBytes));
      expect(item.imageUrl, isNull);
      expect(item.xFile, isNull);
    });

    test('the fit of the gallery is used without imageFit', () {
      final item = ImpaktfullUiGalleryItem.bytes(bytes: testPngBytes);
      final image = item.child(fit: BoxFit.cover) as Image;
      expect(image.fit, BoxFit.cover);
    });

    test('every item gets its own hero tag, an id wins', () {
      final first = ImpaktfullUiGalleryItem.bytes(bytes: testPngBytes);
      final second = ImpaktfullUiGalleryItem.bytes(
          bytes: Uint8List.fromList(testPngBytes));
      expect(first.heroTag, isNot(second.heroTag));
      expect(
        ImpaktfullUiGalleryItem.bytes(id: 'red', bytes: testPngBytes).heroTag,
        'red',
      );
    });

    test('equality uses the bytes', () {
      expect(
        ImpaktfullUiGalleryItem.bytes(bytes: testPngBytes),
        ImpaktfullUiGalleryItem.bytes(bytes: testPngBytes),
      );
      expect(
        ImpaktfullUiGalleryItem.bytes(bytes: testPngBytes),
        isNot(ImpaktfullUiGalleryItem.bytes(
            bytes: Uint8List.fromList(testPngBytes))),
      );
    });
  });

  group('ImpaktfullUiGalleryItem.xFile', () {
    test('shows the XFile with an ImpaktfullUiXFileImage', () {
      final xFile = XFile.fromData(testPngBytes, name: 'red.png');
      final item = ImpaktfullUiGalleryItem.xFile(
        xFile: xFile,
        imageFit: BoxFit.contain,
      );
      final image = item.child() as Image;
      expect(image.image, isA<ImpaktfullUiXFileImage>());
      expect((image.image as ImpaktfullUiXFileImage).file, same(xFile));
      expect(image.fit, BoxFit.contain);
      expect(item.xFile, same(xFile));
      expect(item.bytes, isNull);
    });

    test('the hero tag is the path, or unique without a path', () {
      final withPath = ImpaktfullUiGalleryItem.xFile(
        xFile: XFile('images/red.png'),
      );
      expect(withPath.heroTag, 'images/red.png');

      // XFile.fromData has no path on io and a unique blob url on the web
      final first = ImpaktfullUiGalleryItem.xFile(
        xFile: XFile.fromData(testPngBytes),
      );
      final second = ImpaktfullUiGalleryItem.xFile(
        xFile: XFile.fromData(testPngBytes),
      );
      expect(first.heroTag, isNotEmpty);
      expect(first.heroTag, isNot(second.heroTag));
    });
  });

  group('ImpaktfullUiXFileImage', () {
    testWidgets('decodes the bytes of the XFile', (tester) async {
      final provider = ImpaktfullUiXFileImage(
        XFile.fromData(testPngBytes, name: 'red.png'),
      );
      await pumpComponent(tester, Image(image: provider));
      await _decodeImages(tester, 1);
      final rawImage =
          tester.widget<RawImage>(_decodedImage(find.byType(Image)));
      expect(rawImage.image!.width, testPngWidth);
      expect(rawImage.image!.height, testPngHeight);
    });

    test('an empty XFile reports an error', () async {
      TestWidgetsFlutterBinding.ensureInitialized();
      final provider = ImpaktfullUiXFileImage(
        XFile.fromData(Uint8List(0), name: 'empty.png'),
      );
      final error = Completer<Object>();
      provider.resolve(ImageConfiguration.empty).addListener(
            ImageStreamListener(
              (_, __) => error.completeError('decoded an empty file'),
              onError: (e, _) => error.complete(e),
            ),
          );
      expect(await error.future, isA<StateError>());
    });

    test('equality uses the identity of the XFile', () {
      final xFile = XFile.fromData(testPngBytes);
      expect(ImpaktfullUiXFileImage(xFile), ImpaktfullUiXFileImage(xFile));
      expect(
        ImpaktfullUiXFileImage(xFile).hashCode,
        ImpaktfullUiXFileImage(xFile).hashCode,
      );
      expect(
        ImpaktfullUiXFileImage(xFile),
        isNot(ImpaktfullUiXFileImage(XFile.fromData(testPngBytes))),
      );
      expect(
        ImpaktfullUiXFileImage(xFile),
        isNot(ImpaktfullUiXFileImage(xFile, scale: 2)),
      );
    });
  });

  testWidgets('the gallery shows bytes and XFile items', (tester) async {
    final items = [
      ImpaktfullUiGalleryItem.bytes(title: 'Bytes', bytes: testPngBytes),
      ImpaktfullUiGalleryItem.xFile(
        title: 'XFile',
        xFile: XFile.fromData(testPngBytes, name: 'red.png'),
      ),
    ];
    await pumpComponent(
      tester,
      ImpaktfullUiGallery(items: items, noDataLabel: 'No items'),
    );
    await _decodeImages(tester, 2);
    expect(tester.takeException(), isNull);
    expect(_decodedImage(find.byType(Image)), findsNWidgets(2));
  });
}

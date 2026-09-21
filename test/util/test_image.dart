import 'dart:typed_data';
import 'dart:ui' as ui;

/// A red PNG of 8 by 4 pixels.
///
/// Inline bytes instead of a file in `test/assets`: the tests also run in
/// Chrome, where `dart:io` can not read files.
final testPngBytes = Uint8List.fromList(const [
  137, 80, 78, 71, 13, 10, 26, 10, 0, 0, 0, 13, 73, 72, 68, 82, 0, 0, 0, 8, //
  0, 0, 0, 4, 8, 6, 0, 0, 0, 179, 205, 126, 240, 0, 0, 0, 18, 73, 68, 65,
  84, 120, 218, 99, 248, 207, 192, 240, 31, 31, 102, 160, 189, 2, 0, 112, 244,
  63, 193, 132, 114, 250, 194, 0, 0, 0, 0, 73, 69, 78, 68, 174, 66, 96, 130,
]);

const testPngWidth = 8;
const testPngHeight = 4;

/// Encodes an image once, outside the fake time of a widget test. Call it in
/// `setUpAll` of a test that encodes images inside `testWidgets` (e.g. the
/// PNG of a crop).
///
/// With Wasm (skwasm) the first encoding sets up how the results come back,
/// in the zone of its caller. When that is the fake zone of a widget test,
/// the results of every later test are delivered to that finished test and
/// never arrive.
Future<void> warmUpImageEncoding() async {
  final recorder = ui.PictureRecorder();
  ui.Canvas(recorder).drawRect(
    const ui.Rect.fromLTWH(0, 0, 1, 1),
    ui.Paint(),
  );
  final image = recorder.endRecording().toImageSync(1, 1);
  await image.toByteData(format: ui.ImageByteFormat.png);
  image.dispose();
}

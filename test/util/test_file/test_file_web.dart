import 'dart:typed_data';

import 'package:web/web.dart' as web;

/// Reads [path], relative to the root of the package (e.g. `test/assets/...`).
///
/// `flutter test --platform chrome` serves the `test` directory at the root
/// of its server, so `test/assets/x` is fetched from `/assets/x`.
///
/// Synchronous, like the dart:io version: real asynchronous I/O never
/// completes inside the fake time of `testWidgets`.
Uint8List readTestFile(String path) {
  const testDirectory = 'test/';
  if (!path.startsWith(testDirectory)) {
    throw ArgumentError.value(path, 'path', 'must be in $testDirectory');
  }
  final url = '/${path.substring(testDirectory.length)}';
  final request = web.XMLHttpRequest()
    ..open('GET', url, false)
    // A synchronous request can not return an ArrayBuffer: read the bytes as
    // characters without decoding them.
    ..overrideMimeType('text/plain; charset=x-user-defined')
    ..send();
  if (request.status != 200) {
    throw StateError('Could not load $url: ${request.status}');
  }
  final text = request.responseText;
  final bytes = Uint8List(text.length);
  for (var i = 0; i < text.length; i++) {
    bytes[i] = text.codeUnitAt(i) & 0xff;
  }
  return bytes;
}

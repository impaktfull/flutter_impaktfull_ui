import 'dart:io';
import 'dart:typed_data';

/// Reads [path], relative to the root of the package (e.g. `test/assets/...`).
///
/// Synchronous: real asynchronous I/O never completes inside the fake time of
/// `testWidgets`.
Uint8List readTestFile(String path) => File(path).readAsBytesSync();

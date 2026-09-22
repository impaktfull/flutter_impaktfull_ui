// Reads a file of the repository in a test, on the Dart VM and in Chrome
// (tool/test_web.sh), without importing dart:io on the web.
export 'test_file_io.dart' if (dart.library.js_interop) 'test_file_web.dart';

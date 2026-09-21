// The only way `lib/` may use `dart:io` for files: behind this conditional
// export.
//
// On platforms with `dart:io` (Android, iOS, macOS, Windows and Linux) `File`
// is the `File` of `dart:io`. On the web (JS and Wasm, both have
// `dart.library.js_interop`), where `dart:io` is not available, `File` is an
// alias of `Object` and every helper throws an [UnsupportedError]. This keeps
// the deprecated `File` APIs source compatible on every platform, without
// importing `dart:io` in a web build.
export 'io_file_io.dart' if (dart.library.js_interop) 'io_file_stub.dart';

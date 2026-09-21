// Runs on the Dart VM and in Chrome (tool/test_web.sh).
//
// The deprecated `dart:io` File APIs go through lib/src/util/io_file/io_file.dart,
// so a web build never imports `dart:io`. On the web `File` is an alias of
// `Object` and reading one throws an UnsupportedError that names the
// replacement.

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/src/util/io_file/io_file.dart' as io_file;
import 'package:impaktfull_ui/src/util/io_file/io_file_stub.dart' as stub;

void main() {
  test('the stub can not read a file', () async {
    final file = Object();
    expect(stub.ioFilePath(file), isNull);
    expect(
      () => stub.ioFileImage(file, fit: BoxFit.cover),
      throwsA(isA<UnsupportedError>().having(
        (e) => e.message,
        'message',
        contains('XFile'),
      )),
    );
    await expectLater(
      stub.readIoFileBytes(file),
      throwsA(isA<UnsupportedError>()),
    );
  });

  test('the web uses the stub, every other platform dart:io', () {
    // On the web `File` is `Object`, on io it is the `File` of dart:io
    const isObject = identical(io_file.File, Object);
    expect(isObject, kIsWeb);
  });
}

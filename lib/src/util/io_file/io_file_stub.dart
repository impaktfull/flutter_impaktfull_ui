import 'dart:typed_data';

import 'package:flutter/widgets.dart';

/// `dart:io` is not available on this platform (the web), so a `File` of
/// `dart:io` can not be read. `Object` keeps code that passes one compiling.
typedef File = Object;

String? ioFilePath(File file) => null;

Future<Uint8List> readIoFileBytes(File file) =>
    Future.error(_unsupported(), StackTrace.current);

Widget ioFileImage(File file, {BoxFit? fit}) => throw _unsupported();

UnsupportedError _unsupported() => UnsupportedError(
      'A dart:io File can not be read on the web. '
      'Use bytes (Uint8List) or an XFile instead.',
    );

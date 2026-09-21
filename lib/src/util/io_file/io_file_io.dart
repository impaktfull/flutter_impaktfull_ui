import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/widgets.dart';

export 'dart:io' show File;

/// The path of [file], used as a stable identifier.
String? ioFilePath(File file) => file.path;

/// Reads the bytes of [file].
Future<Uint8List> readIoFileBytes(File file) => file.readAsBytes();

/// Shows the image in [file].
Widget ioFileImage(File file, {BoxFit? fit}) => Image.file(file, fit: fit);

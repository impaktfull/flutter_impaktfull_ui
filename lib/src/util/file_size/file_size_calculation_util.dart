import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/util/locale/locale_util.dart';

class FileSizeCalculationUtil {
  const FileSizeCalculationUtil._();

  /// Formats [bytes], e.g. `1.50 MB`. With a [context], the number uses the
  /// decimal separator of the locale (e.g. `1,50 MB` for `nl`).
  static String calculateFileSize(int bytes, {BuildContext? context}) {
    const suffixes = ['B', 'KB', 'MB', 'GB', 'TB'];
    if (bytes == 0) return '0 ${suffixes[0]}';

    final i = (log(bytes) / log(1024)).floor();
    final value = bytes / pow(1024, i);
    final size = context == null
        ? value.toStringAsFixed(2)
        : ImpaktfullUiLocaleUtil.formatDecimal(context, value);

    return '$size ${suffixes[i]}';
  }
}

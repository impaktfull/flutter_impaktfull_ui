import 'dart:math';

class FileSizeCalculationUtil {
  static String calculateFileSize(int? bytes) {
    if (bytes == null) return '0 B';
    const suffixes = ['B', 'KB', 'MB', 'GB', 'TB'];
    if (bytes == 0) return '0 ${suffixes[0]}';

    final i = (log(bytes) / log(1024)).floor();
    final size = (bytes / pow(1024, i)).toStringAsFixed(2);

    return '$size ${suffixes[i]}';
  }
}

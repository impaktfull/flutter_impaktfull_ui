// Prints a line coverage summary of `lib/` from an lcov file and fails when
// the total is below a minimum.
//
// Usage (after `flutter test --coverage`):
//
//   dart run tool/coverage/bin/coverage_summary.dart [--min <percent>] [--lcov <path>]
//
// Only depends on `dart:io`, so it runs without a `pub get` of its own.
import 'dart:io';

const _defaultLcovPath = 'coverage/lcov.info';
const _includePrefix = 'lib/';

void main(List<String> args) {
  var lcovPath = _defaultLcovPath;
  double? minimum;
  for (var i = 0; i < args.length; i++) {
    final arg = args[i];
    if (arg == '--lcov' && i + 1 < args.length) {
      lcovPath = args[++i];
    } else if (arg == '--min' && i + 1 < args.length) {
      minimum = double.tryParse(args[++i]);
      if (minimum == null) _fail('--min expects a number, got "${args[i]}"');
    } else if (arg == '-h' || arg == '--help') {
      stdout.writeln(
          'Usage: dart run tool/coverage/bin/coverage_summary.dart [--min <percent>] [--lcov <path>]');
      return;
    } else {
      _fail('Unknown argument "$arg"');
    }
  }

  final file = File(lcovPath);
  if (!file.existsSync()) {
    _fail('$lcovPath not found, run `flutter test --coverage` first');
  }

  final files = parseLcov(file.readAsLinesSync())
    ..removeWhere((path, _) => !_normalize(path).startsWith(_includePrefix));
  if (files.isEmpty) _fail('No coverage found for $_includePrefix');

  // Group per directory directly under lib/src (e.g. lib/src/components).
  final groups = <String, FileCoverage>{};
  final total = FileCoverage();
  for (final entry in files.entries) {
    final path = _normalize(entry.key);
    final parts = path.split('/');
    final group = parts.length > 3 && parts[1] == 'src'
        ? parts.take(3).join('/')
        : parts.length > 2
            ? parts.take(2).join('/')
            : path;
    groups.putIfAbsent(group, FileCoverage.new).add(entry.value);
    total.add(entry.value);
  }

  final sortedGroups = groups.keys.toList()..sort();
  final width = sortedGroups.fold<int>(
      'Total'.length, (w, e) => e.length > w ? e.length : w);
  stdout.writeln('Line coverage of $_includePrefix (${files.length} files)');
  stdout.writeln('');
  for (final group in sortedGroups) {
    stdout.writeln(_row(group, groups[group]!, width));
  }
  stdout.writeln('-' * (width + 30));
  stdout.writeln(_row('Total', total, width));

  final percentage = total.percentage;
  if (minimum != null) {
    stdout.writeln('');
    if (percentage + 1e-9 < minimum) {
      _fail('Coverage ${percentage.toStringAsFixed(2)}% is below the minimum '
          'of ${minimum.toStringAsFixed(2)}%');
    }
    stdout.writeln('Coverage ${percentage.toStringAsFixed(2)}% meets the '
        'minimum of ${minimum.toStringAsFixed(2)}%');
  }
}

class FileCoverage {
  var found = 0;
  var hit = 0;

  double get percentage => found == 0 ? 100 : hit * 100 / found;

  void add(FileCoverage other) {
    found += other.found;
    hit += other.hit;
  }
}

/// Parses the `SF`, `DA`, `LF` and `LH` records of an lcov file.
///
/// Line hits are counted from the `DA` records. The same file can be listed
/// more than once, a line counts as hit when any record hits it.
Map<String, FileCoverage> parseLcov(List<String> lines) {
  final lineHits = <String, Map<int, bool>>{};
  String? current;
  for (final line in lines) {
    if (line.startsWith('SF:')) {
      current = line.substring(3).trim();
      lineHits.putIfAbsent(current, () => {});
    } else if (line.startsWith('DA:') && current != null) {
      final values = line.substring(3).split(',');
      if (values.length < 2) continue;
      final lineNumber = int.tryParse(values[0]);
      final hits = int.tryParse(values[1]);
      if (lineNumber == null || hits == null) continue;
      final map = lineHits[current]!;
      map[lineNumber] = (map[lineNumber] ?? false) || hits > 0;
    } else if (line.trim() == 'end_of_record') {
      current = null;
    }
  }
  return lineHits.map((path, hits) => MapEntry(
        path,
        FileCoverage()
          ..found = hits.length
          ..hit = hits.values.where((e) => e).length,
      ));
}

String _normalize(String path) {
  final normalized = path.replaceAll('\\', '/');
  if (normalized.startsWith(_includePrefix)) return normalized;
  // Absolute paths: keep everything from the last `/lib/`.
  final libIndex = normalized.lastIndexOf('/$_includePrefix');
  if (libIndex == -1) return normalized;
  return normalized.substring(libIndex + 1);
}

String _row(String name, FileCoverage coverage, int width) {
  final percentage = '${coverage.percentage.toStringAsFixed(2)}%'.padLeft(8);
  final lines = '${coverage.hit}/${coverage.found}'.padLeft(13);
  return '${name.padRight(width)}  $percentage  $lines lines';
}

Never _fail(String message) {
  stderr.writeln(message);
  exit(1);
}

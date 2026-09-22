import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

/// In Chrome (tool/test_web.sh) a failing test only reports "Test failed. See
/// exception logs above.": the exception itself goes to the console of the
/// browser. Print it, so it shows up in the output of `flutter test` and CI.
Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  if (kIsWeb) {
    final report = reportTestException;
    reportTestException = (details, testDescription) {
      // ignore: avoid_print
      print(details.toString());
      report(details, testDescription);
    };
  }
  await testMain();
}

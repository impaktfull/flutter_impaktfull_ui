import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../_overlays_golden_helpers.dart';

Widget _list() => ImpaktfullUiRefreshIndicator(
      // Never completes: the golden shows the indicator while refreshing.
      onRefresh: () => Completer<void>().future,
      child: ListView(
        children: [
          for (var i = 1; i <= 10; i++) ListTile(title: Text('Item $i')),
        ],
      ),
    );

void main() {
  setUp(() => setupComponentTest());

  runOverlayGoldenTest(
    fileName: 'impaktfull_ui_refresh_indicator_idle',
    size: const Size(300, 240),
    builder: _list,
  );

  runOverlayGoldenTest(
    fileName: 'impaktfull_ui_refresh_indicator_refreshing',
    size: const Size(300, 240),
    builder: _list,
    whilePerforming: (tester) async {
      await tester.fling(find.text('Item 1'), const Offset(0, 300), 1000);
      // The indicator keeps spinning: pump a fixed time instead of settling.
      for (var i = 0; i < 14; i++) {
        await tester.pump(const Duration(milliseconds: 100));
      }
      return null;
    },
  );
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/screen_size_util.dart';
import '../../../util/test_util.dart';

void main() {
  for (final size in const [Size(400, 800), Size(1600, 800)]) {
    testWidgets('shows the badge (${size.width})', (tester) async {
      setScreenSize(tester, size);
      await pumpAndSettleComponent(
        tester,
        const ImpaktfullUiAdaptiveNavBar(
          title: 'Title',
          badge: 'Beta',
        ),
      );
      expect(find.text('Title'), findsOneWidget);
      expect(find.text('Beta'), findsOneWidget);
    });
  }

  testWidgets('small screen async action can finish after being removed',
      (tester) async {
    setScreenSize(tester, const Size(400, 800));
    final completer = Completer<void>();
    var showNavBar = true;
    late StateSetter setState;
    await pumpAndSettleComponent(
      tester,
      StatefulBuilder(builder: (context, setter) {
        setState = setter;
        if (!showNavBar) return const SizedBox();
        return ImpaktfullUiAdaptiveNavBar(
          title: 'Title',
          actions: [
            ImpaktfullUiAdaptiveNavBarActionItem(
              title: 'Save',
              asset: ImpaktfullUiAsset.icon(Icons.save),
              onAsyncTap: () => completer.future,
            ),
          ],
        );
      }),
    );
    await tester.tap(find.byTooltip('Save'));
    await tester.pump();
    expect(find.byType(ImpaktfullUiLoadingIndicator), findsOneWidget);

    setState(() => showNavBar = false);
    await tester.pumpAndSettle();

    completer.complete();
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
  });
}

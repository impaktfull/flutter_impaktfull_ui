import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/screen_size_util.dart';

void main() {
  final asset = ImpaktfullUiAsset.icon(Icons.add);

  Widget buildMasterDetail({
    required bool hasDetail,
    required VoidCallback onCloseDetail,
    VoidCallback? onDetailBuilt,
  }) =>
      ImpaktfullUiMasterDetail(
        title: 'Master',
        actions: [
          ImpaktfullUiAdaptiveNavBarActionItem(
            title: 'Master action',
            asset: asset,
            onTap: () {},
          ),
        ],
        navigation: const Text('navigation'),
        onCloseDetail: onCloseDetail,
        detail: (context) {
          if (!hasDetail) return null;
          return Builder(builder: (context) {
            onDetailBuilt?.call();
            return ImpaktfullUiMasterDetailItemScreen(
              title: 'Detail',
              // A new list (and new items) on every build, as in most apps.
              actions: [
                ImpaktfullUiAdaptiveNavBarActionItem(
                  title: 'Detail action',
                  asset: asset,
                  onTap: () {},
                ),
              ],
              headerBottomChild: const SizedBox(height: 1),
              child: const Text('detail'),
            );
          });
        },
      );

  Future<void> pumpApp(WidgetTester tester, Widget child) =>
      tester.pumpWidget(ImpaktfullUiApp(
        title: 'app',
        showDebugFlag: false,
        home: Material(child: child),
      ));

  for (final size in const [Size(400, 800), Size(1600, 800)]) {
    testWidgets('detail does not rebuild in a loop (${size.width})',
        (tester) async {
      setScreenSize(tester, size);
      var detailBuilds = 0;
      await pumpApp(
        tester,
        buildMasterDetail(
          hasDetail: true,
          onCloseDetail: () {},
          onDetailBuilt: () => detailBuilds++,
        ),
      );
      for (var i = 0; i < 10; i++) {
        await tester.pump();
      }
      final buildsAfterSettling = detailBuilds;
      for (var i = 0; i < 10; i++) {
        await tester.pump();
      }
      expect(detailBuilds, buildsAfterSettling);
      expect(tester.binding.hasScheduledFrame, isFalse);
      // Small screens show an icon button with a tooltip, bigger screens a
      // button with a title.
      expect(
        find.byTooltip('Detail action').evaluate().length +
            find.text('Detail action').evaluate().length,
        1,
      );
    });
  }

  testWidgets('master actions come back after closing the detail',
      (tester) async {
    setScreenSize(tester, const Size(400, 800));
    var hasDetail = true;
    await pumpApp(
      tester,
      StatefulBuilder(
        builder: (context, setState) => buildMasterDetail(
          hasDetail: hasDetail,
          onCloseDetail: () => setState(() => hasDetail = false),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byTooltip('Detail action'), findsOneWidget);
    expect(find.byTooltip('Master action'), findsNothing);

    await tester.tap(find.byTooltip('Back'));
    await tester.pumpAndSettle();

    expect(find.text('navigation'), findsOneWidget);
    expect(find.byTooltip('Detail action'), findsNothing);
    expect(find.byTooltip('Master action'), findsOneWidget);
    expect(find.text('Master'), findsOneWidget);
  });
}

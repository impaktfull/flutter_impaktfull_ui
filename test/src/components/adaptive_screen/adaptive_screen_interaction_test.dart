import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../_layout_test_helpers.dart';

void main() {
  Widget screen({
    VoidCallback? onBackTapped,
    bool isDrawerEnabled = false,
    Widget? drawer,
    List<ImpaktfullUiAdaptiveNavBarActionItem> actions = const [],
  }) =>
      ImpaktfullUiAdaptiveScreen(
        title: 'Title',
        onBackTapped: onBackTapped,
        isDrawerEnabled: isDrawerEnabled,
        drawer: drawer,
        actions: actions,
        builder: (context) => const Text('small'),
        mediumBuilder: (context) => const Text('medium'),
        largeBuilder: (context) => const Text('large'),
        extraLargeBuilder: (context) => const Text('extraLarge'),
      );

  final builderCases = <double, String>{
    400: 'small',
    1024: 'small',
    1025: 'medium',
    1440: 'medium',
    1441: 'large',
    1920: 'large',
    1921: 'extraLarge',
  };
  for (final entry in builderCases.entries) {
    testWidgets('width ${entry.key} uses the ${entry.value} builder',
        (tester) async {
      await pumpLayoutApp(tester, screen(), size: Size(entry.key, 800));
      expect(find.text(entry.value), findsOneWidget);
    });
  }

  testWidgets('falls back to the small builder', (tester) async {
    await pumpLayoutApp(
      tester,
      ImpaktfullUiAdaptiveScreen(builder: (context) => const Text('small')),
      size: largeScreenSize,
    );
    expect(find.text('small'), findsOneWidget);
  });

  for (final size in [smallScreenSize, mediumScreenSize]) {
    testWidgets('back calls onBackTapped (${size.width})', (tester) async {
      var taps = 0;
      await pumpLayoutApp(
        tester,
        screen(onBackTapped: () => taps++),
        size: size,
      );
      await tester.tap(find.byTooltip('Back'));
      await tester.pumpAndSettle();
      expect(taps, 1);
    });

    testWidgets('the drawer button opens the drawer (${size.width})',
        (tester) async {
      await pumpLayoutApp(
        tester,
        screen(
          isDrawerEnabled: true,
          drawer: const SizedBox(width: 200, child: Text('drawer')),
        ),
        size: size,
      );
      expect(find.text('drawer'), findsNothing);
      await tester.tap(find.byType(ImpaktfullUiIconButton));
      await tester.pumpAndSettle();
      expect(find.text('drawer'), findsOneWidget);
    });
  }

  testWidgets('no drawer button when the drawer is not enabled',
      (tester) async {
    await pumpLayoutApp(
      tester,
      screen(drawer: const SizedBox(width: 200, child: Text('drawer'))),
    );
    expect(find.byTooltip('Open Drawer'), findsNothing);
    expect(find.byType(ImpaktfullUiIconButton), findsNothing);
  });

  testWidgets('actions are icon buttons on small and buttons on bigger screens',
      (tester) async {
    var taps = 0;
    final actions = [
      ImpaktfullUiAdaptiveNavBarActionItem(
        title: 'Add',
        asset: testAsset,
        onTap: () => taps++,
      ),
    ];
    await pumpLayoutApp(tester, screen(actions: actions));
    await tester.tap(find.byTooltip('Add'));
    await tester.pumpAndSettle();

    await pumpLayoutApp(tester, screen(actions: actions),
        size: mediumScreenSize);
    await tester.tap(find.text('Add'));
    await tester.pumpAndSettle();
    expect(taps, 2);
  });

  testWidgets('shows the fab above the content', (tester) async {
    var taps = 0;
    await pumpLayoutApp(
      tester,
      ImpaktfullUiAdaptiveScreen(
        fab: ImpaktfullUiFloatingActionButton(
          asset: testAsset,
          onTap: () => taps++,
        ),
        builder: (context) => const SizedBox.expand(),
      ),
    );
    final fab = find.byType(ImpaktfullUiFloatingActionButton);
    expect(tester.getBottomRight(fab).dx, smallScreenSize.width - 16);
    await tester.tap(fab);
    await tester.pumpAndSettle();
    expect(taps, 1);
  });
}

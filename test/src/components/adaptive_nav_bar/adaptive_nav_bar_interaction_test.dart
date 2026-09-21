import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../_layout_test_helpers.dart';

void main() {
  testWidgets('renders nothing without content', (tester) async {
    await pumpLayoutApp(
      tester,
      const Align(child: ImpaktfullUiAdaptiveNavBar()),
    );
    expect(find.byType(ImpaktfullUiNavBar), findsNothing);
    expect(find.byType(ImpaktfullUiCmsHeader), findsNothing);
    expect(
      tester.getSize(find.byType(ImpaktfullUiAdaptiveNavBar)),
      Size.zero,
    );
  });

  final sizes = {
    smallScreenSize: ImpaktfullUiNavBar,
    mediumScreenSize: ImpaktfullUiCmsHeader,
    largeScreenSize: ImpaktfullUiCmsHeader,
  };
  for (final entry in sizes.entries) {
    final width = entry.key.width;
    testWidgets('uses ${entry.value} at width $width', (tester) async {
      await pumpLayoutApp(
        tester,
        const ImpaktfullUiAdaptiveNavBar(title: 'Title'),
        size: entry.key,
      );
      expect(find.byType(entry.value), findsOneWidget);
    });

    testWidgets('back calls onBackTapped at width $width', (tester) async {
      var taps = 0;
      await pumpLayoutApp(
        tester,
        ImpaktfullUiAdaptiveNavBar(
          title: 'Title',
          onBackTapped: () => taps++,
        ),
        size: entry.key,
      );
      await tester.tap(find.byTooltip('Back'));
      await tester.pumpAndSettle();
      expect(taps, 1);
    });

    testWidgets('drawer calls onDrawerTapped at width $width', (tester) async {
      var taps = 0;
      await pumpLayoutApp(
        tester,
        ImpaktfullUiAdaptiveNavBar(
          title: 'Title',
          onDrawerTapped: () => taps++,
        ),
        size: entry.key,
      );
      await tester.tap(find.byType(ImpaktfullUiIconButton));
      await tester.pumpAndSettle();
      expect(taps, 1);
    });
  }

  testWidgets('small screens show actions as icon buttons', (tester) async {
    var taps = 0;
    await pumpLayoutApp(
      tester,
      ImpaktfullUiAdaptiveNavBar(
        title: 'Title',
        actions: [
          ImpaktfullUiAdaptiveNavBarActionItem(
            title: 'Add',
            asset: testAsset,
            onTap: () => taps++,
          ),
        ],
      ),
    );
    expect(find.text('Add'), findsNothing);
    expect(find.byType(ImpaktfullUiButton), findsNothing);
    await tester.tap(find.byTooltip('Add'));
    await tester.pumpAndSettle();
    expect(taps, 1);
  });

  testWidgets('bigger screens show actions as buttons with a title',
      (tester) async {
    var taps = 0;
    await pumpLayoutApp(
      tester,
      ImpaktfullUiAdaptiveNavBar(
        title: 'Title',
        actions: [
          ImpaktfullUiAdaptiveNavBarActionItem(
            title: 'Add',
            asset: testAsset,
            type: ImpaktfullUiAdaptiveNavBarActionItemType.secondary,
            onTap: () => taps++,
          ),
        ],
      ),
      size: mediumScreenSize,
    );
    final button = tester.widget<ImpaktfullUiButton>(
      find.byType(ImpaktfullUiButton),
    );
    expect(button.type, ImpaktfullUiButtonType.secondary);
    await tester.tap(find.text('Add'));
    await tester.pumpAndSettle();
    expect(taps, 1);
  });

  testWidgets('small screens add padding below horizontal tabs',
      (tester) async {
    await pumpLayoutApp(
      tester,
      ImpaktfullUiAdaptiveNavBar(
        title: 'Title',
        bottomChild: ImpaktfullUiHorizontalTabs<int>(
          selectedValue: 0,
          onTabSelected: (_) {},
          tabs: [ImpaktfullUiHorizontalTabConfig(label: 'Tab', value: 0)],
        ),
      ),
    );
    final padding = tester.widget<Padding>(find
        .ancestor(
          of: find.byType(ImpaktfullUiHorizontalTabs<int>),
          matching: find.byType(Padding),
        )
        .first);
    expect(padding.padding, const EdgeInsets.only(bottom: 8));
  });

  testWidgets('small screens do not add padding below other children',
      (tester) async {
    await pumpLayoutApp(
      tester,
      const ImpaktfullUiAdaptiveNavBar(
        title: 'Title',
        bottomChild: Text('bottom'),
      ),
    );
    final paddings = tester.widgetList<Padding>(find.ancestor(
      of: find.text('bottom'),
      matching: find.byType(Padding),
    ));
    expect(
      paddings.where((p) => p.padding == const EdgeInsets.only(bottom: 8)),
      isEmpty,
    );
  });
}

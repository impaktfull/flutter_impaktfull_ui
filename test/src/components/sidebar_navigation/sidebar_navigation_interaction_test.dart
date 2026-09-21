import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../_layout_test_helpers.dart';

void main() {
  testWidgets('selecting items updates the selection', (tester) async {
    var selected = 'Home';
    await pumpLayoutApp(
      tester,
      StatefulBuilder(
        builder: (context, setState) => ImpaktfullUiSidebarNavigation(
          items: [
            for (final title in ['Home', 'Settings'])
              ImpaktfullUiSidebarNavigationItem(
                title: title,
                isSelected: selected == title,
                onTap: () => setState(() => selected = title),
              ),
          ],
        ),
      ),
    );
    List<bool> selection() => tester
        .widgetList<ImpaktfullUiSidebarNavigationItem>(
            find.byType(ImpaktfullUiSidebarNavigationItem))
        .map((item) => item.isSelected)
        .toList();
    expect(selection(), [true, false]);

    await tester.tap(find.text('Settings'));
    await tester.pumpAndSettle();
    expect(selected, 'Settings');
    expect(selection(), [false, true]);
  });

  testWidgets('has the given width', (tester) async {
    await pumpLayoutApp(
      tester,
      const Align(
        alignment: Alignment.centerLeft,
        child: ImpaktfullUiSidebarNavigation(width: 250),
      ),
      size: largeScreenSize,
    );
    expect(
      tester.getSize(find.byType(ImpaktfullUiSidebarNavigation)).width,
      250,
    );
  });

  testWidgets('is not wider than the available width', (tester) async {
    await pumpLayoutApp(
      tester,
      const Align(
        alignment: Alignment.centerLeft,
        child: SizedBox(
          width: 200,
          child: ImpaktfullUiSidebarNavigation(width: 350),
        ),
      ),
    );
    expect(
      tester.getSize(find.byType(ImpaktfullUiSidebarNavigation)).width,
      200,
    );
  });

  testWidgets('shows header, footer items and footer', (tester) async {
    var helpTaps = 0;
    await pumpLayoutApp(
      tester,
      ImpaktfullUiSidebarNavigation(
        header: const Text('Header'),
        items: const [ImpaktfullUiSidebarNavigationItem(title: 'Home')],
        footerItems: [
          ImpaktfullUiSidebarNavigationItem(
            title: 'Help',
            onTap: () => helpTaps++,
          ),
        ],
        footer: const Text('Footer'),
      ),
    );
    final header = tester.getRect(find.text('Header'));
    final home = tester.getRect(find.text('Home'));
    final help = tester.getRect(find.text('Help'));
    final footer = tester.getRect(find.text('Footer'));
    expect(header.top, lessThan(home.top));
    expect(home.top, lessThan(help.top));
    expect(help.top, lessThan(footer.top));
    // The footer is at the bottom, below a divider.
    expect(footer.bottom, greaterThan(smallScreenSize.height - 100));
    expect(find.byType(ImpaktfullUiDivider), findsOneWidget);

    await tester.tap(find.text('Help'));
    await tester.pumpAndSettle();
    expect(helpTaps, 1);
  });

  testWidgets('content replaces the items', (tester) async {
    await pumpLayoutApp(
      tester,
      const ImpaktfullUiSidebarNavigation(
        content: Text('content'),
        items: [ImpaktfullUiSidebarNavigationItem(title: 'Home')],
      ),
    );
    expect(find.text('content'), findsOneWidget);
    expect(find.text('Home'), findsNothing);
  });

  testWidgets('secondary items are shown next to the items', (tester) async {
    await pumpLayoutApp(
      tester,
      const Align(
        alignment: Alignment.centerLeft,
        child: ImpaktfullUiSidebarNavigation(
          width: 250,
          items: [ImpaktfullUiSidebarNavigationItem(title: 'Home')],
          secondaryItems: [
            ImpaktfullUiSidebarNavigationItem(title: 'Secondary'),
          ],
        ),
      ),
      size: largeScreenSize,
    );
    expect(
      tester.getTopLeft(find.text('Secondary')).dx,
      greaterThan(250),
    );
    // 250 + 1 (divider) + 300 (secondary items)
    expect(
      tester.getSize(find.byType(ImpaktfullUiSidebarNavigation)).width,
      551,
    );
  });

  testWidgets('secondary content replaces the secondary items', (tester) async {
    await pumpLayoutApp(
      tester,
      const ImpaktfullUiSidebarNavigation(
        width: 250,
        secondaryContent: SizedBox(width: 100, child: Text('secondary')),
        secondaryItems: [
          ImpaktfullUiSidebarNavigationItem(title: 'Secondary'),
        ],
      ),
      size: largeScreenSize,
    );
    expect(find.text('secondary'), findsOneWidget);
    expect(find.text('Secondary'), findsNothing);
  });

  testWidgets('adds the start, top and bottom safe area', (tester) async {
    await pumpLayoutApp(
      tester,
      Builder(
        builder: (context) => MediaQuery(
          data: MediaQuery.of(context).copyWith(
            padding: const EdgeInsets.fromLTRB(20, 30, 40, 50),
          ),
          child: const Align(
            alignment: Alignment.centerLeft,
            child: ImpaktfullUiSidebarNavigation(
              width: 200,
              content: SizedBox(
                width: double.infinity,
                height: 100,
                key: Key('content'),
              ),
            ),
          ),
        ),
      ),
    );
    final content = tester.getRect(find.byKey(const Key('content')));
    expect(content.left, 20);
    expect(content.top, greaterThanOrEqualTo(30));
    expect(content.width, 200);
  });
}

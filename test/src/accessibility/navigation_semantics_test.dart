import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '_accessibility_test_helpers.dart';

void main() {
  testWidgets('bottom navigation items are selectable buttons with a label',
      (tester) async {
    final handle = tester.ensureSemantics();
    await pumpAccessibilityApp(
      tester,
      Row(
        children: [
          ImpaktfullUiBottomNavigationItem(
            asset: ImpaktfullUiAsset.icon(Icons.home),
            label: 'Home',
            isSelected: true,
            onTap: () {},
          ),
          ImpaktfullUiBottomNavigationItem(
            asset: ImpaktfullUiAsset.icon(Icons.mail),
            label: 'Inbox',
            isSelected: false,
            badgeText: '3',
            onTap: () {},
          ),
        ],
      ),
    );
    expect(
      tester.getSemantics(find.text('Home')),
      matchesSemantics(
        label: 'Home',
        isButton: true,
        hasSelectedState: true,
        isSelected: true,
        isFocusable: true,
        hasTapAction: true,
        hasFocusAction: true,
      ),
    );
    // The badge is announced with the item.
    expect(
      tester.getSemantics(find.text('Inbox')),
      isSemantics(
        label: '3 notifications\nInbox',
        isButton: true,
        isSelected: false,
        hasSelectedState: true,
      ),
    );
    handle.dispose();
  });

  testWidgets('tab bar items are tabs with a selected state', (tester) async {
    final handle = tester.ensureSemantics();
    await pumpAccessibilityApp(
      tester,
      DefaultTabController(
        length: 2,
        child: Builder(
          builder: (context) => Row(
            children: [
              ImpaktfullUiTabBarItem(
                label: 'Details',
                index: 0,
                controller: DefaultTabController.of(context),
              ),
              ImpaktfullUiTabBarItem(
                label: 'Reviews',
                index: 1,
                controller: DefaultTabController.of(context),
              ),
            ],
          ),
        ),
      ),
    );
    expect(
      tester.getSemantics(find.text('Details')),
      isSemantics(label: 'Details', isSelected: true, hasTapAction: true),
    );
    expect(
      tester.getSemantics(find.text('Reviews')).getSemanticsData().role,
      SemanticsRole.tab,
    );
    tester.semantics.tap(find.semantics.byLabel('Reviews'));
    await tester.pumpAndSettle();
    expect(
      tester.getSemantics(find.text('Reviews')),
      isSemantics(isSelected: true),
    );
    handle.dispose();
  });

  testWidgets('horizontal tabs are tabs with a selected state', (tester) async {
    final handle = tester.ensureSemantics();
    await pumpAccessibilityApp(
      tester,
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ImpaktfullUiHorizontalTab(
            label: 'All',
            isSelected: true,
            onTap: () {},
          ),
          ImpaktfullUiHorizontalTab(
            label: 'Unread',
            badge: '4',
            onTap: () {},
          ),
        ],
      ),
    );
    expect(
      tester.getSemantics(find.text('All')),
      isSemantics(
        label: 'All',
        isButton: true,
        isSelected: true,
        hasTapAction: true,
      ),
    );
    expect(
      tester.getSemantics(find.text('Unread')),
      isSemantics(label: 'Unread', isSelected: false),
    );
    handle.dispose();
  });

  testWidgets('segmented control segments are selectable buttons',
      (tester) async {
    final handle = tester.ensureSemantics();
    String? changedTo;
    await pumpAccessibilityApp(
      tester,
      ImpaktfullUiSegmentedControl<String>(
        value: 'Day',
        items: const ['Day', 'Week'],
        onChanged: (value) => changedTo = value,
      ),
    );
    expect(
      tester.getSemantics(find.text('Day')),
      isSemantics(
        label: 'Day',
        isButton: true,
        isSelected: true,
        isInMutuallyExclusiveGroup: true,
      ),
    );
    tester.semantics.tap(find.semantics.byLabel('Week'));
    expect(changedTo, 'Week');
    handle.dispose();
  });

  testWidgets('sidebar navigation items announce selected and expanded',
      (tester) async {
    final handle = tester.ensureSemantics();
    await pumpAccessibilityApp(
      tester,
      ImpaktfullUiSidebarNavigationItem(
        title: 'Settings',
        items: [
          ImpaktfullUiSidebarNavigationItem(
            title: 'Profile',
            isSelected: true,
            onTap: () {},
          ),
        ],
      ),
    );
    expect(
      tester.getSemantics(find.text('Settings')),
      isSemantics(
        label: 'Settings',
        isButton: true,
        isSelected: false,
        hasExpandedState: true,
        isExpanded: true,
        hasTapAction: true,
      ),
    );
    expect(
      tester.getSemantics(find.text('Profile')),
      isSemantics(label: 'Profile', isSelected: true),
    );
    tester.semantics.tap(find.semantics.byLabel('Settings'));
    await tester.pumpAndSettle();
    expect(
      tester.getSemantics(find.text('Settings')),
      isSemantics(hasExpandedState: true, isExpanded: false),
    );
    handle.dispose();
  });

  testWidgets('accordion announces expanded', (tester) async {
    final handle = tester.ensureSemantics();
    var expanded = false;
    await pumpAccessibilityApp(
      tester,
      StatefulBuilder(
        builder: (context, setState) => ImpaktfullUiAccordion(
          title: 'Shipping',
          expanded: expanded,
          onExpandedChanged: (value) => setState(() => expanded = value),
          expandedBuilder: (context) => const Text('3 to 5 days'),
        ),
      ),
    );
    expect(
      tester.getSemantics(find.text('Shipping')),
      isSemantics(
        label: 'Shipping',
        hasExpandedState: true,
        isExpanded: false,
        hasTapAction: true,
      ),
    );
    tester.semantics.tap(find.semantics.byLabel('Shipping'));
    await tester.pumpAndSettle();
    expect(
      tester.getSemantics(find.text('Shipping')),
      isSemantics(hasExpandedState: true, isExpanded: true),
    );
    handle.dispose();
  });

  testWidgets('stepper announces every step and the current step',
      (tester) async {
    final handle = tester.ensureSemantics();
    await pumpAccessibilityApp(
      tester,
      ImpaktfullUiStepper.simple(currentStep: 1, amountOfSteps: 3),
    );
    expect(
      find.semantics.byLabel('Step 1 of 3'),
      findsOne,
    );
    expect(
      semanticsWithLabel('Step 1 of 3'),
      isSemantics(value: 'Completed'),
    );
    expect(
      semanticsWithLabel('Step 2 of 3'),
      isSemantics(value: 'Current step'),
    );
    expect(
      semanticsWithLabel('Step 3 of 3'),
      isSemantics(value: ''),
    );
    handle.dispose();
  });

  testWidgets('pagination buttons have a label and the page is announced',
      (tester) async {
    final handle = tester.ensureSemantics();
    var page = 0;
    await pumpAccessibilityApp(
      tester,
      StatefulBuilder(
        builder: (context, setState) =>
            ImpaktfullUiPagination.withAmountOfPages(
          page: page,
          itemsPerPage: 10,
          amountOfPages: 3,
          onLoadPage: (value) => setState(() => page = value),
        ),
      ),
    );
    expect(
      semanticsWithTooltip('Previous page'),
      isSemantics(isButton: true, isEnabled: false),
    );
    expect(
      semanticsWithTooltip('Next page'),
      isSemantics(isButton: true, isEnabled: true, hasTapAction: true),
    );
    expect(
      tester.getSemantics(find.text('Page 1 of 3')),
      isSemantics(label: 'Page 1 of 3', isLiveRegion: true),
    );
    tester.semantics.tap(findSemanticsByTooltip('Next page'));
    await tester.pumpAndSettle();
    expect(find.semantics.byLabel('Page 2 of 3'), findsOne);
    handle.dispose();
  });

  testWidgets('the pagination labels are localized', (tester) async {
    final handle = tester.ensureSemantics();
    await pumpAccessibilityApp(
      tester,
      ImpaktfullUiPagination.withAmountOfPages(
        page: 0,
        itemsPerPage: 10,
        amountOfPages: 3,
        onLoadPage: (_) {},
      ),
      localizations: const ImpaktfullUiLocalizations(
        pagination: ImpaktfullUiPaginationLocalizations(
          previousPage: 'Vorige pagina',
          nextPage: 'Volgende pagina',
        ),
      ),
    );
    expect(findSemanticsByTooltip('Vorige pagina'), findsOne);
    expect(findSemanticsByTooltip('Volgende pagina'), findsOne);
    handle.dispose();
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
// The overlay is built by `ImpaktfullUiDropdown`, which always passes a
// width: only the widget itself can be built without one.
import 'package:impaktfull_ui/src/components/dropdown/widget/dropdown_menu_layout.dart';
import 'package:impaktfull_ui/src/components/dropdown/widget/dropdown_overlay.dart';

import '../_core_test_helpers.dart';

/// Proves that every `dimens` token of a component theme really changes what
/// is rendered: each test asserts the geometry of the built widgets, not the
/// value of the theme.

const _testAsset = ImpaktfullUiAsset.icon(Icons.home);

ImpaktfullUiComponentsTheme get _components =>
    ImpaktfullUiTheme.getDefault().components;

/// Pumps [child] with loose constraints in the top left corner, so a
/// component takes the size it asks for instead of the size of the screen.
Future<void> _pumpLoose(
  WidgetTester tester,
  Widget child, {
  ImpaktfullUiTheme? theme,
}) =>
    pumpImpaktfullUiApp(
      tester,
      Material(
        child: Align(
          alignment: Alignment.topLeft,
          child: child,
        ),
      ),
      theme: theme,
    );

/// Puts [child] in a list, like an `ImpaktfullUiTable` puts its rows in one.
///
/// A table row and a table row item fill the height they are given, so only
/// an unbounded height (what a list gives) shows their minimum height.
Widget _inList(Widget child, {double width = 300}) => SizedBox(
      width: width,
      height: 400,
      child: ListView(children: [child]),
    );

/// The closest ancestor of [of] of type [T], e.g. the `Padding` that a
/// component builds around an asset.
Finder _closestAncestor<T extends Widget>(Finder of) => find
    .ancestor(
      of: of,
      matching: find.byType(T),
    )
    .first;

void main() {
  group('ImpaktfullUiNavBarDimensTheme', () {
    ImpaktfullUiNavBarTheme navBarTheme({
      double? actionSize,
      double? minHeight,
      double? verticalPadding,
      double? sidePadding,
      double? sidePaddingWithActions,
    }) {
      final base = _components.navBar;
      return base.copyWith(
        dimens: base.dimens.copyWith(
          actionSize: actionSize,
          minHeight: minHeight,
          verticalPadding: verticalPadding,
          sidePadding: sidePadding,
          sidePaddingWithActions: sidePaddingWithActions,
        ),
      );
    }

    /// The height of the row of the bar: the bar itself adds a 1px bottom
    /// border and the safe area of the device to it.
    double barHeight(WidgetTester tester) =>
        tester.getSize(_closestAncestor<Container>(find.text('Title'))).height;

    testWidgets('minHeight is the minimum height of the bar', (tester) async {
      await _pumpLoose(tester, const ImpaktfullUiNavBar(title: 'Title'));
      expect(barHeight(tester), 56);

      await _pumpLoose(
        tester,
        ImpaktfullUiNavBar(
          title: 'Title',
          theme: navBarTheme(minHeight: 120),
        ),
      );
      expect(barHeight(tester), 120);
    });

    testWidgets('verticalPadding is added above and below the content',
        (tester) async {
      await _pumpLoose(
        tester,
        ImpaktfullUiNavBar(
          title: 'Title',
          theme: navBarTheme(verticalPadding: 99),
        ),
      );
      // The title is the only content of the bar, so the bar is exactly the
      // title plus the padding above and below it.
      final titleHeight = tester.getSize(find.text('Title')).height;
      expect(barHeight(tester), titleHeight + 2 * 99);
    });

    testWidgets('sidePadding is the padding of a side without an action',
        (tester) async {
      await _pumpLoose(tester, const ImpaktfullUiNavBar(title: 'Title'));
      expect(tester.getTopLeft(find.text('Title')).dx, 16);

      await _pumpLoose(
        tester,
        ImpaktfullUiNavBar(
          title: 'Title',
          theme: navBarTheme(sidePadding: 40),
        ),
      );
      expect(tester.getTopLeft(find.text('Title')).dx, 40);
    });

    testWidgets(
        'sidePaddingWithActions is the padding of a side with an '
        'action', (tester) async {
      await _pumpLoose(
        tester,
        ImpaktfullUiNavBar(title: 'Title', onBackTapped: () {}),
      );
      expect(tester.getTopLeft(find.byType(ImpaktfullUiIconButton)).dx, 6);

      await _pumpLoose(
        tester,
        ImpaktfullUiNavBar(
          title: 'Title',
          onBackTapped: () {},
          theme: navBarTheme(sidePaddingWithActions: 30),
        ),
      );
      expect(tester.getTopLeft(find.byType(ImpaktfullUiIconButton)).dx, 30);
    });

    testWidgets(
        'actionSize is the width reserved per action of a centered '
        'title', (tester) async {
      // With a centered title both sides reserve
      // `maxAmountOfActions * actionSize`, here for the single back button.
      await _pumpLoose(
        tester,
        ImpaktfullUiNavBar(
          title: 'Title',
          centerTitle: true,
          onBackTapped: () {},
        ),
      );
      expect(
        tester
            .getSize(_closestAncestor<SizedBox>(
              find.byType(ImpaktfullUiIconButton),
            ))
            .width,
        44,
      );

      await _pumpLoose(
        tester,
        ImpaktfullUiNavBar(
          title: 'Title',
          centerTitle: true,
          onBackTapped: () {},
          theme: navBarTheme(actionSize: 100),
        ),
      );
      expect(
        tester
            .getSize(_closestAncestor<SizedBox>(
              find.byType(ImpaktfullUiIconButton),
            ))
            .width,
        100,
      );
    });
  });

  group('ImpaktfullUiBottomNavigationItemDimensTheme', () {
    Widget buildItem({
      required bool showTitle,
      EdgeInsetsGeometry? padding,
      EdgeInsetsGeometry? paddingWithoutTitle,
    }) {
      final base = _components.bottomNavigationItem;
      return SizedBox(
        width: 200,
        child: Row(
          children: [
            ImpaktfullUiBottomNavigationItem(
              asset: _testAsset,
              title: 'Home',
              isSelected: false,
              showTitle: showTitle,
              theme: base.copyWith(
                dimens: base.dimens.copyWith(
                  padding: padding,
                  paddingWithoutTitle: paddingWithoutTitle,
                ),
              ),
            ),
          ],
        ),
      );
    }

    /// The space between the top of the item and the top of its icon.
    double paddingTop(WidgetTester tester) =>
        tester.getTopLeft(find.byType(ImpaktfullUiAssetWidget)).dy -
        tester.getTopLeft(find.byType(ImpaktfullUiBottomNavigationItem)).dy;

    testWidgets('padding is used when the item shows its title',
        (tester) async {
      await _pumpLoose(tester, buildItem(showTitle: true));
      expect(paddingTop(tester), 8);

      await _pumpLoose(
        tester,
        buildItem(
          showTitle: true,
          padding: const EdgeInsets.symmetric(vertical: 40),
        ),
      );
      expect(paddingTop(tester), 40);
    });

    testWidgets('paddingWithoutTitle is used when the item hides its title',
        (tester) async {
      await _pumpLoose(tester, buildItem(showTitle: false));
      expect(paddingTop(tester), 12);

      await _pumpLoose(
        tester,
        buildItem(
          showTitle: false,
          paddingWithoutTitle: const EdgeInsets.symmetric(vertical: 40),
        ),
      );
      expect(paddingTop(tester), 40);
    });
  });

  group('ImpaktfullUiHorizontalTabsDimensTheme', () {
    Widget buildTabs({double? height, double? spacing}) {
      final base = _components.horizontalTabs;
      return SizedBox(
        width: 400,
        child: ImpaktfullUiHorizontalTabs<int>(
          value: 1,
          onChanged: (_) {},
          tabs: [
            ImpaktfullUiHorizontalTabConfig(title: 'One', value: 1),
            ImpaktfullUiHorizontalTabConfig(title: 'Two', value: 2),
          ],
          theme: base.copyWith(
            dimens: base.dimens.copyWith(height: height, spacing: spacing),
          ),
        ),
      );
    }

    testWidgets('height is the height of the row of tabs', (tester) async {
      await _pumpLoose(tester, buildTabs());
      expect(
          tester.getSize(find.byType(ImpaktfullUiHorizontalTabs<int>)).height,
          48);

      await _pumpLoose(tester, buildTabs(height: 96));
      expect(
          tester.getSize(find.byType(ImpaktfullUiHorizontalTabs<int>)).height,
          96);
    });

    testWidgets('spacing is the space between two tabs', (tester) async {
      double gap(WidgetTester tester) {
        final tabs = find.byType(ImpaktfullUiHorizontalTab);
        return tester.getRect(tabs.at(1)).left -
            tester.getRect(tabs.at(0)).right;
      }

      await _pumpLoose(tester, buildTabs());
      expect(gap(tester), 8);

      await _pumpLoose(tester, buildTabs(spacing: 40));
      expect(gap(tester), 40);
    });
  });

  group('ImpaktfullUiSidebarNavigationDimensTheme', () {
    ImpaktfullUiSidebarNavigationTheme sidebarTheme({
      double? secondaryWidth,
      BoxConstraints? assetConstraints,
    }) {
      final base = _components.sidebarNavigation;
      return base.copyWith(
        dimens: base.dimens.copyWith(
          secondaryWidth: secondaryWidth,
          assetConstraints: assetConstraints,
        ),
      );
    }

    testWidgets('secondaryWidth is the width of the secondary column',
        (tester) async {
      // Without `items` the secondary column holds the only list view.
      Widget buildSidebar({double? secondaryWidth}) =>
          ImpaktfullUiSidebarNavigation(
            secondaryItems: const [
              ImpaktfullUiSidebarNavigationItem(title: 'Secondary'),
            ],
            theme: sidebarTheme(secondaryWidth: secondaryWidth),
          );

      await pumpImpaktfullUiApp(tester, Material(child: buildSidebar()));
      expect(tester.getSize(find.byType(ImpaktfullUiListView)).width, 300);

      await pumpImpaktfullUiApp(
        tester,
        Material(child: buildSidebar(secondaryWidth: 120)),
      );
      expect(tester.getSize(find.byType(ImpaktfullUiListView)).width, 120);
    });

    testWidgets('assetConstraints constrain the asset in the header',
        (tester) async {
      await pumpImpaktfullUiApp(
        tester,
        const Material(
          child: ImpaktfullUiSidebarNavigation(asset: _testAsset),
        ),
      );
      expect(
        tester
            .widget<ConstrainedBox>(_closestAncestor<ConstrainedBox>(
              find.byType(ImpaktfullUiAssetWidget),
            ))
            .constraints,
        const BoxConstraints(maxWidth: 150, maxHeight: 40),
      );

      await pumpImpaktfullUiApp(
        tester,
        Material(
          child: ImpaktfullUiSidebarNavigation(
            asset: _testAsset,
            theme: sidebarTheme(
              assetConstraints: BoxConstraints.tightFor(width: 99, height: 77),
            ),
          ),
        ),
      );
      expect(
        tester.getSize(find.byType(ImpaktfullUiAssetWidget)),
        const Size(99, 77),
      );
    });
  });

  group('ImpaktfullUiScreenDimensTheme', () {
    const fabKey = Key('fab');

    Widget buildScreen({EdgeInsetsGeometry? floatingActionButtonPadding}) {
      final base = _components.screen;
      return ImpaktfullUiScreen(
        floatingActionButton: const SizedBox(
          key: fabKey,
          width: 40,
          height: 40,
        ),
        theme: base.copyWith(
          dimens: base.dimens.copyWith(
            floatingActionButtonPadding: floatingActionButtonPadding,
          ),
        ),
        child: const SizedBox(),
      );
    }

    testWidgets(
        'floatingActionButtonPadding is the space around the floating action '
        'button', (tester) async {
      Offset distanceToCorner(WidgetTester tester) {
        final screen = tester.getRect(find.byType(ImpaktfullUiScreen));
        final fab = tester.getRect(find.byKey(fabKey));
        return Offset(screen.right - fab.right, screen.bottom - fab.bottom);
      }

      await pumpImpaktfullUiApp(tester, buildScreen());
      expect(distanceToCorner(tester), const Offset(16, 16));

      await pumpImpaktfullUiApp(
        tester,
        buildScreen(floatingActionButtonPadding: const EdgeInsets.all(48)),
      );
      expect(distanceToCorner(tester), const Offset(48, 48));
    });
  });

  group('ImpaktfullUiStepperDimensTheme', () {
    Widget buildStepper({EdgeInsetsGeometry? padding}) {
      final base = _components.stepper;
      return ImpaktfullUiStepper(
        orientation: ImpaktfullUiStepperOrientation.vertical,
        items: const [
          ImpaktfullUiStepperItem(isCompleted: true, asset: _testAsset),
        ],
        theme: base.copyWith(
          dimens: base.dimens.copyWith(padding: padding),
        ),
      );
    }

    testWidgets('padding is the space around the asset of a step',
        (tester) async {
      Rect step(WidgetTester tester) => tester.getRect(
            _closestAncestor<Container>(find.byType(ImpaktfullUiAssetWidget)),
          );
      Rect asset(WidgetTester tester) =>
          tester.getRect(find.byType(ImpaktfullUiAssetWidget));

      // The step draws a 1px border around its padding.
      await _pumpLoose(tester, buildStepper());
      expect(asset(tester).left - step(tester).left, 8 + 1);
      expect(step(tester).right - asset(tester).right, 8 + 1);

      await _pumpLoose(
        tester,
        buildStepper(padding: const EdgeInsets.all(30)),
      );
      expect(asset(tester).left - step(tester).left, 30 + 1);
      expect(step(tester).right - asset(tester).right, 30 + 1);
    });
  });

  group('ImpaktfullUiTableDimensTheme', () {
    Widget buildTable({double? minColumnWidth}) {
      final base = _components.table;
      return SizedBox(
        width: 300,
        height: 400,
        child: ImpaktfullUiTable(
          titles: const [
            ImpaktfullUiTableHeaderItem(title: 'A'),
            ImpaktfullUiTableHeaderItem(title: 'B'),
          ],
          content: const [
            ImpaktfullUiTableRow(
              columns: [
                ImpaktfullUiTableRowItem.text(title: '1'),
                ImpaktfullUiTableRowItem.text(title: '2'),
              ],
            ),
          ],
          theme: base.copyWith(
            dimens: base.dimens.copyWith(minColumnWidth: minColumnWidth),
          ),
        ),
      );
    }

    testWidgets('minColumnWidth is the width every column gets at least',
        (tester) async {
      // The table is 300 wide with two columns, so it scrolls horizontally
      // and its content is `amountOfColumns * minColumnWidth` wide.
      await _pumpLoose(tester, buildTable());
      expect(tester.getSize(find.byType(ImpaktfullUiTableHeader)).width, 500);

      await _pumpLoose(tester, buildTable(minColumnWidth: 400));
      expect(tester.getSize(find.byType(ImpaktfullUiTableHeader)).width, 800);
    });
  });

  group('ImpaktfullUiTableHeaderDimensTheme', () {
    Widget buildHeader({double? minHeight}) {
      final base = _components.tableHeader;
      return SizedBox(
        width: 300,
        child: ImpaktfullUiTableHeader(
          titles: const [ImpaktfullUiTableHeaderItem(title: 'A')],
          theme: base.copyWith(
            dimens: base.dimens.copyWith(minHeight: minHeight),
          ),
        ),
      );
    }

    testWidgets('minHeight is the minimum height of the header row',
        (tester) async {
      await _pumpLoose(tester, buildHeader());
      expect(tester.getSize(find.byType(ImpaktfullUiTableHeader)).height, 48);

      await _pumpLoose(tester, buildHeader(minHeight: 120));
      expect(tester.getSize(find.byType(ImpaktfullUiTableHeader)).height, 120);
    });
  });

  group('ImpaktfullUiTableRowDimensTheme', () {
    Widget buildRow({double? minHeight}) {
      final base = _components.tableRow;
      return _inList(
        ImpaktfullUiTableRow(
          columns: const [ImpaktfullUiTableRowItem.text(title: 'A')],
          theme: base.copyWith(
            dimens: base.dimens.copyWith(minHeight: minHeight),
          ),
        ),
      );
    }

    testWidgets('minHeight is the minimum height of a row', (tester) async {
      await _pumpLoose(tester, buildRow());
      expect(tester.getSize(find.byType(ImpaktfullUiTableRow)).height, 48);

      await _pumpLoose(tester, buildRow(minHeight: 120));
      expect(tester.getSize(find.byType(ImpaktfullUiTableRow)).height, 120);
    });
  });

  group('ImpaktfullUiTableHeaderItemDimensTheme', () {
    ImpaktfullUiTableHeaderItemTheme headerItemTheme(double minHeight) {
      final base = _components.tableHeaderItem;
      return base.copyWith(
        dimens: base.dimens.copyWith(minHeight: minHeight),
      );
    }

    testWidgets('minHeight is the height of an item without a title',
        (tester) async {
      await _pumpLoose(
        tester,
        const SizedBox(width: 200, child: ImpaktfullUiTableHeaderItem()),
      );
      expect(
        tester.getSize(find.byType(ImpaktfullUiTableHeaderItem)).height,
        48,
      );

      await _pumpLoose(
        tester,
        SizedBox(
          width: 200,
          child: ImpaktfullUiTableHeaderItem(theme: headerItemTheme(120)),
        ),
      );
      expect(
        tester.getSize(find.byType(ImpaktfullUiTableHeaderItem)).height,
        120,
      );
    });

    testWidgets('minHeight is the minimum height of an item with a title',
        (tester) async {
      await _pumpLoose(
        tester,
        const SizedBox(
          width: 200,
          child: ImpaktfullUiTableHeaderItem(title: 'A'),
        ),
      );
      expect(
        tester.getSize(find.byType(ImpaktfullUiTableHeaderItem)).height,
        48,
      );

      await _pumpLoose(
        tester,
        SizedBox(
          width: 200,
          child: ImpaktfullUiTableHeaderItem(
            title: 'A',
            theme: headerItemTheme(120),
          ),
        ),
      );
      expect(
        tester.getSize(find.byType(ImpaktfullUiTableHeaderItem)).height,
        120,
      );
    });
  });

  group('ImpaktfullUiTableRowItemDimensTheme', () {
    testWidgets('minHeight is the minimum height of a row item',
        (tester) async {
      final base = _components.tableRowItem;
      await _pumpLoose(
        tester,
        _inList(const ImpaktfullUiTableRowItem.text(title: 'A')),
      );
      expect(tester.getSize(find.byType(ImpaktfullUiTableRowItem)).height, 48);

      await _pumpLoose(
        tester,
        _inList(
          ImpaktfullUiTableRowItem.text(
            title: 'A',
            theme: base.copyWith(
              dimens: base.dimens.copyWith(minHeight: 120),
            ),
          ),
        ),
      );
      expect(tester.getSize(find.byType(ImpaktfullUiTableRowItem)).height, 120);
    });
  });

  group('ImpaktfullUiBadgeDimensTheme', () {
    Widget buildBadge({
      double? closeIconSize,
      EdgeInsetsGeometry? closePadding,
      double? closeSpacing,
    }) {
      final base = _components.badge;
      return ImpaktfullUiBadge(
        type: ImpaktfullUiBadgeType.primary,
        title: 'Tag',
        onCloseTapped: () {},
        theme: base.copyWith(
          dimens: base.dimens.copyWith(
            closeIconSize: closeIconSize,
            closePadding: closePadding,
            closeSpacing: closeSpacing,
          ),
        ),
      );
    }

    /// The close button: the padding around the icon of the close button.
    Finder closeButton() =>
        _closestAncestor<Padding>(find.byType(ImpaktfullUiAssetWidget));

    testWidgets('closeIconSize is the size of the close icon', (tester) async {
      await _pumpLoose(tester, buildBadge());
      expect(
        tester.getSize(find.byType(ImpaktfullUiAssetWidget)),
        const Size(16, 16),
      );

      await _pumpLoose(tester, buildBadge(closeIconSize: 40));
      expect(
        tester.getSize(find.byType(ImpaktfullUiAssetWidget)),
        const Size(40, 40),
      );
    });

    testWidgets('closePadding is the padding around the close icon',
        (tester) async {
      double padding(WidgetTester tester) =>
          tester.getRect(find.byType(ImpaktfullUiAssetWidget)).left -
          tester.getRect(closeButton()).left;

      await _pumpLoose(tester, buildBadge());
      expect(padding(tester), 2);

      await _pumpLoose(
        tester,
        buildBadge(closePadding: const EdgeInsets.all(20)),
      );
      expect(padding(tester), 20);
    });

    testWidgets(
        'closeSpacing is the space between the title and the close '
        'button', (tester) async {
      double spacing(WidgetTester tester) =>
          tester.getRect(closeButton()).left -
          tester.getRect(find.text('Tag')).right;

      await _pumpLoose(tester, buildBadge());
      expect(spacing(tester), 2);

      await _pumpLoose(tester, buildBadge(closeSpacing: 30));
      expect(spacing(tester), 30);
    });
  });

  group('ImpaktfullUiDropdownDimensTheme', () {
    Widget buildOverlay({EdgeInsetsGeometry? padding}) {
      final base = _components.dropdown;
      return ImpaktfullUiDropdownOverlay(
        height: null,
        borderRadius: BorderRadius.zero,
        theme: base.copyWith(
          dimens: base.dimens.copyWith(padding: padding),
        ),
        child: const Text('Content'),
      );
    }

    // The width of a menu comes from `ImpaktfullUiDropdownMenuLayout`, which
    // knows the button and the window; `dropdown_placement_test.dart` covers
    // it through a real dropdown.
    ImpaktfullUiDropdownMenuLayout layout({
      required Size buttonSize,
      double? width,
      double minWidth = 176,
      double fallbackWidth = 200,
    }) =>
        ImpaktfullUiDropdownMenuLayout(
          buttonSize: buttonSize,
          buttonOffset: Offset.zero,
          windowSize: const Size(800, 600),
          windowPadding: EdgeInsets.zero,
          spacing: 4,
          margin: 8,
          width: width,
          minWidth: minWidth,
          fallbackWidth: fallbackWidth,
          alignment: Alignment.topLeft,
        );

    test('overlayWidth is the width of a menu of a button without a size yet',
        () {
      expect(
        layout(buttonSize: Size.zero)
            .getConstraintsForChild(const BoxConstraints())
            .maxWidth,
        200,
      );
      expect(
        layout(buttonSize: Size.zero, fallbackWidth: 320)
            .getConstraintsForChild(const BoxConstraints())
            .maxWidth,
        320,
      );
    });

    test('minWidth is the width of a menu of a narrow button', () {
      expect(
        layout(buttonSize: const Size(80, 40))
            .getConstraintsForChild(const BoxConstraints())
            .maxWidth,
        176,
      );
      expect(
        layout(buttonSize: const Size(240, 40))
            .getConstraintsForChild(const BoxConstraints())
            .maxWidth,
        240,
      );
    });

    testWidgets('padding is the padding of the menu', (tester) async {
      await _pumpLoose(tester, buildOverlay());
      final content = tester.getRect(find.text('Content'));
      final menu = tester.getRect(find.byType(ImpaktfullUiDropdownOverlay));
      expect(content.left - menu.left, 0, reason: 'zero by default');

      await _pumpLoose(
        tester,
        buildOverlay(padding: const EdgeInsets.all(4)),
      );
      expect(
        tester.getRect(find.text('Content')).left -
            tester.getRect(find.byType(ImpaktfullUiDropdownOverlay)).left,
        4,
      );
    });
  });

  group('ImpaktfullUiSegmentedControlDimensTheme', () {
    Widget buildControl({double? height}) {
      final base = _components.segmentedControl;
      return SizedBox(
        width: 300,
        child: ImpaktfullUiSegmentedControl<String>(
          value: 'a',
          items: const ['a', 'b'],
          onChanged: (_) {},
          theme: base.copyWith(
            dimens: base.dimens.copyWith(height: height),
          ),
        ),
      );
    }

    testWidgets('height is the height of the control', (tester) async {
      await _pumpLoose(tester, buildControl());
      expect(
        tester
            .getSize(find.byType(ImpaktfullUiSegmentedControl<String>))
            .height,
        56,
      );

      await _pumpLoose(tester, buildControl(height: 120));
      expect(
        tester
            .getSize(find.byType(ImpaktfullUiSegmentedControl<String>))
            .height,
        120,
      );
    });
  });

  group('ImpaktfullUiRadioButtonDimensTheme', () {
    Widget buildRadioButton({
      double? size,
      double? borderWidth,
      double? dotInset,
    }) {
      final base = _components.radioButton;
      return ImpaktfullUiRadioButton<String>(
        value: 'a',
        groupValue: 'a',
        onChanged: (_) {},
        theme: base.copyWith(
          dimens: base.dimens.copyWith(
            size: size,
            borderWidth: borderWidth,
            dotInset: dotInset,
          ),
        ),
      );
    }

    Size boxSize(WidgetTester tester) => tester.getSize(
          find
              .descendant(
                of: find.byType(ImpaktfullUiRadioButton<String>),
                matching: find.byType(SizedBox),
              )
              .first,
        );

    testWidgets('size is the width and the height of the radio button',
        (tester) async {
      await _pumpLoose(tester, buildRadioButton());
      expect(boxSize(tester), const Size.square(20));

      // `size-4` of shadcn/ui and `controlInteractiveSize` of Ant Design.
      await _pumpLoose(tester, buildRadioButton(size: 16));
      expect(boxSize(tester), const Size.square(16));
    });

    testWidgets('dotInset gives the dot in the middle its size',
        (tester) async {
      // The dot is the only box without a border: the box around it draws
      // the border of the radio button.
      Size dotSize(WidgetTester tester) => tester.getSize(
            find
                .descendant(
                  of: find.byType(ImpaktfullUiRadioButton<String>),
                  matching: find.byWidgetPredicate(
                    (widget) =>
                        widget is Container &&
                        widget.decoration is BoxDecoration &&
                        (widget.decoration! as BoxDecoration).border == null,
                  ),
                )
                .last,
          );

      await _pumpLoose(tester, buildRadioButton());
      // 20 - 2 * 6: the border is painted outside the box of the dot.
      expect(dotSize(tester), const Size.square(8));

      // The 8px dot of a 16px shadcn/ui and Ant Design radio button.
      await _pumpLoose(tester, buildRadioButton(size: 16, dotInset: 4));
      expect(dotSize(tester), const Size.square(8));
    });
  });

  group('ImpaktfullUiSliderDimensTheme', () {
    Widget buildSlider({
      double? height,
      double? trackHeight,
      double? thumbSize,
    }) {
      final base = _components.slider;
      return SizedBox(
        width: 200,
        child: ImpaktfullUiSlider(
          value: 0.5,
          min: 0,
          max: 1,
          onChanged: (_) {},
          theme: base.copyWith(
            dimens: base.dimens.copyWith(
              height: height,
              trackHeight: trackHeight,
              thumbSize: thumbSize,
            ),
          ),
        ),
      );
    }

    testWidgets('height is the height of the slider', (tester) async {
      await _pumpLoose(tester, buildSlider());
      expect(tester.getSize(find.byType(ImpaktfullUiSlider)).height, 48);

      await _pumpLoose(tester, buildSlider(height: 24));
      expect(tester.getSize(find.byType(ImpaktfullUiSlider)).height, 24);
    });

    testWidgets('trackHeight is the thickness of the track', (tester) async {
      double trackHeight(WidgetTester tester) => tester
          .getSize(
            find
                .descendant(
                  of: find.byType(ImpaktfullUiSlider),
                  matching: find.byType(Container),
                )
                .at(1),
          )
          .height;

      await _pumpLoose(tester, buildSlider());
      expect(trackHeight(tester), 4);

      // `h-1.5` of shadcn/ui.
      await _pumpLoose(tester, buildSlider(trackHeight: 6));
      expect(trackHeight(tester), 6);
    });

    testWidgets('thumbSize is the size of the thumb', (tester) async {
      Size thumbSize(WidgetTester tester) => tester.getSize(
            find
                .descendant(
                  of: find.byType(ImpaktfullUiSlider),
                  matching: find.byType(Container),
                )
                .last,
          );

      await _pumpLoose(tester, buildSlider());
      expect(thumbSize(tester), const Size.square(16));

      // The 14px handle of Ant Design.
      await _pumpLoose(tester, buildSlider(thumbSize: 14));
      expect(thumbSize(tester), const Size.square(14));
    });
  });

  group('ImpaktfullUiTooltipDimensTheme', () {
    testWidgets('padding and the text style reach the tooltip', (tester) async {
      final base = _components.tooltip;
      await _pumpLoose(
        tester,
        ImpaktfullUiTooltip(
          message: 'A tooltip',
          theme: base.copyWith(
            dimens: base.dimens.copyWith(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            ),
            textStyles: base.textStyles.copyWith(
              text: const TextStyle(fontSize: 12),
            ),
          ),
          child: const Text('Child'),
        ),
      );
      final tooltip = tester.widget<Tooltip>(find.byType(Tooltip));
      expect(
        tooltip.padding,
        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      );
      expect(tooltip.textStyle?.fontSize, 12);
    });

    testWidgets('a tooltip without them leaves both to Flutter',
        (tester) async {
      await _pumpLoose(
        tester,
        const ImpaktfullUiTooltip(
          message: 'A tooltip',
          child: Text('Child'),
        ),
      );
      final tooltip = tester.widget<Tooltip>(find.byType(Tooltip));
      expect(tooltip.padding, isNull);
      expect(tooltip.textStyle, isNull);
    });
  });
}

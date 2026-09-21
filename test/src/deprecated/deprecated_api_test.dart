// Every deprecated public API must keep working until it is removed in
// 1.0.0: this file uses each one the way an app written against the old name
// does. When an API is removed, remove its test here.
//
// See doc/migrations/1.0.0.md.
// ignore_for_file: deprecated_member_use_from_same_package

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

void main() {
  group('Deprecated class names are aliases of their replacement', () {
    final aliases = <String, (Type, Type)>{
      'ImpaktfullUiCarrousel': (ImpaktfullUiCarrousel, ImpaktfullUiCarousel),
      'ImpaktfullUiCarrouselTheme': (
        ImpaktfullUiCarrouselTheme,
        ImpaktfullUiCarouselTheme
      ),
      'ImpaktfullUiCarrouselAssetsTheme': (
        ImpaktfullUiCarrouselAssetsTheme,
        ImpaktfullUiCarouselAssetsTheme
      ),
      'ImpaktfullUiCarrouselColorTheme': (
        ImpaktfullUiCarrouselColorTheme,
        ImpaktfullUiCarouselColorTheme
      ),
      'ImpaktfullUiCarrouselDimensTheme': (
        ImpaktfullUiCarrouselDimensTheme,
        ImpaktfullUiCarouselDimensTheme
      ),
      'ImpaktfullUiCarrouselTextStyleTheme': (
        ImpaktfullUiCarrouselTextStyleTheme,
        ImpaktfullUiCarouselTextStyleTheme
      ),
      'ImpaktfullUiCheckBox': (ImpaktfullUiCheckBox, ImpaktfullUiCheckbox),
      'ImpaktfullUiCheckBoxListItem': (
        ImpaktfullUiCheckBoxListItem,
        ImpaktfullUiCheckboxListItem
      ),
      'ImpaktfullUiCheckBoxListItemType': (
        ImpaktfullUiCheckBoxListItemType,
        ImpaktfullUiCheckboxListItemType
      ),
      'ImpaktfullUiCheckBoxListItemTheme': (
        ImpaktfullUiCheckBoxListItemTheme,
        ImpaktfullUiCheckboxListItemTheme
      ),
      'ImpaktfullUiCheckBoxListItemAssetsTheme': (
        ImpaktfullUiCheckBoxListItemAssetsTheme,
        ImpaktfullUiCheckboxListItemAssetsTheme
      ),
      'ImpaktfullUiCheckBoxListItemColorTheme': (
        ImpaktfullUiCheckBoxListItemColorTheme,
        ImpaktfullUiCheckboxListItemColorTheme
      ),
      'ImpaktfullUiCheckBoxListItemDimensTheme': (
        ImpaktfullUiCheckBoxListItemDimensTheme,
        ImpaktfullUiCheckboxListItemDimensTheme
      ),
      'ImpaktfullUiCheckBoxListItemTextStyleTheme': (
        ImpaktfullUiCheckBoxListItemTextStyleTheme,
        ImpaktfullUiCheckboxListItemTextStyleTheme
      ),
      'ImpaktfullUIAdaptivePageRoute': (
        ImpaktfullUIAdaptivePageRoute,
        ImpaktfullUiAdaptivePageRoute
      ),
      'ImpaktfullUiThemeBuidler': (
        ImpaktfullUiThemeBuidler,
        ImpaktfullUiThemeBuilder
      ),
      'ImpaktfullUiAlignment': (
        ImpaktfullUiAlignment,
        ImpaktfullUiDropdownAlignment
      ),
      'DefaultTheme': (DefaultTheme, ImpaktfullUiDefaultTheme),
      'TableColumnConfig': (TableColumnConfig, ImpaktfullUiTableColumnConfig),
      'CustomBadgeWidget': (CustomBadgeWidget, ImpaktfullUiCustomBadgeWidget),
      'CommandMenuWindow': (CommandMenuWindow, ImpaktfullUiCommandMenuWindow),
      'InputFieldValidator': (
        InputFieldValidator,
        ImpaktfullUiInputFieldValidator
      ),
      'PasswordStrengthIndicatorRequirement': (
        PasswordStrengthIndicatorRequirement,
        ImpaktfullUiPasswordStrengthIndicatorRequirement
      ),
      'CircleProgressPainter': (
        CircleProgressPainter,
        ImpaktfullUiCircleProgressPainter
      ),
      'HalfCircleProgressPainter': (
        HalfCircleProgressPainter,
        ImpaktfullUiHalfCircleProgressPainter
      ),
      'VirtualKeyboardConfig': (
        VirtualKeyboardConfig,
        ImpaktfullUiVirtualKeyboardConfig
      ),
    };
    for (final MapEntry(key: name, value: (deprecated, replacement))
        in aliases.entries) {
      test(name, () => expect(deprecated, replacement));
    }
  });

  group('Deprecated constructors', () {
    test('ImpaktfullUiCheckBox.indermediate', () {
      bool? changed;
      final checkbox = ImpaktfullUiCheckBox.indermediate(
        value: null,
        onChanged: (value) => changed = value,
      );
      expect(checkbox, isA<ImpaktfullUiCheckbox>());
      expect(checkbox.value, isNull);
      checkbox.onChangedIndeterminate!(true);
      expect(changed, isTrue);
      expect(checkbox.onChangedInterpediate, checkbox.onChangedIndeterminate);
    });

    test('ImpaktfullUiCheckBoxListItem.indermediate', () {
      final item = ImpaktfullUiCheckBoxListItem.indermediate(
        title: 'Title',
        subtitle: 'Subtitle',
        value: false,
        onChanged: (_) {},
      );
      expect(item, isA<ImpaktfullUiCheckboxListItem>());
      expect(item.type, ImpaktfullUiCheckboxListItemType.indeterminate);
      expect(item.title, 'Title');
      expect(item.subtitle, 'Subtitle');
      expect(item.onChangedInterpediate, isNotNull);
    });

    test('static members through a deprecated class name', () {
      final route = ImpaktfullUIAdaptivePageRoute.create<void>(
        builder: (_) => const SizedBox(),
      );
      expect(route, isA<PageRoute<void>>());
      expect(const TableColumnConfig(flex: 2).flex, 2);
      expect(
        const PasswordStrengthIndicatorRequirement(
          requirement: 'At least 8 characters',
          isMet: true,
        ).isMet,
        isTrue,
      );
    });
  });

  group('Deprecated parameters and members', () {
    const icon = ImpaktfullUiAsset.icon(IconData(0xe000));
    const otherIcon = ImpaktfullUiAsset.icon(IconData(0xe001));

    test('ImpaktfullUiCheckboxAssetsTheme.indermediate', () {
      const assets = ImpaktfullUiCheckboxAssetsTheme(
        check: icon,
        indermediate: otherIcon,
      );
      expect(assets.indeterminate, otherIcon);
      expect(assets.indermediate, otherIcon);
      expect(assets.copyWith(indermediate: icon).indeterminate, icon);
    });

    test('ImpaktfullUiPasswordStrengthIndicatorAssetsTheme.leadingRequerement',
        () {
      const assets = ImpaktfullUiPasswordStrengthIndicatorAssetsTheme(
        leadingRequerement: icon,
        leadingRequerementIsMet: otherIcon,
      );
      expect(assets.leadingRequirement, icon);
      expect(assets.leadingRequirementIsMet, otherIcon);
      expect(assets.leadingRequerement, icon);
      expect(assets.leadingRequerementIsMet, otherIcon);
    });

    test('ImpaktfullUiComponentsTheme.carrousel', () {
      final components = ImpaktfullUiTheme.getDefault().components;
      expect(components.carrousel, components.carousel);
      final replaced = components.copyWith(carrousel: components.carousel);
      expect(replaced.carousel, components.carousel);
    });

    test('ImpaktfullUiTouchFeedback.toolTip', () {
      final feedback = ImpaktfullUiTouchFeedback(
        onTap: () {},
        toolTip: 'Tooltip',
        child: const SizedBox(),
      );
      expect(feedback.tooltip, 'Tooltip');
      expect(feedback.toolTip, 'Tooltip');
    });

    test('ImpaktfullUiWysiwygAction.orderdList', () {
      expect(
        ImpaktfullUiWysiwygAction.orderdList,
        ImpaktfullUiWysiwygAction.orderedList,
      );
    });

    test('ImpaktfullUiListView.separated/child(required:) has no effect', () {
      final separated = ImpaktfullUiListView<int>.separated(
        items: const [1],
        itemBuilder: (context, item, index) => Text('$item'),
        placeholderData: null,
        required: 'ignored',
      );
      expect(separated.items, [1]);
      expect(separated.separated, isTrue);
      const child = ImpaktfullUiListView<void>.child(
        required: true,
        child: SizedBox(),
      );
      expect(child.child, isA<SizedBox>());
    });

    test('ImpaktfullUiScreen.fabAlignment', () {
      const screen = ImpaktfullUiScreen(
        fabAlignment: Alignment.bottomLeft,
        child: SizedBox(),
      );
      expect(screen.floatingActionButtonAlignment, Alignment.bottomLeft);
      expect(screen.fabAlignment, Alignment.bottomLeft);
      // The default follows the reading direction, the deprecated getter
      // returns its left-to-right value.
      const defaultScreen = ImpaktfullUiScreen(child: SizedBox());
      expect(defaultScreen.floatingActionButtonAlignment,
          AlignmentDirectional.bottomEnd);
      expect(defaultScreen.fabAlignment, Alignment.bottomRight);
    });

    test('ImpaktfullUiAdaptiveScreen.fabAlignment', () {
      final screen = ImpaktfullUiAdaptiveScreen(
        fabAlignment: Alignment.bottomLeft,
        builder: (context) => const SizedBox(),
      );
      expect(screen.floatingActionButtonAlignment, Alignment.bottomLeft);
      expect(screen.fabAlignment, Alignment.bottomLeft);
      final defaultScreen =
          ImpaktfullUiAdaptiveScreen(builder: (context) => const SizedBox());
      expect(defaultScreen.floatingActionButtonAlignment,
          AlignmentDirectional.bottomEnd);
      expect(defaultScreen.fabAlignment, Alignment.bottomRight);
    });

    test('ImpaktfullUiListItemType.simpleLisItemType', () {
      for (final type in ImpaktfullUiListItemType.values) {
        expect(type.simpleLisItemType, type.simpleListItemType);
      }
    });
  });

  testWidgets('a deprecated widget still renders and handles taps',
      (tester) async {
    bool? changed;
    await tester.pumpWidget(
      ImpaktfullUiApp(
        showDebugFlag: false,
        title: 'impaktfull app',
        home: ImpaktfullUiCheckBox.indermediate(
          value: null,
          onChanged: (value) => changed = value,
        ),
      ),
    );
    await tester.tap(find.byType(ImpaktfullUiCheckbox));
    expect(changed, isTrue);
  });
}

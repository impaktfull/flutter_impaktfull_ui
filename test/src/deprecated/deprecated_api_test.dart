// Every deprecated public API must keep working until it is removed in
// 1.0.0: this file uses each one the way an app written against the old name
// does. When an API is removed, remove its test here.
//
// See doc/migrations/1.0.0.md.
// ignore_for_file: deprecated_member_use_from_same_package

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      'ImpaktfullUiBBLicenseLocalizations': (
        ImpaktfullUiBBLicenseLocalizations,
        ImpaktfullUiBBLicensesLocalizations
      ),
      'ImpaktfullUiTableHeaderItemTextStylesTheme': (
        ImpaktfullUiTableHeaderItemTextStylesTheme,
        ImpaktfullUiTableHeaderItemTextStyleTheme
      ),
      'ImpaktfullUiSnackyConfiguratorTextStylesTheme': (
        ImpaktfullUiSnackyConfiguratorTextStylesTheme,
        ImpaktfullUiSnackyConfiguratorTextStyleTheme
      ),
      'ImpaktfullUiTableRowItemTextStylesTheme': (
        ImpaktfullUiTableRowItemTextStylesTheme,
        ImpaktfullUiTableRowItemTextStyleTheme
      ),
      'ImpaktfullUiHorizontalTabTextStylesTheme': (
        ImpaktfullUiHorizontalTabTextStylesTheme,
        ImpaktfullUiHorizontalTabTextStyleTheme
      ),
      'ImpaktfullUiCmsHeaderTextStylesTheme': (
        ImpaktfullUiCmsHeaderTextStylesTheme,
        ImpaktfullUiCmsHeaderTextStyleTheme
      ),
      'ImpaktfullUiButtonTextStylesTheme': (
        ImpaktfullUiButtonTextStylesTheme,
        ImpaktfullUiButtonTextStyleTheme
      ),
      'ImpaktfullUiListViewTextStylesTheme': (
        ImpaktfullUiListViewTextStylesTheme,
        ImpaktfullUiListViewTextStyleTheme
      ),
      'ImpaktfullUiInputFieldTextStylesTheme': (
        ImpaktfullUiInputFieldTextStylesTheme,
        ImpaktfullUiInputFieldTextStyleTheme
      ),
      'ImpaktfullUiTableRowTextStylesTheme': (
        ImpaktfullUiTableRowTextStylesTheme,
        ImpaktfullUiTableRowTextStyleTheme
      ),
      'ImpaktfullUiBadgeTextStylesTheme': (
        ImpaktfullUiBadgeTextStylesTheme,
        ImpaktfullUiBadgeTextStyleTheme
      ),
      'ImpaktfullUiLoadingIndicatorAssetTheme': (
        ImpaktfullUiLoadingIndicatorAssetTheme,
        ImpaktfullUiLoadingIndicatorAssetsTheme
      ),
      'ImpaktfullUiTooltipDurationTheme': (
        ImpaktfullUiTooltipDurationTheme,
        ImpaktfullUiTooltipDurationsTheme
      ),
      'ImpaktfullUiNotificationBadgeDurationTheme': (
        ImpaktfullUiNotificationBadgeDurationTheme,
        ImpaktfullUiNotificationBadgeDurationsTheme
      ),
      'ImpaktfullUiSidebarNavigationItemDurationTheme': (
        ImpaktfullUiSidebarNavigationItemDurationTheme,
        ImpaktfullUiSidebarNavigationItemDurationsTheme
      ),
      'ImpaktfullUiDropdownShadowTheme': (
        ImpaktfullUiDropdownShadowTheme,
        ImpaktfullUiDropdownShadowsTheme
      ),
      'ImpaktfullUiButtonShadowTheme': (
        ImpaktfullUiButtonShadowTheme,
        ImpaktfullUiButtonShadowsTheme
      ),
      'ImpaktfullUiAutoCompleteShadowTheme': (
        ImpaktfullUiAutoCompleteShadowTheme,
        ImpaktfullUiAutoCompleteShadowsTheme
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

    test('ImpaktfullUiAutoComplete(replaceWithOverlay:) has no effect', () {
      final autoComplete = ImpaktfullUiAutoComplete<String>(
        onSearchChanged: (query) => [],
        itemBuilder: (context, item, index, controller) => Text(item),
        noDataLabel: 'No results',
        replaceWithOverlay: true,
      );
      expect(autoComplete.replaceWithOverlay, isTrue);
      expect(autoComplete.noDataLabel, 'No results');
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

    test('ImpaktfullUiButtonTheme.shadow', () {
      final button = ImpaktfullUiTheme.getDefault().components.button;
      const shadows = ImpaktfullUiButtonShadowsTheme(
        primary: [BoxShadow(blurRadius: 4)],
        secondary: null,
        destructive: null,
      );
      final theme = ImpaktfullUiButtonTheme(
        colors: button.colors,
        dimens: button.dimens,
        durations: button.durations,
        textStyles: button.textStyles,
        config: button.config,
        shadow: shadows,
      );
      expect(theme.shadows, same(shadows));
      expect(theme.shadow, same(shadows));
      expect(button.copyWith(shadow: shadows).shadows, same(shadows));
    });

    test('ImpaktfullUiComponentsTheme.checkBoxListItem', () {
      final components = ImpaktfullUiTheme.getDefault().components;
      expect(components.checkBoxListItem, same(components.checkboxListItem));
      final checkboxListItem = components.checkboxListItem.copyWith();
      final replaced = components.copyWith(checkBoxListItem: checkboxListItem);
      expect(replaced.checkboxListItem, same(checkboxListItem));
    });
  });

  group('Deprecated global theme and locale', () {
    // More cases in test/src/theme/theme_configurator_test.dart.
    testWidgets('ImpaktfullUiApp still sets theme and locale', (tester) async {
      final appTheme = ImpaktfullUiTheme.custom(
        label: 'app',
        primary: Colors.red,
        accent: Colors.green,
        secondary: Colors.blue,
      );
      await tester.pumpWidget(
        ImpaktfullUiApp(
          showDebugFlag: false,
          title: 'impaktfull app',
          impaktfullUiTheme: appTheme,
          locale: const Locale('en', 'GB'),
          supportedLocales: const [Locale('en', 'GB')],
          home: const SizedBox(),
        ),
      );
      expect(theme, same(appTheme));
      expect(locale, const Locale('en', 'GB'));
    });
  });

  group('Deprecated extensions are still exported', () {
    // This file only imports package:impaktfull_ui/impaktfull_ui.dart, like
    // an app: every member keeps working until 1.0.0.
    final date = DateTime(2024, 6, 12, 14, 30);

    test('DateTimeExtensions', () {
      expect(date.startOfTheDay, DateTime(2024, 6, 12));
      expect(date.endOfTheDay, DateTime(2024, 6, 12, 23, 59, 59));
      expect(date.tomorrow, DateTime(2024, 6, 13, 14, 30));
      expect(date.yesterday, DateTime(2024, 6, 11, 14, 30));
      expect(date.nextWeek, DateTime(2024, 6, 19, 14, 30));
      expect(date.previousWeek, DateTime(2024, 6, 5, 14, 30));
      expect(date.beginningOfTheWeek, DateTime(2024, 6, 10, 14, 30));
      expect(date.endOfTheWeek, DateTime(2024, 6, 16, 14, 30));
      expect(date.thisWeekMonday, DateTime(2024, 6, 10, 14, 30));
      expect(date.thisWeekTuesday, DateTime(2024, 6, 11, 14, 30));
      expect(date.thisWeekWednesday, DateTime(2024, 6, 12, 14, 30));
      expect(date.thisWeekThursday, DateTime(2024, 6, 13, 14, 30));
      expect(date.thisWeekFriday, DateTime(2024, 6, 14, 14, 30));
      expect(date.thisWeekSaturday, DateTime(2024, 6, 15, 14, 30));
      expect(date.thisWeekSunday, DateTime(2024, 6, 16, 14, 30));
      expect(date.format('yyyy-MM-dd'), '2024-06-12');
      expect(date.getPreviousMonth(), DateTime(2024, 5, 12, 14, 30));
      expect(date.getNextMonth(), DateTime(2024, 7, 12, 14, 30));
      expect(date.getPreviousYear(), DateTime(2023, 6, 12, 14, 30));
      expect(date.getNextYear(), DateTime(2025, 6, 12, 14, 30));
      expect(date.isSameYear(DateTime(2024)), isTrue);
      expect(date.isSameMonth(DateTime(2024, 6)), isTrue);
      expect(date.isSameDay(DateTime(2024, 6, 12, 8)), isTrue);
      expect(date.dateOnly(), DateTime(2024, 6, 12));
      expect(date.getDaysInMonth(), 30);
      expect(date.setTime(8, 15), DateTime(2024, 6, 12, 8, 15));
      expect(DateTimeExtensions(date).isSameDay(date), isTrue);
      expect(getDayForMonthWithFallback(2024, 2, 31), 29);
    });

    test('TextStyleExtension', () {
      const style = TextStyle(color: Color(0xFF000000));
      expect(style.light.fontWeight, FontWeight.w300);
      expect(style.medium.fontWeight, FontWeight.w500);
      expect(style.semiBold.fontWeight, FontWeight.w600);
      expect(style.bold.fontWeight, FontWeight.w700);
      expect(style.withOpacity(0.5).color!.a, closeTo(0.5, 0.01));
      expect(TextStyleExtension(style).bold.fontWeight, FontWeight.w700);
    });

    test('BorderRadiusGeometryExtension', () {
      const BorderRadiusGeometry radius = BorderRadius.only(
        topLeft: Radius.circular(1),
        topRight: Radius.circular(2),
        bottomLeft: Radius.circular(3),
        bottomRight: Radius.circular(4),
      );
      expect(radius.topStart, const Radius.circular(1));
      expect(radius.topEnd, const Radius.circular(2));
      expect(radius.bottomStart, const Radius.circular(3));
      expect(radius.bottomEnd, const Radius.circular(4));
      expect(radius.value, radius);
      expect(
        radius.copyWith(topStart: const Radius.circular(8)),
        const BorderRadiusDirectional.only(
          topStart: Radius.circular(8),
          topEnd: Radius.circular(2),
          bottomStart: Radius.circular(3),
          bottomEnd: Radius.circular(4),
        ),
      );
    });

    test('EdgeInsetsGeometryExtension', () {
      const EdgeInsetsGeometry insets =
          EdgeInsetsDirectional.fromSTEB(1, 2, 3, 4);
      expect(insets.start, 1);
      expect(insets.top, 2);
      expect(insets.end, 3);
      expect(insets.bottom, 4);
    });

    test('ThemeDataExtension', () {
      final themeData = ThemeData().removeUnwantedBehavior(
        targetPlatform: TargetPlatform.iOS,
      );
      expect(themeData.platform, TargetPlatform.iOS);
      expect(
        themeData.pageTransitionsTheme.builders[TargetPlatform.iOS],
        isA<CupertinoPageTransitionsBuilder>(),
      );
    });

    testWidgets('ResponsiveExtension', (tester) async {
      final results = <String, (bool, bool)>{};
      await tester.pumpWidget(
        ImpaktfullUiApp(
          showDebugFlag: false,
          title: 'impaktfull app',
          home: Builder(
            builder: (context) {
              results.addAll({
                'smallOrBigger': (
                  context.isSmallScreenOrBigger,
                  ImpaktfullUiResponsiveLayout.isSmallOrBigger(context)
                ),
                'mediumOrBigger': (
                  context.isMediumScreenOrBigger,
                  ImpaktfullUiResponsiveLayout.isMediumOrBigger(context)
                ),
                'largeOrBigger': (
                  context.isLargeScreenOrBigger,
                  ImpaktfullUiResponsiveLayout.isLargeOrBigger(context)
                ),
                'extraLargeOrBigger': (
                  context.isExtraLargeScreenOrBigger,
                  ImpaktfullUiResponsiveLayout.isExtraLargeOrBigger(context)
                ),
                'smallOrSmaller': (
                  context.isSmallScreenOrSmaller,
                  ImpaktfullUiResponsiveLayout.isSmallOrSmaller(context)
                ),
                'mediumOrSmaller': (
                  context.isMediumScreenOrSmaller,
                  ImpaktfullUiResponsiveLayout.isMediumOrSmaller(context)
                ),
                'largeOrSmaller': (
                  context.isLargeScreenOrSmaller,
                  ImpaktfullUiResponsiveLayout.isLargeOrSmaller(context)
                ),
              });
              return const SizedBox();
            },
          ),
        ),
      );
      expect(results, hasLength(7));
      for (final MapEntry(key: name, value: (deprecated, replacement))
          in results.entries) {
        expect(deprecated, replacement, reason: name);
      }
    });
  });

  group('Parameters renamed to consistent names', () {
    const asset = ImpaktfullUiAsset.icon(IconData(0xe000));
    void voidCallback() {}
    void stringCallback(String value) {}
    Future<void> asyncCallback() async {}

    test('ImpaktfullUiTouchFeedback.onLongTap', () {
      final feedback = ImpaktfullUiTouchFeedback(
        onTap: null,
        onLongTap: voidCallback,
        child: const SizedBox(),
      );
      expect(feedback.onLongPress, voidCallback);
      expect(feedback.onLongTap, voidCallback);
    });

    test('ImpaktfullUiInputField.onSubmit and onFocusChanged', () {
      void onFocusChanged(bool hasFocus) {}
      final inputField = ImpaktfullUiInputField(
        value: null,
        onChanged: null,
        onSubmit: stringCallback,
        onFocusChanged: onFocusChanged,
      );
      expect(inputField.onSubmitted, stringCallback);
      expect(inputField.onSubmit, stringCallback);
      expect(inputField.onFocusChange, onFocusChanged);
      expect(inputField.onFocusChanged, onFocusChanged);
    });

    test('ImpaktfullUiPinCode.onSubmit', () {
      final pinCode = ImpaktfullUiPinCode(
        code: '',
        onChanged: stringCallback,
        onSubmit: stringCallback,
      );
      expect(pinCode.onSubmitted, stringCallback);
      expect(pinCode.onSubmit, stringCallback);
    });

    test('ImpaktfullUiVirtualKeyboard.onSubmit', () {
      final keyboard = ImpaktfullUiVirtualKeyboard(
        controller: ImpaktfullUiVirtualKeyboardTextEditController(
          config: ImpaktfullUiVirtualQwertyKeyboardConfig(),
        ),
        onSubmit: voidCallback,
      );
      expect(keyboard.onSubmitted, voidCallback);
      expect(keyboard.onSubmit, voidCallback);
    });

    for (final useController in [false, true]) {
      final name = useController
          ? 'ImpaktfullUiVirtualKeyboardTextEditController.openKeyboard'
          : 'ImpaktfullUiVirtualKeyboard.show';
      testWidgets('$name(onSubmit:)', (tester) async {
        final controller = ImpaktfullUiVirtualKeyboardTextEditController(
          config: ImpaktfullUiVirtualQwertyKeyboardConfig(),
        );
        await tester.pumpWidget(
          ImpaktfullUiApp(
            showDebugFlag: false,
            title: 'impaktfull app',
            home: Builder(
              builder: (context) => GestureDetector(
                onTap: () {
                  if (useController) {
                    controller.openKeyboard(context, onSubmit: voidCallback);
                  } else {
                    ImpaktfullUiVirtualKeyboard.show(
                      context: context,
                      controller: controller,
                      onSubmit: voidCallback,
                    );
                  }
                },
                child: const Text('open'),
              ),
            ),
          ),
        );
        await tester.tap(find.text('open'));
        // pumpAndSettle times out once the keyboard sheet is open.
        await tester.pump();
        await tester.pump(const Duration(seconds: 1));
        final keyboard = tester.widget<ImpaktfullUiVirtualKeyboard>(
          find.byType(ImpaktfullUiVirtualKeyboard),
        );
        expect(keyboard.onSubmitted, voidCallback);
      });
    }

    test('ImpaktfullUiAccordion.onExpandedChanged', () {
      void onExpandedChanged(bool expanded) {}
      final accordion = ImpaktfullUiAccordion(
        title: 'Title',
        expanded: false,
        expandedBuilder: (context) => const SizedBox(),
        onExpandedChanged: onExpandedChanged,
      );
      expect(accordion.onExpansionChanged, onExpandedChanged);
      expect(accordion.onExpandedChanged, onExpandedChanged);
    });

    test('ImpaktfullUiScreen.fab and ImpaktfullUiAdaptiveScreen.fab', () {
      const fab = SizedBox();
      const screen = ImpaktfullUiScreen(fab: fab, child: SizedBox());
      expect(screen.floatingActionButton, same(fab));
      expect(screen.fab, same(fab));
      final adaptiveScreen = ImpaktfullUiAdaptiveScreen(
        fab: fab,
        builder: (context) => const SizedBox(),
      );
      expect(adaptiveScreen.floatingActionButton, same(fab));
      expect(adaptiveScreen.fab, same(fab));
    });

    test('ImpaktfullUiHorizontalTabs.selectedValue and onTabSelected', () {
      void onTabSelected(int value) {}
      final tabs = ImpaktfullUiHorizontalTabs<int>(
        selectedValue: 1,
        onTabSelected: onTabSelected,
        tabs: [ImpaktfullUiHorizontalTabConfig(label: 'One', value: 1)],
      );
      expect(tabs.value, 1);
      expect(tabs.selectedValue, 1);
      expect(tabs.onChanged, onTabSelected);
      expect(tabs.onTabSelected, onTabSelected);
    });

    test('ImpaktfullUiOptionSelector.selectedValue', () {
      const selector = ImpaktfullUiOptionSelector<String>(
        options: ['A', 'B'],
        selectedValue: 'B',
      );
      expect(selector.value, 'B');
      expect(selector.selectedValue, 'B');
    });

    testWidgets('ImpaktfullUiOptionSelector.show(selectedValue:)',
        (tester) async {
      await tester.pumpWidget(
        ImpaktfullUiApp(
          showDebugFlag: false,
          title: 'impaktfull app',
          home: Builder(
            builder: (context) => GestureDetector(
              onTap: () => ImpaktfullUiOptionSelector.show<String>(
                context: context,
                title: 'Title',
                options: ['A', 'B'],
                selectedValue: 'B',
              ),
              child: const Text('open'),
            ),
          ),
        ),
      );
      await tester.tap(find.text('open'));
      await tester.pumpAndSettle();
      final selector = tester.widget<ImpaktfullUiOptionSelector<String>>(
        find.byType(ImpaktfullUiOptionSelector<String>),
      );
      expect(selector.value, 'B');
    });

    test('ImpaktfullUiCommandMenuWindow.onInputChanged', () {
      final window = ImpaktfullUiCommandMenuWindow(
        onInputChanged: stringCallback,
        onCloseWindow: voidCallback,
      );
      expect(window.onChanged, stringCallback);
      expect(window.onInputChanged, stringCallback);
    });

    test('ImpaktfullUiPagination.onLoadPage', () {
      void onLoadPage(int page) {}
      final pagination = ImpaktfullUiPagination(
        page: 0,
        itemsPerPage: 10,
        amountOfItems: 100,
        onLoadPage: onLoadPage,
      );
      expect(pagination.onPageChanged, onLoadPage);
      expect(pagination.onLoadPage, onLoadPage);
      final withAmountOfPages = ImpaktfullUiPagination.withAmountOfPages(
        page: 0,
        itemsPerPage: 10,
        amountOfPages: 10,
        onLoadPage: onLoadPage,
      );
      expect(withAmountOfPages.onPageChanged, onLoadPage);
      expect(withAmountOfPages.onLoadPage, onLoadPage);
    });

    test(
        'Building blocks: onChangedEmail, onChangedPassword and '
        'onChangedVerificationCode', () {
      void onChangedEmail(String value) {}
      void onChangedPassword(String value) {}
      final forgetPassword = ImpaktfullUiBBForgetPassword(
        email: '',
        onChangedEmail: onChangedEmail,
        onResetPasswordTapped: asyncCallback,
      );
      expect(forgetPassword.onEmailChanged, onChangedEmail);
      expect(forgetPassword.onChangedEmail, onChangedEmail);
      final login = ImpaktfullUiBBLogin(
        email: '',
        password: '',
        onChangedEmail: onChangedEmail,
        onChangedPassword: onChangedPassword,
        onLoginTapped: asyncCallback,
      );
      expect(login.onEmailChanged, onChangedEmail);
      expect(login.onChangedEmail, onChangedEmail);
      expect(login.onPasswordChanged, onChangedPassword);
      expect(login.onChangedPassword, onChangedPassword);
      final register = ImpaktfullUiBBRegister(
        email: '',
        password: '',
        onChangedEmail: onChangedEmail,
        onChangedPassword: onChangedPassword,
        onRegisterTapped: asyncCallback,
      );
      expect(register.onEmailChanged, onChangedEmail);
      expect(register.onChangedEmail, onChangedEmail);
      expect(register.onPasswordChanged, onChangedPassword);
      expect(register.onChangedPassword, onChangedPassword);
      final verifyRegisterCode = ImpaktfullUiBBVerifyRegisterCode(
        code: '',
        onChangedVerificationCode: stringCallback,
        onVerifyCodeTapped: asyncCallback,
      );
      expect(verifyRegisterCode.onCodeChanged, stringCallback);
      expect(verifyRegisterCode.onChangedVerificationCode, stringCallback);
    });

    test('ImpaktfullUiBadge.label and onCloseTap', () {
      final badge = ImpaktfullUiBadge(
        type: ImpaktfullUiBadgeType.primary,
        label: 'Badge',
        onCloseTap: voidCallback,
      );
      expect(badge.title, 'Badge');
      expect(badge.label, 'Badge');
      expect(badge.onCloseTapped, voidCallback);
      expect(badge.onCloseTap, voidCallback);
    });

    testWidgets('ImpaktfullUiBadge(onCloseTap:) is called on the close icon',
        (tester) async {
      var closeTaps = 0;
      await tester.pumpWidget(
        ImpaktfullUiApp(
          showDebugFlag: false,
          title: 'impaktfull app',
          home: Center(
            child: ImpaktfullUiBadge(
              type: ImpaktfullUiBadgeType.primary,
              label: 'Badge',
              onCloseTap: () => closeTaps++,
            ),
          ),
        ),
      );
      expect(find.text('Badge'), findsOneWidget);
      await tester.tap(find.byType(ImpaktfullUiTouchFeedback).last);
      expect(closeTaps, 1);
    });

    test('ImpaktfullUiModal action labels and callbacks', () {
      void secondaryCallback() {}
      final modals = [
        ImpaktfullUiModal(
          primaryActionLabel: 'Primary',
          primaryActionOnTap: voidCallback,
          secondaryActionLabel: 'Secondary',
          secondaryActionOnTap: secondaryCallback,
        ),
        ImpaktfullUiModal.simple(
          primaryActionLabel: 'Primary',
          primaryActionOnTap: voidCallback,
          secondaryActionLabel: 'Secondary',
          secondaryActionOnTap: secondaryCallback,
        ),
      ];
      for (final modal in modals) {
        expect(modal.primaryActionTitle, 'Primary');
        expect(modal.primaryActionLabel, 'Primary');
        expect(modal.onPrimaryActionTapped, voidCallback);
        expect(modal.primaryActionOnTap, voidCallback);
        expect(modal.secondaryActionTitle, 'Secondary');
        expect(modal.secondaryActionLabel, 'Secondary');
        expect(modal.onSecondaryActionTapped, secondaryCallback);
        expect(modal.secondaryActionOnTap, secondaryCallback);
      }
    });

    test('ImpaktfullUiCalendar, List and Week .onEventTap', () {
      void onEventTap(ImpaktfullUiCalendarEvent event) {}
      final selectedDate = DateTime(2024, 6, 12);
      final calendar = ImpaktfullUiCalendar(
        selectedDate: selectedDate,
        events: const [],
        type: ImpaktfullUiCalendarType.list,
        onEventTap: onEventTap,
      );
      expect(calendar.onEventTapped, onEventTap);
      expect(calendar.onEventTap, onEventTap);
      final list = ImpaktfullUiCalendarList(
        selectedDate: selectedDate,
        events: const [],
        onEventTap: onEventTap,
      );
      expect(list.onEventTapped, onEventTap);
      expect(list.onEventTap, onEventTap);
      final week = ImpaktfullUiCalendarWeek(
        selectedDate: selectedDate,
        events: const [],
        onEventTap: onEventTap,
      );
      expect(week.onEventTapped, onEventTap);
      expect(week.onEventTap, onEventTap);
    });

    test('ImpaktfullUiMarkdown.onOpenLink', () {
      final markdown = ImpaktfullUiMarkdown(
        data: '',
        onOpenLink: stringCallback,
      );
      expect(markdown.onLinkTapped, stringCallback);
      expect(markdown.onOpenLink, stringCallback);
    });

    test('ImpaktfullUiFloatingActionButton.label', () {
      const fab = ImpaktfullUiFloatingActionButton(
        asset: asset,
        label: 'Add',
        expanded: true,
      );
      expect(fab.title, 'Add');
      expect(fab.label, 'Add');
      expect(fab.expanded, isTrue);
    });

    test('ImpaktfullUiDropdown.buttonText and ImpaktfullUiDropdownItem.label',
        () {
      const dropdown = ImpaktfullUiDropdown<void>(
        buttonText: 'Open',
        child: SizedBox(),
      );
      expect(dropdown.buttonTitle, 'Open');
      expect(dropdown.buttonText, 'Open');
      const item = ImpaktfullUiDropdownItem(label: 'Item', value: 1);
      expect(item.title, 'Item');
      expect(item.label, 'Item');
      final builder = ImpaktfullUiDropdown<int>.builder(
        items: const [item],
        itemBuilder: (context, item, index, controller) => Text(item.title),
        noDataLabel: 'No data',
        buttonText: 'Open',
      );
      expect(builder.buttonTitle, 'Open');
      expect(builder.buttonText, 'Open');
    });

    test('ImpaktfullUiBottomNavigationItem.label and showLabel', () {
      const item = ImpaktfullUiBottomNavigationItem(
        asset: asset,
        isSelected: false,
        label: 'Home',
        showLabel: false,
      );
      expect(item.title, 'Home');
      expect(item.label, 'Home');
      expect(item.showTitle, isFalse);
      expect(item.showLabel, isFalse);
      expect(
        const ImpaktfullUiBottomNavigationItem(asset: asset, isSelected: false)
            .showTitle,
        isTrue,
      );
    });

    test('ImpaktfullUiHorizontalTab.label and its config', () {
      final tab = ImpaktfullUiHorizontalTab(label: 'Tab', onTap: voidCallback);
      expect(tab.title, 'Tab');
      expect(tab.label, 'Tab');
      final config = ImpaktfullUiHorizontalTabConfig(label: 'Tab', value: 1);
      expect(config.title, 'Tab');
      expect(config.label, 'Tab');
    });

    test('ImpaktfullUiTabBarItem.label', () {
      final controller = TabController(length: 1, vsync: const TestVSync());
      addTearDown(controller.dispose);
      final item = ImpaktfullUiTabBarItem(
        label: 'Tab',
        index: 0,
        controller: controller,
      );
      expect(item.title, 'Tab');
      expect(item.label, 'Tab');
    });

    test('ImpaktfullUiInputFieldAction.label', () {
      final action = ImpaktfullUiInputFieldAction(
        onTap: voidCallback,
        label: 'Action',
      );
      expect(action.title, 'Action');
      expect(action.label, 'Action');
    });

    test('ImpaktfullUiSegmentedControl.labelBuilder', () {
      String labelBuilder(BuildContext context, int item) => '$item';
      final control = ImpaktfullUiSegmentedControl<int>(
        value: 1,
        items: const [1, 2],
        onChanged: (_) {},
        labelBuilder: labelBuilder,
      );
      expect(control.titleBuilder, labelBuilder);
      expect(control.labelBuilder, labelBuilder);
    });

    test('ImpaktfullUiDateInputField.date and onDateSelected', () {
      void onDateSelected(DateTime? date) {}
      final date = DateTime(2024, 6, 12);
      final inputField = ImpaktfullUiDateInputField(
        date: date,
        onDateSelected: onDateSelected,
      );
      expect(inputField.value, date);
      expect(inputField.date, date);
      expect(inputField.onChanged, onDateSelected);
      expect(inputField.onDateSelected, onDateSelected);
    });

    test('ImpaktfullUiColorPicker.onColorChanged and onColorChangeEnd', () {
      void onColorChanged(Color color) {}
      void onColorChangeEnd(Color color) {}
      final picker = ImpaktfullUiColorPicker(
        selectedColor: null,
        onColorChanged: onColorChanged,
        onColorChangeEnd: onColorChangeEnd,
      );
      expect(picker.onChanged, onColorChanged);
      expect(picker.onColorChanged, onColorChanged);
      expect(picker.onChangeEnd, onColorChangeEnd);
      expect(picker.onColorChangeEnd, onColorChangeEnd);
    });

    test('ImpaktfullUiWysiwyg.text', () {
      final wysiwyg = ImpaktfullUiWysiwyg(
        text: 'Text',
        onChanged: stringCallback,
      );
      expect(wysiwyg.value, 'Text');
      expect(wysiwyg.text, 'Text');
    });

    test('a parameter that becomes required again asserts one of both names',
        () {
      expect(
        () => ImpaktfullUiWysiwyg(onChanged: stringCallback),
        throwsAssertionError,
      );
      expect(
        () => ImpaktfullUiPagination(
          page: 0,
          itemsPerPage: 10,
          amountOfItems: 100,
        ),
        throwsAssertionError,
      );
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

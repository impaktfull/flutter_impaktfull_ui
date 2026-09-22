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

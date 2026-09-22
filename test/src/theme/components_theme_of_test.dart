// Reads the sources with dart:io, so it only runs on the Dart VM.
@TestOn('vm')
library;

import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../_core_test_helpers.dart';

class _ThemeEntry<T extends ImpaktfullUiComponentTheme> {
  final String field;
  final T Function(ImpaktfullUiComponentsTheme theme) getter;

  const _ThemeEntry(this.field, this.getter);

  Type get type => T;

  T of(BuildContext context) => ImpaktfullUiComponentsTheme.of<T>(context);
}

class _UnknownTheme extends ImpaktfullUiComponentTheme {
  const _UnknownTheme();
}

/// Every component theme of [ImpaktfullUiComponentsTheme]. The first test
/// fails when a field is added to ImpaktfullUiComponentsTheme without adding
/// it here.
final _entries = <_ThemeEntry>[
  _ThemeEntry<ImpaktfullUiAccordionTheme>('accordion', (t) => t.accordion),
  _ThemeEntry<ImpaktfullUiAvatarTheme>('avatar', (t) => t.avatar),
  _ThemeEntry<ImpaktfullUiAutoCompleteTheme>(
      'autoComplete', (t) => t.autoComplete),
  _ThemeEntry<ImpaktfullUiBadgeTheme>('badge', (t) => t.badge),
  _ThemeEntry<ImpaktfullUiBottomActionsTheme>(
      'bottomActions', (t) => t.bottomActions),
  _ThemeEntry<ImpaktfullUiBottomNavigationTheme>(
      'bottomNavigation', (t) => t.bottomNavigation),
  _ThemeEntry<ImpaktfullUiBottomNavigationItemTheme>(
      'bottomNavigationItem', (t) => t.bottomNavigationItem),
  _ThemeEntry<ImpaktfullUiBottomSheetTheme>(
      'bottomSheet', (t) => t.bottomSheet),
  _ThemeEntry<ImpaktfullUiButtonTheme>('button', (t) => t.button),
  _ThemeEntry<ImpaktfullUiCalendarTheme>('calendar', (t) => t.calendar),
  _ThemeEntry<ImpaktfullUiCardTheme>('card', (t) => t.card),
  _ThemeEntry<ImpaktfullUiCarouselTheme>('carousel', (t) => t.carousel),
  _ThemeEntry<ImpaktfullUiChatTheme>('chat', (t) => t.chat),
  _ThemeEntry<ImpaktfullUiCheckboxTheme>('checkbox', (t) => t.checkbox),
  _ThemeEntry<ImpaktfullUiCheckboxListItemTheme>(
      'checkBoxListItem', (t) => t.checkBoxListItem),
  _ThemeEntry<ImpaktfullUiCmsHeaderTheme>('cmsHeader', (t) => t.cmsHeader),
  _ThemeEntry<ImpaktfullUiColorPickerTheme>(
      'colorPicker', (t) => t.colorPicker),
  _ThemeEntry<ImpaktfullUiColorInputFieldTheme>(
      'colorInputField', (t) => t.colorInputField),
  _ThemeEntry<ImpaktfullUiCommandMenuTheme>(
      'commandMenu', (t) => t.commandMenu),
  _ThemeEntry<ImpaktfullUiConfettiTheme>('confetti', (t) => t.confetti),
  _ThemeEntry<ImpaktfullUiDateInputFieldTheme>(
      'dateInputField', (t) => t.dateInputField),
  _ThemeEntry<ImpaktfullUiDatePickerTheme>('datePicker', (t) => t.datePicker),
  _ThemeEntry<ImpaktfullUiDateTimePickerTheme>(
      'dateTimePicker', (t) => t.dateTimePicker),
  _ThemeEntry<ImpaktfullUiDividerTheme>('divider', (t) => t.divider),
  _ThemeEntry<ImpaktfullUiDropdownTheme>('dropdown', (t) => t.dropdown),
  _ThemeEntry<ImpaktfullUiFilePickerTheme>('filePicker', (t) => t.filePicker),
  _ThemeEntry<ImpaktfullUiFloatingActionButtonTheme>(
      'floatingActionButton', (t) => t.floatingActionButton),
  _ThemeEntry<ImpaktfullUiFluidPaddingTheme>(
      'fluidPadding', (t) => t.fluidPadding),
  _ThemeEntry<ImpaktfullUiGalleryTheme>('gallery', (t) => t.gallery),
  _ThemeEntry<ImpaktfullUiGridViewTheme>('gridView', (t) => t.gridView),
  _ThemeEntry<ImpaktfullUiHorizontalTabTheme>(
      'horizontalTab', (t) => t.horizontalTab),
  _ThemeEntry<ImpaktfullUiHorizontalTabsTheme>(
      'horizontalTabs', (t) => t.horizontalTabs),
  _ThemeEntry<ImpaktfullUiImageCropTheme>('imageCrop', (t) => t.imageCrop),
  _ThemeEntry<ImpaktfullUiInputFieldTheme>('inputField', (t) => t.inputField),
  _ThemeEntry<ImpaktfullUiIntroductionTheme>(
      'introduction', (t) => t.introduction),
  _ThemeEntry<ImpaktfullUiLineChartTheme>('lineChart', (t) => t.lineChart),
  _ThemeEntry<ImpaktfullUiListItemTheme>('listItem', (t) => t.listItem),
  _ThemeEntry<ImpaktfullUiListViewTheme>('listView', (t) => t.listView),
  _ThemeEntry<ImpaktfullUiLoadingErrorDataTheme>(
      'loadingErrorData', (t) => t.loadingErrorData),
  _ThemeEntry<ImpaktfullUiLoadingIndicatorTheme>(
      'loadingIndicator', (t) => t.loadingIndicator),
  _ThemeEntry<ImpaktfullUiMarkdownTheme>('markdown', (t) => t.markdown),
  _ThemeEntry<ImpaktfullUiMetricTheme>('metric', (t) => t.metric),
  _ThemeEntry<ImpaktfullUiModalTheme>('modal', (t) => t.modal),
  _ThemeEntry<ImpaktfullUiNavBarTheme>('navBar', (t) => t.navBar),
  _ThemeEntry<ImpaktfullUiNetworkImageTheme>(
      'networkImage', (t) => t.networkImage),
  _ThemeEntry<ImpaktfullUiNotificationTheme>(
      'notification', (t) => t.notification),
  _ThemeEntry<ImpaktfullUiNotificationBadgeTheme>(
      'notificationBadge', (t) => t.notificationBadge),
  _ThemeEntry<ImpaktfullUiNumberInputTheme>(
      'numberInput', (t) => t.numberInput),
  _ThemeEntry<ImpaktfullUiOptionSelectorTheme>(
      'optionSelector', (t) => t.optionSelector),
  _ThemeEntry<ImpaktfullUiPaginationTheme>('pagination', (t) => t.pagination),
  _ThemeEntry<ImpaktfullUiPasswordStrengthIndicatorTheme>(
      'passwordStrengthIndicator', (t) => t.passwordStrengthIndicator),
  _ThemeEntry<ImpaktfullUiPinCodeTheme>('pinCode', (t) => t.pinCode),
  _ThemeEntry<ImpaktfullUiPlaceholderTheme>(
      'placeholder', (t) => t.placeholder),
  _ThemeEntry<ImpaktfullUiProgressIndicatorTheme>(
      'progressIndicator', (t) => t.progressIndicator),
  _ThemeEntry<ImpaktfullUiRadioButtonTheme>(
      'radioButton', (t) => t.radioButton),
  _ThemeEntry<ImpaktfullUiRadioButtonListItemTheme>(
      'radioButtonListItem', (t) => t.radioButtonListItem),
  _ThemeEntry<ImpaktfullUiRefreshIndicatorTheme>(
      'refreshIndicator', (t) => t.refreshIndicator),
  _ThemeEntry<ImpaktfullUiResponsiveLayoutTheme>(
      'responsiveLayout', (t) => t.responsiveLayout),
  _ThemeEntry<ImpaktfullUiScreenTheme>('screen', (t) => t.screen),
  _ThemeEntry<ImpaktfullUiSectionTitleTheme>(
      'sectionTitle', (t) => t.sectionTitle),
  _ThemeEntry<ImpaktfullUiSegmentedControlTheme>(
      'segmentedControl', (t) => t.segmentedControl),
  _ThemeEntry<ImpaktfullUiSelectableListItemTheme>(
      'selectableListItem', (t) => t.selectableListItem),
  _ThemeEntry<ImpaktfullUiSeparatedColumnTheme>(
      'separatedColumn', (t) => t.separatedColumn),
  _ThemeEntry<ImpaktfullUiSidebarNavigationTheme>(
      'sidebarNavigation', (t) => t.sidebarNavigation),
  _ThemeEntry<ImpaktfullUiSidebarNavigationItemTheme>(
      'sidebarNavigationItem', (t) => t.sidebarNavigationItem),
  _ThemeEntry<ImpaktfullUiSimpleListItemTheme>(
      'simpleListItem', (t) => t.simpleListItem),
  _ThemeEntry<ImpaktfullUiSkeletonTheme>('skeleton', (t) => t.skeleton),
  _ThemeEntry<ImpaktfullUiSliderTheme>('slider', (t) => t.slider),
  _ThemeEntry<ImpaktfullUiSnackyConfiguratorTheme>(
      'snackyConfigurator', (t) => t.snackyConfigurator),
  _ThemeEntry<ImpaktfullUiStepperTheme>('stepper', (t) => t.stepper),
  _ThemeEntry<ImpaktfullUiSwitchTheme>('switchTheme', (t) => t.switchTheme),
  _ThemeEntry<ImpaktfullUiSwitchListItemTheme>(
      'switchListItem', (t) => t.switchListItem),
  _ThemeEntry<ImpaktfullUiTabBarTheme>('tabBar', (t) => t.tabBar),
  _ThemeEntry<ImpaktfullUiTabBarItemTheme>('tabBarItem', (t) => t.tabBarItem),
  _ThemeEntry<ImpaktfullUiTableTheme>('table', (t) => t.table),
  _ThemeEntry<ImpaktfullUiTableHeaderTheme>(
      'tableHeader', (t) => t.tableHeader),
  _ThemeEntry<ImpaktfullUiTableHeaderItemTheme>(
      'tableHeaderItem', (t) => t.tableHeaderItem),
  _ThemeEntry<ImpaktfullUiTableRowTheme>('tableRow', (t) => t.tableRow),
  _ThemeEntry<ImpaktfullUiTableRowItemTheme>(
      'tableRowItem', (t) => t.tableRowItem),
  _ThemeEntry<ImpaktfullUiTimePickerTheme>('timePicker', (t) => t.timePicker),
  _ThemeEntry<ImpaktfullUiTooltipTheme>('tooltip', (t) => t.tooltip),
  _ThemeEntry<ImpaktfullUiUnifiedScreenLayoutTheme>(
      'unifiedScreenLayout', (t) => t.unifiedScreenLayout),
  _ThemeEntry<ImpaktfullUiVirtualKeyboardTheme>(
      'virtualKeyboard', (t) => t.virtualKeyboard),
  _ThemeEntry<ImpaktfullUiWysiwygTheme>('wysiwyg', (t) => t.wysiwyg),
];

void main() {
  test('every component theme of ImpaktfullUiComponentsTheme is tested', () {
    final source =
        File('lib/src/theme/component_theme.dart').readAsStringSync();
    final classBody = source.substring(
      source.indexOf('class ImpaktfullUiComponentsTheme {'),
      source.indexOf('  ImpaktfullUiComponentsTheme({'),
    );
    final fields =
        RegExp(r'^  final (ImpaktfullUi\w+Theme) (\w+);$', multiLine: true)
            .allMatches(classBody)
            .map((e) => '${e.group(1)} ${e.group(2)}')
            .toList();
    expect(fields, isNotEmpty);
    expect(
      _entries.map((e) => '${e.type} ${e.field}').toList(),
      unorderedEquals(fields),
    );
  });

  testWidgets('of<T> returns the component theme for every registered type',
      (tester) async {
    final theme = ImpaktfullUiTheme.getDefault();
    late BuildContext context;
    await pumpImpaktfullUiApp(
      tester,
      Builder(builder: (c) {
        context = c;
        return const SizedBox();
      }),
      theme: theme,
    );
    for (final entry in _entries) {
      final Object result;
      try {
        result = entry.of(context);
      } catch (error) {
        fail('ImpaktfullUiComponentsTheme.of<${entry.type}> threw $error');
      }
      expect(result, same(entry.getter(theme.components)),
          reason: '${entry.type}');
    }
  });

  testWidgets('of<T> throws an ArgumentError for an unknown theme type',
      (tester) async {
    late BuildContext context;
    await pumpImpaktfullUiApp(
      tester,
      Builder(builder: (c) {
        context = c;
        return const SizedBox();
      }),
    );
    expect(
      () => ImpaktfullUiComponentsTheme.of<_UnknownTheme>(context),
      throwsArgumentError,
    );
  });

  testWidgets('ImpaktfullUiComponentThemeBuilder prefers the override theme',
      (tester) async {
    final theme = ImpaktfullUiTheme.getDefault();
    final override = theme.components.button.copyWith();
    ImpaktfullUiButtonTheme? fromTheme;
    ImpaktfullUiButtonTheme? fromOverride;
    await pumpImpaktfullUiApp(
      tester,
      Column(
        children: [
          ImpaktfullUiComponentThemeBuilder<ImpaktfullUiButtonTheme>(
            builder: (context, componentTheme) {
              fromTheme = componentTheme;
              return const SizedBox();
            },
          ),
          ImpaktfullUiComponentThemeBuilder<ImpaktfullUiButtonTheme>(
            overrideComponentTheme: override,
            builder: (context, componentTheme) {
              fromOverride = componentTheme;
              return const SizedBox();
            },
          ),
        ],
      ),
      theme: theme,
    );
    expect(fromTheme, same(theme.components.button));
    expect(fromOverride, same(override));
  });
}

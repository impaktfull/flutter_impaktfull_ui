// Every deprecated name with a data-driven fix in lib/fix_data.yaml.
// `dart fix --compare-to-golden` (run from this folder) applies the fixes to
// this file and compares the result with deprecated_names.dart.expect.
import 'package:flutter/material.dart' show TabController;
import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

void main() {
  // Renamed classes
  ImpaktfullUiCarrousel? carousel;
  ImpaktfullUiCarrouselTheme? carouselTheme;
  ImpaktfullUiCarrouselAssetsTheme? carouselAssetsTheme;
  ImpaktfullUiCarrouselColorTheme? carouselColorTheme;
  ImpaktfullUiCarrouselDimensTheme? carouselDimensTheme;
  ImpaktfullUiCarrouselTextStyleTheme? carouselTextStyleTheme;
  ImpaktfullUiCheckBoxListItemType? checkboxListItemType;
  ImpaktfullUiCheckBoxListItemTheme? checkboxListItemTheme;
  ImpaktfullUiCheckBoxListItemAssetsTheme? checkboxListItemAssetsTheme;
  ImpaktfullUiCheckBoxListItemColorTheme? checkboxListItemColorTheme;
  ImpaktfullUiCheckBoxListItemDimensTheme? checkboxListItemDimensTheme;
  ImpaktfullUiCheckBoxListItemTextStyleTheme? checkboxListItemTextStyleTheme;
  ImpaktfullUiThemeBuidler? themeBuilder;
  ImpaktfullUiAlignment? alignment;
  DefaultTheme? defaultTheme;
  CustomBadgeWidget? customBadgeWidget;
  CommandMenuWindow? commandMenuWindow;
  InputFieldValidator? inputFieldValidator;
  CircleProgressPainter? circleProgressPainter;
  HalfCircleProgressPainter? halfCircleProgressPainter;
  VirtualKeyboardConfig? virtualKeyboardConfig;
  ImpaktfullUiBBLicenseLocalizations? bbLicensesLocalizations;
  ImpaktfullUiTableHeaderItemTextStylesTheme? tableHeaderItemTextStylesTheme;
  ImpaktfullUiSnackyConfiguratorTextStylesTheme?
      snackyConfiguratorTextStylesTheme;
  ImpaktfullUiTableRowItemTextStylesTheme? tableRowItemTextStylesTheme;
  ImpaktfullUiHorizontalTabTextStylesTheme? horizontalTabTextStylesTheme;
  ImpaktfullUiCmsHeaderTextStylesTheme? cmsHeaderTextStylesTheme;
  ImpaktfullUiButtonTextStylesTheme? buttonTextStylesTheme;
  ImpaktfullUiListViewTextStylesTheme? listViewTextStylesTheme;
  ImpaktfullUiInputFieldTextStylesTheme? inputFieldTextStylesTheme;
  ImpaktfullUiTableRowTextStylesTheme? tableRowTextStylesTheme;
  ImpaktfullUiBadgeTextStylesTheme? badgeTextStylesTheme;
  ImpaktfullUiLoadingIndicatorAssetTheme? loadingIndicatorAssetTheme;
  ImpaktfullUiTooltipDurationTheme? tooltipDurationTheme;
  ImpaktfullUiNotificationBadgeDurationTheme? notificationBadgeDurationTheme;
  ImpaktfullUiSidebarNavigationItemDurationTheme?
      sidebarNavigationItemDurationTheme;
  ImpaktfullUiDropdownShadowTheme? dropdownShadowTheme;
  ImpaktfullUiButtonShadowTheme? buttonShadowTheme;
  ImpaktfullUiAutoCompleteShadowTheme? autoCompleteShadowTheme;
  ImpaktfullUIAdaptivePageRoute.create<void>(
      builder: (context) => const SizedBox());
  const TableColumnConfig(flex: 1);
  const PasswordStrengthIndicatorRequirement(requirement: '', isMet: true);

  // Renamed constructors, called through the old and the new class name
  ImpaktfullUiCheckBox(value: true, onChanged: (_) {});
  final checkbox =
      ImpaktfullUiCheckBox.indermediate(value: null, onChanged: (_) {});
  ImpaktfullUiCheckbox.indermediate(value: null, onChanged: (_) {});
  final checkboxListItem = ImpaktfullUiCheckBoxListItem.indermediate(
      title: '', value: null, onChanged: (_) {});
  ImpaktfullUiCheckboxListItem.indermediate(
      title: '', value: null, onChanged: (_) {});

  // Renamed getters, fields and enum values
  checkbox.onChangedInterpediate;
  checkboxListItem.onChangedInterpediate;
  const checkboxAssets = ImpaktfullUiCheckboxAssetsTheme(
      check: ImpaktfullUiAsset.icon(IconData(0)),
      indermediate: ImpaktfullUiAsset.icon(IconData(0)));
  checkboxAssets.indermediate;
  checkboxAssets.copyWith(
      indermediate: const ImpaktfullUiAsset.icon(IconData(0)));
  const passwordAssets = ImpaktfullUiPasswordStrengthIndicatorAssetsTheme(
      leadingRequerement: null, leadingRequerementIsMet: null);
  passwordAssets.leadingRequerement;
  passwordAssets.leadingRequerementIsMet;
  final components = ImpaktfullUiTheme.getDefault().components;
  components.carrousel;
  components.copyWith(carrousel: components.carrousel);
  final touchFeedback = ImpaktfullUiTouchFeedback(
      onTap: null, toolTip: '', child: const SizedBox());
  touchFeedback.toolTip;
  components.checkBoxListItem;
  components.copyWith(checkBoxListItem: components.checkBoxListItem);
  final button = components.button;
  button.shadow;
  button.copyWith(shadow: button.shadow);
  ImpaktfullUiButtonTheme(
      colors: button.colors,
      dimens: button.dimens,
      durations: button.durations,
      textStyles: button.textStyles,
      config: button.config,
      shadow: button.shadow);
  ImpaktfullUiListItemType.neutral.simpleLisItemType;
  ImpaktfullUiWysiwygAction.orderdList;
  const ImpaktfullUiScreen(
      fabAlignment: Alignment.bottomLeft, child: SizedBox());
  ImpaktfullUiAdaptiveScreen(
      fabAlignment: Alignment.bottomLeft,
      builder: (context) => const SizedBox());

  // Removed parameters that never had an effect
  ImpaktfullUiAutoComplete<String>(
      onSearchChanged: (query) => [],
      itemBuilder: (context, item, index, controller) => Text(item),
      replaceWithOverlay: true,
      noDataLabel: '');

  // Parameters renamed to consistent names, in line with Flutter
  const asset = ImpaktfullUiAsset.icon(IconData(0));
  final touchFeedback2 = ImpaktfullUiTouchFeedback(
      onTap: null, onLongTap: () {}, child: const SizedBox());
  touchFeedback2.onLongTap;
  final inputField = ImpaktfullUiInputField(
      value: null,
      onChanged: null,
      onSubmit: (value) {},
      onFocusChanged: (hasFocus) {});
  inputField.onSubmit;
  inputField.onFocusChanged;
  final pinCode =
      ImpaktfullUiPinCode(code: '', onChanged: (_) {}, onSubmit: (_) {});
  pinCode.onSubmit;
  final keyboardController = ImpaktfullUiVirtualKeyboardTextEditController(
      config: ImpaktfullUiVirtualQwertyKeyboardConfig());
  final keyboard = ImpaktfullUiVirtualKeyboard(
      controller: keyboardController, onSubmit: () {});
  keyboard.onSubmit;
  BuildContext? context;
  ImpaktfullUiVirtualKeyboard.show(
      context: context!, controller: keyboardController, onSubmit: () {});
  keyboardController.openKeyboard(context, onSubmit: () {});
  final accordion = ImpaktfullUiAccordion(
      title: '',
      expanded: false,
      expandedBuilder: (context) => const SizedBox(),
      onExpandedChanged: (_) {});
  accordion.onExpandedChanged;
  const screen = ImpaktfullUiScreen(fab: SizedBox(), child: SizedBox());
  screen.fab;
  final adaptiveScreen = ImpaktfullUiAdaptiveScreen(
      fab: const SizedBox(), builder: (context) => const SizedBox());
  adaptiveScreen.fab;
  final horizontalTabs = ImpaktfullUiHorizontalTabs<int>(
      selectedValue: 0, onTabSelected: (_) {}, tabs: const []);
  horizontalTabs.selectedValue;
  horizontalTabs.onTabSelected;
  const optionSelector =
      ImpaktfullUiOptionSelector<int>(options: [0], selectedValue: 0);
  optionSelector.selectedValue;
  ImpaktfullUiOptionSelector.show<int>(
      context: context, title: '', options: [0], selectedValue: 0);
  final commandMenuWindow2 = ImpaktfullUiCommandMenuWindow(
      onInputChanged: (_) {}, onCloseWindow: () {});
  commandMenuWindow2.onInputChanged;
  final pagination = ImpaktfullUiPagination(
      page: 0, itemsPerPage: 1, amountOfItems: 1, onLoadPage: (_) {});
  pagination.onLoadPage;
  ImpaktfullUiPagination.withAmountOfPages(
      page: 0, itemsPerPage: 1, amountOfPages: 1, onLoadPage: (_) {});
  final forgetPassword = ImpaktfullUiBBForgetPassword(
      email: '', onChangedEmail: (_) {}, onResetPasswordTapped: () async {});
  forgetPassword.onChangedEmail;
  final login = ImpaktfullUiBBLogin(
      email: '',
      password: '',
      onChangedEmail: (_) {},
      onChangedPassword: (_) {},
      onLoginTapped: () async {});
  login.onChangedEmail;
  login.onChangedPassword;
  final register = ImpaktfullUiBBRegister(
      email: '',
      password: '',
      onChangedEmail: (_) {},
      onChangedPassword: (_) {},
      onRegisterTapped: () async {});
  register.onChangedEmail;
  register.onChangedPassword;
  final verifyRegisterCode = ImpaktfullUiBBVerifyRegisterCode(
      code: '',
      onChangedVerificationCode: (_) {},
      onVerifyCodeTapped: () async {});
  verifyRegisterCode.onChangedVerificationCode;
  final badge = ImpaktfullUiBadge(
      type: ImpaktfullUiBadgeType.primary, label: '', onCloseTap: () {});
  badge.label;
  badge.onCloseTap;
  final modal = ImpaktfullUiModal(
      primaryActionLabel: '',
      primaryActionOnTap: () {},
      secondaryActionLabel: '',
      secondaryActionOnTap: () {});
  modal.primaryActionLabel;
  modal.primaryActionOnTap;
  modal.secondaryActionLabel;
  modal.secondaryActionOnTap;
  ImpaktfullUiModal.simple(
      primaryActionLabel: '',
      primaryActionOnTap: () {},
      secondaryActionLabel: '',
      secondaryActionOnTap: () {});
  final calendar = ImpaktfullUiCalendar(
      selectedDate: DateTime(2024),
      events: const [],
      type: ImpaktfullUiCalendarType.list,
      onEventTap: (_) {});
  calendar.onEventTap;
  final calendarList = ImpaktfullUiCalendarList(
      selectedDate: DateTime(2024), events: const [], onEventTap: (_) {});
  calendarList.onEventTap;
  final calendarWeek = ImpaktfullUiCalendarWeek(
      selectedDate: DateTime(2024), events: const [], onEventTap: (_) {});
  calendarWeek.onEventTap;
  final markdown = ImpaktfullUiMarkdown(data: '', onOpenLink: (_) {});
  markdown.onOpenLink;
  const floatingActionButton =
      ImpaktfullUiFloatingActionButton(asset: asset, label: '');
  floatingActionButton.label;
  const dropdown = ImpaktfullUiDropdown<int>(buttonText: '', child: SizedBox());
  dropdown.buttonText;
  const dropdownItem = ImpaktfullUiDropdownItem(label: '', value: 0);
  dropdownItem.label;
  ImpaktfullUiDropdown<int>.builder(
      items: const [dropdownItem],
      itemBuilder: null,
      noDataLabel: '',
      buttonText: '');
  const bottomNavigationItem = ImpaktfullUiBottomNavigationItem(
      asset: asset, isSelected: false, label: '', showLabel: false);
  bottomNavigationItem.label;
  bottomNavigationItem.showLabel;
  final horizontalTab = ImpaktfullUiHorizontalTab(label: '', onTap: () {});
  horizontalTab.label;
  final horizontalTabConfig =
      ImpaktfullUiHorizontalTabConfig(label: '', value: 0);
  horizontalTabConfig.label;
  TabController? tabController;
  final tabBarItem =
      ImpaktfullUiTabBarItem(label: '', index: 0, controller: tabController!);
  tabBarItem.label;
  final inputFieldAction =
      ImpaktfullUiInputFieldAction(onTap: () {}, label: '');
  inputFieldAction.label;
  final segmentedControl = ImpaktfullUiSegmentedControl<int>(
      value: 0,
      items: const [0],
      onChanged: (_) {},
      labelBuilder: (context, item) => '');
  segmentedControl.labelBuilder;
  final dateInputField =
      ImpaktfullUiDateInputField(date: null, onDateSelected: (_) {});
  dateInputField.date;
  dateInputField.onDateSelected;
  final colorPicker = ImpaktfullUiColorPicker(
      selectedColor: null, onColorChanged: (_) {}, onColorChangeEnd: (_) {});
  colorPicker.onColorChanged;
  colorPicker.onColorChangeEnd;
  final wysiwyg = ImpaktfullUiWysiwyg(text: '', onChanged: (_) {});
  wysiwyg.text;

  debugPrint([
    carousel,
    carouselTheme,
    carouselAssetsTheme,
    carouselColorTheme,
    carouselDimensTheme,
    carouselTextStyleTheme,
    checkboxListItemType,
    checkboxListItemTheme,
    checkboxListItemAssetsTheme,
    checkboxListItemColorTheme,
    checkboxListItemDimensTheme,
    checkboxListItemTextStyleTheme,
    themeBuilder,
    alignment,
    defaultTheme,
    customBadgeWidget,
    commandMenuWindow,
    inputFieldValidator,
    circleProgressPainter,
    halfCircleProgressPainter,
    virtualKeyboardConfig,
    bbLicensesLocalizations,
    tableHeaderItemTextStylesTheme,
    snackyConfiguratorTextStylesTheme,
    tableRowItemTextStylesTheme,
    horizontalTabTextStylesTheme,
    cmsHeaderTextStylesTheme,
    buttonTextStylesTheme,
    listViewTextStylesTheme,
    inputFieldTextStylesTheme,
    tableRowTextStylesTheme,
    badgeTextStylesTheme,
    loadingIndicatorAssetTheme,
    tooltipDurationTheme,
    notificationBadgeDurationTheme,
    sidebarNavigationItemDurationTheme,
    dropdownShadowTheme,
    buttonShadowTheme,
    autoCompleteShadowTheme,
  ].toString());
}

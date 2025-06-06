import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/accordion/accordion.dart';
import 'package:impaktfull_ui/src/components/avatar/avatar.dart';
import 'package:impaktfull_ui/src/components/badge/badge.dart';
import 'package:impaktfull_ui/src/components/bottom_actions/bottom_actions.dart';
import 'package:impaktfull_ui/src/components/bottom_navigation/bottom_navigation.dart';
import 'package:impaktfull_ui/src/components/bottom_navigation_item/bottom_navigation_item.dart';
import 'package:impaktfull_ui/src/components/bottom_sheet/bottom_sheet.dart';
import 'package:impaktfull_ui/src/components/button/button.dart';
import 'package:impaktfull_ui/src/components/calendar/calendar.dart';
import 'package:impaktfull_ui/src/components/card/card.dart';
import 'package:impaktfull_ui/src/components/carrousel/carrousel.dart';
import 'package:impaktfull_ui/src/components/chat/chat.dart';
import 'package:impaktfull_ui/src/components/check_box_list_item/check_box_list_item.dart';
import 'package:impaktfull_ui/src/components/checkbox/checkbox.dart';
import 'package:impaktfull_ui/src/components/cms_header/cms_header.dart';
import 'package:impaktfull_ui/src/components/color_input_field/color_input_field_style.dart';
import 'package:impaktfull_ui/src/components/color_picker/color_picker.dart';
import 'package:impaktfull_ui/src/components/command_menu/command_menu.dart';
import 'package:impaktfull_ui/src/components/confetti/confetti.dart';
import 'package:impaktfull_ui/src/components/date_input_field/date_input_field.dart';
import 'package:impaktfull_ui/src/components/date_picker/date_picker.dart';
import 'package:impaktfull_ui/src/components/date_time_picker/date_time_picker.dart';
import 'package:impaktfull_ui/src/components/divider/divider.dart';
import 'package:impaktfull_ui/src/components/dropdown/dropdown.dart';
import 'package:impaktfull_ui/src/components/file_picker/file_picker.dart';
import 'package:impaktfull_ui/src/components/floating_action_button/floating_action_button.dart';
import 'package:impaktfull_ui/src/components/fluid_padding/fluid_padding.dart';
import 'package:impaktfull_ui/src/components/gallery/gallery.dart';
import 'package:impaktfull_ui/src/components/grid_view/grid_view.dart';
import 'package:impaktfull_ui/src/components/horizontal_tab/horizontal_tab.dart';
import 'package:impaktfull_ui/src/components/horizontal_tabs/horizontal_tabs.dart';
import 'package:impaktfull_ui/src/components/input_field/input_field.dart';
import 'package:impaktfull_ui/src/components/introduction/introduction.dart';
import 'package:impaktfull_ui/src/components/list_item/list_item.dart';
import 'package:impaktfull_ui/src/components/list_view/list_view.dart';
import 'package:impaktfull_ui/src/components/loading_error_data/loading_error_data.dart';
import 'package:impaktfull_ui/src/components/loading_indicator/loading_indicator.dart';
import 'package:impaktfull_ui/src/components/markdown/markdown.dart';
import 'package:impaktfull_ui/src/components/modal/modal.dart';
import 'package:impaktfull_ui/src/components/nav_bar/nav_bar.dart';
import 'package:impaktfull_ui/src/components/network_image/network_image.dart';
import 'package:impaktfull_ui/src/components/notification/notification.dart';
import 'package:impaktfull_ui/src/components/notification_badge/notification_badge.dart';
import 'package:impaktfull_ui/src/components/option_selector/option_selector.dart';
import 'package:impaktfull_ui/src/components/pagination/pagination.dart';
import 'package:impaktfull_ui/src/components/password_strength_indicator/password_strength_indicator.dart';
import 'package:impaktfull_ui/src/components/pin_code/pin_code.dart';
import 'package:impaktfull_ui/src/components/progress_indicator/progress_indicator_style.dart';
import 'package:impaktfull_ui/src/components/radio_button/radio_button.dart';
import 'package:impaktfull_ui/src/components/radio_button_list_item/radio_button_list_item.dart';
import 'package:impaktfull_ui/src/components/refresh_indicator/refresh_indicator.dart';
import 'package:impaktfull_ui/src/components/responsive_layout/responsive_layout.dart';
import 'package:impaktfull_ui/src/components/screen/screen.dart';
import 'package:impaktfull_ui/src/components/section_title/section_title.dart';
import 'package:impaktfull_ui/src/components/segmented_control/segmented_control.dart';
import 'package:impaktfull_ui/src/components/selectable_list_item/selectable_list_item.dart';
import 'package:impaktfull_ui/src/components/separated_column/separated_column.dart';
import 'package:impaktfull_ui/src/components/sidebar_navigation/sidebar_navigation.dart';
import 'package:impaktfull_ui/src/components/sidebar_navigation_item/sidebar_navigation_item.dart';
import 'package:impaktfull_ui/src/components/simple_list_item/simple_list_item.dart';
import 'package:impaktfull_ui/src/components/skeleton/skeleton.dart';
import 'package:impaktfull_ui/src/components/slider/slider.dart';
import 'package:impaktfull_ui/src/components/snacky/snacky_configurator.dart';
import 'package:impaktfull_ui/src/components/stepper/stepper_style.dart';
import 'package:impaktfull_ui/src/components/switch/switch.dart';
import 'package:impaktfull_ui/src/components/switch_list_item/switch_list_item.dart';
import 'package:impaktfull_ui/src/components/tab_bar/tab_bar.dart';
import 'package:impaktfull_ui/src/components/tab_bar_item/tab_bar_item.dart';
import 'package:impaktfull_ui/src/components/table/table.dart';
import 'package:impaktfull_ui/src/components/table_header/table_header.dart';
import 'package:impaktfull_ui/src/components/table_header_item/table_header_item.dart';
import 'package:impaktfull_ui/src/components/table_row/table_row.dart';
import 'package:impaktfull_ui/src/components/table_row_item/table_row_item.dart';
import 'package:impaktfull_ui/src/components/time_picker/time_picker.dart';
import 'package:impaktfull_ui/src/components/tooltip/tooltip.dart';
import 'package:impaktfull_ui/src/components/unified_screen_layout/unified_screen_layout.dart';
import 'package:impaktfull_ui/src/components/virtual_keyboard/virtual_keyboard.dart';
import 'package:impaktfull_ui/src/components/wysiwyg/wysiwyg.dart';
import 'package:impaktfull_ui/src/components/auto_complete/auto_complete.dart';
import 'package:impaktfull_ui/src/components/image_crop/image_crop.dart';
import 'package:impaktfull_ui/src/components/number_input/number_input.dart';
import 'package:impaktfull_ui/src/components/placeholder/placeholder.dart';
import 'package:impaktfull_ui/src/components/metric/metric.dart';
import 'package:impaktfull_ui/src/components/line_chart/line_chart.dart';

abstract class ImpaktfullUiComponentTheme {
  const ImpaktfullUiComponentTheme();
}

class ImpaktfullUiComponentsTheme {
  final ImpaktfullUiAccordionTheme accordion;
  final ImpaktfullUiAvatarTheme avatar;
  final ImpaktfullUiAutoCompleteTheme autoComplete;
  final ImpaktfullUiBadgeTheme badge;
  final ImpaktfullUiBottomActionsTheme bottomActions;
  final ImpaktfullUiBottomNavigationTheme bottomNavigation;
  final ImpaktfullUiBottomNavigationItemTheme bottomNavigationItem;
  final ImpaktfullUiBottomSheetTheme bottomSheet;
  final ImpaktfullUiButtonTheme button;
  final ImpaktfullUiCalendarTheme calendar;
  final ImpaktfullUiCardTheme card;
  final ImpaktfullUiCarrouselTheme carrousel;
  final ImpaktfullUiChatTheme chat;
  final ImpaktfullUiCheckboxTheme checkbox;
  final ImpaktfullUiCheckBoxListItemTheme checkBoxListItem;
  final ImpaktfullUiCmsHeaderTheme cmsHeader;
  final ImpaktfullUiColorPickerTheme colorPicker;
  final ImpaktfullUiColorInputFieldTheme colorInputField;
  final ImpaktfullUiCommandMenuTheme commandMenu;
  final ImpaktfullUiConfettiTheme confetti;
  final ImpaktfullUiDateInputFieldTheme dateInputField;
  final ImpaktfullUiDatePickerTheme datePicker;
  final ImpaktfullUiDateTimePickerTheme dateTimePicker;
  final ImpaktfullUiDividerTheme divider;
  final ImpaktfullUiDropdownTheme dropdown;
  final ImpaktfullUiFilePickerTheme filePicker;
  final ImpaktfullUiFloatingActionButtonTheme floatingActionButton;
  final ImpaktfullUiFluidPaddingTheme fluidPadding;
  final ImpaktfullUiGalleryTheme gallery;
  final ImpaktfullUiGridViewTheme gridView;
  final ImpaktfullUiHorizontalTabTheme horizontalTab;
  final ImpaktfullUiHorizontalTabsTheme horizontalTabs;
  final ImpaktfullUiImageCropTheme imageCrop;
  final ImpaktfullUiInputFieldTheme inputField;
  final ImpaktfullUiIntroductionTheme introduction;
  final ImpaktfullUiLineChartTheme lineChart;
  final ImpaktfullUiListItemTheme listItem;
  final ImpaktfullUiListViewTheme listView;
  final ImpaktfullUiLoadingErrorDataTheme loadingErrorData;
  final ImpaktfullUiLoadingIndicatorTheme loadingIndicator;
  final ImpaktfullUiMarkdownTheme markdown;
  final ImpaktfullUiMetricTheme metric;
  final ImpaktfullUiModalTheme modal;
  final ImpaktfullUiNavBarTheme navBar;
  final ImpaktfullUiNetworkImageTheme networkImage;
  final ImpaktfullUiNotificationTheme notification;
  final ImpaktfullUiNotificationBadgeTheme notificationBadge;
  final ImpaktfullUiNumberInputTheme numberInput;
  final ImpaktfullUiOptionSelectorTheme optionSelector;
  final ImpaktfullUiPaginationTheme pagination;
  final ImpaktfullUiPasswordStrengthIndicatorTheme passwordStrengthIndicator;
  final ImpaktfullUiPinCodeTheme pinCode;
  final ImpaktfullUiPlaceholderTheme placeholder;
  final ImpaktfullUiProgressIndicatorTheme progressIndicator;
  final ImpaktfullUiRadioButtonTheme radioButton;
  final ImpaktfullUiRadioButtonListItemTheme radioButtonListItem;
  final ImpaktfullUiRefreshIndicatorTheme refreshIndicator;
  final ImpaktfullUiResponsiveLayoutTheme responsiveLayout;
  final ImpaktfullUiScreenTheme screen;
  final ImpaktfullUiSectionTitleTheme sectionTitle;
  final ImpaktfullUiSegmentedControlTheme segmentedControl;
  final ImpaktfullUiSelectableListItemTheme selectableListItem;
  final ImpaktfullUiSeparatedColumnTheme separatedColumn;
  final ImpaktfullUiSidebarNavigationTheme sidebarNavigation;
  final ImpaktfullUiSidebarNavigationItemTheme sidebarNavigationItem;
  final ImpaktfullUiSimpleListItemTheme simpleListItem;
  final ImpaktfullUiSkeletonTheme skeleton;
  final ImpaktfullUiSliderTheme slider;
  final ImpaktfullUiSnackyConfiguratorTheme snackyConfigurator;
  final ImpaktfullUiStepperTheme stepper;
  final ImpaktfullUiSwitchTheme switchTheme;
  final ImpaktfullUiSwitchListItemTheme switchListItem;
  final ImpaktfullUiTabBarTheme tabBar;
  final ImpaktfullUiTabBarItemTheme tabBarItem;
  final ImpaktfullUiTableTheme table;
  final ImpaktfullUiTableHeaderTheme tableHeader;
  final ImpaktfullUiTableHeaderItemTheme tableHeaderItem;
  final ImpaktfullUiTableRowTheme tableRow;
  final ImpaktfullUiTableRowItemTheme tableRowItem;
  final ImpaktfullUiTimePickerTheme timePicker;
  final ImpaktfullUiTooltipTheme tooltip;
  final ImpaktfullUiUnifiedScreenLayoutTheme unifiedScreenLayout;
  final ImpaktfullUiVirtualKeyboardTheme virtualKeyboard;
  final ImpaktfullUiWysiwygTheme wysiwyg;

  ImpaktfullUiComponentsTheme({
    required this.accordion,
    required this.avatar,
    required this.autoComplete,
    required this.badge,
    required this.bottomActions,
    required this.bottomNavigation,
    required this.bottomNavigationItem,
    required this.bottomSheet,
    required this.button,
    required this.calendar,
    required this.card,
    required this.carrousel,
    required this.chat,
    required this.checkbox,
    required this.checkBoxListItem,
    required this.cmsHeader,
    required this.colorPicker,
    required this.colorInputField,
    required this.commandMenu,
    required this.confetti,
    required this.dateInputField,
    required this.datePicker,
    required this.dateTimePicker,
    required this.divider,
    required this.dropdown,
    required this.filePicker,
    required this.floatingActionButton,
    required this.fluidPadding,
    required this.gridView,
    required this.gallery,
    required this.horizontalTab,
    required this.horizontalTabs,
    required this.imageCrop,
    required this.inputField,
    required this.introduction,
    required this.lineChart,
    required this.listItem,
    required this.listView,
    required this.loadingErrorData,
    required this.loadingIndicator,
    required this.markdown,
    required this.metric,
    required this.modal,
    required this.navBar,
    required this.networkImage,
    required this.notification,
    required this.notificationBadge,
    required this.numberInput,
    required this.optionSelector,
    required this.pagination,
    required this.passwordStrengthIndicator,
    required this.pinCode,
    required this.placeholder,
    required this.progressIndicator,
    required this.radioButton,
    required this.radioButtonListItem,
    required this.refreshIndicator,
    required this.responsiveLayout,
    required this.screen,
    required this.sectionTitle,
    required this.segmentedControl,
    required this.selectableListItem,
    required this.separatedColumn,
    required this.sidebarNavigation,
    required this.sidebarNavigationItem,
    required this.simpleListItem,
    required this.skeleton,
    required this.slider,
    required this.snackyConfigurator,
    required this.stepper,
    required this.switchTheme,
    required this.switchListItem,
    required this.tabBar,
    required this.tabBarItem,
    required this.table,
    required this.tableHeader,
    required this.tableHeaderItem,
    required this.tableRow,
    required this.tableRowItem,
    required this.timePicker,
    required this.tooltip,
    required this.unifiedScreenLayout,
    required this.virtualKeyboard,
    required this.wysiwyg,
  });

  ImpaktfullUiComponentsTheme copyWith({
    ImpaktfullUiAccordionTheme? accordion,
    ImpaktfullUiAvatarTheme? avatar,
    ImpaktfullUiAutoCompleteTheme? autoComplete,
    ImpaktfullUiBadgeTheme? badge,
    ImpaktfullUiBottomActionsTheme? bottomActions,
    ImpaktfullUiBottomNavigationTheme? bottomNavigation,
    ImpaktfullUiBottomNavigationItemTheme? bottomNavigationItem,
    ImpaktfullUiBottomSheetTheme? bottomSheet,
    ImpaktfullUiButtonTheme? button,
    ImpaktfullUiCalendarTheme? calendar,
    ImpaktfullUiCardTheme? card,
    ImpaktfullUiCarrouselTheme? carrousel,
    ImpaktfullUiChatTheme? chat,
    ImpaktfullUiCheckboxTheme? checkbox,
    ImpaktfullUiCheckBoxListItemTheme? checkBoxListItem,
    ImpaktfullUiCmsHeaderTheme? cmsHeader,
    ImpaktfullUiColorPickerTheme? colorPicker,
    ImpaktfullUiColorInputFieldTheme? colorInputField,
    ImpaktfullUiCommandMenuTheme? commandMenu,
    ImpaktfullUiConfettiTheme? confetti,
    ImpaktfullUiDateInputFieldTheme? dateInputField,
    ImpaktfullUiDatePickerTheme? datePicker,
    ImpaktfullUiDateTimePickerTheme? dateTimePicker,
    ImpaktfullUiDividerTheme? divider,
    ImpaktfullUiDropdownTheme? dropdown,
    ImpaktfullUiFilePickerTheme? filePicker,
    ImpaktfullUiFloatingActionButtonTheme? floatingActionButton,
    ImpaktfullUiFluidPaddingTheme? fluidPadding,
    ImpaktfullUiGalleryTheme? gallery,
    ImpaktfullUiGridViewTheme? gridView,
    ImpaktfullUiHorizontalTabTheme? horizontalTab,
    ImpaktfullUiHorizontalTabsTheme? horizontalTabs,
    ImpaktfullUiImageCropTheme? imageCrop,
    ImpaktfullUiInputFieldTheme? inputField,
    ImpaktfullUiIntroductionTheme? introduction,
    ImpaktfullUiLineChartTheme? lineChart,
    ImpaktfullUiListItemTheme? listItem,
    ImpaktfullUiListViewTheme? listView,
    ImpaktfullUiLoadingErrorDataTheme? loadingErrorData,
    ImpaktfullUiLoadingIndicatorTheme? loadingIndicator,
    ImpaktfullUiMarkdownTheme? markdown,
    ImpaktfullUiMetricTheme? metric,
    ImpaktfullUiModalTheme? modal,
    ImpaktfullUiNavBarTheme? navBar,
    ImpaktfullUiNetworkImageTheme? networkImage,
    ImpaktfullUiNotificationTheme? notification,
    ImpaktfullUiNotificationBadgeTheme? notificationBadge,
    ImpaktfullUiNumberInputTheme? numberInput,
    ImpaktfullUiOptionSelectorTheme? optionSelector,
    ImpaktfullUiPaginationTheme? pagination,
    ImpaktfullUiPasswordStrengthIndicatorTheme? passwordStrengthIndicator,
    ImpaktfullUiPinCodeTheme? pinCode,
    ImpaktfullUiPlaceholderTheme? placeholder,
    ImpaktfullUiProgressIndicatorTheme? progressIndicator,
    ImpaktfullUiRadioButtonTheme? radioButton,
    ImpaktfullUiRadioButtonListItemTheme? radioButtonListItem,
    ImpaktfullUiRefreshIndicatorTheme? refreshIndicator,
    ImpaktfullUiResponsiveLayoutTheme? responsiveLayout,
    ImpaktfullUiScreenTheme? screen,
    ImpaktfullUiSectionTitleTheme? sectionTitle,
    ImpaktfullUiSegmentedControlTheme? segmentedControl,
    ImpaktfullUiSelectableListItemTheme? selectableListItem,
    ImpaktfullUiSeparatedColumnTheme? separatedColumn,
    ImpaktfullUiSidebarNavigationTheme? sidebarNavigation,
    ImpaktfullUiSidebarNavigationItemTheme? sidebarNavigationItem,
    ImpaktfullUiSimpleListItemTheme? simpleListItem,
    ImpaktfullUiSkeletonTheme? skeleton,
    ImpaktfullUiSliderTheme? slider,
    ImpaktfullUiSnackyConfiguratorTheme? snackyConfigurator,
    ImpaktfullUiStepperTheme? stepper,
    ImpaktfullUiSwitchTheme? switchTheme,
    ImpaktfullUiSwitchListItemTheme? switchListItem,
    ImpaktfullUiTabBarTheme? tabBar,
    ImpaktfullUiTabBarItemTheme? tabBarItem,
    ImpaktfullUiTableTheme? table,
    ImpaktfullUiTableHeaderTheme? tableHeader,
    ImpaktfullUiTableHeaderItemTheme? tableHeaderItem,
    ImpaktfullUiTableRowTheme? tableRow,
    ImpaktfullUiTableRowItemTheme? tableRowItem,
    ImpaktfullUiTimePickerTheme? timePicker,
    ImpaktfullUiTooltipTheme? tooltip,
    ImpaktfullUiUnifiedScreenLayoutTheme? unifiedScreenLayout,
    ImpaktfullUiVirtualKeyboardTheme? virtualKeyboard,
    ImpaktfullUiWysiwygTheme? wysiwyg,
  }) =>
      ImpaktfullUiComponentsTheme(
        accordion: accordion ?? this.accordion,
        avatar: avatar ?? this.avatar,
        autoComplete: autoComplete ?? this.autoComplete,
        badge: badge ?? this.badge,
        bottomActions: bottomActions ?? this.bottomActions,
        bottomNavigation: bottomNavigation ?? this.bottomNavigation,
        bottomNavigationItem: bottomNavigationItem ?? this.bottomNavigationItem,
        bottomSheet: bottomSheet ?? this.bottomSheet,
        button: button ?? this.button,
        calendar: calendar ?? this.calendar,
        card: card ?? this.card,
        carrousel: carrousel ?? this.carrousel,
        chat: chat ?? this.chat,
        checkbox: checkbox ?? this.checkbox,
        checkBoxListItem: checkBoxListItem ?? this.checkBoxListItem,
        cmsHeader: cmsHeader ?? this.cmsHeader,
        colorPicker: colorPicker ?? this.colorPicker,
        colorInputField: colorInputField ?? this.colorInputField,
        commandMenu: commandMenu ?? this.commandMenu,
        confetti: confetti ?? this.confetti,
        dateInputField: dateInputField ?? this.dateInputField,
        datePicker: datePicker ?? this.datePicker,
        dateTimePicker: dateTimePicker ?? this.dateTimePicker,
        divider: divider ?? this.divider,
        dropdown: dropdown ?? this.dropdown,
        filePicker: filePicker ?? this.filePicker,
        floatingActionButton: floatingActionButton ?? this.floatingActionButton,
        fluidPadding: fluidPadding ?? this.fluidPadding,
        gridView: gridView ?? this.gridView,
        gallery: gallery ?? this.gallery,
        horizontalTab: horizontalTab ?? this.horizontalTab,
        horizontalTabs: horizontalTabs ?? this.horizontalTabs,
        imageCrop: imageCrop ?? this.imageCrop,
        inputField: inputField ?? this.inputField,
        introduction: introduction ?? this.introduction,
        lineChart: lineChart ?? this.lineChart,
        listItem: listItem ?? this.listItem,
        listView: listView ?? this.listView,
        loadingErrorData: loadingErrorData ?? this.loadingErrorData,
        loadingIndicator: loadingIndicator ?? this.loadingIndicator,
        markdown: markdown ?? this.markdown,
        metric: metric ?? this.metric,
        modal: modal ?? this.modal,
        navBar: navBar ?? this.navBar,
        networkImage: networkImage ?? this.networkImage,
        notification: notification ?? this.notification,
        notificationBadge: notificationBadge ?? this.notificationBadge,
        numberInput: numberInput ?? this.numberInput,
        optionSelector: optionSelector ?? this.optionSelector,
        pagination: pagination ?? this.pagination,
        passwordStrengthIndicator:
            passwordStrengthIndicator ?? this.passwordStrengthIndicator,
        pinCode: pinCode ?? this.pinCode,
        placeholder: placeholder ?? this.placeholder,
        progressIndicator: progressIndicator ?? this.progressIndicator,
        radioButton: radioButton ?? this.radioButton,
        radioButtonListItem: radioButtonListItem ?? this.radioButtonListItem,
        refreshIndicator: refreshIndicator ?? this.refreshIndicator,
        responsiveLayout: responsiveLayout ?? this.responsiveLayout,
        screen: screen ?? this.screen,
        sectionTitle: sectionTitle ?? this.sectionTitle,
        segmentedControl: segmentedControl ?? this.segmentedControl,
        selectableListItem: selectableListItem ?? this.selectableListItem,
        sidebarNavigation: sidebarNavigation ?? this.sidebarNavigation,
        sidebarNavigationItem:
            sidebarNavigationItem ?? this.sidebarNavigationItem,
        separatedColumn: separatedColumn ?? this.separatedColumn,
        simpleListItem: simpleListItem ?? this.simpleListItem,
        skeleton: skeleton ?? this.skeleton,
        slider: slider ?? this.slider,
        snackyConfigurator: snackyConfigurator ?? this.snackyConfigurator,
        stepper: stepper ?? this.stepper,
        switchTheme: switchTheme ?? this.switchTheme,
        switchListItem: switchListItem ?? this.switchListItem,
        tabBar: tabBar ?? this.tabBar,
        tabBarItem: tabBarItem ?? this.tabBarItem,
        table: table ?? this.table,
        tableHeader: tableHeader ?? this.tableHeader,
        tableHeaderItem: tableHeaderItem ?? this.tableHeaderItem,
        tableRow: tableRow ?? this.tableRow,
        tableRowItem: tableRowItem ?? this.tableRowItem,
        timePicker: timePicker ?? this.timePicker,
        tooltip: tooltip ?? this.tooltip,
        unifiedScreenLayout: unifiedScreenLayout ?? this.unifiedScreenLayout,
        virtualKeyboard: virtualKeyboard ?? this.virtualKeyboard,
        wysiwyg: wysiwyg ?? this.wysiwyg,
      );

  static T of<T extends ImpaktfullUiComponentTheme>(BuildContext context) {
    if (T == ImpaktfullUiAccordionTheme) {
      return ImpaktfullUiAccordionTheme.of(context) as T;
    } else if (T == ImpaktfullUiAvatarTheme) {
      return ImpaktfullUiAvatarTheme.of(context) as T;
    } else if (T == ImpaktfullUiAutoCompleteTheme) {
      return ImpaktfullUiAutoCompleteTheme.of(context) as T;
    } else if (T == ImpaktfullUiBadgeTheme) {
      return ImpaktfullUiBadgeTheme.of(context) as T;
    } else if (T == ImpaktfullUiBottomActionsTheme) {
      return ImpaktfullUiBottomActionsTheme.of(context) as T;
    } else if (T == ImpaktfullUiBottomNavigationTheme) {
      return ImpaktfullUiBottomNavigationTheme.of(context) as T;
    } else if (T == ImpaktfullUiBottomNavigationItemTheme) {
      return ImpaktfullUiBottomNavigationItemTheme.of(context) as T;
    } else if (T == ImpaktfullUiBottomSheetTheme) {
      return ImpaktfullUiBottomSheetTheme.of(context) as T;
    } else if (T == ImpaktfullUiButtonTheme) {
      return ImpaktfullUiButtonTheme.of(context) as T;
    } else if (T == ImpaktfullUiCalendarTheme) {
      return ImpaktfullUiCalendarTheme.of(context) as T;
    } else if (T == ImpaktfullUiCardTheme) {
      return ImpaktfullUiCardTheme.of(context) as T;
    } else if (T == ImpaktfullUiCarrouselTheme) {
      return ImpaktfullUiCarrouselTheme.of(context) as T;
    } else if (T == ImpaktfullUiChatTheme) {
      return ImpaktfullUiChatTheme.of(context) as T;
    } else if (T == ImpaktfullUiCheckboxTheme) {
      return ImpaktfullUiCheckboxTheme.of(context) as T;
    } else if (T == ImpaktfullUiCheckBoxListItemTheme) {
      return ImpaktfullUiCheckBoxListItemTheme.of(context) as T;
    } else if (T == ImpaktfullUiCmsHeaderTheme) {
      return ImpaktfullUiCmsHeaderTheme.of(context) as T;
    } else if (T == ImpaktfullUiColorPickerTheme) {
      return ImpaktfullUiColorPickerTheme.of(context) as T;
    } else if (T == ImpaktfullUiColorInputFieldTheme) {
      return ImpaktfullUiColorInputFieldTheme.of(context) as T;
    } else if (T == ImpaktfullUiCommandMenuTheme) {
      return ImpaktfullUiCommandMenuTheme.of(context) as T;
    } else if (T == ImpaktfullUiConfettiTheme) {
      return ImpaktfullUiConfettiTheme.of(context) as T;
    } else if (T == ImpaktfullUiDateInputFieldTheme) {
      return ImpaktfullUiDateInputFieldTheme.of(context) as T;
    } else if (T == ImpaktfullUiDatePickerTheme) {
      return ImpaktfullUiDatePickerTheme.of(context) as T;
    } else if (T == ImpaktfullUiDateTimePickerTheme) {
      return ImpaktfullUiDateTimePickerTheme.of(context) as T;
    } else if (T == ImpaktfullUiDividerTheme) {
      return ImpaktfullUiDividerTheme.of(context) as T;
    } else if (T == ImpaktfullUiDropdownTheme) {
      return ImpaktfullUiDropdownTheme.of(context) as T;
    } else if (T == ImpaktfullUiFilePickerTheme) {
      return ImpaktfullUiFilePickerTheme.of(context) as T;
    } else if (T == ImpaktfullUiFloatingActionButtonTheme) {
      return ImpaktfullUiFloatingActionButtonTheme.of(context) as T;
    } else if (T == ImpaktfullUiFluidPaddingTheme) {
      return ImpaktfullUiFluidPaddingTheme.of(context) as T;
    } else if (T == ImpaktfullUiGalleryTheme) {
      return ImpaktfullUiGalleryTheme.of(context) as T;
    } else if (T == ImpaktfullUiGridViewTheme) {
      return ImpaktfullUiGridViewTheme.of(context) as T;
    } else if (T == ImpaktfullUiHorizontalTabTheme) {
      return ImpaktfullUiHorizontalTabTheme.of(context) as T;
    } else if (T == ImpaktfullUiHorizontalTabsTheme) {
      return ImpaktfullUiHorizontalTabsTheme.of(context) as T;
    } else if (T == ImpaktfullUiImageCropTheme) {
      return ImpaktfullUiImageCropTheme.of(context) as T;
    } else if (T == ImpaktfullUiInputFieldTheme) {
      return ImpaktfullUiInputFieldTheme.of(context) as T;
    } else if (T == ImpaktfullUiIntroductionTheme) {
      return ImpaktfullUiIntroductionTheme.of(context) as T;
    } else if (T == ImpaktfullUiLineChartTheme) {
      return ImpaktfullUiLineChartTheme.of(context) as T;
    } else if (T == ImpaktfullUiListItemTheme) {
      return ImpaktfullUiListItemTheme.of(context) as T;
    } else if (T == ImpaktfullUiListViewTheme) {
      return ImpaktfullUiListViewTheme.of(context) as T;
    } else if (T == ImpaktfullUiLoadingErrorDataTheme) {
      return ImpaktfullUiLoadingErrorDataTheme.of(context) as T;
    } else if (T == ImpaktfullUiLoadingIndicatorTheme) {
      return ImpaktfullUiLoadingIndicatorTheme.of(context) as T;
    } else if (T == ImpaktfullUiMarkdownTheme) {
      return ImpaktfullUiMarkdownTheme.of(context) as T;
    } else if (T == ImpaktfullUiMetricTheme) {
      return ImpaktfullUiMetricTheme.of(context) as T;
    } else if (T == ImpaktfullUiModalTheme) {
      return ImpaktfullUiModalTheme.of(context) as T;
    } else if (T == ImpaktfullUiNavBarTheme) {
      return ImpaktfullUiNavBarTheme.of(context) as T;
    } else if (T == ImpaktfullUiNetworkImageTheme) {
      return ImpaktfullUiNetworkImageTheme.of(context) as T;
    } else if (T == ImpaktfullUiNotificationTheme) {
      return ImpaktfullUiNotificationTheme.of(context) as T;
    } else if (T == ImpaktfullUiNotificationBadgeTheme) {
      return ImpaktfullUiNotificationBadgeTheme.of(context) as T;
    } else if (T == ImpaktfullUiNumberInputTheme) {
      return ImpaktfullUiNumberInputTheme.of(context) as T;
    } else if (T == ImpaktfullUiOptionSelectorTheme) {
      return ImpaktfullUiOptionSelectorTheme.of(context) as T;
    } else if (T == ImpaktfullUiProgressIndicatorTheme) {
      return ImpaktfullUiProgressIndicatorTheme.of(context) as T;
    } else if (T == ImpaktfullUiPaginationTheme) {
      return ImpaktfullUiPaginationTheme.of(context) as T;
    } else if (T == ImpaktfullUiPasswordStrengthIndicatorTheme) {
      return ImpaktfullUiPasswordStrengthIndicatorTheme.of(context) as T;
    } else if (T == ImpaktfullUiPinCodeTheme) {
      return ImpaktfullUiPinCodeTheme.of(context) as T;
    } else if (T == ImpaktfullUiPlaceholderTheme) {
      return ImpaktfullUiPlaceholderTheme.of(context) as T;
    } else if (T == ImpaktfullUiRadioButtonTheme) {
      return ImpaktfullUiRadioButtonTheme.of(context) as T;
    } else if (T == ImpaktfullUiRadioButtonListItemTheme) {
      return ImpaktfullUiRadioButtonListItemTheme.of(context) as T;
    } else if (T == ImpaktfullUiRefreshIndicatorTheme) {
      return ImpaktfullUiRefreshIndicatorTheme.of(context) as T;
    } else if (T == ImpaktfullUiResponsiveLayoutTheme) {
      return ImpaktfullUiResponsiveLayoutTheme.of(context) as T;
    } else if (T == ImpaktfullUiScreenTheme) {
      return ImpaktfullUiScreenTheme.of(context) as T;
    } else if (T == ImpaktfullUiSectionTitleTheme) {
      return ImpaktfullUiSectionTitleTheme.of(context) as T;
    } else if (T == ImpaktfullUiSegmentedControlTheme) {
      return ImpaktfullUiSegmentedControlTheme.of(context) as T;
    } else if (T == ImpaktfullUiSelectableListItemTheme) {
      return ImpaktfullUiSelectableListItemTheme.of(context) as T;
    } else if (T == ImpaktfullUiSeparatedColumnTheme) {
      return ImpaktfullUiSeparatedColumnTheme.of(context) as T;
    } else if (T == ImpaktfullUiSidebarNavigationTheme) {
      return ImpaktfullUiSidebarNavigationTheme.of(context) as T;
    } else if (T == ImpaktfullUiSidebarNavigationItemTheme) {
      return ImpaktfullUiSidebarNavigationItemTheme.of(context) as T;
    } else if (T == ImpaktfullUiSimpleListItemTheme) {
      return ImpaktfullUiSimpleListItemTheme.of(context) as T;
    } else if (T == ImpaktfullUiSkeletonTheme) {
      return ImpaktfullUiSkeletonTheme.of(context) as T;
    } else if (T == ImpaktfullUiSliderTheme) {
      return ImpaktfullUiSliderTheme.of(context) as T;
    } else if (T == ImpaktfullUiSnackyConfiguratorTheme) {
      return ImpaktfullUiSnackyConfiguratorTheme.of(context) as T;
    } else if (T == ImpaktfullUiStepperTheme) {
      return ImpaktfullUiStepperTheme.of(context) as T;
    } else if (T == ImpaktfullUiSwitchTheme) {
      return ImpaktfullUiSwitchTheme.of(context) as T;
    } else if (T == ImpaktfullUiSwitchListItemTheme) {
      return ImpaktfullUiSwitchListItemTheme.of(context) as T;
    } else if (T == ImpaktfullUiTabBarItemTheme) {
      return ImpaktfullUiTabBarItemTheme.of(context) as T;
    } else if (T == ImpaktfullUiTabBarTheme) {
      return ImpaktfullUiTabBarTheme.of(context) as T;
    } else if (T == ImpaktfullUiTableTheme) {
      return ImpaktfullUiTableTheme.of(context) as T;
    } else if (T == ImpaktfullUiTableHeaderTheme) {
      return ImpaktfullUiTableHeaderTheme.of(context) as T;
    } else if (T == ImpaktfullUiTableHeaderItemTheme) {
      return ImpaktfullUiTableHeaderItemTheme.of(context) as T;
    } else if (T == ImpaktfullUiTableRowTheme) {
      return ImpaktfullUiTableRowTheme.of(context) as T;
    } else if (T == ImpaktfullUiTableRowItemTheme) {
      return ImpaktfullUiTableRowItemTheme.of(context) as T;
    } else if (T == ImpaktfullUiTimePickerTheme) {
      return ImpaktfullUiTimePickerTheme.of(context) as T;
    } else if (T == ImpaktfullUiTooltipTheme) {
      return ImpaktfullUiTooltipTheme.of(context) as T;
    } else if (T == ImpaktfullUiUnifiedScreenLayoutTheme) {
      return ImpaktfullUiUnifiedScreenLayoutTheme.of(context) as T;
    } else if (T == ImpaktfullUiVirtualKeyboardTheme) {
      return ImpaktfullUiVirtualKeyboardTheme.of(context) as T;
    } else if (T == ImpaktfullUiWysiwygTheme) {
      return ImpaktfullUiWysiwygTheme.of(context) as T;
    } else {
      throw ArgumentError('$T is not configured in the impaktfull ui theme');
    }
  }
}

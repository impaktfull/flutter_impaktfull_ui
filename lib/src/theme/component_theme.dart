import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/building_block/licenses/licenses.theme.dart';
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
import 'package:impaktfull_ui/src/components/carousel/carousel.dart';
import 'package:impaktfull_ui/src/components/chat/chat.dart';
import 'package:impaktfull_ui/src/components/checkbox_list_item/checkbox_list_item.dart';
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
import 'package:impaktfull_ui/src/components/icon_button/icon_button.dart';
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
import 'package:impaktfull_ui/src/components/interaction_feedback/touch_feedback/touch_feedback.dart';
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
import 'package:impaktfull_ui/src/theme/theme.dart';

abstract class ImpaktfullUiComponentTheme {
  const ImpaktfullUiComponentTheme();
}

class ImpaktfullUiComponentsTheme {
  final ImpaktfullUiAccordionTheme accordion;
  final ImpaktfullUiAvatarTheme avatar;
  final ImpaktfullUiAutoCompleteTheme autoComplete;
  final ImpaktfullUiBadgeTheme badge;
  final ImpaktfullUiBBLicensesTheme bbLicenses;
  final ImpaktfullUiBottomActionsTheme bottomActions;
  final ImpaktfullUiBottomNavigationTheme bottomNavigation;
  final ImpaktfullUiBottomNavigationItemTheme bottomNavigationItem;
  final ImpaktfullUiBottomSheetTheme bottomSheet;
  final ImpaktfullUiButtonTheme button;
  final ImpaktfullUiCalendarTheme calendar;
  final ImpaktfullUiCardTheme card;
  final ImpaktfullUiCarouselTheme carousel;
  final ImpaktfullUiChatTheme chat;
  final ImpaktfullUiCheckboxTheme checkbox;
  final ImpaktfullUiCheckboxListItemTheme checkboxListItem;
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
  final ImpaktfullUiIconButtonTheme iconButton;
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
  final ImpaktfullUiTouchFeedbackTheme touchFeedback;
  final ImpaktfullUiUnifiedScreenLayoutTheme unifiedScreenLayout;
  final ImpaktfullUiVirtualKeyboardTheme virtualKeyboard;
  final ImpaktfullUiWysiwygTheme wysiwyg;

  ImpaktfullUiComponentsTheme({
    required this.accordion,
    required this.avatar,
    required this.autoComplete,
    required this.badge,
    required this.bbLicenses,
    required this.bottomActions,
    required this.bottomNavigation,
    required this.bottomNavigationItem,
    required this.bottomSheet,
    required this.button,
    required this.calendar,
    required this.card,
    // `carousel` becomes `required` again in 1.0.0, when `carrousel` is removed.
    ImpaktfullUiCarouselTheme? carousel,
    @Deprecated('Use carousel instead. Will be removed in 1.0.0.')
    ImpaktfullUiCarouselTheme? carrousel,
    required this.chat,
    required this.checkbox,
    // `checkboxListItem` becomes `required` again in 1.0.0, when
    // `checkBoxListItem` is removed.
    ImpaktfullUiCheckboxListItemTheme? checkboxListItem,
    @Deprecated('Use checkboxListItem instead. Will be removed in 1.0.0.')
    ImpaktfullUiCheckboxListItemTheme? checkBoxListItem,
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
    // Optional, so adding it does not break code that creates this class.
    // Defaults to ImpaktfullUiIconButtonTheme.fallback.
    ImpaktfullUiIconButtonTheme? iconButton,
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
    // Optional, so adding it does not break code that creates this class.
    // Defaults to ImpaktfullUiTouchFeedbackTheme.fallback.
    ImpaktfullUiTouchFeedbackTheme? touchFeedback,
    required this.unifiedScreenLayout,
    required this.virtualKeyboard,
    required this.wysiwyg,
  })  : assert(carousel != null || carrousel != null, 'carousel is required'),
        carousel = (carousel ?? carrousel)!,
        assert(checkboxListItem != null || checkBoxListItem != null,
            'checkboxListItem is required'),
        checkboxListItem = (checkboxListItem ?? checkBoxListItem)!,
        iconButton = iconButton ?? ImpaktfullUiIconButtonTheme.fallback,
        touchFeedback =
            touchFeedback ?? ImpaktfullUiTouchFeedbackTheme.fallback;

  @Deprecated('Use carousel instead. Will be removed in 1.0.0.')
  ImpaktfullUiCarouselTheme get carrousel => carousel;

  @Deprecated('Use checkboxListItem instead. Will be removed in 1.0.0.')
  ImpaktfullUiCheckboxListItemTheme get checkBoxListItem => checkboxListItem;

  ImpaktfullUiComponentsTheme copyWith({
    ImpaktfullUiAccordionTheme? accordion,
    ImpaktfullUiAvatarTheme? avatar,
    ImpaktfullUiAutoCompleteTheme? autoComplete,
    ImpaktfullUiBadgeTheme? badge,
    ImpaktfullUiBBLicensesTheme? bbLicenses,
    ImpaktfullUiBottomActionsTheme? bottomActions,
    ImpaktfullUiBottomNavigationTheme? bottomNavigation,
    ImpaktfullUiBottomNavigationItemTheme? bottomNavigationItem,
    ImpaktfullUiBottomSheetTheme? bottomSheet,
    ImpaktfullUiButtonTheme? button,
    ImpaktfullUiCalendarTheme? calendar,
    ImpaktfullUiCardTheme? card,
    ImpaktfullUiCarouselTheme? carousel,
    @Deprecated('Use carousel instead. Will be removed in 1.0.0.')
    ImpaktfullUiCarouselTheme? carrousel,
    ImpaktfullUiChatTheme? chat,
    ImpaktfullUiCheckboxTheme? checkbox,
    ImpaktfullUiCheckboxListItemTheme? checkboxListItem,
    @Deprecated('Use checkboxListItem instead. Will be removed in 1.0.0.')
    ImpaktfullUiCheckboxListItemTheme? checkBoxListItem,
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
    ImpaktfullUiIconButtonTheme? iconButton,
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
    ImpaktfullUiTouchFeedbackTheme? touchFeedback,
    ImpaktfullUiUnifiedScreenLayoutTheme? unifiedScreenLayout,
    ImpaktfullUiVirtualKeyboardTheme? virtualKeyboard,
    ImpaktfullUiWysiwygTheme? wysiwyg,
  }) =>
      ImpaktfullUiComponentsTheme(
        accordion: accordion ?? this.accordion,
        avatar: avatar ?? this.avatar,
        autoComplete: autoComplete ?? this.autoComplete,
        badge: badge ?? this.badge,
        bbLicenses: bbLicenses ?? this.bbLicenses,
        bottomActions: bottomActions ?? this.bottomActions,
        bottomNavigation: bottomNavigation ?? this.bottomNavigation,
        bottomNavigationItem: bottomNavigationItem ?? this.bottomNavigationItem,
        bottomSheet: bottomSheet ?? this.bottomSheet,
        button: button ?? this.button,
        calendar: calendar ?? this.calendar,
        card: card ?? this.card,
        carousel: carousel ?? carrousel ?? this.carousel,
        chat: chat ?? this.chat,
        checkbox: checkbox ?? this.checkbox,
        checkboxListItem:
            checkboxListItem ?? checkBoxListItem ?? this.checkboxListItem,
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
        iconButton: iconButton ?? this.iconButton,
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
        touchFeedback: touchFeedback ?? this.touchFeedback,
        unifiedScreenLayout: unifiedScreenLayout ?? this.unifiedScreenLayout,
        virtualKeyboard: virtualKeyboard ?? this.virtualKeyboard,
        wysiwyg: wysiwyg ?? this.wysiwyg,
      );

  /// Every component theme by the type that [of] looks it up with.
  ///
  /// Built once per [ImpaktfullUiComponentsTheme] (a theme is immutable), so
  /// [of] is a single map lookup instead of a walk over every component
  /// theme.
  late final Map<Type, ImpaktfullUiComponentTheme> _componentThemesByType = {
    ImpaktfullUiAccordionTheme: accordion,
    ImpaktfullUiAvatarTheme: avatar,
    ImpaktfullUiAutoCompleteTheme: autoComplete,
    ImpaktfullUiBadgeTheme: badge,
    ImpaktfullUiBBLicensesTheme: bbLicenses,
    ImpaktfullUiBottomActionsTheme: bottomActions,
    ImpaktfullUiBottomNavigationTheme: bottomNavigation,
    ImpaktfullUiBottomNavigationItemTheme: bottomNavigationItem,
    ImpaktfullUiBottomSheetTheme: bottomSheet,
    ImpaktfullUiButtonTheme: button,
    ImpaktfullUiCalendarTheme: calendar,
    ImpaktfullUiCardTheme: card,
    ImpaktfullUiCarouselTheme: carousel,
    ImpaktfullUiChatTheme: chat,
    ImpaktfullUiCheckboxTheme: checkbox,
    ImpaktfullUiCheckboxListItemTheme: checkboxListItem,
    ImpaktfullUiCmsHeaderTheme: cmsHeader,
    ImpaktfullUiColorPickerTheme: colorPicker,
    ImpaktfullUiColorInputFieldTheme: colorInputField,
    ImpaktfullUiCommandMenuTheme: commandMenu,
    ImpaktfullUiConfettiTheme: confetti,
    ImpaktfullUiDateInputFieldTheme: dateInputField,
    ImpaktfullUiDatePickerTheme: datePicker,
    ImpaktfullUiDateTimePickerTheme: dateTimePicker,
    ImpaktfullUiDividerTheme: divider,
    ImpaktfullUiDropdownTheme: dropdown,
    ImpaktfullUiFilePickerTheme: filePicker,
    ImpaktfullUiFloatingActionButtonTheme: floatingActionButton,
    ImpaktfullUiFluidPaddingTheme: fluidPadding,
    ImpaktfullUiGalleryTheme: gallery,
    ImpaktfullUiGridViewTheme: gridView,
    ImpaktfullUiHorizontalTabTheme: horizontalTab,
    ImpaktfullUiHorizontalTabsTheme: horizontalTabs,
    ImpaktfullUiIconButtonTheme: iconButton,
    ImpaktfullUiImageCropTheme: imageCrop,
    ImpaktfullUiInputFieldTheme: inputField,
    ImpaktfullUiIntroductionTheme: introduction,
    ImpaktfullUiLineChartTheme: lineChart,
    ImpaktfullUiListItemTheme: listItem,
    ImpaktfullUiListViewTheme: listView,
    ImpaktfullUiLoadingErrorDataTheme: loadingErrorData,
    ImpaktfullUiLoadingIndicatorTheme: loadingIndicator,
    ImpaktfullUiMarkdownTheme: markdown,
    ImpaktfullUiMetricTheme: metric,
    ImpaktfullUiModalTheme: modal,
    ImpaktfullUiNavBarTheme: navBar,
    ImpaktfullUiNetworkImageTheme: networkImage,
    ImpaktfullUiNotificationTheme: notification,
    ImpaktfullUiNotificationBadgeTheme: notificationBadge,
    ImpaktfullUiNumberInputTheme: numberInput,
    ImpaktfullUiOptionSelectorTheme: optionSelector,
    ImpaktfullUiPaginationTheme: pagination,
    ImpaktfullUiPasswordStrengthIndicatorTheme: passwordStrengthIndicator,
    ImpaktfullUiPinCodeTheme: pinCode,
    ImpaktfullUiPlaceholderTheme: placeholder,
    ImpaktfullUiProgressIndicatorTheme: progressIndicator,
    ImpaktfullUiRadioButtonTheme: radioButton,
    ImpaktfullUiRadioButtonListItemTheme: radioButtonListItem,
    ImpaktfullUiRefreshIndicatorTheme: refreshIndicator,
    ImpaktfullUiResponsiveLayoutTheme: responsiveLayout,
    ImpaktfullUiScreenTheme: screen,
    ImpaktfullUiSectionTitleTheme: sectionTitle,
    ImpaktfullUiSegmentedControlTheme: segmentedControl,
    ImpaktfullUiSelectableListItemTheme: selectableListItem,
    ImpaktfullUiSeparatedColumnTheme: separatedColumn,
    ImpaktfullUiSidebarNavigationTheme: sidebarNavigation,
    ImpaktfullUiSidebarNavigationItemTheme: sidebarNavigationItem,
    ImpaktfullUiSimpleListItemTheme: simpleListItem,
    ImpaktfullUiSkeletonTheme: skeleton,
    ImpaktfullUiSliderTheme: slider,
    ImpaktfullUiSnackyConfiguratorTheme: snackyConfigurator,
    ImpaktfullUiStepperTheme: stepper,
    ImpaktfullUiSwitchTheme: switchTheme,
    ImpaktfullUiSwitchListItemTheme: switchListItem,
    ImpaktfullUiTabBarTheme: tabBar,
    ImpaktfullUiTabBarItemTheme: tabBarItem,
    ImpaktfullUiTableTheme: table,
    ImpaktfullUiTableHeaderTheme: tableHeader,
    ImpaktfullUiTableHeaderItemTheme: tableHeaderItem,
    ImpaktfullUiTableRowTheme: tableRow,
    ImpaktfullUiTableRowItemTheme: tableRowItem,
    ImpaktfullUiTimePickerTheme: timePicker,
    ImpaktfullUiTooltipTheme: tooltip,
    ImpaktfullUiTouchFeedbackTheme: touchFeedback,
    ImpaktfullUiUnifiedScreenLayoutTheme: unifiedScreenLayout,
    ImpaktfullUiVirtualKeyboardTheme: virtualKeyboard,
    ImpaktfullUiWysiwygTheme: wysiwyg,
  };

  /// The component theme of type [T] of the [ImpaktfullUiTheme] of [context].
  ///
  /// Throws an [ArgumentError] when [T] is not one of the component themes of
  /// [ImpaktfullUiComponentsTheme].
  static T of<T extends ImpaktfullUiComponentTheme>(BuildContext context) {
    final components = ImpaktfullUiTheme.of(context).components;
    final componentTheme = components._componentThemesByType[T];
    if (componentTheme == null) {
      throw ArgumentError(
        '$T is not configured in the impaktfull ui theme. Every component '
        'theme of impaktfull_ui is a field of ImpaktfullUiComponentsTheme and '
        'is registered in `_componentThemesByType` of '
        'lib/src/theme/component_theme.dart. Register $T there, or pass your '
        'own theme to the `theme` parameter of the component instead of '
        'reading it from the impaktfull ui theme.',
      );
    }
    return componentTheme as T;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiComponentsTheme &&
          accordion == other.accordion &&
          avatar == other.avatar &&
          autoComplete == other.autoComplete &&
          badge == other.badge &&
          bbLicenses == other.bbLicenses &&
          bottomActions == other.bottomActions &&
          bottomNavigation == other.bottomNavigation &&
          bottomNavigationItem == other.bottomNavigationItem &&
          bottomSheet == other.bottomSheet &&
          button == other.button &&
          calendar == other.calendar &&
          card == other.card &&
          carousel == other.carousel &&
          chat == other.chat &&
          checkbox == other.checkbox &&
          checkboxListItem == other.checkboxListItem &&
          cmsHeader == other.cmsHeader &&
          colorPicker == other.colorPicker &&
          colorInputField == other.colorInputField &&
          commandMenu == other.commandMenu &&
          confetti == other.confetti &&
          dateInputField == other.dateInputField &&
          datePicker == other.datePicker &&
          dateTimePicker == other.dateTimePicker &&
          divider == other.divider &&
          dropdown == other.dropdown &&
          filePicker == other.filePicker &&
          floatingActionButton == other.floatingActionButton &&
          fluidPadding == other.fluidPadding &&
          gallery == other.gallery &&
          gridView == other.gridView &&
          horizontalTab == other.horizontalTab &&
          horizontalTabs == other.horizontalTabs &&
          iconButton == other.iconButton &&
          imageCrop == other.imageCrop &&
          inputField == other.inputField &&
          introduction == other.introduction &&
          lineChart == other.lineChart &&
          listItem == other.listItem &&
          listView == other.listView &&
          loadingErrorData == other.loadingErrorData &&
          loadingIndicator == other.loadingIndicator &&
          markdown == other.markdown &&
          metric == other.metric &&
          modal == other.modal &&
          navBar == other.navBar &&
          networkImage == other.networkImage &&
          notification == other.notification &&
          notificationBadge == other.notificationBadge &&
          numberInput == other.numberInput &&
          optionSelector == other.optionSelector &&
          pagination == other.pagination &&
          passwordStrengthIndicator == other.passwordStrengthIndicator &&
          pinCode == other.pinCode &&
          placeholder == other.placeholder &&
          progressIndicator == other.progressIndicator &&
          radioButton == other.radioButton &&
          radioButtonListItem == other.radioButtonListItem &&
          refreshIndicator == other.refreshIndicator &&
          responsiveLayout == other.responsiveLayout &&
          screen == other.screen &&
          sectionTitle == other.sectionTitle &&
          segmentedControl == other.segmentedControl &&
          selectableListItem == other.selectableListItem &&
          separatedColumn == other.separatedColumn &&
          sidebarNavigation == other.sidebarNavigation &&
          sidebarNavigationItem == other.sidebarNavigationItem &&
          simpleListItem == other.simpleListItem &&
          skeleton == other.skeleton &&
          slider == other.slider &&
          snackyConfigurator == other.snackyConfigurator &&
          stepper == other.stepper &&
          switchTheme == other.switchTheme &&
          switchListItem == other.switchListItem &&
          tabBar == other.tabBar &&
          tabBarItem == other.tabBarItem &&
          table == other.table &&
          tableHeader == other.tableHeader &&
          tableHeaderItem == other.tableHeaderItem &&
          tableRow == other.tableRow &&
          tableRowItem == other.tableRowItem &&
          timePicker == other.timePicker &&
          tooltip == other.tooltip &&
          touchFeedback == other.touchFeedback &&
          unifiedScreenLayout == other.unifiedScreenLayout &&
          virtualKeyboard == other.virtualKeyboard &&
          wysiwyg == other.wysiwyg;

  @override
  int get hashCode => Object.hashAll([
        accordion,
        avatar,
        autoComplete,
        badge,
        bbLicenses,
        bottomActions,
        bottomNavigation,
        bottomNavigationItem,
        bottomSheet,
        button,
        calendar,
        card,
        carousel,
        chat,
        checkbox,
        checkboxListItem,
        cmsHeader,
        colorPicker,
        colorInputField,
        commandMenu,
        confetti,
        dateInputField,
        datePicker,
        dateTimePicker,
        divider,
        dropdown,
        filePicker,
        floatingActionButton,
        fluidPadding,
        gallery,
        gridView,
        horizontalTab,
        horizontalTabs,
        iconButton,
        imageCrop,
        inputField,
        introduction,
        lineChart,
        listItem,
        listView,
        loadingErrorData,
        loadingIndicator,
        markdown,
        metric,
        modal,
        navBar,
        networkImage,
        notification,
        notificationBadge,
        numberInput,
        optionSelector,
        pagination,
        passwordStrengthIndicator,
        pinCode,
        placeholder,
        progressIndicator,
        radioButton,
        radioButtonListItem,
        refreshIndicator,
        responsiveLayout,
        screen,
        sectionTitle,
        segmentedControl,
        selectableListItem,
        separatedColumn,
        sidebarNavigation,
        sidebarNavigationItem,
        simpleListItem,
        skeleton,
        slider,
        snackyConfigurator,
        stepper,
        switchTheme,
        switchListItem,
        tabBar,
        tabBarItem,
        table,
        tableHeader,
        tableHeaderItem,
        tableRow,
        tableRowItem,
        timePicker,
        tooltip,
        touchFeedback,
        unifiedScreenLayout,
        virtualKeyboard,
        wysiwyg,
      ]);
}

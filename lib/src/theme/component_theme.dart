import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/avatar/avatar.dart';
import 'package:impaktfull_ui_2/src/components/badge/badge.dart';
import 'package:impaktfull_ui_2/src/components/bottom_navigation/bottom_navigation.dart';
import 'package:impaktfull_ui_2/src/components/bottom_navigation_item/bottom_navigation_item.dart';
import 'package:impaktfull_ui_2/src/components/bottom_sheet/bottom_sheet.dart';
import 'package:impaktfull_ui_2/src/components/button/button.dart';
import 'package:impaktfull_ui_2/src/components/card/card.dart';
import 'package:impaktfull_ui_2/src/components/checkbox/checkbox.dart';
import 'package:impaktfull_ui_2/src/components/cms_header/cms_header.dart';
import 'package:impaktfull_ui_2/src/components/color_picker/color_picker.dart';
import 'package:impaktfull_ui_2/src/components/command_menu/command_menu.dart';
import 'package:impaktfull_ui_2/src/components/divider/divider.dart';
import 'package:impaktfull_ui_2/src/components/dropdown/dropdown.dart';
import 'package:impaktfull_ui_2/src/components/fluid_padding/fluid_padding.dart';
import 'package:impaktfull_ui_2/src/components/grid_view/grid_view.dart';
import 'package:impaktfull_ui_2/src/components/horizontal_tab/horizontal_tab.dart';
import 'package:impaktfull_ui_2/src/components/horizontal_tabs/horizontal_tabs.dart';
import 'package:impaktfull_ui_2/src/components/input_field/input_field.dart';
import 'package:impaktfull_ui_2/src/components/list_item/list_item.dart';
import 'package:impaktfull_ui_2/src/components/list_view/list_view.dart';
import 'package:impaktfull_ui_2/src/components/loading_indicator/loading_indicator.dart';
import 'package:impaktfull_ui_2/src/components/modal/modal.dart';
import 'package:impaktfull_ui_2/src/components/network_image/network_image.dart';
import 'package:impaktfull_ui_2/src/components/notification/notification.dart';
import 'package:impaktfull_ui_2/src/components/notification_badge/notification_badge.dart';
import 'package:impaktfull_ui_2/src/components/pagination/pagination.dart';
import 'package:impaktfull_ui_2/src/components/refresh_indicator/refresh_indicator.dart';
import 'package:impaktfull_ui_2/src/components/sidebar_navigation/sidebar_navigation.dart';
import 'package:impaktfull_ui_2/src/components/sidebar_navigation_item/sidebar_navigation_item.dart';
import 'package:impaktfull_ui_2/src/components/simple_list_item/simple_list_item.dart';
import 'package:impaktfull_ui_2/src/components/snacky/snacky_configurator.dart';
import 'package:impaktfull_ui_2/src/components/switch/switch.dart';
import 'package:impaktfull_ui_2/src/components/table/table.dart';
import 'package:impaktfull_ui_2/src/components/table_header/table_header.dart';
import 'package:impaktfull_ui_2/src/components/table_header_item/table_header_item.dart';
import 'package:impaktfull_ui_2/src/components/table_row/table_row.dart';
import 'package:impaktfull_ui_2/src/components/table_row_item/table_row_item.dart';
import 'package:impaktfull_ui_2/src/components/tooltip/tooltip.dart';

abstract class ImpaktfullUiComponentTheme {
  const ImpaktfullUiComponentTheme();
}

class ImpaktfullUiComponentsTheme {
  final ImpaktfullUiAvatarTheme avatar;
  final ImpaktfullUiBadgeTheme badge;
  final ImpaktfullUiBottomNavigationTheme bottomNavigation;
  final ImpaktfullUiBottomNavigationItemTheme bottomNavigationItem;
  final ImpaktfullUiBottomSheetTheme bottomSheet;
  final ImpaktfullUiButtonTheme button;
  final ImpaktfullUiCardTheme card;
  final ImpaktfullUiCheckboxTheme checkbox;
  final ImpaktfullUiCmsHeaderTheme cmsHeader;
  final ImpaktfullUiColorPickerTheme colorPicker;
  final ImpaktfullUiCommandMenuTheme commandMenu;
  final ImpaktfullUiDividerTheme divider;
  final ImpaktfullUiDropdownTheme dropdown;
  final ImpaktfullUiFluidPaddingTheme fluidPadding;
  final ImpaktfullUiGridViewTheme gridView;
  final ImpaktfullUiHorizontalTabTheme horizontalTab;
  final ImpaktfullUiHorizontalTabsTheme horizontalTabs;
  final ImpaktfullUiInputFieldTheme inputField;
  final ImpaktfullUiListItemTheme listItem;
  final ImpaktfullUiListViewTheme listView;
  final ImpaktfullUiLoadingIndicatorTheme loadingIndicator;
  final ImpaktfullUiModalTheme modal;
  final ImpaktfullUiNetworkImageTheme networkImage;
  final ImpaktfullUiNotificationTheme notification;
  final ImpaktfullUiNotificationBadgeTheme notificationBadge;
  final ImpaktfullUiPaginationTheme pagination;
  final ImpaktfullUiRefreshIndicatorTheme refreshIndicator;
  final ImpaktfullUiSidebarNavigationTheme sidebarNavigation;
  final ImpaktfullUiSidebarNavigationItemTheme sidebarNavigationItem;
  final ImpaktfullUiSimpleListItemTheme simpleListItem;
  final ImpaktfullUiSnackyConfiguratorTheme snackyConfigurator;
  final ImpaktfullUiSwitchTheme switchTheme;
  final ImpaktfullUiTableTheme table;
  final ImpaktfullUiTableHeaderTheme tableHeader;
  final ImpaktfullUiTableHeaderItemTheme tableHeaderItem;
  final ImpaktfullUiTableRowTheme tableRow;
  final ImpaktfullUiTableRowItemTheme tableRowItem;
  final ImpaktfullUiTooltipTheme tooltip;

  ImpaktfullUiComponentsTheme({
    required this.avatar,
    required this.badge,
    required this.bottomNavigation,
    required this.bottomNavigationItem,
    required this.bottomSheet,
    required this.button,
    required this.card,
    required this.checkbox,
    required this.cmsHeader,
    required this.colorPicker,
    required this.commandMenu,
    required this.divider,
    required this.dropdown,
    required this.fluidPadding,
    required this.gridView,
    required this.horizontalTab,
    required this.horizontalTabs,
    required this.inputField,
    required this.listItem,
    required this.listView,
    required this.loadingIndicator,
    required this.modal,
    required this.networkImage,
    required this.notification,
    required this.notificationBadge,
    required this.pagination,
    required this.refreshIndicator,
    required this.sidebarNavigation,
    required this.sidebarNavigationItem,
    required this.simpleListItem,
    required this.snackyConfigurator,
    required this.switchTheme,
    required this.tableHeader,
    required this.tableHeaderItem,
    required this.table,
    required this.tableRow,
    required this.tableRowItem,
    required this.tooltip,
  });

  ImpaktfullUiComponentsTheme copyWith({
    ImpaktfullUiAvatarTheme? avatar,
    ImpaktfullUiBadgeTheme? badge,
    ImpaktfullUiBottomNavigationTheme? bottomNavigation,
    ImpaktfullUiBottomNavigationItemTheme? bottomNavigationItem,
    ImpaktfullUiBottomSheetTheme? bottomSheet,
    ImpaktfullUiButtonTheme? button,
    ImpaktfullUiCardTheme? card,
    ImpaktfullUiCheckboxTheme? checkbox,
    ImpaktfullUiCmsHeaderTheme? cmsHeader,
    ImpaktfullUiColorPickerTheme? colorPicker,
    ImpaktfullUiCommandMenuTheme? commandMenu,
    ImpaktfullUiDividerTheme? divider,
    ImpaktfullUiDropdownTheme? dropdown,
    ImpaktfullUiFluidPaddingTheme? fluidPadding,
    ImpaktfullUiGridViewTheme? gridView,
    ImpaktfullUiHorizontalTabTheme? horizontalTab,
    ImpaktfullUiHorizontalTabsTheme? horizontalTabs,
    ImpaktfullUiInputFieldTheme? inputField,
    ImpaktfullUiListItemTheme? listItem,
    ImpaktfullUiListViewTheme? listView,
    ImpaktfullUiLoadingIndicatorTheme? loadingIndicator,
    ImpaktfullUiModalTheme? modal,
    ImpaktfullUiNetworkImageTheme? networkImage,
    ImpaktfullUiNotificationTheme? notification,
    ImpaktfullUiNotificationBadgeTheme? notificationBadge,
    ImpaktfullUiPaginationTheme? pagination,
    ImpaktfullUiRefreshIndicatorTheme? refreshIndicator,
    ImpaktfullUiSidebarNavigationTheme? sidebarNavigation,
    ImpaktfullUiSidebarNavigationItemTheme? sidebarNavigationItem,
    ImpaktfullUiSimpleListItemTheme? simpleListItem,
    ImpaktfullUiSnackyConfiguratorTheme? snackyConfigurator,
    ImpaktfullUiSwitchTheme? switchTheme,
    ImpaktfullUiTableTheme? table,
    ImpaktfullUiTableHeaderTheme? tableHeader,
    ImpaktfullUiTableHeaderItemTheme? tableHeaderItem,
    ImpaktfullUiTableRowTheme? tableRow,
    ImpaktfullUiTableRowItemTheme? tableRowItem,
    ImpaktfullUiTooltipTheme? tooltip,
  }) =>
      ImpaktfullUiComponentsTheme(
        avatar: avatar ?? this.avatar,
        badge: badge ?? this.badge,
        bottomNavigation: bottomNavigation ?? this.bottomNavigation,
        bottomNavigationItem: bottomNavigationItem ?? this.bottomNavigationItem,
        bottomSheet: bottomSheet ?? this.bottomSheet,
        button: button ?? this.button,
        card: card ?? this.card,
        checkbox: checkbox ?? this.checkbox,
        cmsHeader: cmsHeader ?? this.cmsHeader,
        colorPicker: colorPicker ?? this.colorPicker,
        commandMenu: commandMenu ?? this.commandMenu,
        divider: divider ?? this.divider,
        dropdown: dropdown ?? this.dropdown,
        fluidPadding: fluidPadding ?? this.fluidPadding,
        gridView: gridView ?? this.gridView,
        horizontalTab: horizontalTab ?? this.horizontalTab,
        horizontalTabs: horizontalTabs ?? this.horizontalTabs,
        inputField: inputField ?? this.inputField,
        listItem: listItem ?? this.listItem,
        listView: listView ?? this.listView,
        loadingIndicator: loadingIndicator ?? this.loadingIndicator,
        modal: modal ?? this.modal,
        networkImage: networkImage ?? this.networkImage,
        notification: notification ?? this.notification,
        notificationBadge: notificationBadge ?? this.notificationBadge,
        pagination: pagination ?? this.pagination,
        refreshIndicator: refreshIndicator ?? this.refreshIndicator,
        sidebarNavigation: sidebarNavigation ?? this.sidebarNavigation,
        sidebarNavigationItem:
            sidebarNavigationItem ?? this.sidebarNavigationItem,
        simpleListItem: simpleListItem ?? this.simpleListItem,
        snackyConfigurator: snackyConfigurator ?? this.snackyConfigurator,
        switchTheme: switchTheme ?? this.switchTheme,
        table: table ?? this.table,
        tableHeader: tableHeader ?? this.tableHeader,
        tableHeaderItem: tableHeaderItem ?? this.tableHeaderItem,
        tableRow: tableRow ?? this.tableRow,
        tableRowItem: tableRowItem ?? this.tableRowItem,
        tooltip: tooltip ?? this.tooltip,
      );

  static T of<T extends ImpaktfullUiComponentTheme>(BuildContext context) {
    if (T == ImpaktfullUiBadgeTheme) {
      return ImpaktfullUiBadgeTheme.of(context) as T;
    } else if (T == ImpaktfullUiAvatarTheme) {
      return ImpaktfullUiAvatarTheme.of(context) as T;
    } else if (T == ImpaktfullUiBottomNavigationTheme) {
      return ImpaktfullUiBottomNavigationTheme.of(context) as T;
    } else if (T == ImpaktfullUiBottomNavigationItemTheme) {
      return ImpaktfullUiBottomNavigationItemTheme.of(context) as T;
    } else if (T == ImpaktfullUiBottomSheetTheme) {
      return ImpaktfullUiBottomSheetTheme.of(context) as T;
    } else if (T == ImpaktfullUiButtonTheme) {
      return ImpaktfullUiButtonTheme.of(context) as T;
    } else if (T == ImpaktfullUiCardTheme) {
      return ImpaktfullUiCardTheme.of(context) as T;
    } else if (T == ImpaktfullUiCheckboxTheme) {
      return ImpaktfullUiCheckboxTheme.of(context) as T;
    } else if (T == ImpaktfullUiCmsHeaderTheme) {
      return ImpaktfullUiCmsHeaderTheme.of(context) as T;
    } else if (T == ImpaktfullUiColorPickerTheme) {
      return ImpaktfullUiColorPickerTheme.of(context) as T;
    } else if (T == ImpaktfullUiCommandMenuTheme) {
      return ImpaktfullUiCommandMenuTheme.of(context) as T;
    } else if (T == ImpaktfullUiDividerTheme) {
      return ImpaktfullUiDividerTheme.of(context) as T;
    } else if (T == ImpaktfullUiDropdownTheme) {
      return ImpaktfullUiDropdownTheme.of(context) as T;
    } else if (T == ImpaktfullUiFluidPaddingTheme) {
      return ImpaktfullUiFluidPaddingTheme.of(context) as T;
    } else if (T == ImpaktfullUiGridViewTheme) {
      return ImpaktfullUiGridViewTheme.of(context) as T;
    } else if (T == ImpaktfullUiHorizontalTabTheme) {
      return ImpaktfullUiHorizontalTabTheme.of(context) as T;
    } else if (T == ImpaktfullUiHorizontalTabsTheme) {
      return ImpaktfullUiHorizontalTabsTheme.of(context) as T;
    } else if (T == ImpaktfullUiInputFieldTheme) {
      return ImpaktfullUiInputFieldTheme.of(context) as T;
    } else if (T == ImpaktfullUiListItemTheme) {
      return ImpaktfullUiListItemTheme.of(context) as T;
    } else if (T == ImpaktfullUiListViewTheme) {
      return ImpaktfullUiListViewTheme.of(context) as T;
    } else if (T == ImpaktfullUiLoadingIndicatorTheme) {
      return ImpaktfullUiLoadingIndicatorTheme.of(context) as T;
    } else if (T == ImpaktfullUiModalTheme) {
      return ImpaktfullUiModalTheme.of(context) as T;
    } else if (T == ImpaktfullUiNetworkImageTheme) {
      return ImpaktfullUiNetworkImageTheme.of(context) as T;
    } else if (T == ImpaktfullUiNotificationTheme) {
      return ImpaktfullUiNotificationTheme.of(context) as T;
    } else if (T == ImpaktfullUiNotificationBadgeTheme) {
      return ImpaktfullUiNotificationBadgeTheme.of(context) as T;
    } else if (T == ImpaktfullUiPaginationTheme) {
      return ImpaktfullUiPaginationTheme.of(context) as T;
    } else if (T == ImpaktfullUiRefreshIndicatorTheme) {
      return ImpaktfullUiRefreshIndicatorTheme.of(context) as T;
    } else if (T == ImpaktfullUiSidebarNavigationTheme) {
      return ImpaktfullUiSidebarNavigationTheme.of(context) as T;
    } else if (T == ImpaktfullUiSidebarNavigationItemTheme) {
      return ImpaktfullUiSidebarNavigationItemTheme.of(context) as T;
    } else if (T == ImpaktfullUiSimpleListItemTheme) {
      return ImpaktfullUiSimpleListItemTheme.of(context) as T;
    } else if (T == ImpaktfullUiSnackyConfiguratorTheme) {
      return ImpaktfullUiSnackyConfiguratorTheme.of(context) as T;
    } else if (T == ImpaktfullUiSwitchTheme) {
      return ImpaktfullUiSwitchTheme.of(context) as T;
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
    } else if (T == ImpaktfullUiTooltipTheme) {
      return ImpaktfullUiTooltipTheme.of(context) as T;
    } else {
      throw ArgumentError('$T is not configured in the impaktfull ui theme');
    }
  }
}

import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/badge/badge.dart';
import 'package:impaktfull_ui_2/src/components/button/button.dart';
import 'package:impaktfull_ui_2/src/components/card/card.dart';
import 'package:impaktfull_ui_2/src/components/checkbox/checkbox.dart';
import 'package:impaktfull_ui_2/src/components/cms_header/cms_header.dart';
import 'package:impaktfull_ui_2/src/components/divider/divider.dart';
import 'package:impaktfull_ui_2/src/components/dropdown/dropdown.dart';
import 'package:impaktfull_ui_2/src/components/horizontal_tab/horizontal_tab.dart';
import 'package:impaktfull_ui_2/src/components/horizontal_tabs/horizontal_tabs.dart';
import 'package:impaktfull_ui_2/src/components/input_field/input_field.dart';
import 'package:impaktfull_ui_2/src/components/list_view/list_view.dart';
import 'package:impaktfull_ui_2/src/components/loading_indicator/loading_indicator.dart';
import 'package:impaktfull_ui_2/src/components/modal/modal.dart';
import 'package:impaktfull_ui_2/src/components/notification/notification.dart';
import 'package:impaktfull_ui_2/src/components/refresh_indicator/refresh_indicator.dart';
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
  final ImpaktfullUiBadgeTheme badge;
  final ImpaktfullUiButtonTheme button;
  final ImpaktfullUiCardTheme card;
  final ImpaktfullUiCheckboxTheme checkbox;
  final ImpaktfullUiCmsHeaderTheme cmsHeader;
  final ImpaktfullUiDividerTheme divider;
  final ImpaktfullUiDropdownTheme dropdown;
  final ImpaktfullUiHorizontalTabTheme horizontalTab;
  final ImpaktfullUiHorizontalTabsTheme horizontalTabs;
  final ImpaktfullUiInputFieldTheme inputField;
  final ImpaktfullUiListViewTheme listView;
  final ImpaktfullUiLoadingIndicatorTheme loadingIndicator;
  final ImpaktfullUiModalTheme modal;
  final ImpaktfullUiNotificationTheme notification;
  final ImpaktfullUiRefreshIndicatorTheme refreshIndicator;
  final ImpaktfullUiSnackyConfiguratorTheme snackyConfigurator;
  final ImpaktfullUiSwitchTheme switchTheme;
  final ImpaktfullUiTableTheme table;
  final ImpaktfullUiTableHeaderTheme tableHeader;
  final ImpaktfullUiTableHeaderItemTheme tableHeaderItem;
  final ImpaktfullUiTableRowTheme tableRow;
  final ImpaktfullUiTableRowItemTheme tableRowItem;
  final ImpaktfullUiTooltipTheme tooltip;

  ImpaktfullUiComponentsTheme({
    required this.badge,
    required this.button,
    required this.card,
    required this.checkbox,
    required this.cmsHeader,
    required this.divider,
    required this.dropdown,
    required this.horizontalTab,
    required this.horizontalTabs,
    required this.inputField,
    required this.listView,
    required this.loadingIndicator,
    required this.modal,
    required this.notification,
    required this.refreshIndicator,
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
    ImpaktfullUiBadgeTheme? badge,
    ImpaktfullUiButtonTheme? button,
    ImpaktfullUiCardTheme? card,
    ImpaktfullUiCheckboxTheme? checkbox,
    ImpaktfullUiCmsHeaderTheme? cmsHeader,
    ImpaktfullUiDividerTheme? divider,
    ImpaktfullUiDropdownTheme? dropdown,
    ImpaktfullUiHorizontalTabTheme? horizontalTab,
    ImpaktfullUiHorizontalTabsTheme? horizontalTabs,
    ImpaktfullUiInputFieldTheme? inputField,
    ImpaktfullUiListViewTheme? listView,
    ImpaktfullUiLoadingIndicatorTheme? loadingIndicator,
    ImpaktfullUiModalTheme? modal,
    ImpaktfullUiNotificationTheme? notification,
    ImpaktfullUiRefreshIndicatorTheme? refreshIndicator,
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
        badge: badge ?? this.badge,
        button: button ?? this.button,
        card: card ?? this.card,
        checkbox: checkbox ?? this.checkbox,
        cmsHeader: cmsHeader ?? this.cmsHeader,
        divider: divider ?? this.divider,
        dropdown: dropdown ?? this.dropdown,
        horizontalTab: horizontalTab ?? this.horizontalTab,
        horizontalTabs: horizontalTabs ?? this.horizontalTabs,
        inputField: inputField ?? this.inputField,
        listView: listView ?? this.listView,
        loadingIndicator: loadingIndicator ?? this.loadingIndicator,
        modal: modal ?? this.modal,
        notification: notification ?? this.notification,
        refreshIndicator: refreshIndicator ?? this.refreshIndicator,
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
    } else if (T == ImpaktfullUiButtonTheme) {
      return ImpaktfullUiButtonTheme.of(context) as T;
    } else if (T == ImpaktfullUiCardTheme) {
      return ImpaktfullUiCardTheme.of(context) as T;
    } else if (T == ImpaktfullUiCheckboxTheme) {
      return ImpaktfullUiCheckboxTheme.of(context) as T;
    } else if (T == ImpaktfullUiCmsHeaderTheme) {
      return ImpaktfullUiCmsHeaderTheme.of(context) as T;
    } else if (T == ImpaktfullUiDividerTheme) {
      return ImpaktfullUiDividerTheme.of(context) as T;
    } else if (T == ImpaktfullUiDropdownTheme) {
      return ImpaktfullUiDropdownTheme.of(context) as T;
    } else if (T == ImpaktfullUiHorizontalTabTheme) {
      return ImpaktfullUiHorizontalTabTheme.of(context) as T;
    } else if (T == ImpaktfullUiHorizontalTabsTheme) {
      return ImpaktfullUiHorizontalTabsTheme.of(context) as T;
    } else if (T == ImpaktfullUiInputFieldTheme) {
      return ImpaktfullUiInputFieldTheme.of(context) as T;
    } else if (T == ImpaktfullUiListViewTheme) {
      return ImpaktfullUiListViewTheme.of(context) as T;
    } else if (T == ImpaktfullUiLoadingIndicatorTheme) {
      return ImpaktfullUiLoadingIndicatorTheme.of(context) as T;
    } else if (T == ImpaktfullUiModalTheme) {
      return ImpaktfullUiModalTheme.of(context) as T;
    } else if (T == ImpaktfullUiNotificationTheme) {
      return ImpaktfullUiNotificationTheme.of(context) as T;
    } else if (T == ImpaktfullUiRefreshIndicatorTheme) {
      return ImpaktfullUiRefreshIndicatorTheme.of(context) as T;
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

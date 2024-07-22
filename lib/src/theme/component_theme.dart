import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/badge/badge_style.dart';
import 'package:impaktfull_ui_2/src/components/button/button.dart';
import 'package:impaktfull_ui_2/src/components/card/card.dart';
import 'package:impaktfull_ui_2/src/components/cms_header/cms_header.dart';
import 'package:impaktfull_ui_2/src/components/divider/divider.dart';
import 'package:impaktfull_ui_2/src/components/horizontal_tab/horizontal_tab.dart';
import 'package:impaktfull_ui_2/src/components/horizontal_tabs/horizontal_tabs.dart';
import 'package:impaktfull_ui_2/src/components/input_field/input_field.dart';
import 'package:impaktfull_ui_2/src/components/list_view/list_view_style.dart';
import 'package:impaktfull_ui_2/src/components/loading_indicator/loading_indicator_style.dart';
import 'package:impaktfull_ui_2/src/components/refresh_indicator/refresh_indicator_style.dart';
import 'package:impaktfull_ui_2/src/components/snacky/snacky_configurator_style.dart';
import 'package:impaktfull_ui_2/src/components/table/table.dart';
import 'package:impaktfull_ui_2/src/components/table_header/table_header.dart';
import 'package:impaktfull_ui_2/src/components/table_header_item/table_header_item.dart';
import 'package:impaktfull_ui_2/src/components/table_row/table_row.dart';
import 'package:impaktfull_ui_2/src/components/table_row_item/table_row_item.dart';
import 'package:impaktfull_ui_2/src/theme/theme.dart';

class ImpaktfullUiComponentsTheme {
  final ImpaktfullUiBadgeTheme badge;
  final ImpaktfullUiButtonTheme button;
  final ImpaktfullUiCardTheme card;
  final ImpaktfullUiCmsHeaderTheme cmsHeaders;
  final ImpaktfullUiDividerTheme divider;
  final ImpaktfullUiHorizontalTabTheme horizontalTab;
  final ImpaktfullUiHorizontalTabsTheme horizontalTabs;
  final ImpaktfullUiInputFieldTheme inputField;
  final ImpaktfullUiListViewTheme listView;
  final ImpaktfullUiLoadingIndicatorTheme loadingIndicator;
  final ImpaktfullUiRefreshIndicatorTheme refreshIndicator;
  final ImpaktfullUiSnackyConfiguratorTheme snackyConfigurator;
  final ImpaktfullUiTableTheme table;
  final ImpaktfullUiTableHeaderTheme tableHeader;
  final ImpaktfullUiTableHeaderItemTheme tableHeaderItem;
  final ImpaktfullUiTableRowTheme tableRow;
  final ImpaktfullUiTableRowItemTheme tableRowItem;

  ImpaktfullUiComponentsTheme({
    required this.badge,
    required this.button,
    required this.card,
    required this.cmsHeaders,
    required this.divider,
    required this.horizontalTab,
    required this.horizontalTabs,
    required this.inputField,
    required this.listView,
    required this.loadingIndicator,
    required this.refreshIndicator,
    required this.snackyConfigurator,
    required this.tableHeader,
    required this.tableHeaderItem,
    required this.table,
    required this.tableRow,
    required this.tableRowItem,
  });

  static T of<T>(BuildContext context) {
    final theme = ImpaktfullUiTheme.of(context);
    final themeComponents = theme.components;
    if (T == ImpaktfullUiButtonTheme) {
      return themeComponents.button as T;
    } else if (T == ImpaktfullUiCardTheme) {
      return themeComponents.card as T;
    } else if (T == ImpaktfullUiBadgeTheme) {
      return themeComponents.badge as T;
    } else if (T == ImpaktfullUiDividerTheme) {
      return themeComponents.divider as T;
    } else if (T == ImpaktfullUiHorizontalTabTheme) {
      return themeComponents.horizontalTab as T;
    } else if (T == ImpaktfullUiHorizontalTabsTheme) {
      return themeComponents.horizontalTabs as T;
    } else if (T == ImpaktfullUiInputFieldTheme) {
      return themeComponents.inputField as T;
    } else if (T == ImpaktfullUiListViewTheme) {
      return themeComponents.listView as T;
    } else if (T == ImpaktfullUiLoadingIndicatorTheme) {
      return themeComponents.loadingIndicator as T;
    } else if (T == ImpaktfullUiRefreshIndicatorTheme) {
      return themeComponents.refreshIndicator as T;
    } else if (T == ImpaktfullUiSnackyConfiguratorTheme) {
      return themeComponents.snackyConfigurator as T;
    } else if (T == ImpaktfullUiTableTheme) {
      return themeComponents.table as T;
    } else if (T == ImpaktfullUiTableHeaderTheme) {
      return themeComponents.tableHeader as T;
    } else if (T == ImpaktfullUiTableHeaderItemTheme) {
      return themeComponents.tableHeaderItem as T;
    } else if (T == ImpaktfullUiTableRowTheme) {
      return themeComponents.tableRow as T;
    } else if (T == ImpaktfullUiTableRowItemTheme) {
      return themeComponents.tableRowItem as T;
    } else {
      throw ArgumentError('$T is not configured in the impaktfull ui theme');
    }
  }
}

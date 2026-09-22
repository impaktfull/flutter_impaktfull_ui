import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/items/horizontal_tabs/horizontal_tabs_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class HorizontalTabsVariant
    extends ComponentLibraryVariant<HorizontalTabsLibraryVariantInputs> {
  HorizontalTabsVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(
      BuildContext context, HorizontalTabsLibraryVariantInputs inputs) {
    return [
      ImpaktfullUiHorizontalTabs(
        value: inputs.selectedIndex.value,
        onChanged: inputs.selectedIndex.updateState,
        tabs: [
          ImpaktfullUiHorizontalTabConfig(
            title: 'Tab 1',
            value: 0,
          ),
          ImpaktfullUiHorizontalTabConfig(
            title: 'Tab 2',
            value: 1,
          ),
          ImpaktfullUiHorizontalTabConfig(
            title: 'Tab 3',
            value: 2,
          ),
          ImpaktfullUiHorizontalTabConfig(
            title: 'Tab 4',
            value: 3,
            badge: '20',
            badgeType: ImpaktfullUiBadgeType.error,
          ),
          ImpaktfullUiHorizontalTabConfig(
            title: 'Tab 5',
            value: 4,
          ),
        ],
      ),
    ];
  }

  @override
  HorizontalTabsLibraryVariantInputs inputs() =>
      HorizontalTabsLibraryVariantInputs();
}

class HorizontalTabsLibraryVariantInputs extends HorizontalTabsLibraryInputs {}

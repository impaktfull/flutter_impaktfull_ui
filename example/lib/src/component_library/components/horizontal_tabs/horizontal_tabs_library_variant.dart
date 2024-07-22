import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/components/horizontal_tabs/horizontal_tabs_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class HorizontalTabsVariant extends ComponentLibraryVariant<HorizontalTabsLibraryVariantInputs> {
  HorizontalTabsVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(BuildContext context, HorizontalTabsLibraryVariantInputs inputs) {
    return [
      ImpaktfullUiHorizontalTabs(
        selectedValue: inputs.selectedIndex.value,
        onTabSelected: (value) => inputs.selectedIndex.updateState(value),
        tabs: [
          ImpaktfullUiHorizontalTabConfig(
            label: 'Tab 1',
            value: 0,
          ),
          ImpaktfullUiHorizontalTabConfig(
            label: 'Tab 2',
            value: 1,
          ),
          ImpaktfullUiHorizontalTabConfig(
            label: 'Tab 3',
            value: 2,
          ),
          ImpaktfullUiHorizontalTabConfig(
            label: 'Tab 4',
            value: 3,
            badge: '20',
            badgeType: ImpaktfullUiBadgeType.error,
          ),
          ImpaktfullUiHorizontalTabConfig(
            label: 'Tab 5',
            value: 4,
          ),
        ],
      ),
    ];
  }

  @override
  HorizontalTabsLibraryVariantInputs inputs() => HorizontalTabsLibraryVariantInputs();
}

class HorizontalTabsLibraryVariantInputs extends HorizontalTabsLibraryInputs {}

import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/items/cms_header/cms_header_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class CmsHeaderVariant
    extends ComponentLibraryVariant<CmsHeaderLibraryVariantInputs> {
  CmsHeaderVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(
      BuildContext context, CmsHeaderLibraryVariantInputs inputs) {
    return [
      ImpaktfullUiCmsHeader(
        title: inputs.title.value ?? '{fallback title}',
        subtitle: inputs.subtitle.value,
        badge: inputs.badge.value,
        actions: [
          ImpaktfullUiButton(
            type: ImpaktfullUiButtonType.primary,
            leadingAsset: theme.assets.icons.add,
            title: 'Add',
            onTap: () {},
          ),
        ],
      ),
      ImpaktfullUiCmsHeader(
        title: inputs.title.value ?? '{fallback title}',
        subtitle: inputs.subtitle.value,
        badge: inputs.badge.value,
        actions: [
          ImpaktfullUiButton(
            type: ImpaktfullUiButtonType.secondary,
            leadingAsset: theme.assets.icons.logout,
            onTap: () {},
          ),
          ImpaktfullUiButton(
            type: ImpaktfullUiButtonType.primary,
            leadingAsset: theme.assets.icons.settings,
            title: 'Settings',
            onTap: () {},
          ),
        ],
        bottomChild: ImpaktfullUiHorizontalTabs(
          selectedValue: inputs.selectedTab.value,
          onTabSelected: inputs.selectedTab.updateState,
          tabs: [
            ImpaktfullUiHorizontalTabConfig(label: 'Tab 1', value: 0),
            ImpaktfullUiHorizontalTabConfig(label: 'Tab 2', value: 1),
            ImpaktfullUiHorizontalTabConfig(label: 'Tab 3', value: 2),
            ImpaktfullUiHorizontalTabConfig(label: 'Tab 4', value: 3),
            ImpaktfullUiHorizontalTabConfig(label: 'Tab 5', value: 4),
          ],
        ),
      ),
    ];
  }

  @override
  CmsHeaderLibraryVariantInputs inputs() => CmsHeaderLibraryVariantInputs();
}

class CmsHeaderLibraryVariantInputs extends CmsHeaderLibraryInputs {}

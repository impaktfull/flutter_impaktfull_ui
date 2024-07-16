import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/component_library.dart';
import 'package:impaktfull_ui_example/src/component_library/variants/cms_header/cms_header_library_item.dart';

class CmsHeaderVariant extends ComponentLibraryVariant<CmsHeaderLibraryVariantInputs> {
  CmsHeaderVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(BuildContext context, CmsHeaderLibraryVariantInputs inputs) {
    return [
      ImpaktfullUiCmsHeader(
        title: inputs.title.value ?? '{cms header title}',
        subtitle: inputs.subtitle.value ?? '{a longer cms header subtitle}',
        badge: inputs.badge.value,
        actions: [
          ImpaktfullUiButton(
            type: ImpaktfullUiButtonType.primary,
            leadingIcon: Icons.add,
            title: 'Add',
            onTap: () {},
          ),
        ],
      ),
      ImpaktfullUiCmsHeader(
        title: inputs.title.value ?? '{cms header title}',
        subtitle: inputs.subtitle.value ?? '{a longer cms header subtitle}',
        badge: inputs.badge.value,
        actions: [
          ImpaktfullUiButton(
            type: ImpaktfullUiButtonType.secondary,
            leadingIcon: Icons.logout,
            onTap: () {},
          ),
          ImpaktfullUiButton(
            type: ImpaktfullUiButtonType.primary,
            leadingIcon: Icons.download,
            title: 'Download',
            onTap: () {},
          ),
        ],
        bottom: ImpaktfullUiHorizontalTabs(
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

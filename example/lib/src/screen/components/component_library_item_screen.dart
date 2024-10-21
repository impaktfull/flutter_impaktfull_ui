import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/navigator/navigator.dart';
import 'package:impaktfull_ui_example/src/screen/components/component_library_variant_screen.dart';

class ComponentLibraryItemScreen extends StatefulWidget {
  final ComponentLibraryItem item;
  const ComponentLibraryItemScreen({
    required this.item,
    super.key,
  });

  @override
  State<ComponentLibraryItemScreen> createState() =>
      _ComponentLibraryItemScreenState();
}

class _ComponentLibraryItemScreenState
    extends State<ComponentLibraryItemScreen> {
  late final List<ComponentLibraryVariant> variants;
  late ComponentLibraryVariant _selectedTab;
  var _showEdits = false;

  @override
  void initState() {
    super.initState();
    variants = widget.item.getComponentVariants();
    _selectedTab = variants.first;
  }

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiAdaptiveScreen(
      title: widget.item.title,
      actions: [
        ImpaktfullUiAdaptiveNavBarActionItem(
          onTap: _onEditTapped,
          type: _showEdits
              ? ImpaktfullUiAdaptiveNavBarActionItemType.primary
              : ImpaktfullUiAdaptiveNavBarActionItemType.secondary,
          asset: theme.assets.icons.edit,
          title: 'Inputs',
        ),
      ],
      onBackTapped: () => ImpaktfullUiNavigator.instance.goBack(),
      headerBottomChild: variants.length <= 1
          ? null
          : ImpaktfullUiHorizontalTabs(
              selectedValue: _selectedTab,
              tabs: variants
                  .map(
                    (e) => ImpaktfullUiHorizontalTabConfig(
                      label: e.title,
                      value: e,
                    ),
                  )
                  .toList(),
              onTabSelected: (value) => setState(() => _selectedTab = value),
            ),
      builder: (context) => ComponentsLibraryVariantScreen(
        variant: _selectedTab,
        showInputs: _showEdits,
      ),
    );
  }

  void _onEditTapped() {
    setState(() {
      _showEdits = !_showEdits;
    });
  }
}

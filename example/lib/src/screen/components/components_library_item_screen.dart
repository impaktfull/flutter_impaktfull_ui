import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/widget/components/components_library_variant_screen.dart';
import 'package:impaktfull_ui_example/src/widget/base/base_screen.dart';

class ComponentsLibraryItemScreen extends StatefulWidget {
  final ComponentLibraryItem item;
  const ComponentsLibraryItemScreen({
    required this.item,
    super.key,
  });

  @override
  State<ComponentsLibraryItemScreen> createState() =>
      _ComponentsLibraryItemScreenState();
}

class _ComponentsLibraryItemScreenState
    extends State<ComponentsLibraryItemScreen> {
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
    return BaseScreen(
      title: widget.item.title,
      headerBottom: variants.length <= 1
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
      actions: [
        ImpaktfullUiIconButton(
          onTap: _onEditTapped,
          color: _showEdits ? theme.colors.accent : theme.colors.text,
          asset: theme.assets.icons.edit,
        ),
      ],
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

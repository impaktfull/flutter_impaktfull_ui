import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/component_library.dart';
import 'package:impaktfull_ui_example/src/screen/components_library_variant_screen.dart';

class ComponentsLibraryItemScreen extends StatefulWidget {
  final ComponentLibraryItem item;
  const ComponentsLibraryItemScreen({
    required this.item,
    super.key,
  });

  @override
  State<ComponentsLibraryItemScreen> createState() => _ComponentsLibraryItemScreenState();
}

class _ComponentsLibraryItemScreenState extends State<ComponentsLibraryItemScreen> {
  late final List<ComponentLibraryVariant> variants;
  late ComponentLibraryVariant _selectedTab;

  @override
  void initState() {
    super.initState();
    variants = widget.item.getComponentVariants();
    _selectedTab = variants.first;
  }

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiThemeBuidler(
      builder: (context, theme) => Scaffold(
        body: ImpaktfullUiAutoLayout.vertical(
          children: [
            ImpaktfullUiCmsHeader(
              title: widget.item.title,
              onBackTapped: () => Navigator.of(context).pop(),
              bottom: ImpaktfullUiHorizontalTabs(
                selectedValue: _selectedTab,
                tabs: variants
                    .map(
                      (e) => ImpaktfullUiHorizontalTabConfig(label: e.title, value: e),
                    )
                    .toList(),
                onTabSelected: (value) => setState(() => _selectedTab = value),
              ),
            ),
            Expanded(
              child: ComponentsLibraryVariantScreen(
                variant: _selectedTab,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

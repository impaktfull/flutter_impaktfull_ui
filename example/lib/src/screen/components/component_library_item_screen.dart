import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/navigator/navigator.dart';
import 'package:impaktfull_ui_example/src/screen/components/component_library_variant_screen.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

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
  var _isRtl = false;

  @override
  void initState() {
    super.initState();
    variants = widget.item.getComponentVariants();
    _selectedTab = variants.first;
  }

  @override
  Widget build(BuildContext context) {
    final theme = ImpaktfullUiTheme.of(context);
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
        ImpaktfullUiAdaptiveNavBarActionItem(
          onTap: _onRtlTapped,
          type: _isRtl
              ? ImpaktfullUiAdaptiveNavBarActionItemType.primary
              : ImpaktfullUiAdaptiveNavBarActionItemType.secondary,
          asset: ImpaktfullUiAsset.icon(PhosphorIcons.arrowsLeftRight()),
          title: 'Right-to-left',
        ),
      ],
      onBackTapped: () => ImpaktfullUiNavigator.instance.goBack(),
      headerBottomChild: variants.length <= 1
          ? null
          : ImpaktfullUiHorizontalTabs(
              value: _selectedTab,
              tabs: variants
                  .map(
                    (e) => ImpaktfullUiHorizontalTabConfig(
                      title: e.title,
                      value: e,
                    ),
                  )
                  .toList(),
              onChanged: (value) => setState(() => _selectedTab = value),
            ),
      builder: (context) => Directionality(
        textDirection: _isRtl ? TextDirection.rtl : TextDirection.ltr,
        child: ComponentsLibraryVariantScreen(
          variant: _selectedTab,
          showInputs: _showEdits,
        ),
      ),
    );
  }

  void _onRtlTapped() => setState(() => _isRtl = !_isRtl);

  void _onEditTapped() {
    setState(() {
      _showEdits = !_showEdits;
    });
  }
}

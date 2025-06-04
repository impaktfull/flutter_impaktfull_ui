import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/navigator/navigator.dart';
import 'package:impaktfull_ui_example/src/widget/component/component_card.dart';

class ComponentLibraryScreen extends StatefulWidget {
  const ComponentLibraryScreen({
    super.key,
  });

  @override
  State<ComponentLibraryScreen> createState() => _ComponentLibraryScreenState();
}

class _ComponentLibraryScreenState extends State<ComponentLibraryScreen> {
  final _fixedSearchQuery = [];
  var _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredComponents = ComponentLibrary.instance.items.where((e) {
      if (_fixedSearchQuery.isNotEmpty) {
        for (final fixedQuery in _fixedSearchQuery) {
          if (e.title.toLowerCase().contains(fixedQuery.toLowerCase())) {
            return true;
          }
        }
        return false;
      }
      return e.title.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();
    return ImpaktfullUiCommandMenu(
      shortcutActivator: const SingleActivator(
        LogicalKeyboardKey.keyF,
        meta: true,
      ),
      autofocus: true,
      builder: (BuildContext context, theme, controller) => CommandMenuWindow(
        value: _searchQuery,
        onInputChanged: _onChanged,
        onCloseWindow: () => controller.hide(),
      ),
      child: ImpaktfullUiAdaptiveScreen(
        title: 'Components',
        onBackTapped: () => ImpaktfullUiNavigator.instance.goBack(),
        actions: [
          if (_fixedSearchQuery.isNotEmpty) ...[
            ImpaktfullUiAdaptiveNavBarActionItem(
              asset: theme.assets.icons.close,
              onTap: () {
                _fixedSearchQuery.clear();
                setState(() {});
              },
              title: 'Clear search',
            ),
          ],
        ],
        builder: (context) => ImpaktfullUiGridView.builder(
          crossAxisCount: (context, config) => config.maxWidth ~/ 250,
          padding: const EdgeInsets.all(16),
          items: filteredComponents,
          spacing: 8,
          placeholderData: const ImpaktfullUiGridViewPlaceholderData(
            title: 'No Components',
          ),
          itemBuilder: (context, item, index) {
            final value = filteredComponents[index];
            final fistComponent = value.getComponentVariants().first;
            final widget =
                fistComponent.build(context, fistComponent.inputs()).first;
            return ComponentCard(
              label: value.name,
              onTap: () => _onItemTapped(value),
              child: widget,
            );
          },
        ),
      ),
    );
  }

  void _onItemTapped(ComponentLibraryItem value) =>
      ImpaktfullUiNavigator.instance.goToComponent(value);

  void _onChanged(String value) {
    setState(() {
      _searchQuery = value;
    });
  }
}

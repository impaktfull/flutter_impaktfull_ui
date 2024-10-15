import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/navigator/page_route/native_page_route_builder.dart';
import 'package:impaktfull_ui_example/src/screen/components/components_library_item_screen.dart';
import 'package:impaktfull_ui_example/src/widget/base/base_screen.dart';
import 'package:impaktfull_ui_example/src/widget/components/component_card.dart';

class ComponentsLibraryScreen extends StatefulWidget {
  const ComponentsLibraryScreen({super.key});

  @override
  State<ComponentsLibraryScreen> createState() => _ComponentsLibraryScreenState();
}

class _ComponentsLibraryScreenState extends State<ComponentsLibraryScreen> {
  final _componentLibrary = ComponentLibrary();
  final _fixedSearchQuery = [
    // 'ImageCrop',
  ];
  var _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredComponents = _componentLibrary.components.where((e) {
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
      child: BaseScreen(
        title: 'Components',
        actions: [
          if (_fixedSearchQuery.isNotEmpty) ...[
            ImpaktfullUiIconButton(
              asset: theme.assets.icons.cloudDownload,
              onTap: () {
                _fixedSearchQuery.clear();
                setState(() {});
              },
            ),
          ],
        ],
        builder: (context) => ImpaktfullUiGridView.builder(
          crossAxisCount: (context, config) => config.maxWidth ~/ 250,
          padding: const EdgeInsets.all(16),
          items: filteredComponents,
          spacing: 8,
          itemBuilder: (context, item, index) {
            final value = filteredComponents[index];
            final fistComponent = value.getComponentVariants().first;
            final widget = fistComponent.build(context, fistComponent.inputs()).first;
            return ComponentCard(
              label: value.title,
              onTap: () => _onItemTapped(value),
              child: widget,
            );
          },
        ),
      ),
    );
  }

  void _onItemTapped(ComponentLibraryItem value) =>
      Navigator.of(context).push(NativePageRoute(builder: (context) => ComponentsLibraryItemScreen(item: value)));

  void _onChanged(String value) {
    setState(() {
      _searchQuery = value;
    });
  }
}

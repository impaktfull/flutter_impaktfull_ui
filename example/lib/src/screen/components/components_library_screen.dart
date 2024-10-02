import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/navigator/page_route/native_page_route_builder.dart';
import 'package:impaktfull_ui_example/src/screen/components/components_library_item_screen.dart';
import 'package:impaktfull_ui_example/src/widget/base/base_screen.dart';

class ComponentsLibraryScreen extends StatefulWidget {
  const ComponentsLibraryScreen({super.key});

  @override
  State<ComponentsLibraryScreen> createState() =>
      _ComponentsLibraryScreenState();
}

class _ComponentsLibraryScreenState extends State<ComponentsLibraryScreen> {
  final _componentLibrary = ComponentLibrary();
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: 'Components',
      builder: (context) => ImpaktfullUiListView.builder(
        padding: const EdgeInsets.all(16),
        items: _componentLibrary.components,
        spacing: 8,
        itemBuilder: (context, item, index) {
          final value = _componentLibrary.components[index];
          return ImpaktfullUiButton(
            type: ImpaktfullUiButtonType.primary,
            title: value.title,
            fullWidth: true,
            onTap: () => _onItemTapped(value),
          );
        },
        noDataLabel: 'No components configured',
      ),
    );
  }

  void _onItemTapped(ComponentLibraryItem value) =>
      Navigator.of(context).push(NativePageRoute(
          builder: (context) => ComponentsLibraryItemScreen(item: value)));
}

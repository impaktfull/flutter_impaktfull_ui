import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/component_library.dart';
import 'package:impaktfull_ui_example/src/screen/components_library_item_screen.dart';

class ComponentsLibraryScreen extends StatefulWidget {
  const ComponentsLibraryScreen({super.key});

  @override
  State<ComponentsLibraryScreen> createState() => _ComponentsLibraryScreenState();
}

class _ComponentsLibraryScreenState extends State<ComponentsLibraryScreen> {
  final _componentLibrary = ComponentLibrary();
  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiThemeBuidler(
      builder: (context, theme) => Scaffold(
        body: ImpaktfullUiAutoLayout.vertical(
          children: [
            ImpaktfullUiCmsHeader(
              title: 'Components',
              onBackTapped: () => Navigator.of(context).pop(),
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: _componentLibrary.components.length,
                itemBuilder: (BuildContext context, int index) {
                  final value = _componentLibrary.components[index];
                  return ImpaktfullUiButton(
                    type: ImpaktfullUiButtonType.primary,
                    title: value.title,
                    onTap: () => _onItemTapped(value),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(height: 8),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onItemTapped(ComponentLibraryItem value) =>
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ComponentsLibraryItemScreen(item: value)));
}

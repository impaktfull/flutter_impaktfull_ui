import 'package:flutter/material.dart';
import 'package:impaktfull_ui_example/src/component_library/component_library.dart';

class ComponentLibraryIconInput extends ComponentLibraryInputItem<IconData> {
  final icons = [
    Icons.add,
    Icons.settings,
    Icons.search,
    Icons.cloud_upload,
    Icons.cloud_download,
  ];
  ComponentLibraryIconInput(
    super.label, {
    super.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) => Column(
        children: [
          for (final icon in icons) ...[
            GestureDetector(
              onTap: () => updateState(icon),
              child: Icon(icon),
            ),
          ],
        ],
      ),
    );
  }
}

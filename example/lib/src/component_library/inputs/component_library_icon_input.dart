import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/icons_data/icons_data.dart';

class ComponentLibraryIconInput extends ComponentLibraryInputItem<IconData> {
  final _controller = ImpaktfullUiDropdownController();
  final items = AllIcons.allFlatIconsAsMap.values
      .map((e) =>
          ImpaktfullUiDropdownItem(label: e.hashCode.toString(), value: e))
      .toList();

  ComponentLibraryIconInput(
    super.label, {
    super.initialValue,
    super.extraInfo,
  });

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) => Center(
        child: ImpaktfullUiDropdown.builder(
          controller: _controller,
          button: (context) => ImpaktfullUiButton(
            type: ImpaktfullUiButtonType.secondary,
            size: ImpaktfullUiButtonSize.extraLarge,
            leadingIcon: value == null ? null : ImpaktfullUiAsset.icon(value!),
            trailingIcon: const ImpaktfullUiAsset.icon(Icons.arrow_drop_down),
            onTap: () => _controller.open(),
          ),
          items: items,
          itemBuilder: (context, item, index) => ImpaktfullUiTouchFeedback(
            onTap: () {
              updateState(item.value);
              _controller.close();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Icon(item.value),
            ),
          ),
          noDataLabel: 'No icons',
        ),
      ),
    );
  }
}

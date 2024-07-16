import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/component_library.dart';
import 'package:impaktfull_ui_example/src/component_library/variants/buttons/buttons_library_item.dart';

class ButtonTypeVariant extends ComponentLibraryVariant<ButtonsLibraryPrimaryInputs> {
  final ImpaktfullUiButtonType type;

  ButtonTypeVariant({
    required this.type,
  });

  @override
  String get title => type.name;

  @override
  List<Widget> build(BuildContext context, ButtonsLibraryPrimaryInputs inputs) {
    final title = inputs.title.value ?? '{button_label}';
    final leadingIcons = [
      null,
      inputs.leadingIcon.value ?? Icons.add,
    ];
    final trailingIcons = [
      null,
      inputs.trailingIcon.value ?? Icons.add,
    ];
    return [
      for (final size in ImpaktfullUiButtonSize.values) ...[
        for (final leadingIcon in leadingIcons) ...[
          for (final trailingIcon in trailingIcons) ...[
            ImpaktfullUiButton(
              type: type,
              size: size,
              title: title,
              leadingIcon: leadingIcon,
              trailingIcon: trailingIcon,
            ),
          ],
        ],
      ],
    ];
  }

  @override
  ButtonsLibraryPrimaryInputs inputs() => ButtonsLibraryPrimaryInputs();
}

class ButtonsLibraryPrimaryInputs extends ButtonsLibraryInputs {}

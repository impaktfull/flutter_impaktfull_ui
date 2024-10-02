import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/components/snacky/snacky_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/widget/components/components_library_variant_descriptor.dart';

class SnackyLibraryVariant
    extends ComponentLibraryVariant<SnackyLibraryPrimaryInputs> {
  const SnackyLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(BuildContext context, SnackyLibraryPrimaryInputs inputs) {
    return [
      for (final type in SnackyType.values) ...[
        ComponentsLibraryVariantDescriptor(
          title: 'Snacky ${type.name}',
          child: ImpaktfullUiButton(
            type: ImpaktfullUiButtonType.primary,
            title: '${type.name} snacky',
            onTap: () => SnackyController.instance.showMessage(
              (context) => Snacky(
                title: type.name,
                type: type,
                canBeClosed: true,
              ),
            ),
          ),
        ),
      ],
    ];
  }

  @override
  SnackyLibraryPrimaryInputs inputs() => SnackyLibraryPrimaryInputs();
}

class SnackyLibraryPrimaryInputs extends SnackyLibraryInputs {}

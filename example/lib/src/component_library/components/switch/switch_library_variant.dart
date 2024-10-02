import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/components/switch/switch_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/widget/components/components_library_variant_descriptor.dart';

class SwitchLibraryVariant
    extends ComponentLibraryVariant<SwitchLibraryPrimaryInputs> {
  const SwitchLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(BuildContext context, SwitchLibraryPrimaryInputs inputs) {
    return [
      ImpaktfullUiSwitch(
        value: inputs.value.value ?? false,
        onChanged: inputs.value.updateState,
      ),
      ComponentsLibraryVariantDescriptor(
        title: 'value: ${inputs.value.value} / accessibleNavigation: true',
        child: MediaQuery(
          data: MediaQuery.of(context).copyWith(accessibleNavigation: true),
          child: ImpaktfullUiSwitch(
            value: inputs.value.value ?? false,
            onChanged: inputs.value.updateState,
          ),
        ),
      ),
    ];
  }

  @override
  SwitchLibraryPrimaryInputs inputs() => SwitchLibraryPrimaryInputs();
}

class SwitchLibraryPrimaryInputs extends SwitchLibraryInputs {}

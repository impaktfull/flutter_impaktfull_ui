import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/components/pin_code/pin_code_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/widget/component/components_library_variant_descriptor.dart';

class PinCodeLibraryVariant
    extends ComponentLibraryVariant<PinCodeLibraryPrimaryInputs> {
  const PinCodeLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(BuildContext context, PinCodeLibraryPrimaryInputs inputs) {
    return [
      ComponentsLibraryVariantDescriptor(
        height: 500,
        child: ImpaktfullUiPinCode(
          code: inputs.code.value ?? '',
          onChanged: inputs.code.updateState,
          onSubmit: (value) =>
              ImpaktfullUiNotification.show(title: 'Pincode is: $value'),
          length: 5,
        ),
      ),
    ];
  }

  @override
  PinCodeLibraryPrimaryInputs inputs() => PinCodeLibraryPrimaryInputs();
}

class PinCodeLibraryPrimaryInputs extends PinCodeLibraryInputs {}

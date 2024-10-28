import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/components/slider/slider_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class SliderLibraryVariant extends ComponentLibraryVariant<SliderLibraryPrimaryInputs> {
  const SliderLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(BuildContext context, SliderLibraryPrimaryInputs inputs) {
    return [
      ImpaktfullUiSlider(
        value: inputs.value.value!,
        min: 0,
        max: 100,
        onChanged: inputs.value.updateState,
      ),
    ];
  }

  @override
  SliderLibraryPrimaryInputs inputs() => SliderLibraryPrimaryInputs();
}

class SliderLibraryPrimaryInputs extends SliderLibraryInputs {}

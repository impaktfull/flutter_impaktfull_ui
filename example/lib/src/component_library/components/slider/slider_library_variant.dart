import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/components/slider/slider_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class SliderLibraryVariant
    extends ComponentLibraryVariant<SliderLibraryPrimaryInputs> {
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
      ImpaktfullUiSlider(
        value: inputs.value.value!,
        min: 0,
        max: 100,
        legendBuilder: (context, value) => Row(
          children: [
            ...List.generate(100, (i) => i).map(
              (i) => Expanded(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: Container(
                      color:
                          value < i ? theme.colors.border : theme.colors.accent,
                      height: 24 * (i / 50),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        onChanged: inputs.value.updateState,
      ),
    ];
  }

  @override
  SliderLibraryPrimaryInputs inputs() => SliderLibraryPrimaryInputs();
}

class SliderLibraryPrimaryInputs extends SliderLibraryInputs {}

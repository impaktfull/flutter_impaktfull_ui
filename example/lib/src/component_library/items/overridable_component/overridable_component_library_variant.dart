import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/items/overridable_component/overridable_component_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/items/overridable_component/override_component.dart';

class OverridableComponentConfiguratorLibraryVariant
    extends ComponentLibraryVariant<
        OverridableComponentConfiguratorPrimaryInputs> {
  const OverridableComponentConfiguratorLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(BuildContext context,
      OverridableComponentConfiguratorPrimaryInputs inputs) {
    return [
      ImpaktfullUiOverridableComponentConfigurator(
        overrideComponents: [
          ImpaktfullUiOverridableComponent<ImpaktfullUiRadioButton<bool?>,
              ImpaktfullUiRadioButtonTheme>(
            builder: (context, component, theme) =>
                OverrideComponent(component: component),
          ),
        ],
        child: ImpaktfullUiOverridableComponentConfigurator(
          overrideComponents: const [],
          child: ImpaktfullUiRadioButton(
            value: true,
            groupValue: inputs.value.value,
            onChanged: inputs.value.updateState,
          ),
        ),
      ),
    ];
  }

  @override
  OverridableComponentConfiguratorPrimaryInputs inputs() =>
      OverridableComponentConfiguratorPrimaryInputs();
}

class OverridableComponentConfiguratorPrimaryInputs
    extends OverridableCOmponentConfiguratorLibraryInputs {}

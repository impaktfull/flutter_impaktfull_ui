import 'package:material_ui/material_ui.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_string_input.dart';

/// A picker field: `onTap` opens a list of options instead of the keyboard.
class InputFieldPickerVariant
    extends ComponentLibraryVariant<InputFieldPickerLibraryVariantInputs> {
  static const _countries = [
    'Belgium',
    'France',
    'Germany',
    'Luxembourg',
    'The Netherlands',
  ];

  InputFieldPickerVariant();

  @override
  String get title => 'Picker (onTap)';

  @override
  List<Widget> build(
      BuildContext context, InputFieldPickerLibraryVariantInputs inputs) {
    final theme = ImpaktfullUiTheme.of(context);
    return [
      ImpaktfullUiInputField(
        label: inputs.label.value,
        placeholder: inputs.placeholder.value,
        hint: inputs.hint.value,
        error: inputs.error.value,
        value: inputs.value.value,
        onChanged: null,
        onTap: () => _onPickerTapped(context, inputs),
        trailingInputActions: [
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 8),
            child: ImpaktfullUiAssetWidget(
              asset: theme.assets.icons.chevronDown,
              size: 20,
            ),
          ),
        ],
      ),
    ];
  }

  Future<void> _onPickerTapped(
    BuildContext context,
    InputFieldPickerLibraryVariantInputs inputs,
  ) async {
    final country = await ImpaktfullUiBottomSheet.showSimple<String>(
      context: context,
      title: inputs.label.value,
      child: ImpaktfullUiAutoLayout.vertical(
        children: [
          for (final country in _countries)
            ImpaktfullUiSimpleListItem(
              title: country,
              onTap: () => Navigator.of(context).pop(country),
            ),
        ],
      ),
    );
    if (country == null) return;
    inputs.value.updateState(country);
  }

  @override
  InputFieldPickerLibraryVariantInputs inputs() =>
      InputFieldPickerLibraryVariantInputs();
}

class InputFieldPickerLibraryVariantInputs extends ComponentLibraryInputs {
  final label = ComponentLibraryStringInput('Label', initialValue: 'Country');
  final placeholder = ComponentLibraryStringInput('Placeholder',
      initialValue: 'Choose a country');
  final value = ComponentLibraryStringInput('Value');
  final hint = ComponentLibraryStringInput('Hint');
  final error = ComponentLibraryStringInput('Error');

  @override
  List<ComponentLibraryInputItem> buildInputItems() => [
        label,
        placeholder,
        value,
        hint,
        error,
      ];
}

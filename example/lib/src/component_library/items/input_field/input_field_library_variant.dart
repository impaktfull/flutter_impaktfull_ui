import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/items/input_field/input_field_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class InputFieldVariant
    extends ComponentLibraryVariant<InputFieldLibraryVariantInputs> {
  InputFieldVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(
      BuildContext context, InputFieldLibraryVariantInputs inputs) {
    final label = inputs.label.value;
    final hint = inputs.hint.value;
    final placholder = inputs.placholder.value;
    final error = inputs.error.value;
    final value = inputs.value.value;
    final leadingIcon = inputs.leadingIcon.value;
    final showTrailingAction = inputs.showTrailingAction.value ?? false;
    final showLabelAction = inputs.showLabelAction.value ?? false;
    final multiLine = inputs.multiLine.value ?? false;
    return [
      ImpaktfullUiInputField(
        leadingIcon:
            leadingIcon == null ? null : ImpaktfullUiAsset.icon(leadingIcon),
        label: label,
        labelActions: [
          if (showLabelAction) ...[
            ImpaktfullUiIconButton(
              asset: theme.assets.icons.copy,
              onTap: () =>
                  ImpaktfullUiNotification.show(title: 'Copied to clipboard'),
            ),
          ],
        ],
        placeholder: placholder,
        hint: hint,
        error: error,
        value: value,
        obscureText: inputs.obscureText.value ?? false,
        onChanged: inputs.value.updateState,
        multiline: multiLine,
        trailingAction: showTrailingAction
            ? ImpaktfullUiInputFieldAction(
                label: 'Copy',
                asset: theme.assets.icons.copy,
                onTap: () => ImpaktfullUiNotification.show(
                  title: 'Copied to clipboard',
                ),
              )
            : null,
        validator: (value) {
          if (!value.contains('@')) {
            return const ImpaktfullUiInputFieldValidatorResult
                .pendingFinalValidation();
          }
          if (value.contains('@') && value.contains('.') && value.length < 4) {
            return const ImpaktfullUiInputFieldValidatorResult.invalid(
                errorMessage: 'At least 4 characters');
          }
          return const ImpaktfullUiInputFieldValidatorResult.valid();
        },
      ),
      ImpaktfullUiInputField(
        leadingIcon:
            leadingIcon == null ? null : ImpaktfullUiAsset.icon(leadingIcon),
        label: label,
        labelActions: [
          if (showLabelAction) ...[
            ImpaktfullUiIconButton(
              asset: theme.assets.icons.copy,
              onTap: () =>
                  ImpaktfullUiNotification.show(title: 'Copied to clipboard'),
            ),
          ],
        ],
        placeholder: placholder,
        hint: hint,
        error: error,
        value: value,
        onChanged: null,
        readOnly: true,
        obscureText: inputs.obscureText.value ?? false,
        multiline: multiLine,
        trailingAction: showTrailingAction
            ? ImpaktfullUiInputFieldAction(
                label: 'Copy',
                asset: theme.assets.icons.copy,
                onTap: () => ImpaktfullUiNotification.show(
                  title: 'Copied to clipboard',
                ),
              )
            : null,
      ),
    ];
  }

  @override
  InputFieldLibraryVariantInputs inputs() => InputFieldLibraryVariantInputs();
}

class InputFieldLibraryVariantInputs extends InputLibraryInputs {}

import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/items/password_strength_indicator/password_strength_indicator_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class PasswordStrengthIndicatorLibraryVariant extends ComponentLibraryVariant<
    PasswordStrengthIndicatorLibraryPrimaryInputs> {
  const PasswordStrengthIndicatorLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(BuildContext context,
      PasswordStrengthIndicatorLibraryPrimaryInputs inputs) {
    return [
      const ImpaktfullUiPasswordStrengthIndicator(
        strengthIndicatorIndex: 0,
        requirements: [
          PasswordStrengthIndicatorRequirement(
              requirement: 'Requirement 1', isMet: true),
          PasswordStrengthIndicatorRequirement(
              requirement: 'Requirement 2', isMet: false),
          PasswordStrengthIndicatorRequirement(
              requirement: 'Requirement 3', isMet: false),
        ],
      ),
    ];
  }

  @override
  PasswordStrengthIndicatorLibraryPrimaryInputs inputs() =>
      PasswordStrengthIndicatorLibraryPrimaryInputs();
}

class PasswordStrengthIndicatorLibraryPrimaryInputs
    extends PasswordStrengthIndicatorLibraryInputs {}

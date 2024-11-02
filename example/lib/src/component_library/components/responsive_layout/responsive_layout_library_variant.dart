import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/components/responsive_layout/responsive_layout_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class ResponsiveLayoutLibraryVariant extends ComponentLibraryVariant<ResponsiveLayoutLibraryPrimaryInputs> {
  const ResponsiveLayoutLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(BuildContext context, ResponsiveLayoutLibraryPrimaryInputs inputs) {
    return [
      ImpaktfullUiResponsiveLayout(
        small: (context) => const Text('Small'),
        medium: (context) => const Text('Medium'),
        large: (context) => const Text('Large'),
        extraLarge: (context) => const Text('Extra large'),
      ),
    ];
  }

  @override
  ResponsiveLayoutLibraryPrimaryInputs inputs() => ResponsiveLayoutLibraryPrimaryInputs();
}

class ResponsiveLayoutLibraryPrimaryInputs extends ResponsiveLayoutLibraryInputs {}

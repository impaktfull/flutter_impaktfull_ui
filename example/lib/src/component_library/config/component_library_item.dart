import 'package:flutter/material.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';

abstract class ComponentLibraryItem {
  String get title;

  const ComponentLibraryItem();

  List<ComponentLibraryVariant> getComponentVariants();
}

abstract class ComponentLibraryVariant<T extends ComponentLibraryInputs?> {
  String get title;

  const ComponentLibraryVariant();

  List<Widget> build(BuildContext context, T inputs);

  T inputs();
}

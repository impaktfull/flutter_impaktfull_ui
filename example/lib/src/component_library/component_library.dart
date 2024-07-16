import 'package:flutter/material.dart';
import 'package:impaktfull_ui_example/src/component_library/variants/badge/badge_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/variants/buttons/buttons_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/variants/card/card_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/variants/cms_header/cms_header_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/variants/horizontal_tabs/horizontal_tabs_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/variants/input_field/input_field_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/variants/table/table_library_item.dart';

class ComponentLibrary {
  final List<ComponentLibraryItem> components = [
    BadgeLibraryItem(),
    ButtonsLibraryItem(),
    CardLibraryItem(),
    CmsHeaderLibraryItem(),
    HorizontalTabsLibraryItem(),
    InputFieldLibraryItem(),
    TableLibraryItem(),
  ];
}

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

abstract class ComponentLibraryInputs {
  late final List<ComponentLibraryInputItem> inputItems;
  ComponentLibraryInputs();

  List<ComponentLibraryInputItem> buildInputItems();

  void setup(VoidCallback listener) {
    inputItems = buildInputItems();
    for (final item in inputItems) {
      item._addListener(listener);
    }
  }

  void dispose(VoidCallback listener) {
    for (final item in inputItems) {
      item._removeListener(listener);
    }
  }
}

abstract class ComponentLibraryInputItem<T> {
  T? _value;
  T? get value => _value;
  final String label;
  final _listeners = <VoidCallback>{};

  ComponentLibraryInputItem(
    this.label, {
    T? initialValue,
  }) : _value = initialValue;

  Widget build(BuildContext context);

  void updateState(T? value) {
    _value = value;
    notifyListeners();
  }

  void notifyListeners() {
    for (final listener in _listeners) {
      listener.call();
    }
  }

  void _addListener(VoidCallback listener) {
    _listeners.add(listener);
  }

  void _removeListener(VoidCallback listener) => _listeners.remove(listener);
}

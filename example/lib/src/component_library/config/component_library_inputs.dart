import 'package:flutter/material.dart';

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
  final String? extraInfo;
  final _listeners = <VoidCallback>{};

  ComponentLibraryInputItem(
    this.label, {
    T? initialValue,
    this.extraInfo,
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

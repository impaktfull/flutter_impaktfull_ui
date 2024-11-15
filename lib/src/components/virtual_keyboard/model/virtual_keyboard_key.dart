import 'package:flutter/services.dart';

class ImpaktfullUiVirtualKeyboardKeyItem {
  final ImpaktfullUiVirtualKeyboardKey defaultKey;
  final ImpaktfullUiVirtualKeyboardKey? shiftKey;
  final int flex;

  String keyLabel(bool shift) {
    if (shift && shiftKey != null) {
      return shiftKey!.label ?? shiftKey!.key.keyLabel;
    }
    return defaultKey.label ?? defaultKey.key.keyLabel;
  }

  LogicalKeyboardKey logicalKey(bool shift) {
    if (shift && shiftKey != null) {
      return shiftKey!.key;
    }
    return defaultKey.key;
  }

  String valueForTextInput(bool shift) {
    if (shift && shiftKey != null) {
      return shiftKey!.valueForTextInput;
    }
    return defaultKey.valueForTextInput;
  }

  const ImpaktfullUiVirtualKeyboardKeyItem({
    required this.defaultKey,
    this.shiftKey,
    this.flex = 1,
  });
}

class ImpaktfullUiVirtualKeyboardKey {
  final String? label;
  final String? value;
  final LogicalKeyboardKey key;

  const ImpaktfullUiVirtualKeyboardKey({
    required this.key,
    this.label,
    this.value,
  });

  String get valueForTextInput => value ?? label ?? key.keyLabel;
}

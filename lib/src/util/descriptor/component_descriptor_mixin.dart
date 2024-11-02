import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/models/asset.dart';

mixin ComponentDescriptorMixin {
  String describe(BuildContext context);
}

class ComponentDescriptor {
  final Map<String, Object> _descriptors = {};

  void add(String key, Object? value) {
    if (value == null) return;
    if (value is List) {
      if (value.isEmpty) {
        return;
      } else {
        _descriptors[key] = value.length;
      }
    } else if (value is ImpaktfullUiAsset) {
      _descriptors[key] = value.getAssetName();
    } else {
      _descriptors[key] = value;
    }
  }

  String describe() {
    final sb = StringBuffer();
    for (var i = 0; i < _descriptors.length; ++i) {
      final key = _descriptors.keys.elementAt(i);
      final value = _descriptors[key];
      sb.write('$key: $value');
      if (i < _descriptors.length - 1) {
        sb.write(' / ');
      }
    }
    return sb.toString();
  }
}

import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/items/unified_screen_layout/unified_screen_layout_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class UnifiedScreenLayoutLibraryVariant
    extends ComponentLibraryVariant<UnifiedScreenLayoutLibraryPrimaryInputs> {
  const UnifiedScreenLayoutLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(
      BuildContext context, UnifiedScreenLayoutLibraryPrimaryInputs inputs) {
    return [
      const ImpaktfullUiUnifiedScreenLayout(
        centerChild: Center(
          child: Text('Center'),
        ),
      ),
    ];
  }

  @override
  UnifiedScreenLayoutLibraryPrimaryInputs inputs() =>
      UnifiedScreenLayoutLibraryPrimaryInputs();
}

class UnifiedScreenLayoutLibraryPrimaryInputs
    extends UnifiedScreenLayoutLibraryInputs {}

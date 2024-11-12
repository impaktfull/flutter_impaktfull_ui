import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/items/adaptive_safe_area/adaptive_safe_area_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class AdaptiveSafeAreaLibraryVariant
    extends ComponentLibraryVariant<AdaptiveSafeAreaLibraryPrimaryInputs> {
  const AdaptiveSafeAreaLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(
      BuildContext context, AdaptiveSafeAreaLibraryPrimaryInputs inputs) {
    return [
      ImpaktfullUiAdaptiveSafeArea(
        child: Container(),
      ),
    ];
  }

  @override
  AdaptiveSafeAreaLibraryPrimaryInputs inputs() =>
      AdaptiveSafeAreaLibraryPrimaryInputs();
}

class AdaptiveSafeAreaLibraryPrimaryInputs
    extends AdaptiveSafeAreaLibraryInputs {}

import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/components/wysiwyg/wysiwyg_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class WysiwygLibraryVariant extends ComponentLibraryVariant<WysiwygLibraryPrimaryInputs> {
  const WysiwygLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(BuildContext context, WysiwygLibraryPrimaryInputs inputs) {
    return [
      ImpaktfullUiWysiwyg(
        type: inputs.previewType.value!,
      ),
    ];
  }

  @override
  WysiwygLibraryPrimaryInputs inputs() => WysiwygLibraryPrimaryInputs();
}

class WysiwygLibraryPrimaryInputs extends WysiwygLibraryInputs {}

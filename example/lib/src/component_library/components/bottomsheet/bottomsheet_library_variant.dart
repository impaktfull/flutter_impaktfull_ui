import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/components/bottomsheet/bottomsheet_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/widget/component/components_library_variant_descriptor.dart';

class BottomSheetLibraryVariant extends ComponentLibraryVariant<BottomSheetLibraryPrimaryInputs> {
  const BottomSheetLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(BuildContext context, BottomSheetLibraryPrimaryInputs inputs) {
    return [
      ComponentsLibraryVariantDescriptor(
        child: ImpaktfullUiButton(
          type: ImpaktfullUiButtonType.primary,
          title: 'Show bottom sheet',
          onTap: () => ImpaktfullUiBottomSheet.showSimple(
            context: context,
            title: 'Title',
            subtitle: 'This is quite a long subtitle that should wrap to the next line',
            child: ImpaktfullUiAutoLayout.vertical(
              children: [
                Text(
                  'Testing',
                  style: ImpaktfullUiTheme.of(context).textStyles.onCanvas.text.medium,
                ),
              ],
            ),
          ),
        ),
      ),
    ];
  }

  @override
  BottomSheetLibraryPrimaryInputs inputs() => BottomSheetLibraryPrimaryInputs();
}

class BottomSheetLibraryPrimaryInputs extends BottomSheetLibraryInputs {}

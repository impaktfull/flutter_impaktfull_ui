import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/components/progress_indicator/progress_indicator_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/widget/components/components_library_variant_descriptor.dart';

class ProgressIndicatorLibraryVariant
    extends ComponentLibraryVariant<ProgressIndicatorLibraryPrimaryInputs> {
  final ImpaktfullUiProgressIndicatorType type;
  const ProgressIndicatorLibraryVariant({
    required this.type,
  });

  @override
  String get title => type.name;

  @override
  List<Widget> build(
      BuildContext context, ProgressIndicatorLibraryPrimaryInputs inputs) {
    return [
      ComponentsLibraryVariantDescriptor(
        wrapWithCard: true,
        height: 150,
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: ImpaktfullUiProgressIndicator(
          value: (inputs.value.value ?? 0) / 100,
          showText: true,
          type: type,
        ),
      ),
    ];
  }

  @override
  ProgressIndicatorLibraryPrimaryInputs inputs() =>
      ProgressIndicatorLibraryPrimaryInputs();
}

class ProgressIndicatorLibraryPrimaryInputs
    extends ProgressIndicatorLibraryInputs {}

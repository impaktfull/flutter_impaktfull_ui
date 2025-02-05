import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/items/segmented_control/segmented_control_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class SegmentedControlLibraryVariant
    extends ComponentLibraryVariant<SegmentedControlLibraryPrimaryInputs> {
  const SegmentedControlLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(
      BuildContext context, SegmentedControlLibraryPrimaryInputs inputs) {
    return [
      ImpaktfullUiSegmentedControl<SegmentedControlLibraryTestValues>(
        value: inputs.values.value!,
        items: SegmentedControlLibraryTestValues.values,
        labelBuilder: (context, item) => item.label,
        onChanged: inputs.values.updateState,
      ),
      ImpaktfullUiSegmentedControl<SegmentedControlLibraryTestValues>(
        value: inputs.values.value!,
        items: SegmentedControlLibraryTestValues.values,
        labelBuilder: (context, item) => item.label,
        onChanged: inputs.values.updateState,
        theme: ImpaktfullUiSegmentedControlTheme(
          assets: const ImpaktfullUiSegmentedControlAssetsTheme(),
          colors: ImpaktfullUiSegmentedControlColorTheme(
            background: theme.colors.accent,
            border: Colors.transparent,
            activeBackground: theme.colors.card,
            activeBorder: theme.colors.border,
          ),
          dimens: ImpaktfullUiSegmentedControlDimensTheme(
            borderRadius: theme.dimens.borderRadius,
            padding: EdgeInsets.zero,
          ),
          textStyles: ImpaktfullUiSegmentedControlTextStyleTheme(
            label: theme.textStyles.onPrimary.text.small,
            activeLabel: theme.textStyles.onCard.text.small,
          ),
        ),
      ),
    ];
  }

  @override
  SegmentedControlLibraryPrimaryInputs inputs() =>
      SegmentedControlLibraryPrimaryInputs();
}

class SegmentedControlLibraryPrimaryInputs
    extends SegmentedControlLibraryInputs {}

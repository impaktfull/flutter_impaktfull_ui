import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/items/grid_view/grid_view_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/widget/component/components_library_variant_descriptor.dart';

class GridViewLibraryVariant
    extends ComponentLibraryVariant<GridViewLibraryPrimaryInputs> {
  const GridViewLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(
      BuildContext context, GridViewLibraryPrimaryInputs inputs) {
    return [
      ComponentsLibraryVariantDescriptor(
        height: 500,
        child: ImpaktfullUiGridView.builder(
          crossAxisCount: (context, config) => config.maxWidth ~/ 250,
          items: List.generate(100, (i) => i),
          spacing: 4,
          noDataLabel: 'No Grid items',
          itemBuilder: (context, item, index) => Container(
            color: theme.colors.accent,
            alignment: Alignment.center,
            child: Text(
              item.toString(),
              style: theme.textStyles.onPrimary.text.large,
            ),
          ),
        ),
      ),
    ];
  }

  @override
  GridViewLibraryPrimaryInputs inputs() => GridViewLibraryPrimaryInputs();
}

class GridViewLibraryPrimaryInputs extends GridViewLibraryInputs {}

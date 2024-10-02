import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/components/grid_view/grid_view_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class GridViewLibraryVariant
    extends ComponentLibraryVariant<GridViewLibraryPrimaryInputs> {
  const GridViewLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(
      BuildContext context, GridViewLibraryPrimaryInputs inputs) {
    return [
      SizedBox(
        height: 200,
        child: ImpaktfullUiGridView.builder(
          crossAxisCount: (context, config) => config.maxWidth ~/ 100,
          items: List.generate(100, (i) => i),
          spacing: 4,
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

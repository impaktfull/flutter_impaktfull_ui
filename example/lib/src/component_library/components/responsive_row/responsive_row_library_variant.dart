import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/components/responsive_row/responsive_row_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/widget/component/components_library_variant_descriptor.dart';

class ResponsiveRowLibraryVariant extends ComponentLibraryVariant<ResponsiveRowLibraryPrimaryInputs> {
  const ResponsiveRowLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(BuildContext context, ResponsiveRowLibraryPrimaryInputs inputs) {
    return [
      ComponentsLibraryVariantDescriptor(
        isScrollable: true,
        child: ImpaktfullUiResponsiveRow(
          verticalSpacing: 8,
          horizontalSpacing: 8,
          maxColumns: 1,
          mediumMaxColumns: 2,
          largeMaxColumns: 3,
          extraLargeMaxColumns: 4,
          children: [
            for (var i = 0; i < 10; i++) ...[
              Container(
                color: theme.colors.accent,
                width: double.infinity,
                height: 100,
              ),
            ],
          ],
        ),
      ),
    ];
  }

  @override
  ResponsiveRowLibraryPrimaryInputs inputs() => ResponsiveRowLibraryPrimaryInputs();
}

class ResponsiveRowLibraryPrimaryInputs extends ResponsiveRowLibraryInputs {}

import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/items/autolayout/autolayout_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/widget/component/components_library_variant_descriptor.dart';

class AutoLayoutLibraryVariant
    extends ComponentLibraryVariant<AutoLayoutLibraryPrimaryInputs> {
  final ImpaktfullUiAutoLayoutOrientation orientation;
  const AutoLayoutLibraryVariant(
    this.orientation,
  );

  @override
  String get title => orientation.name;

  @override
  List<Widget> build(
      BuildContext context, AutoLayoutLibraryPrimaryInputs inputs) {
    return [
      for (final mainAxisAlignment in MainAxisAlignment.values) ...[
        ComponentsLibraryVariantDescriptor(
          height: 50,
          width: double.infinity,
          child: ImpaktfullUiAutoLayout(
            orientation: orientation,
            spacing: 2,
            mainAxisAlignment: mainAxisAlignment,
            children: [
              for (var i = 0; i < 4; i++) ...[
                Container(
                  height: 10,
                  width: 10,
                  color: ImpaktfullUiTheme.of(context).colors.accent,
                ),
              ]
            ],
          ),
        ),
      ],
      for (final crossAxisAlignment in [
        CrossAxisAlignment.start,
        CrossAxisAlignment.stretch,
        CrossAxisAlignment.end,
        CrossAxisAlignment.center,
      ]) ...[
        ComponentsLibraryVariantDescriptor(
          height: 50,
          width: double.infinity,
          child: ImpaktfullUiAutoLayout(
            orientation: orientation,
            spacing: 2,
            crossAxisAlignment: crossAxisAlignment,
            children: [
              for (var i = 0; i < 4; i++) ...[
                Container(
                  height: 10,
                  width: 10,
                  color: ImpaktfullUiTheme.of(context).colors.accent,
                ),
              ]
            ],
          ),
        ),
      ],
    ];
  }

  @override
  AutoLayoutLibraryPrimaryInputs inputs() => AutoLayoutLibraryPrimaryInputs();
}

class AutoLayoutLibraryPrimaryInputs extends AutoLayoutLibraryInputs {}

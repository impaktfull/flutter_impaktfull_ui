import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/components/wrap/wrap_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class WrapLibraryVariant
    extends ComponentLibraryVariant<WrapLibraryPrimaryInputs> {
  const WrapLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(BuildContext context, WrapLibraryPrimaryInputs inputs) {
    return [
      ImpaktfullUiWrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          for (var i = 0; i < 100; ++i) ...[
            ImpaktfullUiBadge(
              type: ImpaktfullUiBadgeType.primary,
              label: 'Item $i',
            ),
          ],
        ],
      ),
    ];
  }

  @override
  WrapLibraryPrimaryInputs inputs() => WrapLibraryPrimaryInputs();
}

class WrapLibraryPrimaryInputs extends WrapLibraryInputs {}

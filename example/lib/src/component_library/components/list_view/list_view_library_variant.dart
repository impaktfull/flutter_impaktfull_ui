import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/components/list_view/list_view_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/widget/components/components_library_variant_descriptor.dart';

class ListViewLibraryVariant
    extends ComponentLibraryVariant<ListViewLibraryPrimaryInputs> {
  const ListViewLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(
      BuildContext context, ListViewLibraryPrimaryInputs inputs) {
    return [
      ComponentsLibraryVariantDescriptor(
        height: 400,
        child: ImpaktfullUiListView(
          onRefresh: () => Future.delayed(const Duration(seconds: 4)),
          children: [
            Container(
              width: double.infinity,
              height: 600,
              color: ImpaktfullUiTheme.of(context).colors.accent,
            ),
          ],
        ),
      ),
    ];
  }

  @override
  ListViewLibraryPrimaryInputs inputs() => ListViewLibraryPrimaryInputs();
}

class ListViewLibraryPrimaryInputs extends ListViewLibraryInputs {}

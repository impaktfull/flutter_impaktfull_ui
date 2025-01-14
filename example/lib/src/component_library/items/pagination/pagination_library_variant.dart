import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/items/pagination/pagination_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class PaginationLibraryVariant
    extends ComponentLibraryVariant<PaginationLibraryPrimaryInputs> {
  const PaginationLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(
      BuildContext context, PaginationLibraryPrimaryInputs inputs) {
    return [
      ImpaktfullUiPagination(
        amountOfItems: inputs.amountOfItems.value ?? 0,
        itemsPerPage: inputs.itemsPerPage.value ?? 0,
        page: inputs.page.value ?? 0,
        onLoadPage: (page) {
          inputs.page.updateState(page);
          ImpaktfullUiNotification.show(title: 'Load page $page');
        },
      ),
    ];
  }

  @override
  PaginationLibraryPrimaryInputs inputs() => PaginationLibraryPrimaryInputs();
}

class PaginationLibraryPrimaryInputs extends PaginationLibraryInputs {}

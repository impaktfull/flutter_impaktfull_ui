import 'package:impaktfull_ui_example/src/component_library/components/pagination/pagination_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_int_input.dart';

class PaginationLibraryItem extends ComponentLibraryItem {
  const PaginationLibraryItem();

  @override
  String get title => 'ImpaktfullUiPagination';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const PaginationLibraryVariant(),
    ];
  }
}

class PaginationLibraryInputs extends ComponentLibraryInputs {
  final ComponentLibraryIntInput page = ComponentLibraryIntInput(
    'Page',
    initialValue: 1,
    min: 1,
  );
  final ComponentLibraryIntInput amountOfItems = ComponentLibraryIntInput(
    'amountOfItems',
    initialValue: 55,
    min: 1,
  );
  final ComponentLibraryIntInput itemsPerPage = ComponentLibraryIntInput(
    'itemsPerPage',
    initialValue: 10,
    min: 1,
  );
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [
        itemsPerPage,
        amountOfItems,
        page,
      ];
}

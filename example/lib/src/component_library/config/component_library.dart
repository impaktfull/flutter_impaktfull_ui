import 'package:impaktfull_ui_example/src/component_library/components/autolayout/autolayout_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/components/badge/badge_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/components/button/button_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/components/card/card_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/components/checkbox/checkbox_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/components/cms_header/cms_header_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/components/dropdown/dropdown_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/components/horizontal_tabs/horizontal_tabs_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/components/input_field/input_field_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/components/list_view/list_view_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/components/loading_indicator/loading_indicator_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/components/modal/modal_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/components/refreshindicator/refreshindicator_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/components/table/table_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class ComponentLibrary {
  final List<ComponentLibraryItem> components = [
    const AutoLayoutLibraryItem(),
    const BadgeLibraryItem(),
    const ButtonLibraryItem(),
    const CheckboxLibraryItem(),
    const CardLibraryItem(),
    const CmsHeaderLibraryItem(),
    const DropdownLibraryItem(),
    const HorizontalTabsLibraryItem(),
    const InputFieldLibraryItem(),
    const ListViewLibraryItem(),
    const LoadingIndicatorLibraryItem(),
    const RefreshIndicatorLibraryItem(),
    const ModalLibraryItem(),
    const TableLibraryItem(),
  ];
}

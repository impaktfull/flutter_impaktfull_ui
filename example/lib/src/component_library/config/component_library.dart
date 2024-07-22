import 'package:impaktfull_ui_example/src/component_library/components/badge/badge_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/components/buttons/buttons_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/components/card/card_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/components/cms_header/cms_header_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/components/horizontal_tabs/horizontal_tabs_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/components/input_field/input_field_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/components/loading_indicator/loading_indicator_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/components/table/table_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class ComponentLibrary {
  final List<ComponentLibraryItem> components = [
    BadgeLibraryItem(),
    ButtonsLibraryItem(),
    CardLibraryItem(),
    CmsHeaderLibraryItem(),
    HorizontalTabsLibraryItem(),
    InputFieldLibraryItem(),
    LoadingIndicatorLibraryItem(),
    TableLibraryItem(),
  ];
}

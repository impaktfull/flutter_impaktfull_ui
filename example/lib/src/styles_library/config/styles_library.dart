import 'package:impaktfull_ui_example/src/styles_library/config/styles_library_item.dart';
import 'package:impaktfull_ui_example/src/styles_library/items/colors/colors_styles_item.dart';

class StylesLibrary {
  static StylesLibrary? _instance;

  StylesLibrary._();

  static StylesLibrary get instance => _instance ??= StylesLibrary._();

  final List<StylesLibraryItem> items = [
    const ColorsStyle(),
  ];
}

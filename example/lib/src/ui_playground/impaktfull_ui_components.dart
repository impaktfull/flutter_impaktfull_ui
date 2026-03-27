import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/ui_playground/impaktfull_ui_components.ui_playground.dart';
import 'package:ui_playground/ui_playground.dart';

@UiPlaygroundComponents(
  extraComponents: [
    UiPlaygroundComponentConfig(
      ImpaktfullUiButton,
      excludeParams: [
        'leadingAsset',
        'trailingAsset',
        'leadingChild',
        'trailingChild',
        'theme',
      ],
    )
  ],
)
class AppComponents {
  static List<UiPlaygroundItem> get items =>
      GeneratedUiPlaygroundComponents.items;
}

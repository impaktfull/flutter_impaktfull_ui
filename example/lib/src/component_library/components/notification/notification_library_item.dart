import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/components/notification/notification_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_boolean_input.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_int_input.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_string_input.dart';

class NotificationLibraryItem extends ComponentLibraryItem {
  const NotificationLibraryItem();

  @override
  String get title => 'ImpaktfullUiNotification';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      for (final type in ImpaktfullUiNotificationType.values) ...[
        NotificationLibraryVariant(
          type: type,
        ),
      ]
    ];
  }
}

class NotificationLibraryInputs extends ComponentLibraryInputs {
  final ComponentLibraryStringInput title = ComponentLibraryStringInput(
    'Title',
    initialValue: 'Title',
  );
  final ComponentLibraryStringInput subtitle =
      ComponentLibraryStringInput('Subtitle');
  final ComponentLibraryBoolInput canBeClosed =
      ComponentLibraryBoolInput('Can be closed');
  final ComponentLibraryIntInput width = ComponentLibraryIntInput(
    'Width',
    extraInfo: 'Fallback to min 300px',
  );

  @override
  List<ComponentLibraryInputItem> buildInputItems() => [
        title,
        subtitle,
        canBeClosed,
        width,
      ];
}

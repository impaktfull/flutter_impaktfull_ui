import 'package:impaktfull_ui_example/src/component_library/components/notification_badge/notification_badge_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_boolean_input.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_string_input.dart';

class NotificationBadgeLibraryItem extends ComponentLibraryItem {
  const NotificationBadgeLibraryItem();

  @override
  String get title => 'ImpaktfullUiNotificationBadge';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const NotificationBadgeLibraryVariant(),
    ];
  }
}

class NotificationBadgeLibraryInputs extends ComponentLibraryInputs {
  final ComponentLibraryBoolInput show = ComponentLibraryBoolInput(
    'Show',
    initialValue: true,
  );
  final ComponentLibraryStringInput badgeText =
      ComponentLibraryStringInput('Badge text');

  @override
  List<ComponentLibraryInputItem> buildInputItems() => [
        show,
        badgeText,
      ];
}

import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/items/notification_badge/notification_badge_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class NotificationBadgeLibraryVariant
    extends ComponentLibraryVariant<NotificationBadgeLibraryPrimaryInputs> {
  const NotificationBadgeLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(
      BuildContext context, NotificationBadgeLibraryPrimaryInputs inputs) {
    return [
      ImpaktfullUiNotificationBadge(
        show: inputs.show.value ?? false,
        text: inputs.badgeText.value,
        color: theme.colors.accent,
        child: ImpaktfullUiAssetWidget(
          asset: theme.assets.icons.home,
          color: theme.colors.text,
        ),
      ),
    ];
  }

  @override
  NotificationBadgeLibraryPrimaryInputs inputs() =>
      NotificationBadgeLibraryPrimaryInputs();
}

class NotificationBadgeLibraryPrimaryInputs
    extends NotificationBadgeLibraryInputs {}

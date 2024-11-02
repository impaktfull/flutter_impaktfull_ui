import 'dart:math';

import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/components/notification/notification_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class NotificationLibraryVariant extends ComponentLibraryVariant<NotificationLibraryPrimaryInputs> {
  final ImpaktfullUiNotificationType type;
  const NotificationLibraryVariant({
    required this.type,
  });

  @override
  String get title => type.name;

  @override
  List<Widget> build(BuildContext context, NotificationLibraryPrimaryInputs inputs) {
    return [
      ImpaktfullUiNotification(
        title: inputs.title.value ?? '',
        subtitle: inputs.subtitle.value,
        onCloseTapped: inputs.canBeClosed.value ?? false ? () {} : null,
        width: max(inputs.width.value?.toDouble() ?? double.infinity, 300),
        type: type,
      ),
      for (final alignment in ImpaktfullUiNotificationAlignment.values) ...[
        ImpaktfullUiNotification(
          title: inputs.title.value ?? '',
          subtitle: inputs.subtitle.value,
          onCloseTapped: inputs.canBeClosed.value ?? false ? () {} : null,
          width: max(inputs.width.value?.toDouble() ?? double.infinity, 300),
          leadingWidgetBuilder: (context, config) => Container(
            width: 24,
            height: 24,
            margin: const EdgeInsets.all(16),
            color: config.color,
          ),
          trailingWidgetBuilder: (context, config) => Container(
            width: 24,
            height: 24,
            margin: const EdgeInsets.all(16),
            color: config.color,
          ),
          centerWidgetBuilder: (context, config) => Container(
            width: double.infinity,
            height: 24,
            color: config.color,
          ),
          bottomWidgetBuilder: (context, config) => Container(
            width: double.infinity,
            height: 10,
            color: config.color,
          ),
          alignment: alignment,
          type: type,
        ),
      ],
    ];
  }

  @override
  NotificationLibraryPrimaryInputs inputs() => NotificationLibraryPrimaryInputs();
}

class NotificationLibraryPrimaryInputs extends NotificationLibraryInputs {}

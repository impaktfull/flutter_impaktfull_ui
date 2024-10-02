import 'dart:math';

import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/components/notification/notification_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class NotificationLibraryVariant
    extends ComponentLibraryVariant<NotificationLibraryPrimaryInputs> {
  final ImpaktfullUiNotificationType type;
  const NotificationLibraryVariant({
    required this.type,
  });

  @override
  String get title => type.name;

  @override
  List<Widget> build(
      BuildContext context, NotificationLibraryPrimaryInputs inputs) {
    return [
      ImpaktfullUiNotification(
        title: inputs.title.value ?? '',
        subtitle: inputs.subtitle.value,
        onCloseTapped: inputs.canBeClosed.value ?? false ? () {} : null,
        width: max(inputs.width.value?.toDouble() ?? double.infinity, 300),
        type: type,
      ),
    ];
  }

  @override
  NotificationLibraryPrimaryInputs inputs() =>
      NotificationLibraryPrimaryInputs();
}

class NotificationLibraryPrimaryInputs extends NotificationLibraryInputs {}

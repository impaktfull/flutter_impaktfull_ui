import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';

const _width = 360.0;

void main() {
  setUp(() => setupComponentTest());

  runComponentTest(
    fileName: 'impaktfull_ui_notification_types',
    columns: 2,
    goldenTests: () => [
      for (final type in ImpaktfullUiNotificationType.values) ...[
        GoldenTest(
          description: type.name,
          child: ImpaktfullUiNotification(
            width: _width,
            type: type,
            title: 'Title of ${type.name}',
            subtitle: 'The subtitle of the notification',
          ),
        ),
        GoldenTest(
          description: '${type.name} with close',
          child: ImpaktfullUiNotification(
            width: _width,
            type: type,
            title: 'Title of ${type.name}',
            onCloseTapped: () {},
          ),
        ),
      ],
    ],
  );

  runComponentTest(
    fileName: 'impaktfull_ui_notification_variants',
    columns: 2,
    goldenTests: () => [
      for (final alignment in ImpaktfullUiNotificationAlignment.values)
        GoldenTest(
          description: 'Alignment ${alignment.name}',
          child: ImpaktfullUiNotification(
            width: _width,
            alignment: alignment,
            title: 'Alignment ${alignment.name}',
            subtitle: 'A subtitle that is long enough to wrap over '
                'multiple lines in the notification',
            onCloseTapped: () {},
          ),
        ),
      GoldenTest(
        description: 'With onTap',
        child: ImpaktfullUiNotification(
          width: _width,
          title: 'Tap me',
          subtitle: 'Shows a chevron',
          onTap: () {},
        ),
      ),
      GoldenTest(
        description: 'Custom builders',
        child: ImpaktfullUiNotification(
          width: _width,
          type: ImpaktfullUiNotificationType.info,
          title: 'Custom builders',
          leadingWidgetBuilder: (context, config) => Container(
            width: 8,
            height: 56,
            color: config.color,
          ),
          trailingWidgetBuilder: (context, config) => Padding(
            padding: const EdgeInsets.all(8),
            child: Text('Undo', style: TextStyle(color: config.color)),
          ),
          centerWidgetBuilder: (context, config) => const Text('Center'),
          bottomWidgetBuilder: (context, config) => Container(
            height: 4,
            color: config.color,
          ),
        ),
      ),
    ],
  );
}

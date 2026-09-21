import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';

void main() {
  setUp(() => setupComponentTest());

  Widget box() => Container(
        width: 32,
        height: 32,
        color: Colors.grey.shade300,
      );

  Widget badge({
    String? text,
    bool show = true,
    Color? color,
    ImpaktfullUiNotificationBadgeLocation location =
        ImpaktfullUiNotificationBadgeLocation.topRight,
  }) =>
      Padding(
        padding: const EdgeInsets.all(24),
        child: ImpaktfullUiNotificationBadge(
          show: show,
          text: text,
          color: color,
          location: location,
          child: box(),
        ),
      );

  runComponentTest(
    fileName: 'impaktfull_ui_notification_badge',
    columns: 4,
    goldenTests: () => [
      for (final location in ImpaktfullUiNotificationBadgeLocation.values)
        GoldenTest(
          description: 'dot ${location.name}',
          child: badge(location: location),
        ),
      for (final location in ImpaktfullUiNotificationBadgeLocation.values)
        GoldenTest(
          description: 'text ${location.name}',
          child: badge(text: '3', location: location),
        ),
      GoldenTest(
        description: 'long text',
        child: badge(text: '999+'),
      ),
      GoldenTest(
        description: 'custom color',
        child: badge(text: '5', color: Colors.green),
      ),
      GoldenTest(
        description: 'hidden',
        child: badge(text: '3', show: false),
      ),
      GoldenTest(
        description: 'hidden dot',
        child: badge(show: false),
      ),
    ],
  );
}

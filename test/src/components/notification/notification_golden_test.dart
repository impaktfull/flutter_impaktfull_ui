import 'package:material_ui/material_ui.dart';
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

  // A static alert in a page: no close button, no onTap, no shadow, and the
  // background, the border and the text in the colours of the type. The tints
  // come from the type colours of each shipped theme, so they also work in
  // the dark themes.
  runComponentTest(
    fileName: 'impaktfull_ui_notification_tinted',
    goldenTests: () => [
      for (final type in ImpaktfullUiNotificationType.values)
        GoldenTest(
          description: 'Tinted ${type.name}',
          child: Builder(
            builder: (context) => ImpaktfullUiNotification(
              width: _width,
              type: type,
              title: 'Title of ${type.name}',
              subtitle: 'The subtitle of the notification',
              theme: _tinted(ImpaktfullUiNotificationTheme.of(context)),
            ),
          ),
        ),
    ],
  );
}

/// [theme] with a background tinted with the colour of each type, a border
/// and a text in that colour, and no shadow.
ImpaktfullUiNotificationTheme _tinted(ImpaktfullUiNotificationTheme theme) {
  final colors = theme.colors;
  Color tint(Color color) =>
      Color.alphaBlend(color.withValues(alpha: 0.12), colors.background);
  return theme.copyWith(
    colors: colors.copyWith(
      brandedBackground: tint(colors.branded),
      brandedText: colors.branded,
      errorBackground: tint(colors.error),
      errorText: colors.error,
      infoBackground: tint(colors.info),
      infoText: colors.info,
      matchBorderWithType: true,
      successBackground: tint(colors.success),
      successText: colors.success,
      warningBackground: tint(colors.warning),
      warningText: colors.warning,
    ),
    shadows: theme.shadows.copyWith(card: const []),
  );
}

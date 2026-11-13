import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/items/notification/notification_library_item.dart';

/// Notifications used as static alerts in a page: no close button, no shadow,
/// and the background, the border and the text in the colours of their type.
class NotificationTintedLibraryVariant
    extends ComponentLibraryVariant<NotificationTintedLibraryInputs> {
  const NotificationTintedLibraryVariant();

  @override
  String get title => 'Tinted inline alerts';

  @override
  List<Widget> build(
      BuildContext context, NotificationTintedLibraryInputs inputs) {
    final theme = _tinted(ImpaktfullUiNotificationTheme.of(context));
    return [
      for (final type in ImpaktfullUiNotificationType.values) ...[
        ImpaktfullUiNotification(
          title: inputs.title.value ?? '',
          subtitle: inputs.subtitle.value,
          onCloseTapped: inputs.canBeClosed.value ?? false ? () {} : null,
          type: type,
          theme: theme,
        ),
      ],
    ];
  }

  /// The theme of the app with a background tinted with the colour of each
  /// type, a border and a text in that colour, and no shadow.
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

  @override
  NotificationTintedLibraryInputs inputs() => NotificationTintedLibraryInputs();
}

class NotificationTintedLibraryInputs extends NotificationLibraryInputs {}

import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/avatar/avatar.dart';
import 'package:impaktfull_ui/src/components/chat/chat.dart';
import 'package:impaktfull_ui/src/components/notification_badge/notification_badge.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

class ImpaktfullUiChatListItemAvatar extends StatelessWidget {
  final ImpaktfullUiChatSender? sender;
  final ImpaktfullUiChatSender? previousSender;
  final bool isMyOwnMessage;
  final ImpaktfullUiChatTheme? theme;

  const ImpaktfullUiChatListItemAvatar({
    required this.sender,
    required this.previousSender,
    required this.isMyOwnMessage,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final sender = this.sender;
    if (!isMyOwnMessage && sender != null) {
      if (sender.id == previousSender?.id) {
        return const SizedBox(width: 24);
      }
      final showBadge = sender.isOnline ?? true;
      return ImpaktfullUiOverridableComponentBuilder(
        component: this,
        overrideComponentTheme: theme,
        builder: (context, componentTheme) => ImpaktfullUiNotificationBadge(
          show: showBadge,
          color: componentTheme.colors.onlineBadge,
          size: 10,
          location: ImpaktfullUiNotificationBadgeLocation.bottomRight,
          child: ImpaktfullUiAvatar(
            url: sender.avatarUrl,
            width: 24,
            height: 24,
            fit: BoxFit.cover,
          ),
        ),
      );
    }
    return const SizedBox.shrink();
  }
}

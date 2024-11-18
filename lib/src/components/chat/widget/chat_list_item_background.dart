import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/chat/chat.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';

class ImpaktfullUiChatListItemBackground extends StatelessWidget {
  final ImpaktfullUiChatSenderConfig senderConfig;
  final ImpaktfullUiChatItem? previousItem;
  final ImpaktfullUiChatItem item;
  final ImpaktfullUiChatItem? nextItem;
  final Widget child;
  final ImpaktfullUiChatTheme? theme;
  const ImpaktfullUiChatListItemBackground({
    required this.senderConfig,
    required this.previousItem,
    required this.item,
    required this.nextItem,
    required this.child,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final senderId = item.senderId;
    final isMyOwnMessage = senderId == senderConfig.me.id;
    final isNotMyOwnMessage = !isMyOwnMessage;
    final isDifferentSenderThanPrevious = previousItem?.senderId != senderId;
    final isDifferentSenderThanNext = nextItem?.senderId != senderId;
    return ImpaktfullUiComponentThemeBuilder(
      overrideComponentTheme: theme,
      builder: (context, componentTheme) {
        return Container(
          constraints: const BoxConstraints(
            maxWidth: 300,
          ),
          decoration: BoxDecoration(
            color: isMyOwnMessage
                ? componentTheme.colors.ownMessageBackground
                : componentTheme.colors.otherMessageBackground,
            border: Border.all(
              color: isMyOwnMessage ? componentTheme.colors.ownMessageBorder : componentTheme.colors.otherMessageBorder,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(isMyOwnMessage || isDifferentSenderThanPrevious ? 8 : 4),
              topRight: Radius.circular(isNotMyOwnMessage || isDifferentSenderThanPrevious ? 8 : 4),
              bottomLeft: Radius.circular(isMyOwnMessage || isDifferentSenderThanNext ? 8 : 4),
              bottomRight: Radius.circular(isNotMyOwnMessage || isDifferentSenderThanNext ? 8 : 4),
            ),
          ),
          padding: const EdgeInsets.all(8),
          child: child,
        );
      },
    );
  }
}

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
    final isMyOwnMessage = item.senderId == senderConfig.me.id;
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
              color: isMyOwnMessage
                  ? componentTheme.colors.ownMessageBorder
                  : componentTheme.colors.otherMessageBorder,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                  item.isMyOwnMessage || previousItem?.senderId != item.senderId
                      ? 8
                      : 4),
              topRight: Radius.circular(item.isNotMyOwnMessage ||
                      previousItem?.senderId != item.senderId
                  ? 8
                  : 4),
              bottomLeft: Radius.circular(
                  item.isMyOwnMessage || nextItem?.senderId != item.senderId
                      ? 8
                      : 4),
              bottomRight: Radius.circular(
                  item.isNotMyOwnMessage || nextItem?.senderId != item.senderId
                      ? 8
                      : 4),
            ),
          ),
          padding: const EdgeInsets.all(8),
          child: child,
        );
      },
    );
  }
}

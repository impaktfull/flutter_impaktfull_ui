import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/chat/chat.dart';
import 'package:impaktfull_ui/src/components/chat/widget/chat_list_item_avatar.dart';
import 'package:impaktfull_ui/src/components/chat/widget/chat_list_item_background.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

class ImpaktfullUiChatListItem extends StatelessWidget {
  final ImpaktfullUiChatItem item;
  final ImpaktfullUiChatItem? nextItem;
  final ImpaktfullUiChatItem? previousItem;
  final ImpaktfullUiChatSenderConfig senderConfig;
  final bool showAvatars;
  final ImpaktfullUiChatTheme theme;

  const ImpaktfullUiChatListItem({
    required this.item,
    required this.theme,
    required this.senderConfig,
    this.nextItem,
    this.previousItem,
    this.showAvatars = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final sender = senderConfig.getById(item.senderId);
    final previousSender = senderConfig.getById(previousItem?.senderId);
    final isMyOwnMessage = sender?.id == senderConfig.me.id;
    return ImpaktfullUiOverridableComponentBuilder(
      component: this,
      overrideComponentTheme: theme,
      builder: (context, componentTheme) => Align(
        alignment:
            isMyOwnMessage ? Alignment.centerRight : Alignment.centerLeft,
        child: ImpaktfullUiAutoLayout.horizontal(
          mainAxisSize: MainAxisSize.min,
          spacing: 4,
          children: [
            if (showAvatars) ...[
              ImpaktfullUiChatListItemAvatar(
                sender: sender,
                isMyOwnMessage: isMyOwnMessage,
                previousSender: previousSender,
              ),
            ],
            ImpaktfullUiChatListItemBackground(
              previousItem: previousItem,
              item: item,
              nextItem: nextItem,
              senderConfig: senderConfig,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (item.message != null) ...[
                    Text(
                      item.message!,
                      style: isMyOwnMessage
                          ? componentTheme.textStyles.ownMessage
                          : componentTheme.textStyles.otherMessage,
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/chat/chat.dart';
import 'package:impaktfull_ui/src/components/chat/widget/chat_list_item.dart';
import 'package:impaktfull_ui/src/components/chat/widget/chat_list_item_date_label.dart';
import 'package:impaktfull_ui/src/components/chat/widget/chat_list_typing_container.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

class ImpaktfullUiChatListInternalItem extends StatelessWidget {
  final int index;
  final List<ImpaktfullUiChatItem> items;
  final Widget Function(
    BuildContext context,
    ImpaktfullUiChatItem item,
    ImpaktfullUiChatItem? nextItem,
    ImpaktfullUiChatItem? previousItem,
  )? itemBuilder;
  final ImpaktfullUiChatSenderConfig senderConfig;
  final List<String> senderIdsTyping;
  final ImpaktfullUiChatTheme theme;

  const ImpaktfullUiChatListInternalItem({
    required this.index,
    required this.items,
    required this.senderConfig,
    required this.theme,
    required this.itemBuilder,
    required this.senderIdsTyping,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final item = items[index];
    final previousItem = index < items.length - 1 ? items[index + 1] : null;
    final nextItem = index > 0 ? items[index - 1] : null;
    final isLastItem = index == 0;
    final showAvatars = senderConfig.isGroupChat;
    final sendersTyping = senderIdsTyping
        .map((id) => senderConfig.getById(id))
        .whereType<ImpaktfullUiChatSender>()
        .where((e) => e.id != senderConfig.me.id)
        .toList();
    return ImpaktfullUiOverridableComponentBuilder(
      component: this,
      overrideComponentTheme: theme,
      builder: (context, componentTheme) => ImpaktfullUiAutoLayout.vertical(
        mainAxisSize: MainAxisSize.min,
        spacing: 4,
        children: [
          ImpaktfullUiChatListItemDateLabel(
            item: item,
            previousItem: previousItem,
            theme: componentTheme,
          ),
          Builder(
            builder: (context) {
              if (itemBuilder != null) {
                return itemBuilder!(
                  context,
                  item,
                  nextItem,
                  previousItem,
                );
              }
              return ImpaktfullUiChatListItem(
                item: item,
                nextItem: nextItem,
                previousItem: previousItem,
                theme: componentTheme,
                senderConfig: senderConfig,
                showAvatars: showAvatars,
              );
            },
          ),
          if (isLastItem && senderIdsTyping.isNotEmpty) ...[
            ImpaktfullUiChatListTypingContainer(
              sendersTyping: sendersTyping,
              showAvatars: showAvatars,
              theme: componentTheme,
            ),
          ],
        ],
      ),
    );
  }
}

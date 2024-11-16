import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/chat/chat_style.dart';
import 'package:impaktfull_ui_2/src/components/chat/model/chat_item.dart';
import 'package:impaktfull_ui_2/src/components/chat/model/sender/chat_sender_config.dart';
import 'package:impaktfull_ui_2/src/components/chat/widget/chat_list_item.dart';
import 'package:impaktfull_ui_2/src/components/list_view/list_view.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';

export 'chat_style.dart';
export 'model/chat_item.dart';
export 'model/sender/chat_sender_config.dart';
export 'model/sender/chat_sender.dart';

part 'chat.describe.dart';

class ImpaktfullUiChat extends StatelessWidget with ComponentDescriptorMixin {
  final List<ImpaktfullUiChatItem> items;
  final EdgeInsetsGeometry padding;
  final Stream<bool>? isTyping;
  final Widget Function(
    BuildContext context,
    ImpaktfullUiChatItem item,
    ImpaktfullUiChatItem? nextItem,
    ImpaktfullUiChatItem? previousItem,
  )? itemBuilder;
  final ImpaktfullUiChatSenderConfig senderConfig;
  final ImpaktfullUiChatTheme? theme;

  const ImpaktfullUiChat({
    required this.items,
    required this.senderConfig,
    this.isTyping,
    this.padding = const EdgeInsets.all(16),
    this.itemBuilder,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuilder<ImpaktfullUiChatTheme>(
      overrideComponentTheme: theme,
      builder: (context, componentTheme) => ImpaktfullUiListView.builder(
        padding: padding,
        items: items,
        noDataLabel: '',
        spacing: 2,
        reversed: true,
        itemBuilder: (context, item, index) {
          final item = items[index];
          final previousItem =
              index < items.length - 1 ? items[index + 1] : null;
          final nextItem = index > 0 ? items[index - 1] : null;
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
          );
        },
      ),
    );
  }

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}

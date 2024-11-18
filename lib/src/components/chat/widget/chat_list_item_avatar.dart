import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/avatar/avatar.dart';
import 'package:impaktfull_ui_2/src/components/chat/chat.dart';

class ImpaktfullUiChatListItemAvatar extends StatelessWidget {
  final ImpaktfullUiChatSender? sender;
  final ImpaktfullUiChatSender? previousSender;
  final bool isMyOwnMessage;

  const ImpaktfullUiChatListItemAvatar({
    required this.sender,
    required this.previousSender,
    required this.isMyOwnMessage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final sender = this.sender;
    if (!isMyOwnMessage && sender != null) {
      if (sender.id == previousSender?.id) {
        return const SizedBox(width: 24);
      }
      return ImpaktfullUiAvatar(
        url: sender.avatarUrl,
        width: 24,
        height: 24,
        fit: BoxFit.cover,
      );
    }
    return const SizedBox.shrink();
  }
}

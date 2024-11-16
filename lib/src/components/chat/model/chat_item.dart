import 'package:impaktfull_ui_2/src/components/chat/model/chat_status.dart';

class ImpaktfullUiChatItem {
  final String? message;
  final String senderId;
  final DateTime timestamp;
  final bool isMyOwnMessage;
  final ImpaktfullUiChatStatus? status;

  bool get isNotMyOwnMessage => !isMyOwnMessage;

  bool isSameSender(ImpaktfullUiChatItem? other) {
    if (other == null) return false;
    return senderId == other.senderId;
  }

  const ImpaktfullUiChatItem({
    required this.senderId,
    required this.timestamp,
    required this.isMyOwnMessage,
    this.message,
    this.status,
  });
}

import 'package:impaktfull_ui/src/components/chat/model/chat_status.dart';

class ImpaktfullUiChatItem {
  final String? message;
  final String senderId;
  final DateTime timestamp;
  final ImpaktfullUiChatStatus? status;

  bool isSameSender(ImpaktfullUiChatItem? other) {
    if (other == null) return false;
    return senderId == other.senderId;
  }

  const ImpaktfullUiChatItem({
    required this.senderId,
    required this.timestamp,
    this.message,
    this.status,
  });
}

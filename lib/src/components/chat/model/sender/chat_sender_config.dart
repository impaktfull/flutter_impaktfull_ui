import 'package:impaktfull_ui_2/src/components/chat/model/sender/chat_sender.dart';
import 'package:impaktfull_ui_2/src/util/extension/list_extension.dart';

class ImpaktfullUiChatSenderConfig {
  final ImpaktfullUiChatSender me;
  final ImpaktfullUiChatSender? _other;
  final List<ImpaktfullUiChatSender> _others;

  bool get isOneToOne => _others.isEmpty;

  bool get isGroupChat => _others.length >= 2;

  const ImpaktfullUiChatSenderConfig({
    required this.me,
    required List<ImpaktfullUiChatSender> others,
  })  : _other = null,
        _others = others;

  const ImpaktfullUiChatSenderConfig.oneToOne({
    required this.me,
    required ImpaktfullUiChatSender other,
  })  : _other = other,
        _others = const [];

  ImpaktfullUiChatSender? getById(String? senderId) {
    if (senderId == null) return null;
    if (senderId == me.id) return me;
    if (_other != null && senderId == _other.id) return _other;
    return _others.firstWhereOrNull((sender) => sender.id == senderId);
  }
}

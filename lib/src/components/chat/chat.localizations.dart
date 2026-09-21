import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/util/localizations/localizations.dart';

class ImpaktfullUiChatLocalizations extends ImpaktfullUiComponentLocalizations {
  /// The semantics label of the typing indicator of a sender.
  final String Function(String? senderName) typingLabel;

  const ImpaktfullUiChatLocalizations({
    this.typingLabel = _defaultTypingLabel,
  });

  static ImpaktfullUiChatLocalizations of(BuildContext context) =>
      ImpaktfullUiLocalizations.of<ImpaktfullUiChatLocalizations>(context);

  ImpaktfullUiChatLocalizations copyWith({
    String Function(String? senderName)? typingLabel,
  }) =>
      ImpaktfullUiChatLocalizations(
        typingLabel: typingLabel ?? this.typingLabel,
      );
}

String _defaultTypingLabel(String? senderName) =>
    senderName == null ? 'Typing' : '$senderName is typing';

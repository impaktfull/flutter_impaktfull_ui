import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';
import '../_data_display_golden_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  const me = ImpaktfullUiChatSender(id: 'me', name: 'Me');
  const jane = ImpaktfullUiChatSender(id: 'jane', name: 'Jane', isOnline: true);
  const john =
      ImpaktfullUiChatSender(id: 'john', name: 'John', isOnline: false);

  ImpaktfullUiChatItem message(
    ImpaktfullUiChatSender sender,
    String text,
    Duration offset,
  ) =>
      ImpaktfullUiChatItem(
        senderId: sender.id,
        message: text,
        timestamp: fixedDate.add(offset),
      );

  // Newest first, over 2 days, so there are 2 date separators.
  final oneToOneItems = [
    message(me, 'See you tomorrow!', const Duration(days: 1, hours: 2)),
    message(jane, 'Sounds good', const Duration(days: 1, hours: 1)),
    message(jane, 'Are we still on for lunch?', const Duration(days: 1)),
    message(me, 'Sure, I will send it later', const Duration(minutes: 5)),
    message(jane, 'Hi! Can you send me the report?', Duration.zero),
  ];

  final groupItems = [
    message(john, 'Me too', const Duration(days: 1, minutes: 2)),
    message(jane, longText, const Duration(days: 1, minutes: 1)),
    message(me, 'Good morning everyone', const Duration(days: 1)),
    message(john, 'Bye!', const Duration(minutes: 3)),
    message(jane, 'Hello', const Duration(minutes: 2)),
    message(jane, 'Hi all', const Duration(minutes: 1)),
  ];

  runComponentTest(
    fileName: 'impaktfull_ui_chat',
    columns: 2,
    goldenTests: () => [
      GoldenTest(
        description: 'one to one with date separators',
        child: goldenBox(
          width: 400,
          height: 480,
          child: ImpaktfullUiChat(
            items: oneToOneItems,
            senderConfig: const ImpaktfullUiChatSenderConfig.oneToOne(
              me: me,
              other: jane,
            ),
          ),
        ),
      ),
      GoldenTest(
        description: 'group chat with avatars and a long message',
        child: goldenBox(
          width: 400,
          height: 480,
          child: ImpaktfullUiChat(
            items: groupItems,
            senderConfig: const ImpaktfullUiChatSenderConfig(
              me: me,
              others: [jane, john],
            ),
          ),
        ),
      ),
      GoldenTest(
        description: 'custom item builder',
        child: goldenBox(
          width: 400,
          height: 200,
          child: ImpaktfullUiChat(
            items: oneToOneItems.take(2).toList(),
            senderConfig: const ImpaktfullUiChatSenderConfig.oneToOne(
              me: me,
              other: jane,
            ),
            itemBuilder: (context, item, nextItem, previousItem) =>
                Text('${item.senderId}: ${item.message}'),
          ),
        ),
      ),
      GoldenTest(
        description: 'empty',
        child: goldenBox(
          width: 400,
          height: 200,
          child: const ImpaktfullUiChat(
            items: [],
            senderConfig: ImpaktfullUiChatSenderConfig.oneToOne(
              me: me,
              other: jane,
            ),
          ),
        ),
      ),
    ],
  );

  // The typing dots start with a delay: pump for 500ms so every delay has
  // passed, and freeze the dots so the golden is stable.
  runComponentTestWithPump(
    fileName: 'impaktfull_ui_chat_typing',
    columns: 2,
    pumpBeforeTest: pumpNTimes(5, const Duration(milliseconds: 100)),
    goldenTests: () => [
      GoldenTest(
        description: 'one to one, typing',
        child: frozen(
          goldenBox(
            width: 400,
            height: 240,
            child: ImpaktfullUiChat(
              items: oneToOneItems.take(2).toList(),
              senderIdsTypingStream: Stream.value(const ['jane', 'me']),
              senderConfig: const ImpaktfullUiChatSenderConfig.oneToOne(
                me: me,
                other: jane,
              ),
            ),
          ),
        ),
      ),
      GoldenTest(
        description: 'group, 2 senders typing',
        child: frozen(
          goldenBox(
            width: 400,
            height: 240,
            child: ImpaktfullUiChat(
              items: groupItems.take(2).toList(),
              senderIdsTypingStream: Stream.value(const ['jane', 'john']),
              senderConfig: const ImpaktfullUiChatSenderConfig(
                me: me,
                others: [jane, john],
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

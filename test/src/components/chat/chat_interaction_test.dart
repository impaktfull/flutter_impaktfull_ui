import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui/src/components/chat/widget/chat_list_typing_container.dart';

import '../_data_display_test_helpers.dart';

void main() {
  const me = ImpaktfullUiChatSender(id: 'me');
  const jane = ImpaktfullUiChatSender(id: 'jane', isOnline: true);
  const john = ImpaktfullUiChatSender(id: 'john', isOnline: false);
  const oneToOne = ImpaktfullUiChatSenderConfig.oneToOne(me: me, other: jane);
  const groupConfig =
      ImpaktfullUiChatSenderConfig(me: me, others: [jane, john]);

  ImpaktfullUiChatItem message(
    ImpaktfullUiChatSender sender,
    String text, [
    Duration offset = Duration.zero,
  ]) =>
      ImpaktfullUiChatItem(
        senderId: sender.id,
        message: text,
        timestamp: fixedDate.add(offset),
      );

  Future<void> pumpChat(WidgetTester tester, Widget chat) =>
      pumpSized(tester, chat, size: const Size(400, 600));

  group('sender config', () {
    test('one to one finds me and the other sender', () {
      expect(oneToOne.isOneToOne, isTrue);
      expect(oneToOne.isGroupChat, isFalse);
      expect(oneToOne.getById('me'), same(me));
      expect(oneToOne.getById('jane'), same(jane));
      expect(oneToOne.getById('unknown'), isNull);
      expect(oneToOne.getById(null), isNull);
    });

    test('group finds every sender', () {
      expect(groupConfig.isOneToOne, isFalse);
      expect(groupConfig.isGroupChat, isTrue);
      expect(groupConfig.getById('john'), same(john));
    });

    test('chat items compare their sender', () {
      final first = message(jane, 'a');
      expect(first.isSameSender(message(jane, 'b')), isTrue);
      expect(first.isSameSender(message(me, 'b')), isFalse);
      expect(first.isSameSender(null), isFalse);
    });
  });

  testWidgets('own messages are on the end, others on the start',
      (tester) async {
    await pumpChat(
      tester,
      ImpaktfullUiChat(
        items: [
          message(me, 'Mine', const Duration(minutes: 1)),
          message(jane, 'Theirs')
        ],
        senderConfig: oneToOne,
      ),
    );
    expect(tester.getCenter(find.text('Mine')).dx, greaterThan(200));
    expect(tester.getCenter(find.text('Theirs')).dx, lessThan(200));
    // The newest message (first item) is at the bottom.
    expect(
      tester.getCenter(find.text('Mine')).dy,
      greaterThan(tester.getCenter(find.text('Theirs')).dy),
    );
  });

  testWidgets('in right-to-left own messages are on the start (left)',
      (tester) async {
    await pumpChat(
      tester,
      Directionality(
        textDirection: TextDirection.rtl,
        child: ImpaktfullUiChat(
          items: [message(me, 'Mine'), message(jane, 'Theirs')],
          senderConfig: oneToOne,
        ),
      ),
    );
    expect(tester.getCenter(find.text('Mine')).dx, lessThan(200));
    expect(tester.getCenter(find.text('Theirs')).dx, greaterThan(200));
  });

  testWidgets('avatars are only shown in a group chat', (tester) async {
    await pumpChat(
      tester,
      ImpaktfullUiChat(items: [message(jane, 'Hi')], senderConfig: oneToOne),
    );
    expect(find.byType(ImpaktfullUiAvatar), findsNothing);

    await pumpChat(
      tester,
      ImpaktfullUiChat(items: [message(jane, 'Hi')], senderConfig: groupConfig),
    );
    expect(find.byType(ImpaktfullUiAvatar), findsOneWidget);
  });

  testWidgets('consecutive messages of a sender show one avatar',
      (tester) async {
    await pumpChat(
      tester,
      ImpaktfullUiChat(
        // Newest first.
        items: [
          message(john, 'John', const Duration(minutes: 3)),
          message(jane, 'Jane 2', const Duration(minutes: 2)),
          message(jane, 'Jane 1', const Duration(minutes: 1)),
          message(me, 'Me'),
        ],
        senderConfig: groupConfig,
      ),
    );
    expect(find.byType(ImpaktfullUiAvatar), findsNWidgets(2));
  });

  testWidgets('the online badge follows isOnline', (tester) async {
    await pumpChat(
      tester,
      ImpaktfullUiChat(
        items: [
          message(john, 'John', const Duration(minutes: 1)),
          message(jane, 'Jane'),
        ],
        senderConfig: groupConfig,
      ),
    );
    final badges = tester
        .widgetList<ImpaktfullUiNotificationBadge>(
          find.byType(ImpaktfullUiNotificationBadge),
        )
        .map((badge) => badge.show)
        .toList();
    // The list is reversed: jane (oldest) is built first.
    expect(badges, unorderedEquals([true, false]));
  });

  testWidgets('date separators are shown for every new day (fixed dates)',
      (tester) async {
    await pumpChat(
      tester,
      ImpaktfullUiChat(
        items: [
          message(me, 'Day 3', const Duration(days: 2)),
          message(jane, 'Day 2', const Duration(days: 1)),
          message(me, 'Day 1 later', const Duration(hours: 1)),
          message(jane, 'Day 1'),
        ],
        senderConfig: oneToOne,
      ),
    );
    expect(find.text('14/03/2024'), findsOneWidget);
    expect(find.text('15/03/2024'), findsOneWidget);
    expect(find.text('16/03/2024'), findsOneWidget);
  });

  testWidgets('the item builder gets the next and previous item',
      (tester) async {
    final calls = <String>[];
    await pumpChat(
      tester,
      ImpaktfullUiChat(
        items: [
          message(me, 'c', const Duration(minutes: 2)),
          message(jane, 'b', const Duration(minutes: 1)),
          message(me, 'a'),
        ],
        senderConfig: oneToOne,
        itemBuilder: (context, item, nextItem, previousItem) {
          calls.add('${previousItem?.message}<${item.message}>'
              '${nextItem?.message}');
          return Text(item.message!);
        },
      ),
    );
    expect(calls, unorderedEquals(['b<c>null', 'a<b>c', 'null<a>b']));
  });

  testWidgets('items: updates when the parent adds to the same list',
      (tester) async {
    final items = [message(jane, 'First')];
    late StateSetter setState;
    await pumpChat(
      tester,
      StatefulBuilder(
        builder: (context, setter) {
          setState = setter;
          return ImpaktfullUiChat(items: items, senderConfig: oneToOne);
        },
      ),
    );
    setState(() => items.insert(
          0,
          message(me, 'Second', const Duration(minutes: 1)),
        ));
    await tester.pumpAndSettle();
    expect(find.text('First'), findsOneWidget);
    expect(find.text('Second'), findsOneWidget);
  });

  testWidgets('typing: the typing indicator follows the stream',
      (tester) async {
    final typing = StreamController<List<String>>();
    addTearDown(typing.close);
    await pumpChat(
      tester,
      ImpaktfullUiChat(
        items: [message(jane, 'Hi')],
        senderIdsTypingStream: typing.stream,
        senderConfig: oneToOne,
      ),
    );
    Finder dots() => find.byType(ImpaktfullUiChatListTypingContainer);
    expect(dots(), findsNothing);

    typing.add(['jane']);
    // One pump to deliver the stream event, one to rebuild.
    await tester.pump();
    await tester.pump();
    expect(dots(), findsOneWidget);

    // Me typing is not shown.
    typing.add(['me']);
    await tester.pump(const Duration(seconds: 1));
    expect(dots(), findsNothing);

    typing.add([]);
    await tester.pump(const Duration(seconds: 1));
    expect(dots(), findsNothing);
    await tester.pumpWidget(const SizedBox());
  });

  testWidgets('typing: disposing while the dots start does not leak a timer',
      (tester) async {
    await pumpChat(
      tester,
      ImpaktfullUiChat(
        items: [message(jane, 'Hi')],
        senderIdsTypingStream: Stream.value(const ['jane']),
        senderConfig: oneToOne,
      ),
    );
    await tester.pump();
    // The 2nd and 3rd dot start after 200ms and 400ms.
    await tester.pumpWidget(const SizedBox());
  });

  testWidgets('a narrow chat does not overflow', (tester) async {
    await pumpSized(
      tester,
      ImpaktfullUiChat(
        items: [message(jane, longText), message(me, longText)],
        senderConfig: groupConfig,
      ),
      size: const Size(280, 400),
    );
    expect(tester.takeException(), isNull);
  });
}

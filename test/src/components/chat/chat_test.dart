import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';

void main() {
  const me = ImpaktfullUiChatSender(id: 'me');
  const other = ImpaktfullUiChatSender(id: 'other');
  const senderConfig = ImpaktfullUiChatSenderConfig.oneToOne(
    me: me,
    other: other,
  );

  ImpaktfullUiChatItem message(String text, DateTime timestamp) =>
      ImpaktfullUiChatItem(
        senderId: other.id,
        message: text,
        timestamp: timestamp,
      );

  testWidgets('stream: shows the messages the stream emits', (tester) async {
    final controller = StreamController<List<ImpaktfullUiChatItem>>();
    addTearDown(controller.close);
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiChat.stream(
        itemsStream: controller.stream,
        senderConfig: senderConfig,
      ),
    );
    expect(find.text('Hello'), findsNothing);

    controller.add([message('Hello', DateTime(2024, 1, 1, 12))]);
    await tester.pumpAndSettle();
    expect(find.text('Hello'), findsOneWidget);

    controller.add([
      message('World', DateTime(2024, 1, 1, 13)),
      message('Hello', DateTime(2024, 1, 1, 12)),
    ]);
    await tester.pumpAndSettle();
    expect(find.text('Hello'), findsOneWidget);
    expect(find.text('World'), findsOneWidget);
  });

  testWidgets('stream: listens to a new stream passed by the parent',
      (tester) async {
    final first = StreamController<List<ImpaktfullUiChatItem>>.broadcast();
    final second = StreamController<List<ImpaktfullUiChatItem>>.broadcast();
    addTearDown(first.close);
    addTearDown(second.close);
    var stream = first.stream;
    late StateSetter setState;
    await pumpAndSettleComponent(
      tester,
      StatefulBuilder(
        builder: (context, setter) {
          setState = setter;
          return ImpaktfullUiChat.stream(
            itemsStream: stream,
            senderConfig: senderConfig,
          );
        },
      ),
    );

    setState(() => stream = second.stream);
    await tester.pumpAndSettle();
    second.add([message('From second', DateTime(2024, 1, 1))]);
    await tester.pumpAndSettle();
    expect(find.text('From second'), findsOneWidget);

    first.add([message('From first', DateTime(2024, 1, 1))]);
    await tester.pumpAndSettle();
    expect(find.text('From first'), findsNothing);
  });

  testWidgets('items: shows new items passed by the parent', (tester) async {
    var items = [message('First', DateTime(2024, 1, 1, 12))];
    late StateSetter setState;
    await pumpAndSettleComponent(
      tester,
      StatefulBuilder(
        builder: (context, setter) {
          setState = setter;
          return ImpaktfullUiChat(
            items: items,
            senderConfig: senderConfig,
          );
        },
      ),
    );
    expect(find.text('First'), findsOneWidget);

    setState(
      () => items = [message('Second', DateTime(2024, 1, 1, 13)), ...items],
    );
    await tester.pumpAndSettle();
    expect(find.text('First'), findsOneWidget);
    expect(find.text('Second'), findsOneWidget);
  });

  testWidgets('shows a date label above the first message of every day',
      (tester) async {
    // Newest first.
    final items = [
      message('Day 2, second', DateTime(2024, 1, 2, 13)),
      message('Day 2, first', DateTime(2024, 1, 2, 12)),
      message('Day 1', DateTime(2024, 1, 1, 12)),
    ];
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiChat(
        items: items,
        senderConfig: senderConfig,
      ),
    );
    expect(find.text('01/01/2024'), findsOneWidget);
    expect(find.text('02/01/2024'), findsOneWidget);
  });
}

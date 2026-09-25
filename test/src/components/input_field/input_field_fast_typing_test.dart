// Typing faster than the app rebuilds: the value that comes back is behind
// what the controller holds, and writing it back would undo the keystrokes in
// between.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';

/// An app that passes back the value before the one the field just reported.
///
/// That is what a rebuild that lands one keystroke late looks like to the
/// field, without a timer to wait for in the test.
class _LaggingApp extends StatefulWidget {
  final List<String> reported;

  const _LaggingApp({required this.reported});

  @override
  State<_LaggingApp> createState() => _LaggingAppState();
}

class _LaggingAppState extends State<_LaggingApp> {
  String _value = '';
  String? _previous;

  @override
  Widget build(BuildContext context) => ImpaktfullUiInputField(
        label: 'Search',
        value: _value,
        onChanged: (value) {
          widget.reported.add(value);
          setState(() {
            _value = _previous ?? '';
            _previous = value;
          });
        },
      );
}

TextEditingController _controller(WidgetTester tester) =>
    tester.widget<TextField>(find.byType(TextField)).controller!;

void main() {
  testWidgets(
      'a value that is one keystroke behind does not undo what was '
      'typed', (tester) async {
    final reported = <String>[];
    await pumpAndSettleComponent(tester, _LaggingApp(reported: reported));

    for (final text in ['i', 'im', 'imp', 'impa']) {
      await tester.enterText(find.byType(TextField), text);
      await tester.pump();
    }

    expect(_controller(tester).text, 'impa');
    expect(
      _controller(tester).selection,
      const TextSelection.collapsed(offset: 4),
      reason: 'the cursor stays at the end, so the next character is appended '
          'instead of replacing what is there',
    );
    expect(reported, ['i', 'im', 'imp', 'impa']);
  });

  testWidgets('a value the app changes itself still reaches the field',
      (tester) async {
    final value = ValueNotifier('one');
    addTearDown(value.dispose);
    await pumpAndSettleComponent(
      tester,
      ValueListenableBuilder<String>(
        valueListenable: value,
        builder: (context, current, child) => ImpaktfullUiInputField(
          label: 'Search',
          value: current,
          onChanged: (it) => value.value = it,
        ),
      ),
    );

    await tester.enterText(find.byType(TextField), 'two');
    await tester.pump();
    expect(_controller(tester).text, 'two');

    value.value = 'three';
    await tester.pump();
    expect(_controller(tester).text, 'three');
  });

  testWidgets('a field without an onChanged follows its value', (tester) async {
    final value = ValueNotifier('one');
    addTearDown(value.dispose);
    await pumpAndSettleComponent(
      tester,
      ValueListenableBuilder<String>(
        valueListenable: value,
        builder: (context, current, child) => ImpaktfullUiInputField(
          label: 'Search',
          value: current,
          onChanged: null,
        ),
      ),
    );
    expect(find.text('one'), findsOneWidget);

    value.value = 'two';
    await tester.pump();
    expect(find.text('two'), findsOneWidget);
  });

  testWidgets('the app hears every keystroke while it is rebuilding',
      (tester) async {
    final reported = <String>[];
    await pumpAndSettleComponent(tester, _LaggingApp(reported: reported));

    // No pump in between: every character is reported before the app rebuilds.
    await tester.enterText(find.byType(TextField), 'a');
    await tester.enterText(find.byType(TextField), 'ab');
    await tester.pumpAndSettle();

    expect(reported, ['a', 'ab']);
    expect(_controller(tester).text, 'ab');
  });
}

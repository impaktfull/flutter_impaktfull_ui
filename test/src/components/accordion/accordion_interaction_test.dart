import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../_data_display_test_helpers.dart';

void main() {
  Widget content(BuildContext context) =>
      const SizedBox(height: 100, child: Text('Content'));

  Future<void> pumpAccordion(WidgetTester tester, Widget accordion) =>
      pumpSized(
        tester,
        Align(alignment: AlignmentDirectional.topStart, child: accordion),
      );

  double contentHeight(WidgetTester tester) =>
      tester.getSize(find.byType(SizeTransition)).height;

  /// An accordion that keeps its expanded state, like a screen would.
  Widget statefulAccordion({
    bool animated = true,
    ImpaktfullUiAccordionRevealType revealType =
        ImpaktfullUiAccordionRevealType.topDown,
    List<bool>? changes,
  }) {
    var expanded = false;
    return StatefulBuilder(
      builder: (context, setState) => ImpaktfullUiAccordion(
        title: 'Title',
        expanded: expanded,
        animated: animated,
        revealType: revealType,
        expandedBuilder: content,
        onExpandedChanged: (value) {
          changes?.add(value);
          setState(() => expanded = value);
        },
      ),
    );
  }

  testWidgets('tapping the title reports the inverted expanded value',
      (tester) async {
    final changes = <bool>[];
    await pumpAccordion(
      tester,
      ImpaktfullUiAccordion(
        title: 'Title',
        expanded: false,
        expandedBuilder: content,
        onExpandedChanged: changes.add,
      ),
    );
    await tester.tap(find.text('Title'));
    expect(changes, [true]);
  });

  testWidgets('expands and collapses with an animation', (tester) async {
    final changes = <bool>[];
    await pumpAccordion(tester, statefulAccordion(changes: changes));
    expect(contentHeight(tester), 0);

    await tester.tap(find.text('Title'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));
    expect(contentHeight(tester), greaterThan(0));
    expect(contentHeight(tester), lessThan(100));
    await tester.pumpAndSettle();
    expect(contentHeight(tester), 100);

    await tester.tap(find.text('Title'));
    await tester.pumpAndSettle();
    expect(contentHeight(tester), 0);
    expect(changes, [true, false]);
  });

  testWidgets('the chevron rotates when expanded', (tester) async {
    await pumpAccordion(tester, statefulAccordion());
    double turns() =>
        tester.widget<AnimatedRotation>(find.byType(AnimatedRotation)).turns;
    expect(turns(), 0);
    await tester.tap(find.text('Title'));
    await tester.pumpAndSettle();
    expect(turns(), -0.5);
  });

  testWidgets('not animated: the content is added and removed', (tester) async {
    await pumpAccordion(tester, statefulAccordion(animated: false));
    expect(find.text('Content'), findsNothing);
    expect(find.byType(SizeTransition), findsNothing);
    await tester.tap(find.text('Title'));
    await tester.pump();
    expect(find.text('Content'), findsOneWidget);
    await tester.tap(find.text('Title'));
    await tester.pump();
    expect(find.text('Content'), findsNothing);
  });

  testWidgets('expanded at the start shows the content without animating',
      (tester) async {
    await pumpAccordion(
      tester,
      ImpaktfullUiAccordion(
        title: 'Title',
        expanded: true,
        expandedBuilder: content,
      ),
    );
    expect(contentHeight(tester), 100);
  });

  testWidgets('without onExpandedChanged a tap does not expand',
      (tester) async {
    await pumpAccordion(
      tester,
      ImpaktfullUiAccordion(
        title: 'Title',
        expanded: false,
        expandedBuilder: content,
      ),
    );
    await tester.tap(find.text('Title'));
    await tester.pumpAndSettle();
    expect(contentHeight(tester), 0);
  });

  for (final revealType in ImpaktfullUiAccordionRevealType.values) {
    testWidgets('$revealType uses its alignment', (tester) async {
      await pumpAccordion(tester, statefulAccordion(revealType: revealType));
      expect(
        tester.widget<SizeTransition>(find.byType(SizeTransition)).alignment,
        revealType.alignment,
      );
    });
  }

  testWidgets('a custom trailing widget replaces the chevron', (tester) async {
    await pumpAccordion(
      tester,
      ImpaktfullUiAccordion(
        title: 'Title',
        expanded: false,
        expandedBuilder: content,
        trailingWidgetBuilder: (context) => const Text('Trailing'),
      ),
    );
    expect(find.text('Trailing'), findsOneWidget);
    expect(find.byType(AnimatedRotation), findsNothing);
  });
}

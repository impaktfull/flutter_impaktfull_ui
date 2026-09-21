import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';

// The error border and clipping are tested in card_test.dart.
void main() {
  Future<void> pump(WidgetTester tester, ImpaktfullUiCard card) =>
      pumpAndSettleComponent(
        tester,
        Align(alignment: Alignment.topLeft, child: card),
      );

  ImpaktfullUiTouchFeedback feedback(WidgetTester tester) =>
      tester.widget<ImpaktfullUiTouchFeedback>(find.descendant(
        of: find.byType(ImpaktfullUiCard),
        matching: find.byType(ImpaktfullUiTouchFeedback),
      ));

  testWidgets('tapping calls onTap', (tester) async {
    var taps = 0;
    await pump(
      tester,
      ImpaktfullUiCard(onTap: () => taps++, child: const Text('card')),
    );
    await tester.tap(find.text('card'));
    await tester.pumpAndSettle();
    expect(taps, 1);
  });

  testWidgets('with onTap: click cursor and focusable', (tester) async {
    await pump(
      tester,
      ImpaktfullUiCard(onTap: () {}, child: const Text('card')),
    );
    expect(feedback(tester).cursor, SystemMouseCursors.click);
    expect(feedback(tester).canRequestFocus, isTrue);
    expect(feedback(tester).useFocusColor, isTrue);
  });

  testWidgets('without onTap: not focusable, deferred cursor', (tester) async {
    await pump(tester, const ImpaktfullUiCard(child: Text('card')));
    expect(feedback(tester).cursor, MouseCursor.defer);
    expect(feedback(tester).canRequestFocus, isFalse);
    expect(feedback(tester).onTap, isNull);
  });

  testWidgets('a custom cursor wins over the click cursor', (tester) async {
    await pump(
      tester,
      ImpaktfullUiCard(
        onTap: () {},
        cursor: SystemMouseCursors.grab,
        child: const Text('card'),
      ),
    );
    expect(feedback(tester).cursor, SystemMouseCursors.grab);
  });

  testWidgets('uses the theme padding by default', (tester) async {
    await pump(
      tester,
      const ImpaktfullUiCard(child: SizedBox(width: 10, height: 10)),
    );
    final theme = ImpaktfullUiCardTheme.of(
      tester.element(find.byType(ImpaktfullUiCard)),
    );
    final padding = theme.dimens.padding.resolve(TextDirection.ltr);
    expect(
      tester.getSize(find.byType(ImpaktfullUiCard)),
      Size(10 + padding.horizontal, 10 + padding.vertical),
    );
  });

  testWidgets('uses the size, padding and alignment', (tester) async {
    await pump(
      tester,
      const ImpaktfullUiCard(
        width: 200,
        height: 100,
        padding: EdgeInsets.all(10),
        alignment: Alignment.bottomRight,
        child: SizedBox(width: 20, height: 20, key: Key('child')),
      ),
    );
    expect(tester.getSize(find.byType(ImpaktfullUiCard)), const Size(200, 100));
    expect(
      tester.getRect(find.byKey(const Key('child'))),
      const Rect.fromLTRB(170, 70, 190, 90),
    );
  });

  testWidgets('uses a custom shadow', (tester) async {
    const shadow = [BoxShadow(color: Colors.red, blurRadius: 3)];
    await pump(
      tester,
      const ImpaktfullUiCard(shadow: shadow, child: Text('card')),
    );
    expect(
      tester
          .widget<ImpaktfullUiContainer>(find
              .descendant(
                of: find.byType(ImpaktfullUiCard),
                matching: find.byType(ImpaktfullUiContainer),
              )
              .first)
          .shadow,
      shadow,
    );
  });

  testWidgets('error uses the theme error border', (tester) async {
    await pump(tester, const ImpaktfullUiCard(error: true, child: Text('c')));
    final theme = ImpaktfullUiCardTheme.of(
      tester.element(find.byType(ImpaktfullUiCard)),
    );
    final border = tester
        .widget<ImpaktfullUiContainer>(find
            .descendant(
              of: find.byType(ImpaktfullUiCard),
              matching: find.byType(ImpaktfullUiContainer),
            )
            .first)
        .border as Border?;
    expect(border?.top.color, theme.colors.borderError ?? theme.colors.border);
  });
}

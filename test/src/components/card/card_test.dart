import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';

void main() {
  ImpaktfullUiCardTheme cardTheme({
    required Color? border,
    required Color? borderError,
  }) =>
      ImpaktfullUiCardTheme(
        colors: ImpaktfullUiCardColorTheme(
          background: Colors.white,
          border: border,
          borderError: borderError,
        ),
        dimens: const ImpaktfullUiCardDimensTheme(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          padding: EdgeInsets.all(16),
          borderWidth: 1,
        ),
        shadows: const ImpaktfullUiCardShadowsTheme(card: []),
      );

  BoxBorder? cardBorder(WidgetTester tester) => tester
      .widget<ImpaktfullUiContainer>(find
          .descendant(
            of: find.byType(ImpaktfullUiCard),
            matching: find.byType(ImpaktfullUiContainer),
          )
          .first)
      .border;

  testWidgets('error without borderError falls back to the border',
      (tester) async {
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiCard(
        error: true,
        theme: cardTheme(border: Colors.green, borderError: null),
        child: const Text('card'),
      ),
    );
    expect(tester.takeException(), isNull);
    expect((cardBorder(tester)! as Border).top.color, Colors.green);
  });

  testWidgets('error uses borderError', (tester) async {
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiCard(
        error: true,
        theme: cardTheme(border: Colors.green, borderError: Colors.red),
        child: const Text('card'),
      ),
    );
    expect((cardBorder(tester)! as Border).top.color, Colors.red);
  });

  testWidgets('no border and no borderError', (tester) async {
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiCard(
        error: true,
        theme: cardTheme(border: null, borderError: null),
        child: const Text('card'),
      ),
    );
    expect(cardBorder(tester), isNull);
  });

  testWidgets('clips with the borderRadius of the card', (tester) async {
    const borderRadius = BorderRadius.all(Radius.circular(24));
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiCard(
        borderRadius: borderRadius,
        theme: cardTheme(border: null, borderError: null),
        child: const Text('card'),
      ),
    );
    final clip = tester.widget<ClipRRect>(find.descendant(
      of: find.byType(ImpaktfullUiCard),
      matching: find.byType(ClipRRect),
    ));
    expect(clip.borderRadius, borderRadius);
  });

  testWidgets('clips with the theme borderRadius by default', (tester) async {
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiCard(
        theme: cardTheme(border: null, borderError: null),
        child: const Text('card'),
      ),
    );
    final clip = tester.widget<ClipRRect>(find.descendant(
      of: find.byType(ImpaktfullUiCard),
      matching: find.byType(ClipRRect),
    ));
    expect(clip.borderRadius, const BorderRadius.all(Radius.circular(8)));
  });
}

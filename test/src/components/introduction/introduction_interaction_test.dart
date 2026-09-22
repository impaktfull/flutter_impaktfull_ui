import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';

void main() {
  const pages = [
    ImpaktfullUiIntroductionPage(title: 'Page 1', subtitle: 'Subtitle 1'),
    ImpaktfullUiIntroductionPage(title: 'Page 2', subtitle: 'Subtitle 2'),
    ImpaktfullUiIntroductionPage(
      title: 'Page 3',
      child: Text('Child 3'),
    ),
  ];

  Future<void> pumpIntroduction(
    WidgetTester tester, {
    int initialIndex = 0,
    VoidCallback? onDone,
    VoidCallback? onSkip,
    ValueChanged<int>? onPageChanged,
    ImpaktfullUiIntroductionLocalizations? localizations,
  }) =>
      pumpAndSettleComponent(
        tester,
        ImpaktfullUiIntroduction(
          pages: pages,
          initialIndex: initialIndex,
          onDone: onDone,
          onSkip: onSkip,
          onPageChanged: onPageChanged,
          localizations: localizations,
        ),
      );

  testWidgets('without pages nothing is shown', (tester) async {
    await pumpAndSettleComponent(
      tester,
      const Center(child: ImpaktfullUiIntroduction()),
    );
    expect(tester.takeException(), isNull);
    expect(tester.getSize(find.byType(ImpaktfullUiIntroduction)), Size.zero);
    expect(find.byType(ImpaktfullUiButton), findsNothing);
  });

  testWidgets('shows the first page with a page indicator', (tester) async {
    await pumpIntroduction(tester, onDone: () {}, onSkip: () {});
    expect(find.text('Page 1'), findsOneWidget);
    expect(find.text('Subtitle 1'), findsOneWidget);
    expect(find.byType(ImpaktfullUiCarousel), findsOneWidget);
    expect(find.text('Next'), findsOneWidget);
    expect(find.text('Skip'), findsOneWidget);
    expect(find.text('Done'), findsNothing);
  });

  testWidgets('next goes to the next page and done ends on the last page',
      (tester) async {
    final changes = <int>[];
    var done = 0;
    await pumpIntroduction(
      tester,
      onDone: () => done++,
      onSkip: () {},
      onPageChanged: changes.add,
    );
    await tester.tap(find.text('Next'));
    await tester.pumpAndSettle();
    expect(find.text('Page 2'), findsOneWidget);
    expect(changes, [1]);

    await tester.tap(find.text('Next'));
    await tester.pumpAndSettle();
    expect(find.text('Page 3'), findsOneWidget);
    expect(find.text('Child 3'), findsOneWidget);
    expect(changes, [1, 2]);
    expect(find.text('Next'), findsNothing);
    expect(find.text('Skip'), findsNothing);

    await tester.tap(find.text('Done'));
    await tester.pumpAndSettle();
    expect(done, 1);
  });

  testWidgets('skip calls onSkip', (tester) async {
    var skipped = 0;
    await pumpIntroduction(tester, onSkip: () => skipped++);
    await tester.tap(find.text('Skip'));
    await tester.pumpAndSettle();
    expect(skipped, 1);
  });

  testWidgets('without onSkip and onDone there is no skip or done button',
      (tester) async {
    await pumpIntroduction(tester, initialIndex: 2);
    expect(find.text('Skip'), findsNothing);
    expect(find.text('Done'), findsNothing);
    expect(find.text('Next'), findsNothing);
  });

  testWidgets('swiping changes the page and the buttons', (tester) async {
    final changes = <int>[];
    await pumpIntroduction(
      tester,
      onDone: () {},
      onPageChanged: changes.add,
    );
    await tester.fling(find.text('Page 1'), const Offset(-400, 0), 1000);
    await tester.pumpAndSettle();
    expect(find.text('Page 2'), findsOneWidget);
    expect(changes, [1]);

    await tester.fling(find.text('Page 2'), const Offset(-400, 0), 1000);
    await tester.pumpAndSettle();
    expect(find.text('Page 3'), findsOneWidget);
    expect(find.text('Done'), findsOneWidget);
    expect(changes, [1, 2]);

    await tester.fling(find.text('Page 3'), const Offset(400, 0), 1000);
    await tester.pumpAndSettle();
    expect(find.text('Page 2'), findsOneWidget);
    expect(find.text('Next'), findsOneWidget);
    expect(changes, [1, 2, 1]);
  });

  testWidgets('a drag past the middle of the page is not interrupted',
      (tester) async {
    final changes = <int>[];
    await pumpIntroduction(tester, onPageChanged: changes.add);
    final gesture =
        await tester.startGesture(tester.getCenter(find.text('Page 1')));
    for (var i = 0; i < 12; i++) {
      await gesture.moveBy(const Offset(-50, 0));
      await tester.pump(const Duration(milliseconds: 50));
    }
    // The page changed while the finger is still down.
    expect(changes, [1]);
    // Dragging back still moves the pages.
    for (var i = 0; i < 12; i++) {
      await gesture.moveBy(const Offset(50, 0));
      await tester.pump(const Duration(milliseconds: 50));
    }
    await tester.pump(const Duration(milliseconds: 500));
    await gesture.up();
    await tester.pumpAndSettle();
    expect(find.text('Page 1'), findsOneWidget);
    expect(find.text('Page 2'), findsNothing);
    expect(changes, [1, 0]);
  });

  testWidgets('initialIndex is clamped to the pages', (tester) async {
    await pumpIntroduction(tester, initialIndex: 10, onDone: () {});
    expect(find.text('Page 3'), findsOneWidget);
    expect(find.text('Done'), findsOneWidget);
  });

  testWidgets('uses the localizations', (tester) async {
    await pumpIntroduction(
      tester,
      onSkip: () {},
      localizations: const ImpaktfullUiIntroductionLocalizations(
        nextBtn: 'Volgende',
        skipBtn: 'Overslaan',
      ),
    );
    expect(find.text('Volgende'), findsOneWidget);
    expect(find.text('Overslaan'), findsOneWidget);
  });

  testWidgets('uses the localizations of the app', (tester) async {
    await tester.pumpWidget(
      ImpaktfullUiApp(
        title: 'app',
        showDebugFlag: false,
        localizations: const ImpaktfullUiLocalizations(
          introduction: ImpaktfullUiIntroductionLocalizations(doneBtn: 'Klaar'),
        ),
        home: ImpaktfullUiIntroduction(
          pages: pages,
          initialIndex: 2,
          onDone: () {},
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('Klaar'), findsOneWidget);
  });

  testWidgets('uses the theme', (tester) async {
    final base = ImpaktfullUiTheme.getDefault().components.introduction;
    const titleStyle = TextStyle(fontSize: 40, color: Colors.teal);
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiIntroduction(
        pages: const [
          ImpaktfullUiIntroductionPage(
            title: 'Themed',
            asset: ImpaktfullUiAsset.icon(Icons.star),
          ),
        ],
        theme: base.copyWith(
          colors: base.colors.copyWith(asset: Colors.teal),
          dimens: base.dimens.copyWith(assetSize: 64),
          textStyles: base.textStyles.copyWith(title: titleStyle),
        ),
      ),
    );
    final asset = tester
        .widget<ImpaktfullUiAssetWidget>(find.byType(ImpaktfullUiAssetWidget));
    expect(asset.color, Colors.teal);
    expect(asset.size, 64);
    expect(tester.widget<Text>(find.text('Themed')).style, titleStyle);
  });

  test('is still a StatelessWidget', () {
    const Widget introduction = ImpaktfullUiIntroduction();
    expect(introduction, isA<StatelessWidget>());
  });

  test('the default localizations are English', () {
    const localizations = ImpaktfullUiLocalizations();
    expect(localizations.introduction.nextBtn, 'Next');
    expect(localizations.introduction.skipBtn, 'Skip');
    expect(localizations.introduction.doneBtn, 'Done');
    expect(
      localizations.introduction.copyWith(nextBtn: 'Verder').nextBtn,
      'Verder',
    );
  });
}

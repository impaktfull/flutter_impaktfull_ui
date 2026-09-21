import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../_layout_test_helpers.dart';

void main() {
  late StateSetter setState;
  late int? selected;
  late int closeDetailCalls;
  late int backTaps;

  setUp(() {
    selected = null;
    closeDetailCalls = 0;
    backTaps = 0;
  });

  /// A master detail with a list of 3 items, the detail of the [selected]
  /// item and a master action.
  Widget masterDetail({
    bool withOnBackTapped = false,
    bool withOnCloseDetail = true,
    bool closeDetailBeforeMaster = false,
    bool keepOriginalMasterTitle = false,
    String? detailSubtitle,
  }) =>
      StatefulBuilder(builder: (context, setter) {
        setState = setter;
        return ImpaktfullUiMasterDetail(
          title: 'Master',
          actions: [
            ImpaktfullUiAdaptiveNavBarActionItem(
              title: 'Master action',
              asset: testAsset,
              onTap: () {},
            ),
          ],
          onBackTapped: withOnBackTapped ? () => backTaps++ : null,
          closeDetailBeforeMaster: closeDetailBeforeMaster,
          onCloseDetail: withOnCloseDetail
              ? () {
                  closeDetailCalls++;
                  setState(() => selected = null);
                }
              : null,
          emptyDetail: const Text('empty detail'),
          navigation: Column(
            children: [
              for (var i = 0; i < 3; i++)
                TextButton(
                  onPressed: () => setState(() => selected = i),
                  child: Text('Item $i'),
                ),
            ],
          ),
          detail: (context) {
            final item = selected;
            if (item == null) return null;
            return ImpaktfullUiMasterDetailItemScreen(
              title: 'Detail $item',
              subtitle: detailSubtitle,
              keepOriginalMasterTitle: keepOriginalMasterTitle,
              actions: [
                ImpaktfullUiAdaptiveNavBarActionItem(
                  title: 'Detail action',
                  asset: testAsset,
                  onTap: () {},
                ),
              ],
              child: Text('detail content $item'),
            );
          },
        );
      });

  /// Small screens show the actions as icon buttons with a tooltip, bigger
  /// screens as buttons with a title.
  Finder action(String title) => find.byWidgetPredicate((widget) =>
      (widget is Tooltip && widget.message == title) ||
      (widget is Text && widget.data == title));

  group('small screen', () {
    testWidgets('opens and closes the detail', (tester) async {
      await pumpLayoutApp(tester, masterDetail());
      expect(find.text('Item 0'), findsOneWidget);
      expect(find.text('Master'), findsOneWidget);
      expect(find.byTooltip('Back'), findsNothing);

      await tester.tap(find.text('Item 1'));
      await tester.pumpAndSettle();
      expect(find.text('Item 0'), findsNothing);
      expect(find.text('detail content 1'), findsOneWidget);
      expect(find.text('Detail 1'), findsOneWidget);
      expect(find.text('Master'), findsNothing);

      await tester.tap(find.byTooltip('Back'));
      await tester.pumpAndSettle();
      expect(closeDetailCalls, 1);
      expect(backTaps, 0);
      expect(find.text('Item 0'), findsOneWidget);
      expect(find.text('Master'), findsOneWidget);
      expect(find.byTooltip('Back'), findsNothing);
    });

    testWidgets('switches the detail actions and restores the master actions',
        (tester) async {
      await pumpLayoutApp(tester, masterDetail());
      expect(action('Master action'), findsOneWidget);
      expect(action('Detail action'), findsNothing);

      await tester.tap(find.text('Item 0'));
      await tester.pumpAndSettle();
      expect(action('Master action'), findsNothing);
      expect(action('Detail action'), findsOneWidget);

      await tester.tap(find.byTooltip('Back'));
      await tester.pumpAndSettle();
      expect(action('Master action'), findsOneWidget);
      expect(action('Detail action'), findsNothing);
    });

    testWidgets('back without onCloseDetail calls onBackTapped',
        (tester) async {
      await pumpLayoutApp(
        tester,
        masterDetail(withOnBackTapped: true, withOnCloseDetail: false),
      );
      await tester.tap(find.byTooltip('Back'));
      await tester.pumpAndSettle();
      expect(backTaps, 1);
    });

    group(
      'Bug',
      skip: 'Bug: on small screens back without an open detail calls '
          'onCloseDetail instead of onBackTapped, so the master can not be '
          'left with back',
      () {
        testWidgets('back without a detail calls onBackTapped', (tester) async {
          await pumpLayoutApp(tester, masterDetail(withOnBackTapped: true));
          await tester.tap(find.byTooltip('Back'));
          await tester.pumpAndSettle();
          expect(backTaps, 1);
          expect(closeDetailCalls, 0);
        });
      },
    );

    testWidgets('without onCloseDetail the detail (or empty detail) is shown',
        (tester) async {
      await pumpLayoutApp(tester, masterDetail(withOnCloseDetail: false));
      expect(find.text('empty detail'), findsOneWidget);
      expect(find.text('Item 0'), findsNothing);
    });

    group(
      'Bug',
      skip: 'Bug: closing the detail without the back button (detail builder '
          'returns null) keeps the title and actions of the detail, only '
          'the back button clears the overrides',
      () {
        testWidgets('closing the detail from code restores the master',
            (tester) async {
          await pumpLayoutApp(tester, masterDetail());
          await tester.tap(find.text('Item 0'));
          await tester.pumpAndSettle();
          expect(find.text('Detail 0'), findsOneWidget);

          setState(() => selected = null);
          await tester.pumpAndSettle();
          expect(find.text('Item 0'), findsOneWidget);
          expect(find.text('Detail 0'), findsNothing);
          expect(find.text('Master'), findsOneWidget);
          expect(action('Master action'), findsOneWidget);
          expect(action('Detail action'), findsNothing);
        });
      },
    );
  });

  group('large screen', () {
    testWidgets('shows the navigation next to the empty detail',
        (tester) async {
      await pumpLayoutApp(tester, masterDetail(), size: largeScreenSize);
      expect(find.text('Item 0'), findsOneWidget);
      expect(find.text('empty detail'), findsOneWidget);
      expect(find.byType(ImpaktfullUiDivider), findsOneWidget);
      expect(
        tester.getTopLeft(find.text('empty detail')).dx,
        greaterThan(tester.getTopLeft(find.text('Item 0')).dx),
      );
    });

    testWidgets('the detail uses detailFlex of the width', (tester) async {
      await pumpLayoutApp(
        tester,
        ImpaktfullUiMasterDetail(
          navigation: const SizedBox.expand(key: Key('navigation')),
          detail: (context) => const SizedBox.expand(key: Key('detail')),
          detailFlex: 3,
        ),
        size: largeScreenSize,
      );
      final navigation = tester.getSize(find.byKey(const Key('navigation')));
      final detail = tester.getSize(find.byKey(const Key('detail')));
      expect(
          detail.width / navigation.width, moreOrLessEquals(3, epsilon: 0.01));
    });

    testWidgets('selecting an item shows its detail next to the navigation',
        (tester) async {
      await pumpLayoutApp(tester, masterDetail(), size: largeScreenSize);
      await tester.tap(find.text('Item 2'));
      await tester.pumpAndSettle();
      expect(find.text('Item 0'), findsOneWidget);
      expect(find.text('detail content 2'), findsOneWidget);
      expect(find.text('Detail 2'), findsOneWidget);
      expect(action('Detail action'), findsOneWidget);

      await tester.tap(find.text('Item 1'));
      await tester.pumpAndSettle();
      expect(find.text('detail content 1'), findsOneWidget);
      expect(find.text('Detail 1'), findsOneWidget);
    });

    testWidgets('keepOriginalMasterTitle moves the detail title to subtitle',
        (tester) async {
      await pumpLayoutApp(
        tester,
        masterDetail(keepOriginalMasterTitle: true, detailSubtitle: 'Info'),
        size: largeScreenSize,
      );
      await tester.tap(find.text('Item 0'));
      await tester.pumpAndSettle();
      expect(find.text('Detail 0 > Info'), findsOneWidget);
    });

    testWidgets('closeDetailBeforeMaster closes the detail on back',
        (tester) async {
      await pumpLayoutApp(
        tester,
        masterDetail(closeDetailBeforeMaster: true, withOnBackTapped: true),
        size: largeScreenSize,
      );
      await tester.tap(find.text('Item 0'));
      await tester.pumpAndSettle();
      await tester.tap(find.byTooltip('Back'));
      await tester.pumpAndSettle();
      expect(closeDetailCalls, 1);
      expect(backTaps, 0);
      expect(find.text('empty detail'), findsOneWidget);
      expect(find.text('Master'), findsOneWidget);
      expect(action('Master action'), findsOneWidget);

      // Without a detail, back goes to onBackTapped.
      await tester.tap(find.byTooltip('Back'));
      await tester.pumpAndSettle();
      expect(backTaps, 1);
    });

    testWidgets('back calls onBackTapped when the detail stays open',
        (tester) async {
      await pumpLayoutApp(
        tester,
        masterDetail(withOnBackTapped: true),
        size: largeScreenSize,
      );
      await tester.tap(find.text('Item 0'));
      await tester.pumpAndSettle();
      await tester.tap(find.byTooltip('Back'));
      await tester.pumpAndSettle();
      expect(backTaps, 1);
      expect(closeDetailCalls, 0);
    });

    group(
      'Bug',
      skip: 'Bug: on large screens an open detail shows a back button (because '
          'of onCloseDetail) that does nothing without onBackTapped and '
          'closeDetailBeforeMaster',
      () {
        testWidgets('a visible back button does something', (tester) async {
          await pumpLayoutApp(tester, masterDetail(), size: largeScreenSize);
          await tester.tap(find.text('Item 0'));
          await tester.pumpAndSettle();
          final back = find.byTooltip('Back');
          if (back.evaluate().isEmpty) return;
          await tester.tap(back);
          await tester.pumpAndSettle();
          expect(closeDetailCalls + backTaps, 1);
        });
      },
    );
  });

  testWidgets('of throws outside an ImpaktfullUiMasterDetail', (tester) async {
    Object? error;
    await pumpLayoutApp(
      tester,
      Builder(builder: (context) {
        try {
          ImpaktfullUiMasterDetail.of(context);
        } catch (e) {
          error = e;
        }
        return const SizedBox();
      }),
    );
    expect(error, isA<FlutterError>());
  });
}

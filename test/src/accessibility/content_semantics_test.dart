import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '_accessibility_test_helpers.dart';

void main() {
  group('progress indicator', () {
    for (final type in ImpaktfullUiProgressIndicatorType.values) {
      testWidgets('$type announces the value as a percentage', (tester) async {
        final handle = tester.ensureSemantics();
        await pumpAccessibilityApp(
          tester,
          Center(
            child: SizedBox(
              width: 200,
              height: 200,
              child: ImpaktfullUiProgressIndicator(
                value: 0.4,
                type: type,
                showText: true,
              ),
            ),
          ),
        );
        // The visible percentage is not announced a second time.
        expect(
          semanticsOf(tester, find.byType(ImpaktfullUiProgressIndicator)),
          matchesSemantics(label: 'Progress', value: '40%'),
        );
        handle.dispose();
      });
    }

    testWidgets('uses the semantic label', (tester) async {
      final handle = tester.ensureSemantics();
      await pumpAccessibilityApp(
        tester,
        const ImpaktfullUiLineProgressIndicator(
          value: 1.2,
          semanticLabel: 'Upload',
        ),
      );
      // The value is clamped between 0% and 100%.
      expect(
        find.semantics.byLabel('Upload'),
        findsOne,
      );
      expect(
        semanticsWithLabel('Upload'),
        isSemantics(value: '100%'),
      );
      handle.dispose();
    });
  });

  group('line chart', () {
    ImpaktfullUiLineChartItemData<double, double> line(int points) =>
        ImpaktfullUiLineChartItemData<double, double>(
          points: [
            for (var i = 0; i < points; i++)
              ImpaktfullUiLineChartItemDataItem(x: i.toDouble(), y: i * 2.0),
          ],
          offsetBuilder: (x, y) => Offset(x, y),
        );

    testWidgets('announces a localized summary', (tester) async {
      final handle = tester.ensureSemantics();
      await pumpAccessibilityApp(
        tester,
        ImpaktfullUiLineChart<double, double>(
          data: [line(3), line(4)],
          height: 100,
        ),
      );
      expect(
        semanticsWithLabel('Line chart with 2 lines and 7 data points'),
        isSemantics(isImage: true),
      );
      handle.dispose();
    });

    testWidgets('announces the semantic label', (tester) async {
      final handle = tester.ensureSemantics();
      await pumpAccessibilityApp(
        tester,
        ImpaktfullUiLineChart<double, double>(
          data: [line(2)],
          height: 100,
          semanticLabel: 'Revenue is rising',
        ),
        localizations: ImpaktfullUiLocalizations(
          accessibility: ImpaktfullUiAccessibilityLocalizations(
            lineChartSummary: (lines, points) => 'Grafiek',
          ),
        ),
      );
      expect(find.semantics.byLabel('Revenue is rising'), findsOne);
      expect(find.semantics.byLabel('Grafiek'), findsNothing);
      handle.dispose();
    });
  });

  group('images', () {
    testWidgets('an avatar without a label is decorative', (tester) async {
      final handle = tester.ensureSemantics();
      await pumpAccessibilityApp(
        tester,
        const Center(child: ImpaktfullUiAvatar(url: null)),
      );
      expect(
        tester.getSemantics(find.byType(ImpaktfullUiAvatar)),
        isNot(isSemantics(isImage: true)),
      );
      handle.dispose();
    });

    testWidgets('an avatar with a label is an image, a button with onTap',
        (tester) async {
      final handle = tester.ensureSemantics();
      await pumpAccessibilityApp(
        tester,
        Center(
          child: ImpaktfullUiAvatar(
            url: null,
            semanticLabel: 'Jane Doe',
            onTap: () {},
          ),
        ),
      );
      expect(
        semanticsWithLabel('Jane Doe'),
        isSemantics(isImage: true, isButton: true, hasTapAction: true),
      );
      handle.dispose();
    });

    testWidgets('a network image has alt text', (tester) async {
      final handle = tester.ensureSemantics();
      await pumpAccessibilityApp(
        tester,
        const ImpaktfullUiNetworkImage(
          url: 'https://example.com/cat.png',
          width: 50,
          height: 50,
          semanticLabel: 'A cat',
        ),
        settle: false,
      );
      final image = tester.widget<Image>(find.byType(Image));
      expect(image.semanticLabel, 'A cat');
      expect(image.excludeFromSemantics, isFalse);
      handle.dispose();
    });

    testWidgets('a network image can be excluded', (tester) async {
      await pumpAccessibilityApp(
        tester,
        const ImpaktfullUiNetworkImage(
          url: 'https://example.com/cat.png',
          excludeFromSemantics: true,
        ),
        settle: false,
      );
      expect(tester.widget<Image>(find.byType(Image)).excludeFromSemantics,
          isTrue);
    });

    testWidgets('an asset has a label or is excluded', (tester) async {
      final handle = tester.ensureSemantics();
      await pumpAccessibilityApp(
        tester,
        Column(
          children: [
            ImpaktfullUiAssetWidget(
              asset: ImpaktfullUiAsset.icon(Icons.warning),
              semanticLabel: 'Warning',
            ),
            ImpaktfullUiAssetWidget(
              asset: ImpaktfullUiAsset.icon(Icons.star),
              excludeFromSemantics: true,
            ),
          ],
        ),
      );
      expect(
        semanticsWithLabel('Warning'),
        isSemantics(isImage: true),
      );
      // The asset widget wraps the asset in ExcludeSemantics.
      final excluded = tester.widget<ExcludeSemantics>(find
          .descendant(
            of: find.byType(ImpaktfullUiAssetWidget).last,
            matching: find.byType(ExcludeSemantics),
          )
          .first);
      expect(excluded.child, isA<SizedBox>());
      handle.dispose();
    });
  });

  group('badges', () {
    testWidgets('a notification badge announces the amount', (tester) async {
      final handle = tester.ensureSemantics();
      await pumpAccessibilityApp(
        tester,
        const Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ImpaktfullUiNotificationBadge(
                show: true,
                text: '3',
                color: null,
                child: SizedBox(width: 24, height: 24),
              ),
              ImpaktfullUiNotificationBadge(
                show: true,
                text: '1',
                color: null,
                child: SizedBox(width: 24, height: 24),
              ),
              ImpaktfullUiNotificationBadge(
                show: true,
                text: '99+',
                color: null,
                child: SizedBox(width: 24, height: 24),
              ),
              ImpaktfullUiNotificationBadge(
                show: true,
                color: null,
                child: SizedBox(width: 24, height: 24),
              ),
              ImpaktfullUiNotificationBadge(
                show: false,
                text: '5',
                color: null,
                child: SizedBox(width: 24, height: 24),
              ),
            ],
          ),
        ),
      );
      expect(find.semantics.byLabel('3 notifications'), findsOne);
      expect(find.semantics.byLabel('1 notification'), findsOne);
      expect(find.semantics.byLabel('99+ notifications'), findsOne);
      expect(find.semantics.byLabel('New notification'), findsOne);
      // A hidden badge is not announced.
      expect(find.semantics.byLabel('5 notifications'), findsNothing);
      handle.dispose();
    });

    testWidgets('the notification label is localized', (tester) async {
      final handle = tester.ensureSemantics();
      await pumpAccessibilityApp(
        tester,
        const Center(
          child: ImpaktfullUiNotificationBadge(
            show: true,
            text: '3',
            color: null,
            child: SizedBox(width: 24, height: 24),
          ),
        ),
        localizations: ImpaktfullUiLocalizations(
          accessibility: ImpaktfullUiAccessibilityLocalizations(
            notificationCount: (count) => '$count meldingen',
          ),
        ),
      );
      expect(find.semantics.byLabel('3 meldingen'), findsOne);
      handle.dispose();
    });

    testWidgets('a badge with onTap is a button, its close button is labeled',
        (tester) async {
      final handle = tester.ensureSemantics();
      var closed = false;
      await pumpAccessibilityApp(
        tester,
        Center(
          child: ImpaktfullUiBadge(
            type: ImpaktfullUiBadgeType.primary,
            label: '3',
            semanticLabel: '3 unread messages',
            onTap: () {},
            onCloseTap: () => closed = true,
          ),
        ),
      );
      expect(
        semanticsWithLabel('3 unread messages'),
        isSemantics(isButton: true, hasTapAction: true),
      );
      expect(
        semanticsWithLabel('Remove'),
        isSemantics(isButton: true, hasTapAction: true),
      );
      tester.semantics.tap(find.semantics.byLabel('Remove'));
      expect(closed, isTrue);
      handle.dispose();
    });
  });

  group('slider', () {
    testWidgets('has slider semantics with a value and actions',
        (tester) async {
      final handle = tester.ensureSemantics();
      var value = 50.0;
      await pumpAccessibilityApp(
        tester,
        StatefulBuilder(
          builder: (context, setState) => ImpaktfullUiSlider(
            value: value,
            min: 0,
            max: 100,
            semanticLabel: 'Volume',
            onChanged: (newValue) => setState(() => value = newValue),
          ),
        ),
      );
      expect(
        semanticsWithLabel('Volume'),
        matchesSemantics(
          label: 'Volume',
          value: '50',
          increasedValue: '60',
          decreasedValue: '40',
          isSlider: true,
          hasEnabledState: true,
          isEnabled: true,
          isFocusable: true,
          hasIncreaseAction: true,
          hasDecreaseAction: true,
          hasFocusAction: true,
          // The tap and drag of the track.
          hasTapAction: true,
          hasScrollLeftAction: true,
          hasScrollRightAction: true,
        ),
      );
      tester.semantics.increase(find.semantics.byLabel('Volume'));
      await tester.pump();
      expect(value, 60);
      tester.semantics.decrease(find.semantics.byLabel('Volume'));
      await tester.pump();
      expect(value, 50);
      handle.dispose();
    });

    testWidgets('a disabled slider has no actions', (tester) async {
      final handle = tester.ensureSemantics();
      await pumpAccessibilityApp(
        tester,
        const ImpaktfullUiSlider(
          value: 5,
          min: 0,
          max: 10,
          semanticLabel: 'Volume',
        ),
      );
      expect(
        semanticsWithLabel('Volume'),
        isSemantics(
          isSlider: true,
          isEnabled: false,
          hasIncreaseAction: false,
          hasDecreaseAction: false,
        ),
      );
      handle.dispose();
    });
  });

  group('loading', () {
    testWidgets('a skeleton is not announced', (tester) async {
      final handle = tester.ensureSemantics();
      await pumpAccessibilityApp(
        tester,
        const Center(child: ImpaktfullUiSkeleton.box(width: 100, height: 20)),
        settle: false,
      );
      expect(
        find.descendant(
          of: find.byType(ImpaktfullUiSkeleton),
          matching: find.byType(ExcludeSemantics),
        ),
        findsOne,
      );
      handle.dispose();
    });

    testWidgets('a loading indicator announces loading', (tester) async {
      final handle = tester.ensureSemantics();
      await pumpAccessibilityApp(
        tester,
        const Center(child: ImpaktfullUiLoadingIndicator()),
        settle: false,
      );
      expect(find.semantics.byLabel('Loading'), findsOne);
      handle.dispose();
    });

    testWidgets('an error of loading error data is a live region',
        (tester) async {
      final handle = tester.ensureSemantics();
      await pumpAccessibilityApp(
        tester,
        ImpaktfullUiLoadingErrorData<String>(
          isLoading: false,
          errorTitle: 'Something went wrong',
          errorMessage: 'Try again later',
          errorActions: [
            ImpaktfullUiButton(
              type: ImpaktfullUiButtonType.primary,
              title: 'Retry',
              onTap: () {},
            ),
          ],
          builder: (context) => const SizedBox(),
        ),
      );
      expect(
        semanticsWithLabel('Something went wrong\nTry again later'),
        isSemantics(isLiveRegion: true),
      );
      expect(
        semanticsWithLabel('Retry'),
        isSemantics(isButton: true, hasTapAction: true),
      );
      handle.dispose();
    });

    testWidgets('the placeholder illustration is not announced',
        (tester) async {
      await pumpAccessibilityApp(
        tester,
        ImpaktfullUiPlaceholder(
          asset: ImpaktfullUiAsset.icon(Icons.inbox),
          title: 'No messages',
        ),
      );
      expect(
        tester
            .widget<ImpaktfullUiAssetWidget>(
                find.byType(ImpaktfullUiAssetWidget))
            .excludeFromSemantics,
        isTrue,
      );
    });
  });

  group('buttons', () {
    testWidgets('a button is a button and announces disabled', (tester) async {
      final handle = tester.ensureSemantics();
      await pumpAccessibilityApp(
        tester,
        const Center(
          child: ImpaktfullUiButton(
            type: ImpaktfullUiButtonType.primary,
            title: 'Save',
          ),
        ),
      );
      expect(
        semanticsWithLabel('Save'),
        matchesSemantics(
          label: 'Save',
          isButton: true,
          hasEnabledState: true,
          isEnabled: false,
        ),
      );
      handle.dispose();
    });

    testWidgets('an icon button is a button with its tooltip', (tester) async {
      final handle = tester.ensureSemantics();
      await pumpAccessibilityApp(
        tester,
        Center(
          child: ImpaktfullUiIconButton(
            asset: ImpaktfullUiAsset.icon(Icons.add),
            tooltip: 'Add',
            onTap: () {},
          ),
        ),
      );
      expect(
        semanticsWithTooltip('Add'),
        isSemantics(isButton: true, hasTapAction: true),
      );
      handle.dispose();
    });

    testWidgets('the close button of a modal has a label', (tester) async {
      final handle = tester.ensureSemantics();
      await pumpAccessibilityApp(
        tester,
        Builder(
          builder: (context) => ImpaktfullUiButton(
            type: ImpaktfullUiButtonType.primary,
            title: 'Open',
            onTap: () => ImpaktfullUiModal.showSimple<void>(
              context: context,
              title: 'Modal',
            ),
          ),
        ),
      );
      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();
      expect(
        semanticsWithTooltip('Close'),
        isSemantics(isButton: true, hasTapAction: true),
      );
      handle.dispose();
    });
  });

  group('overlays', () {
    testWidgets('the dropdown button announces expanded', (tester) async {
      final handle = tester.ensureSemantics();
      await pumpAccessibilityApp(
        tester,
        Align(
          alignment: Alignment.topCenter,
          child: ImpaktfullUiDropdown<String>(
            buttonText: 'Sort',
            height: 100,
            child: const Text('Newest'),
          ),
        ),
      );
      expect(
        tester.getSemantics(find.text('Sort')),
        isSemantics(
          label: 'Sort',
          isButton: true,
          hasExpandedState: true,
          isExpanded: false,
        ),
      );
      tester.semantics.tap(find.semantics.byLabel('Sort'));
      await tester.pumpAndSettle();
      expect(
        tester.getSemantics(find.text('Sort')),
        isSemantics(hasExpandedState: true, isExpanded: true),
      );
      // The dropdown can be dismissed by screen readers.
      expect(
        find.semantics.byAction(SemanticsAction.dismiss),
        findsOne,
      );
      tester.semantics.performAction(
        find.semantics.byAction(SemanticsAction.dismiss),
        SemanticsAction.dismiss,
      );
      await tester.pumpAndSettle();
      expect(find.text('Newest'), findsNothing);
      handle.dispose();
    });

    testWidgets('the carousel announces the current slide', (tester) async {
      final handle = tester.ensureSemantics();
      await pumpAccessibilityApp(
        tester,
        SizedBox(
          height: 200,
          child: ImpaktfullUiCarousel(
            items: const [Text('One'), Text('Two'), Text('Three')],
          ),
        ),
      );
      expect(
        semanticsWithLabel('Slide 1 of 3'),
        isSemantics(isLiveRegion: true),
      );
      handle.dispose();
    });
  });
}

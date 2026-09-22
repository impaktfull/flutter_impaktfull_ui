import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '_accessibility_test_helpers.dart';

/// "Reduce motion" (`MediaQuery.disableAnimations`): decorative animations
/// do not run, changes happen immediately.
void main() {
  testWidgets('the helper returns zero durations with reduce motion',
      (tester) async {
    late Duration reduced;
    late Duration normal;
    await tester.pumpWidget(
      MediaQuery(
        data: const MediaQueryData(disableAnimations: true),
        child: Builder(builder: (context) {
          reduced = ImpaktfullUiAnimationUtil.duration(
              context, const Duration(milliseconds: 300));
          return const SizedBox();
        }),
      ),
    );
    await tester.pumpWidget(
      MediaQuery(
        data: const MediaQueryData(),
        child: Builder(builder: (context) {
          normal = ImpaktfullUiAnimationUtil.duration(
              context, const Duration(milliseconds: 300));
          return const SizedBox();
        }),
      ),
    );
    expect(reduced, Duration.zero);
    expect(normal, const Duration(milliseconds: 300));
  });

  group('skeleton', () {
    testWidgets('shimmers by default', (tester) async {
      await pumpAccessibilityApp(
        tester,
        const Center(child: ImpaktfullUiSkeleton.box(width: 100, height: 20)),
        settle: false,
      );
      expect(tester.hasRunningAnimations, isTrue);
    });

    testWidgets('does not shimmer with reduce motion', (tester) async {
      await pumpAccessibilityApp(
        tester,
        const Center(child: ImpaktfullUiSkeleton.box(width: 100, height: 20)),
        disableAnimations: true,
        settle: false,
      );
      expect(tester.hasRunningAnimations, isFalse);
    });
  });

  testWidgets('confetti does not run with reduce motion', (tester) async {
    await pumpAccessibilityApp(
      tester,
      const SizedBox(
        width: 200,
        height: 200,
        child: ImpaktfullUiConfetti(type: ImpaktfullUiConfettiType.circle),
      ),
      disableAnimations: true,
      settle: false,
    );
    // After the debounce of the size and the first layout.
    await tester.pump(const Duration(milliseconds: 200));
    await tester.pump(const Duration(milliseconds: 200));
    expect(tester.hasRunningAnimations, isFalse);
    expect(
      find.descendant(
        of: find.byType(ImpaktfullUiConfetti),
        matching: find.byType(CustomPaint),
      ),
      findsNothing,
    );
  });

  testWidgets('the carousel does not autoplay with reduce motion',
      (tester) async {
    final changes = <int>[];
    await pumpAccessibilityApp(
      tester,
      SizedBox(
        height: 200,
        child: ImpaktfullUiCarousel(
          autoplay: true,
          autoplayInterval: const Duration(seconds: 1),
          onItemChanged: changes.add,
          items: const [Text('One'), Text('Two')],
        ),
      ),
      disableAnimations: true,
    );
    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();
    expect(changes, isEmpty);
    expect(find.text('One'), findsOne);
  });

  testWidgets('the carousel still autoplays by default', (tester) async {
    final changes = <int>[];
    await pumpAccessibilityApp(
      tester,
      SizedBox(
        height: 200,
        child: ImpaktfullUiCarousel(
          autoplay: true,
          autoplayInterval: const Duration(seconds: 1),
          onItemChanged: changes.add,
          items: const [Text('One'), Text('Two')],
        ),
      ),
    );
    await tester.pump(const Duration(seconds: 1));
    await tester.pumpAndSettle();
    expect(changes, [1]);
  });

  testWidgets('the accordion expands immediately with reduce motion',
      (tester) async {
    var expanded = false;
    await pumpAccessibilityApp(
      tester,
      StatefulBuilder(
        builder: (context, setState) => ImpaktfullUiAccordion(
          title: 'Shipping',
          expanded: expanded,
          onExpansionChanged: (value) => setState(() => expanded = value),
          expandedBuilder: (context) => const Text('3 to 5 days'),
        ),
      ),
      disableAnimations: true,
    );
    await tester.tap(find.text('Shipping'));
    await tester.pump();
    // The ink highlight of the tap still fades, the content does not.
    expect(
      tester
          .widget<SizeTransition>(find.byType(SizeTransition))
          .sizeFactor
          .value,
      1,
    );
  });

  testWidgets('the sidebar navigation item expands immediately',
      (tester) async {
    await pumpAccessibilityApp(
      tester,
      ImpaktfullUiSidebarNavigationItem(
        title: 'Settings',
        items: [
          ImpaktfullUiSidebarNavigationItem(title: 'Profile', onTap: () {}),
        ],
      ),
      disableAnimations: true,
    );
    await tester.tap(find.text('Settings'));
    await tester.pump();
    // The ink highlight of the tap still fades, the content does not.
    expect(
      tester
          .widget<SizeTransition>(find.byType(SizeTransition))
          .sizeFactor
          .value,
      1,
    );
  });

  testWidgets('the switch thumb moves without an animation', (tester) async {
    await pumpAccessibilityApp(
      tester,
      Center(child: ImpaktfullUiSwitch(value: true, onChanged: (_) {})),
      disableAnimations: true,
    );
    expect(
      tester.widget<AnimatedPadding>(find.byType(AnimatedPadding)).duration,
      Duration.zero,
    );
  });

  testWidgets('the segmented control indicator moves without an animation',
      (tester) async {
    await pumpAccessibilityApp(
      tester,
      ImpaktfullUiSegmentedControl<String>(
        value: 'Day',
        items: const ['Day', 'Week'],
        onChanged: (_) {},
      ),
      disableAnimations: true,
    );
    expect(
      tester.widget<AnimatedAlign>(find.byType(AnimatedAlign)).duration,
      Duration.zero,
    );
  });

  testWidgets('the dropdown opens without a fade', (tester) async {
    await pumpAccessibilityApp(
      tester,
      Align(
        alignment: Alignment.topCenter,
        child: ImpaktfullUiDropdown<String>(
          buttonTitle: 'Sort',
          height: 100,
          child: const Text('Newest'),
        ),
      ),
      disableAnimations: true,
    );
    await tester.tap(find.text('Sort'));
    await tester.pump();
    final fade = tester.widget<FadeTransition>(find
        .ancestor(
            of: find.text('Newest'), matching: find.byType(FadeTransition))
        .first);
    expect(fade.opacity.value, 1);
  });

  group('routes', () {
    void reduceMotion(WidgetTester tester) {
      tester.platformDispatcher.accessibilityFeaturesTestValue =
          const FakeAccessibilityFeatures(disableAnimations: true);
      addTearDown(
          tester.platformDispatcher.clearAccessibilityFeaturesTestValue);
    }

    Widget opener(void Function(BuildContext context) onTap) => Builder(
          builder: (context) => ImpaktfullUiButton(
            type: ImpaktfullUiButtonType.primary,
            title: 'Open',
            onTap: () => onTap(context),
          ),
        );

    testWidgets('a modal opens without a transition', (tester) async {
      reduceMotion(tester);
      await pumpAccessibilityApp(
        tester,
        opener((context) => ImpaktfullUiModal.showSimple<void>(
              context: context,
              title: 'Modal',
            )),
      );
      await tester.tap(find.text('Open'));
      await tester.pump();
      expect(find.text('Modal'), findsOne);
      expect(
        ModalRoute.of(tester.element(find.text('Modal')))!.animation!.value,
        1,
      );
    });

    testWidgets('a bottom sheet opens without a transition', (tester) async {
      reduceMotion(tester);
      await pumpAccessibilityApp(
        tester,
        opener((context) => ImpaktfullUiBottomSheet.showSimple<void>(
              context: context,
              title: 'Sheet',
            )),
      );
      await tester.tap(find.text('Open'));
      await tester.pump();
      expect(find.text('Sheet'), findsOne);
      expect(
        ModalRoute.of(tester.element(find.text('Sheet')))!.animation!.value,
        1,
      );
    });
  });
}

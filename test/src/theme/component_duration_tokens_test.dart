// Proves that the duration tokens of the component themes really drive the
// timing of the components: every test overrides one token with a clearly
// longer duration and observes that the component is still animating (or has
// not started yet) at a moment where the default duration is already done.

import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui/src/components/chat/widget/chat_list_typing_container.dart';
import 'package:impaktfull_ui/src/components/gallery/widget/gallery_full_screen_item.dart';
import 'package:impaktfull_ui/src/components/virtual_keyboard/widget/virtual_keyboard_button.dart';

import '../../util/test_util.dart';
import '../_core_test_helpers.dart';

ImpaktfullUiComponentsTheme get _components =>
    ImpaktfullUiTheme.getDefault().components;

/// An app theme with one component theme replaced, for the components that
/// read their theme from the tree instead of from a `theme:` parameter.
ImpaktfullUiTheme _appTheme(
  ImpaktfullUiComponentsTheme Function(ImpaktfullUiComponentsTheme components)
      update,
) {
  final base = ImpaktfullUiTheme.getDefault();
  return base.copyWith(components: update(base.components));
}

void main() {
  group('ImpaktfullUiAccordionTheme.durations.expand', () {
    Widget accordion({Duration? expand}) {
      final base = _components.accordion;
      var expanded = false;
      return Align(
        alignment: AlignmentDirectional.topStart,
        child: StatefulBuilder(
          builder: (context, setState) => ImpaktfullUiAccordion(
            title: 'Title',
            expanded: expanded,
            expandedBuilder: (context) =>
                const SizedBox(height: 100, child: Text('Content')),
            theme: expand == null
                ? null
                : base.copyWith(
                    durations: base.durations.copyWith(expand: expand),
                  ),
            onExpansionChanged: (value) => setState(() => expanded = value),
          ),
        ),
      );
    }

    double contentHeight(WidgetTester tester) =>
        tester.getSize(find.byType(SizeTransition)).height;

    Duration chevronDuration(WidgetTester tester) => tester
        .widget<AnimatedRotation>(find.descendant(
          of: find.byType(ImpaktfullUiAccordion),
          matching: find.byType(AnimatedRotation),
        ))
        .duration;

    testWidgets('the chevron turns with the duration of the theme',
        (tester) async {
      await pumpAndSettleComponent(tester, accordion());
      expect(chevronDuration(tester), const Duration(milliseconds: 200));

      await pumpAndSettleComponent(
        tester,
        accordion(expand: const Duration(seconds: 1)),
      );
      expect(chevronDuration(tester), const Duration(seconds: 1));
    });

    testWidgets('the default expands within 300ms', (tester) async {
      await pumpAndSettleComponent(tester, accordion());
      await tester.tap(find.text('Title'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));
      expect(contentHeight(tester), 100);
    });

    testWidgets('a longer expand is still running after 300ms', (tester) async {
      await pumpAndSettleComponent(
        tester,
        accordion(expand: const Duration(seconds: 1)),
      );
      expect(contentHeight(tester), 0);

      await tester.tap(find.text('Title'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));
      expect(contentHeight(tester), greaterThan(0));
      expect(contentHeight(tester), lessThan(100));

      await tester.pumpAndSettle();
      expect(contentHeight(tester), 100);
    });
  });

  group('ImpaktfullUiButtonTheme.durations', () {
    const elevation = 20.0;

    ImpaktfullUiButtonTheme buttonTheme({
      Duration? raisedPress,
      Duration? raisedRelease,
    }) {
      final base = _components.button;
      return base.copyWith(
        config: const ImpaktfullUiButtonConfig(
          isRaised: true,
          elevation: elevation,
        ),
        durations: base.durations.copyWith(
          raisedPress: raisedPress,
          raisedRelease: raisedRelease,
        ),
      );
    }

    Future<void> pumpButton(
      WidgetTester tester, {
      Duration? raisedPress,
      Duration? raisedRelease,
    }) =>
        pumpAndSettleComponent(
          tester,
          Center(
            child: ImpaktfullUiButton(
              type: ImpaktfullUiButtonType.primary,
              title: 'Save',
              theme: buttonTheme(
                raisedPress: raisedPress,
                raisedRelease: raisedRelease,
              ),
              onTap: () {},
            ),
          ),
        );

    /// How far the content of the button moved down from its resting place:
    /// 0 when it is up, [elevation] when it is fully pressed down.
    double pressedOffset(WidgetTester tester, double rest) =>
        tester.getTopLeft(find.text('Save')).dy - rest;

    testWidgets('the default raisedPress is down within 300ms', (tester) async {
      await pumpButton(tester);
      final rest = tester.getTopLeft(find.text('Save')).dy;

      final gesture =
          await tester.startGesture(tester.getCenter(find.text('Save')));
      // The tap down is only reported after the press timeout.
      await tester.pump(const Duration(milliseconds: 100));
      await tester.pump(const Duration(milliseconds: 300));
      expect(pressedOffset(tester, rest), elevation);

      await gesture.up();
      await tester.pumpAndSettle();
    });

    testWidgets('a longer raisedPress is still moving down after 300ms',
        (tester) async {
      await pumpButton(tester, raisedPress: const Duration(seconds: 2));
      final rest = tester.getTopLeft(find.text('Save')).dy;

      final gesture =
          await tester.startGesture(tester.getCenter(find.text('Save')));
      await tester.pump(const Duration(milliseconds: 100));
      await tester.pump(const Duration(milliseconds: 300));
      expect(pressedOffset(tester, rest), greaterThan(0));
      expect(pressedOffset(tester, rest), lessThan(elevation));

      await tester.pumpAndSettle();
      expect(pressedOffset(tester, rest), elevation);

      await gesture.up();
      await tester.pumpAndSettle();
    });

    testWidgets('the default raisedRelease is back up within 300ms',
        (tester) async {
      await pumpButton(tester);
      final rest = tester.getTopLeft(find.text('Save')).dy;

      final gesture =
          await tester.startGesture(tester.getCenter(find.text('Save')));
      await tester.pump(const Duration(milliseconds: 100));
      await tester.pumpAndSettle();
      expect(pressedOffset(tester, rest), elevation);

      await gesture.up();
      // One pump fires the release timer and starts the animation, the next
      // one runs it.
      await tester.pump(const Duration(milliseconds: 150));
      await tester.pump(const Duration(milliseconds: 150));
      expect(pressedOffset(tester, rest), 0);
    });

    testWidgets('a longer raisedRelease keeps the button down', (tester) async {
      await pumpButton(tester, raisedRelease: const Duration(seconds: 2));
      final rest = tester.getTopLeft(find.text('Save')).dy;

      final gesture =
          await tester.startGesture(tester.getCenter(find.text('Save')));
      await tester.pump(const Duration(milliseconds: 100));
      await tester.pumpAndSettle();
      expect(pressedOffset(tester, rest), elevation);

      await gesture.up();
      // The release timer has not fired yet, so the button did not move.
      await tester.pump(const Duration(milliseconds: 150));
      await tester.pump(const Duration(milliseconds: 150));
      expect(pressedOffset(tester, rest), elevation);

      await tester.pump(const Duration(seconds: 2));
      await tester.pumpAndSettle();
      expect(pressedOffset(tester, rest), 0);
    });
  });

  group('ImpaktfullUiCarouselTheme.durations.pageTransition', () {
    Future<int> animateToSecondPage(
      WidgetTester tester, {
      Duration? pageTransition,
    }) async {
      final base = _components.carousel;
      var index = 0;
      late StateSetter setIndex;
      await pumpAndSettleComponent(
        tester,
        StatefulBuilder(
          builder: (context, setState) {
            setIndex = setState;
            return ImpaktfullUiCarousel(
              index: index,
              items: const [Text('Page 0'), Text('Page 1')],
              theme: pageTransition == null
                  ? null
                  : base.copyWith(
                      durations: base.durations
                          .copyWith(pageTransition: pageTransition),
                    ),
            );
          },
        ),
      );
      setIndex(() => index = 1);
      // pumpAndSettle returns the number of frames the animation took.
      return tester.pumpAndSettle(const Duration(milliseconds: 16));
    }

    testWidgets('the default slides to the next page in about 300ms',
        (tester) async {
      final frames = await animateToSecondPage(tester);
      expect(frames, lessThan(40));
      expect(find.text('Page 1'), findsOneWidget);
    });

    testWidgets('a longer pageTransition takes more frames', (tester) async {
      final frames = await animateToSecondPage(
        tester,
        pageTransition: const Duration(seconds: 2),
      );
      expect(frames, greaterThan(100));
      expect(find.text('Page 1'), findsOneWidget);
    });
  });

  group('ImpaktfullUiChatTheme.durations', () {
    const sender = ImpaktfullUiChatSender(id: 'jane', name: 'Jane');

    Future<void> pumpTypingDots(
      WidgetTester tester, {
      Duration? typingDot,
      Duration? typingDotDelay,
    }) async {
      final base = _components.chat;
      await pumpComponent(
        tester,
        ImpaktfullUiChatListTypingContainer(
          sendersTyping: const [sender],
          theme: base.copyWith(
            durations: base.durations.copyWith(
              typingDot: typingDot,
              typingDotDelay: typingDotDelay,
            ),
          ),
        ),
      );
      // The first dot starts on a timer without a delay, and its animation
      // only starts counting on the frame after that.
      await tester.pump(const Duration(milliseconds: 1));
    }

    /// How far the first dot bounced up. Every bouncing dot runs a ticker, so
    /// the number of transient callbacks is the number of started dots.
    double firstDotOffset(WidgetTester tester) => tester
        .widgetList<Transform>(find.descendant(
          of: find.byType(ImpaktfullUiChatListTypingContainer),
          matching: find.byType(Transform),
        ))
        .first
        .transform
        .getTranslation()
        .y;

    testWidgets('the default starts the three dots within 500ms',
        (tester) async {
      await pumpTypingDots(tester);
      await tester.pump(const Duration(milliseconds: 500));
      expect(tester.binding.transientCallbackCount, 3);
      await tester.pumpWidget(const SizedBox());
    });

    testWidgets('a longer typingDotDelay starts the dots one by one',
        (tester) async {
      await pumpTypingDots(tester, typingDotDelay: const Duration(seconds: 1));
      expect(tester.binding.transientCallbackCount, 1);

      await tester.pump(const Duration(milliseconds: 1100));
      expect(tester.binding.transientCallbackCount, 2);

      await tester.pump(const Duration(seconds: 1));
      expect(tester.binding.transientCallbackCount, 3);
      await tester.pumpWidget(const SizedBox());
    });

    testWidgets('the default typingDot bounces a dot within 400ms',
        (tester) async {
      await pumpTypingDots(tester);
      // Halfway the 800ms bounce the dot is at the top of its arc.
      await tester.pump(const Duration(milliseconds: 400));
      expect(firstDotOffset(tester).abs(), greaterThan(3));
      await tester.pumpWidget(const SizedBox());
    });

    testWidgets('a longer typingDot bounces slower', (tester) async {
      await pumpTypingDots(tester, typingDot: const Duration(seconds: 8));
      await tester.pump(const Duration(milliseconds: 400));
      expect(firstDotOffset(tester).abs(), lessThan(1));
      await tester.pumpWidget(const SizedBox());
    });
  });

  group('ImpaktfullUiConfettiTheme.durations.resizeDebounce', () {
    Future<void> pumpConfetti(
      WidgetTester tester, {
      Duration? resizeDebounce,
    }) async {
      final base = _components.confetti;
      await tester.pumpWidget(
        ImpaktfullUiApp(
          showDebugFlag: false,
          title: 'test',
          home: Center(
            child: SizedBox(
              width: 200,
              height: 200,
              child: ImpaktfullUiConfetti(
                type: ImpaktfullUiConfettiType.circle,
                theme: resizeDebounce == null
                    ? null
                    : base.copyWith(
                        durations: base.durations
                            .copyWith(resizeDebounce: resizeDebounce),
                      ),
              ),
            ),
          ),
        ),
      );
      await tester.pump();
    }

    /// The confetti is only painted once the debounced size arrived.
    Size paintedSize(WidgetTester tester) => tester
        .widget<CustomPaint>(find
            .descendant(
              of: find.byType(ImpaktfullUiConfetti),
              matching: find.byType(CustomPaint),
            )
            .first)
        .size;

    testWidgets('the default applies the size within 150ms', (tester) async {
      await pumpConfetti(tester);
      expect(paintedSize(tester), Size.zero);

      await tester.pump(const Duration(milliseconds: 150));
      expect(paintedSize(tester), const Size(200, 200));
      await tester.pumpWidget(const SizedBox());
    });

    testWidgets('a longer resizeDebounce delays the size', (tester) async {
      await pumpConfetti(tester, resizeDebounce: const Duration(seconds: 2));
      expect(paintedSize(tester), Size.zero);

      await tester.pump(const Duration(milliseconds: 150));
      expect(paintedSize(tester), Size.zero);

      await tester.pump(const Duration(seconds: 2));
      expect(paintedSize(tester), const Size(200, 200));
      await tester.pumpWidget(const SizedBox());
    });
  });

  group('ImpaktfullUiDropdownTheme.durations.overlay', () {
    Future<void> openDropdown(WidgetTester tester, {Duration? overlay}) async {
      final base = _components.dropdown;
      await pumpAndSettleComponent(
        tester,
        Center(
          child: ImpaktfullUiDropdown<void>(
            buttonTitle: 'Open',
            alignment: ImpaktfullUiDropdownAlignment.bottomLeft,
            theme: overlay == null
                ? null
                : base.copyWith(
                    durations: base.durations.copyWith(overlay: overlay),
                  ),
            child: const Text('Dropdown content'),
          ),
        ),
      );
      await tester.tap(find.text('Open'));
      await tester.pump();
    }

    double overlayOpacity(WidgetTester tester) => tester
        .widget<FadeTransition>(find
            .ancestor(
              of: find.text('Dropdown content'),
              matching: find.byType(FadeTransition),
            )
            .first)
        .opacity
        .value;

    testWidgets('the default is fully open after 300ms', (tester) async {
      await openDropdown(tester);
      await tester.pump(const Duration(milliseconds: 300));
      expect(overlayOpacity(tester), 1);
      await tester.pumpAndSettle();
    });

    testWidgets('a longer overlay is still fading in after 300ms',
        (tester) async {
      await openDropdown(tester, overlay: const Duration(seconds: 2));
      await tester.pump(const Duration(milliseconds: 300));
      expect(overlayOpacity(tester), greaterThan(0));
      expect(overlayOpacity(tester), lessThan(1));

      await tester.pumpAndSettle();
      expect(overlayOpacity(tester), 1);
    });
  });

  group('ImpaktfullUiFloatingActionButtonTheme.durations.expand', () {
    late StateSetter setExpanded;

    Future<void> pumpFab(WidgetTester tester, {Duration? expand}) {
      final base = _components.floatingActionButton;
      var expanded = false;
      return pumpAndSettleComponent(
        tester,
        Center(
          child: StatefulBuilder(
            builder: (context, setState) {
              setExpanded = (callback) => setState(() {
                    callback();
                    expanded = true;
                  });
              return ImpaktfullUiFloatingActionButton(
                asset: ImpaktfullUiAsset.icon(Icons.add),
                title: 'Add',
                expanded: expanded,
                theme: expand == null
                    ? null
                    : base.copyWith(
                        durations: base.durations.copyWith(expand: expand),
                      ),
                onTap: () {},
              );
            },
          ),
        ),
      );
    }

    double labelWidth(WidgetTester tester) => tester
        .getSize(find
            .ancestor(of: find.byType(Text), matching: find.byType(ClipRect))
            .first)
        .width;

    testWidgets('the default is fully expanded after 300ms', (tester) async {
      await pumpFab(tester);
      expect(labelWidth(tester), 0);

      setExpanded(() {});
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));
      final width = labelWidth(tester);
      expect(width, greaterThan(0));

      await tester.pumpAndSettle();
      expect(labelWidth(tester), width);
    });

    testWidgets('a longer expand is still growing after 300ms', (tester) async {
      await pumpFab(tester, expand: const Duration(seconds: 2));
      expect(labelWidth(tester), 0);

      setExpanded(() {});
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));
      final width = labelWidth(tester);
      expect(width, greaterThan(0));

      await tester.pumpAndSettle();
      expect(labelWidth(tester), greaterThan(width));
    });
  });

  group('ImpaktfullUiGalleryTheme.durations.zoom', () {
    final item = ImpaktfullUiGalleryItem(
      id: 'red',
      child: const ColoredBox(
        color: Color(0xFFFF0000),
        child: SizedBox(width: 50, height: 50),
      ),
    );

    Future<void> pumpItem(WidgetTester tester, {Duration? zoom}) {
      final base = _components.gallery;
      return pumpAndSettleComponent(
        tester,
        ImpaktfullUiGalleryFullScreenItemWidget(
          item: item,
          theme: zoom == null
              ? base
              : base.copyWith(
                  durations: base.durations.copyWith(zoom: zoom),
                ),
        ),
      );
    }

    Future<void> doubleTapImage(WidgetTester tester) async {
      final center = tester.getCenter(find.byWidget(item.child()).first);
      await tester.tapAt(center);
      await tester.pump(kDoubleTapMinTime);
      await tester.tapAt(center);
      await tester.pump();
    }

    /// The zoom scales the image, so its painted width grows.
    double imageWidth(WidgetTester tester) =>
        tester.getRect(find.byWidget(item.child()).first).width;

    testWidgets('the default is zoomed in after 300ms', (tester) async {
      await pumpItem(tester);
      final width = imageWidth(tester);

      await doubleTapImage(tester);
      await tester.pump(const Duration(milliseconds: 300));
      expect(imageWidth(tester) / width, closeTo(3, 0.01));
      await tester.pumpAndSettle();
    });

    testWidgets('a longer zoom is still zooming after 300ms', (tester) async {
      await pumpItem(tester, zoom: const Duration(seconds: 3));
      final width = imageWidth(tester);

      await doubleTapImage(tester);
      await tester.pump(const Duration(milliseconds: 300));
      expect(imageWidth(tester) / width, greaterThan(1));
      expect(imageWidth(tester) / width, lessThan(1.5));

      await tester.pumpAndSettle();
      expect(imageWidth(tester) / width, closeTo(3, 0.01));
    });
  });

  group('ImpaktfullUiModalTheme.durations.transition', () {
    /// Shows a modal and returns the number of frames its transition took.
    Future<int> showModal(WidgetTester tester, {Duration? transition}) async {
      late BuildContext appContext;
      await pumpImpaktfullUiApp(
        tester,
        Builder(builder: (context) {
          appContext = context;
          return const SizedBox.expand();
        }),
        theme: transition == null
            ? null
            : _appTheme((components) => components.copyWith(
                  modal: components.modal.copyWith(
                    durations: components.modal.durations
                        .copyWith(transition: transition),
                  ),
                )),
      );
      unawaited(ImpaktfullUiModal.showSimple<void>(
        context: appContext,
        title: 'Title',
      ));
      return tester.pumpAndSettle(const Duration(milliseconds: 16));
    }

    testWidgets('the default transition takes about 150ms', (tester) async {
      final frames = await showModal(tester);
      expect(find.text('Title'), findsOneWidget);
      expect(frames, lessThan(30));
    });

    testWidgets('a longer transition takes more frames', (tester) async {
      final frames = await showModal(
        tester,
        transition: const Duration(seconds: 2),
      );
      expect(find.text('Title'), findsOneWidget);
      expect(frames, greaterThan(100));
    });
  });

  group('ImpaktfullUiSegmentedControlTheme.durations.selected', () {
    Future<void> pumpControl(WidgetTester tester, {Duration? selected}) {
      final base = _components.segmentedControl;
      return pumpAndSettleComponent(
        tester,
        ImpaktfullUiSegmentedControl<String>(
          value: 'A',
          items: const ['A', 'B'],
          theme: selected == null
              ? null
              : base.copyWith(
                  durations: base.durations.copyWith(selected: selected),
                ),
          onChanged: (_) {},
        ),
      );
    }

    Duration indicatorDuration(WidgetTester tester) => tester
        .widget<AnimatedAlign>(find.descendant(
          of: find.byType(ImpaktfullUiSegmentedControl<String>),
          matching: find.byType(AnimatedAlign),
        ))
        .duration;

    testWidgets('the indicator animates with the duration of the theme',
        (tester) async {
      await pumpControl(tester);
      expect(indicatorDuration(tester), const Duration(milliseconds: 200));

      await pumpControl(tester, selected: const Duration(seconds: 2));
      expect(indicatorDuration(tester), const Duration(seconds: 2));
    });
  });

  group('ImpaktfullUiSidebarNavigationItemTheme.durations.dropdownRotation',
      () {
    Widget item({Duration? dropdownRotation}) {
      final base = _components.sidebarNavigationItem;
      return ImpaktfullUiSidebarNavigationItem(
        title: 'Group',
        theme: dropdownRotation == null
            ? null
            : base.copyWith(
                durations:
                    base.durations.copyWith(dropdownRotation: dropdownRotation),
              ),
        items: [
          ImpaktfullUiSidebarNavigationItem(
            title: 'Sub item',
            onTap: () {},
          ),
        ],
      );
    }

    double subItemsSizeFactor(WidgetTester tester) => tester
        .widget<SizeTransition>(find.ancestor(
          of: find.text('Sub item'),
          matching: find.byType(SizeTransition),
        ))
        .sizeFactor
        .value;

    Duration chevronDuration(WidgetTester tester) => tester
        .widgetList<AnimatedRotation>(find.byType(AnimatedRotation))
        .first
        .duration;

    testWidgets('the chevron turns with the duration of the theme',
        (tester) async {
      await pumpAndSettleComponent(tester, item());
      expect(chevronDuration(tester), const Duration(milliseconds: 200));

      await pumpAndSettleComponent(
        tester,
        item(dropdownRotation: const Duration(seconds: 2)),
      );
      expect(chevronDuration(tester), const Duration(seconds: 2));
    });

    testWidgets('the default expands the sub items within 300ms',
        (tester) async {
      await pumpAndSettleComponent(tester, item());
      await tester.tap(find.text('Group'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));
      expect(subItemsSizeFactor(tester), 1);
    });

    testWidgets('a longer dropdownRotation expands slower', (tester) async {
      await pumpAndSettleComponent(
        tester,
        item(dropdownRotation: const Duration(seconds: 2)),
      );
      expect(subItemsSizeFactor(tester), 0);

      await tester.tap(find.text('Group'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));
      expect(subItemsSizeFactor(tester), greaterThan(0));
      expect(subItemsSizeFactor(tester), lessThan(1));

      await tester.pumpAndSettle();
      expect(subItemsSizeFactor(tester), 1);
    });
  });

  group('ImpaktfullUiVirtualKeyboardTheme.durations', () {
    ImpaktfullUiVirtualKeyboardTextEditController buildController() =>
        ImpaktfullUiVirtualKeyboardTextEditController(
          text: '',
          config: ImpaktfullUiVirtualQwertyKeyboardConfig(),
        );

    Finder keyButton(LogicalKeyboardKey key) => find.byWidgetPredicate(
          (widget) =>
              widget is ImpaktfullUiVirtualKeyboardButton &&
              widget.virtualKeyboardKey.defaultKey.key == key,
        );

    Future<void> pumpKeyboard(
      WidgetTester tester,
      ImpaktfullUiVirtualKeyboardTextEditController controller, {
      ImpaktfullUiVirtualKeyboardDurationsTheme? durations,
    }) =>
        // The keyboard buttons read the theme from the tree, so the whole app
        // theme is replaced. The cursor blinks forever: never settle.
        pumpImpaktfullUiApp(
          tester,
          Center(child: ImpaktfullUiVirtualKeyboard(controller: controller)),
          settle: false,
          theme: durations == null
              ? null
              : _appTheme((components) => components.copyWith(
                    virtualKeyboard: components.virtualKeyboard
                        .copyWith(durations: durations),
                  )),
        );

    /// Drags a key down without letting any time pass, so the slide animation
    /// only starts counting on the pumps after it.
    Future<void> dragDown(WidgetTester tester, TestGesture gesture) async {
      for (var i = 0; i < 5; i++) {
        await gesture.moveBy(const Offset(0, 8));
        await tester.pump();
      }
    }

    Offset slideOffset(WidgetTester tester, LogicalKeyboardKey key) => tester
        .widget<SlideTransition>(find.descendant(
          of: keyButton(key),
          matching: find.byType(SlideTransition),
        ))
        .position
        .value;

    double cursorOpacity(WidgetTester tester) => tester
        .widget<FadeTransition>(find.descendant(
          of: find.byType(ImpaktfullUiVirtualKeyboard),
          matching: find.byType(FadeTransition),
        ))
        .opacity
        .value;

    testWidgets('the default cursorBlink fades in 200ms', (tester) async {
      await pumpKeyboard(tester, buildController());
      // Half of the default blink: the cursor is halfway faded in.
      await tester.pump(const Duration(milliseconds: 100));
      expect(cursorOpacity(tester), closeTo(0.5, 0.05));
    });

    testWidgets('a longer cursorBlink makes the cursor fade slower',
        (tester) async {
      await pumpKeyboard(
        tester,
        buildController(),
        durations: const ImpaktfullUiVirtualKeyboardDurationsTheme(
          cursorBlink: Duration(seconds: 4),
        ),
      );
      // A twentieth of the blink instead of half of it.
      await tester.pump(const Duration(milliseconds: 100));
      expect(cursorOpacity(tester), closeTo(0.025, 0.02));
    });

    testWidgets('a longer repeatDelay waits longer before repeating',
        (tester) async {
      final controller = buildController();
      await pumpKeyboard(
        tester,
        controller,
        durations: const ImpaktfullUiVirtualKeyboardDurationsTheme(
          repeatDelay: Duration(seconds: 2),
        ),
      );
      final gesture = await tester
          .startGesture(tester.getCenter(keyButton(LogicalKeyboardKey.keyA)));
      // The tap down is only reported after the press timeout.
      await tester.pump(const Duration(milliseconds: 100));
      await tester.pump(const Duration(milliseconds: 150));
      expect(controller.text, 'a');

      // The default repeat delay of 500ms already passed.
      await tester.pump(const Duration(milliseconds: 800));
      expect(controller.text, 'a');

      await tester.pump(const Duration(seconds: 2));
      expect(controller.text.length, greaterThan(1));

      await gesture.up();
      await tester.pump();
    });

    testWidgets('a longer repeatInterval repeats slower', (tester) async {
      final controller = buildController();
      await pumpKeyboard(
        tester,
        controller,
        durations: const ImpaktfullUiVirtualKeyboardDurationsTheme(
          repeatInterval: Duration(seconds: 1),
        ),
      );
      final gesture = await tester
          .startGesture(tester.getCenter(keyButton(LogicalKeyboardKey.keyA)));
      await tester.pump(const Duration(milliseconds: 100));
      await tester.pump(const Duration(milliseconds: 150));
      // The default repeat delay of 500ms adds the second character.
      await tester.pump(const Duration(milliseconds: 600));
      expect(controller.text, 'aa');

      // With the default interval of 100ms this would have added characters.
      await tester.pump(const Duration(milliseconds: 500));
      expect(controller.text, 'aa');

      await tester.pump(const Duration(milliseconds: 600));
      expect(controller.text, 'aaa');

      await gesture.up();
      await tester.pump();
    });

    testWidgets('a longer keySlide slides the key slower', (tester) async {
      const key = LogicalKeyboardKey.digit1;
      final controller = buildController();
      await pumpKeyboard(
        tester,
        controller,
        durations: const ImpaktfullUiVirtualKeyboardDurationsTheme(
          keySlide: Duration(seconds: 2),
        ),
      );
      expect(slideOffset(tester, key), Offset.zero);

      final gesture =
          await tester.startGesture(tester.getCenter(keyButton(key)));
      await dragDown(tester, gesture);
      // The default slide of 200ms would be done after 300ms.
      await tester.pump(const Duration(milliseconds: 300));
      expect(slideOffset(tester, key).dy, greaterThan(0));
      expect(slideOffset(tester, key).dy, lessThan(0.3));

      await gesture.up();
      await tester.pump();
      await tester.pump(const Duration(seconds: 3));
    });

    testWidgets('the default keySlide is done after 300ms', (tester) async {
      const key = LogicalKeyboardKey.digit1;
      final controller = buildController();
      await pumpKeyboard(tester, controller);
      expect(slideOffset(tester, key), Offset.zero);

      final gesture =
          await tester.startGesture(tester.getCenter(keyButton(key)));
      await dragDown(tester, gesture);
      await tester.pump(const Duration(milliseconds: 300));
      expect(slideOffset(tester, key).dy, 0.3);

      await gesture.up();
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));
    });
  });
}

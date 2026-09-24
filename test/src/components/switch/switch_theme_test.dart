import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
// The opt-in tap area of `minTapTargetSize`, which is not the size of the
// track of the switch.
import 'package:impaktfull_ui/src/widget/accessibility/min_tap_target.dart';

import '../../../util/test_util.dart';
import '../_inputs_test_helpers.dart';

/// Proves that every size token of `ImpaktfullUiSwitchDimensTheme` really
/// changes what is rendered.

/// Pumps [child] with loose constraints, so the switch takes the size it asks
/// for instead of the size of the screen.
Future<void> _pumpSwitch(WidgetTester tester, Widget child) =>
    pumpAndSettleComponent(
      tester,
      Align(alignment: Alignment.topLeft, child: child),
    );

ImpaktfullUiSwitchTheme get _theme => defaultComponentsTheme.switchTheme;

ImpaktfullUiSwitchTheme _withDimens({
  double? thumbSize,
  double? iconSize,
  double? verticalPadding,
  double? horizontalPadding,
  Size? minTapTargetSize,
}) =>
    _theme.copyWith(
      dimens: _theme.dimens.copyWith(
        thumbSize: thumbSize,
        iconSize: iconSize,
        verticalPadding: verticalPadding,
        horizontalPadding: horizontalPadding,
        minTapTargetSize: minTapTargetSize,
      ),
    );

/// The knob of the switch: the innermost `AnimatedContainer` of the track.
Size _thumbSize(WidgetTester tester) => tester.getSize(
      find
          .descendant(
            of: find.byType(ImpaktfullUiSwitch),
            matching: find.byType(AnimatedContainer),
          )
          .last,
    );

Size _trackSize(WidgetTester tester) => tester.getSize(
      find.descendant(
        of: find.byType(ImpaktfullUiSwitch),
        matching: find.byType(ImpaktfullUiTouchFeedback),
      ),
    );

void main() {
  testWidgets('the default theme keeps the size of the switch', (tester) async {
    await _pumpSwitch(
      tester,
      ImpaktfullUiSwitch(value: false, onChanged: (_) {}),
    );
    expect(_thumbSize(tester), const Size.square(16));
    // `thumbSize` plus the padding of the track: 4 twice high, 4 + 20 wide.
    expect(_trackSize(tester), const Size(40, 24));
  });

  testWidgets('thumbSize is the size of the knob and grows the track',
      (tester) async {
    await _pumpSwitch(
      tester,
      ImpaktfullUiSwitch(
        value: false,
        onChanged: (_) {},
        // Ant Design: a 44 x 22 track with an 18 handle.
        theme: _withDimens(
          thumbSize: 18,
          verticalPadding: 2,
          horizontalPadding: 24,
        ),
      ),
    );
    expect(_thumbSize(tester), const Size.square(18));
    expect(_trackSize(tester), const Size(44, 22));
  });

  testWidgets('thumbSize does not change the tap target of minTapTargetSize',
      (tester) async {
    await _pumpSwitch(
      tester,
      ImpaktfullUiSwitch(
        value: false,
        onChanged: (_) {},
        theme: _withDimens(
          thumbSize: 18,
          minTapTargetSize: const Size.square(48),
        ),
      ),
    );
    expect(_thumbSize(tester), const Size.square(18));
    expect(
      tester.getSize(find.byType(ImpaktfullUiMinTapTarget)),
      const Size.square(48),
    );
  });

  testWidgets('the knob stays inside the track when it is toggled',
      (tester) async {
    final value = ValueNotifier(false);
    addTearDown(value.dispose);
    await _pumpSwitch(
      tester,
      ValueListenableBuilder<bool>(
        valueListenable: value,
        builder: (context, current, child) => ImpaktfullUiSwitch(
          value: current,
          onChanged: (newValue) => value.value = newValue,
          theme: _withDimens(
            thumbSize: 18,
            verticalPadding: 2,
            horizontalPadding: 24,
          ),
        ),
      ),
    );
    final track = tester.getRect(find.byType(ImpaktfullUiTouchFeedback));
    expect(tester.getRect(_thumbFinder()).left - track.left, 2);
    value.value = true;
    await tester.pumpAndSettle();
    expect(track.right - tester.getRect(_thumbFinder()).right, 2);
  });

  testWidgets('iconSize is the size of the icon of the knob', (tester) async {
    tester.platformDispatcher.accessibilityFeaturesTestValue =
        FakeAccessibilityFeatures.allOn;
    addTearDown(tester.platformDispatcher.clearAccessibilityFeaturesTestValue);
    await _pumpSwitch(
      tester,
      ImpaktfullUiSwitch(
        value: true,
        onChanged: (_) {},
        theme: _withDimens(thumbSize: 24, iconSize: 20),
      ),
    );
    final icons = tester.widgetList<ImpaktfullUiAssetWidget>(
      find.byType(ImpaktfullUiAssetWidget),
    );
    expect(icons, isNotEmpty);
    expect(icons.map((icon) => icon.size), everyElement(20.0));
  });
}

Finder _thumbFinder() => find
    .descendant(
      of: find.byType(ImpaktfullUiSwitch),
      matching: find.byType(AnimatedContainer),
    )
    .last;

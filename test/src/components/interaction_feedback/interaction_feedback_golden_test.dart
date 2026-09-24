import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';
import '../_overlays_golden_helpers.dart';

const _box = SizedBox(
  width: 120,
  height: 48,
  child: Center(child: Text('Child')),
);

/// Some space around the child: the focus ring is drawn outside of it.
Widget _padded(Widget child) => Padding(
      padding: const EdgeInsets.all(8),
      child: child,
    );

/// More space around the child: an outer ring needs room for its offset.
Widget _paddedLarge(Widget child) => Padding(
      padding: const EdgeInsets.all(16),
      child: child,
    );

/// A child with a border of its own, to show where the ring is drawn.
Widget _bordered(Widget child) => Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE5E5E5)),
      ),
      child: child,
    );

void main() {
  setUp(() => setupComponentTest());

  runComponentTest(
    fileName: 'impaktfull_ui_focus_feedback',
    columns: 3,
    goldenTests: () => [
      GoldenTest(
        description: 'Focused',
        child: _padded(
          ImpaktfullUiFocusFeedback(
            hasFocus: true,
            borderRadius: BorderRadius.circular(8),
            child: _box,
          ),
        ),
      ),
      GoldenTest(
        description: 'Not focused',
        child: _padded(
          ImpaktfullUiFocusFeedback(
            hasFocus: false,
            borderRadius: BorderRadius.circular(8),
            child: _box,
          ),
        ),
      ),
      GoldenTest(
        description: 'Disabled',
        child: _padded(
          const ImpaktfullUiFocusFeedback(
            hasFocus: true,
            enabled: false,
            child: _box,
          ),
        ),
      ),
    ],
  );

  runComponentTest(
    fileName: 'impaktfull_ui_touch_feedback',
    columns: 2,
    goldenTests: () => [
      GoldenTest(
        description: 'Transparent',
        child: _padded(ImpaktfullUiTouchFeedback(onTap: () {}, child: _box)),
      ),
      GoldenTest(
        description: 'Color and border radius',
        child: _padded(
          ImpaktfullUiTouchFeedback(
            onTap: () {},
            color: Colors.amber,
            borderRadius: BorderRadius.circular(16),
            child: _box,
          ),
        ),
      ),
      GoldenTest(
        description: 'Border and shadow',
        child: _padded(
          ImpaktfullUiTouchFeedback(
            onTap: () {},
            color: Colors.white,
            border: Border.all(color: Colors.blue, width: 2),
            borderRadius: BorderRadius.circular(8),
            shadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 8,
                offset: Offset(0, 2),
              ),
            ],
            child: _box,
          ),
        ),
      ),
      GoldenTest(
        description: 'Not tappable',
        child: _padded(
          ImpaktfullUiTouchFeedback(
            onTap: null,
            color: Colors.grey,
            borderRadius: BorderRadius.circular(8),
            child: _box,
          ),
        ),
      ),
    ],
  );

  runComponentTest(
    fileName: 'impaktfull_ui_focus_feedback_theme',
    columns: 3,
    goldenTests: () => [
      GoldenTest(
        description: 'Default ring',
        child: _paddedLarge(
          ImpaktfullUiFocusFeedback(
            hasFocus: true,
            borderRadius: BorderRadius.circular(8),
            child: _bordered(_box),
          ),
        ),
      ),
      GoldenTest(
        // shadcn's ring: 3px, translucent, and an offset that keeps it away
        // from the border of the component itself.
        description: 'Outer ring',
        child: _paddedLarge(
          ImpaktfullUiFocusFeedback(
            hasFocus: true,
            borderRadius: BorderRadius.circular(8),
            theme: const ImpaktfullUiFocusRingTheme(
              color: Color(0x80A1A1A1),
              width: 3,
              offset: 3,
            ),
            child: _bordered(_box),
          ),
        ),
      ),
      GoldenTest(
        // A ring over the border of the component itself.
        description: 'Ring on the border',
        child: _paddedLarge(
          ImpaktfullUiFocusFeedback(
            hasFocus: true,
            borderRadius: BorderRadius.circular(8),
            theme: const ImpaktfullUiFocusRingTheme(
              color: Color(0xFF1677FF),
              width: 2,
              offset: -2,
            ),
            child: _bordered(_box),
          ),
        ),
      ),
    ],
  );

  runOverlayGoldenTest(
    fileName: 'impaktfull_ui_hover_feedback_hovered',
    builder: () => ImpaktfullUiHoverFeedback(
      builder: (context, isHovered) => Container(
        width: 160,
        height: 48,
        color: isHovered ? Colors.blue : Colors.grey,
        alignment: Alignment.center,
        child: Text(isHovered ? 'Hovered' : 'Not hovered'),
      ),
    ),
    whilePerforming: (tester) async {
      final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
      await gesture.addPointer(location: Offset.zero);
      await gesture.moveTo(tester.getCenter(find.byType(Container).last));
      await tester.pumpAndSettle();
      return gesture.removePointer;
    },
  );
}

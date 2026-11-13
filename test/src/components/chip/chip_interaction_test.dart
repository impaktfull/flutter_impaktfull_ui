import 'package:material_ui/material_ui.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';

void main() {
  final chipTheme = ImpaktfullUiTheme.getDefault().components.chip;

  testWidgets('onTap is called on tap', (tester) async {
    var taps = 0;
    await pumpAndSettleComponent(
      tester,
      Center(
        child: ImpaktfullUiChip(
          title: 'Unread',
          value: false,
          onTap: () => taps++,
        ),
      ),
    );
    await tester.tap(find.text('Unread'));
    expect(taps, 1);
  });

  testWidgets('a disabled chip (onTap: null) does nothing and is faded',
      (tester) async {
    await pumpAndSettleComponent(
      tester,
      const Center(
        child: ImpaktfullUiChip(title: 'Unread', value: true, onTap: null),
      ),
    );
    await tester.tap(find.text('Unread'), warnIfMissed: false);
    final opacity = tester.widget<Opacity>(
      find.descendant(
        of: find.byType(ImpaktfullUiChip),
        matching: find.byType(Opacity),
      ),
    );
    expect(opacity.opacity, chipTheme.dimens.disabledOpacity);
  });

  testWidgets('an enabled chip is not faded', (tester) async {
    await pumpAndSettleComponent(
      tester,
      Center(
        child: ImpaktfullUiChip(title: 'Unread', value: false, onTap: () {}),
      ),
    );
    final opacity = tester.widget<Opacity>(
      find.descendant(
        of: find.byType(ImpaktfullUiChip),
        matching: find.byType(Opacity),
      ),
    );
    expect(opacity.opacity, 1);
  });

  for (final value in [false, true]) {
    testWidgets(
        'the title has the ${value ? 'selected' : 'unselected'} text color',
        (tester) async {
      await pumpAndSettleComponent(
        tester,
        Center(
          child: ImpaktfullUiChip(
            title: 'Unread',
            value: value,
            leading: const ImpaktfullUiAsset.icon(Icons.star),
            onTap: () {},
          ),
        ),
      );
      final expected =
          value ? chipTheme.colors.textSelected : chipTheme.colors.text;
      expect(tester.widget<Text>(find.text('Unread')).style?.color, expected);
      expect(tester.widget<Icon>(find.byIcon(Icons.star)).color, expected);
    });
  }

  testWidgets('the leading asset is shown before the title', (tester) async {
    await pumpAndSettleComponent(
      tester,
      Center(
        child: ImpaktfullUiChip(
          title: 'Starred',
          value: false,
          leading: const ImpaktfullUiAsset.icon(Icons.star),
          onTap: () {},
        ),
      ),
    );
    final icon = tester.getRect(find.byIcon(Icons.star));
    final title = tester.getRect(find.text('Starred'));
    expect(icon.right, lessThanOrEqualTo(title.left));
    expect(icon.width, chipTheme.dimens.iconSize);
    expect(title.left - icon.right, closeTo(chipTheme.dimens.spacing, 0.01));
  });

  testWidgets('is at least minHeight high', (tester) async {
    await pumpAndSettleComponent(
      tester,
      Center(
        child: ImpaktfullUiChip(title: 'Unread', value: false, onTap: () {}),
      ),
    );
    expect(
      tester.getSize(find.byType(ImpaktfullUiChip)).height,
      chipTheme.dimens.minHeight,
    );
  });

  testWidgets('keeps the width of its title in an unbounded width',
      (tester) async {
    await pumpAndSettleComponent(
      tester,
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: ImpaktfullUiChip(
          title: 'A title that would not fit on the screen when it is '
              'repeated, repeated, repeated, repeated, repeated and repeated',
          value: false,
          onTap: () {},
        ),
      ),
    );
    expect(tester.takeException(), isNull);
    expect(
        tester.getSize(find.byType(ImpaktfullUiChip)).width, greaterThan(800));
  });

  testWidgets('truncates a long title in a bounded width', (tester) async {
    await pumpAndSettleComponent(
      tester,
      Center(
        child: SizedBox(
          width: 120,
          child: ImpaktfullUiChip(
            title: 'With attachments from last week',
            value: false,
            onTap: () {},
          ),
        ),
      ),
    );
    expect(tester.takeException(), isNull);
    expect(tester.getSize(find.byType(ImpaktfullUiChip)).width,
        lessThanOrEqualTo(120));
  });

  testWidgets('minTapTargetSize makes the tap area bigger', (tester) async {
    var taps = 0;
    await pumpAndSettleComponent(
      tester,
      Center(
        child: ImpaktfullUiChip(
          title: 'Unread',
          value: false,
          onTap: () => taps++,
          theme: chipTheme.copyWith(
            dimens: chipTheme.dimens
                .copyWith(minTapTargetSize: const Size.square(48)),
          ),
        ),
      ),
    );
    final size = tester.getSize(find.byType(ImpaktfullUiChip));
    expect(size.height, 48);
    // Above the visible chip, inside the tap area.
    final chip = tester.getRect(find.byType(ImpaktfullUiTouchFeedback));
    await tester.tapAt(Offset(chip.center.dx, chip.top - 4));
    expect(taps, 1);
  });

  testWidgets('a theme passed to the chip wins over the theme of the app',
      (tester) async {
    await pumpAndSettleComponent(
      tester,
      Center(
        child: ImpaktfullUiChip(
          title: 'Unread',
          value: true,
          onTap: () {},
          theme: chipTheme.copyWith(
            colors: chipTheme.colors.copyWith(textSelected: Colors.red),
          ),
        ),
      ),
    );
    expect(tester.widget<Text>(find.text('Unread')).style?.color, Colors.red);
  });

  for (final key in [LogicalKeyboardKey.enter, LogicalKeyboardKey.space]) {
    testWidgets('${key.keyLabel} on the focused chip calls onTap',
        (tester) async {
      var taps = 0;
      await pumpAndSettleComponent(
        tester,
        Center(
          child: ImpaktfullUiChip(
            title: 'Unread',
            value: false,
            onTap: () => taps++,
          ),
        ),
      );
      await tester.sendKeyEvent(LogicalKeyboardKey.tab);
      await tester.pump();
      await tester.sendKeyEvent(key);
      await tester.pumpAndSettle();
      expect(taps, 1);
    });
  }
}

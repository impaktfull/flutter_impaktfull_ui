import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
// The opt-in tap area of `minTapTargetSize`: it is the only widget whose size
// tells the two apart from the size of the box of the checkbox.
import 'package:impaktfull_ui/src/widget/accessibility/min_tap_target.dart';

import '../../../util/test_util.dart';
import '../_inputs_test_helpers.dart';

/// Proves that every size token of `ImpaktfullUiCheckboxDimensTheme` really
/// changes what is rendered.

ImpaktfullUiCheckboxTheme get _theme => defaultComponentsTheme.checkbox;

ImpaktfullUiCheckboxTheme _withDimens({
  double? size,
  double? iconSize,
  double? borderWidth,
  double? activeBorderWidth,
  Size? minTapTargetSize,
}) =>
    _theme.copyWith(
      dimens: _theme.dimens.copyWith(
        size: size,
        iconSize: iconSize,
        borderWidth: borderWidth,
        activeBorderWidth: activeBorderWidth,
        minTapTargetSize: minTapTargetSize,
      ),
    );

/// The box of the checkbox: the `SizedBox` that holds its border and its mark.
Finder _box() => find
    .descendant(
      of: find.byType(ImpaktfullUiCheckbox),
      matching: find.byType(SizedBox),
    )
    .first;

Size _boxSize(WidgetTester tester) => tester.getSize(_box());

/// The borders the box draws: the resting one first, the active one on top.
List<BorderSide> _borders(WidgetTester tester) => tester
    .widgetList<Container>(
      find.descendant(of: _box(), matching: find.byType(Container)),
    )
    .map((container) => container.decoration)
    .whereType<BoxDecoration>()
    .map((decoration) => decoration.border?.top)
    .whereType<BorderSide>()
    .toList();

void main() {
  testWidgets('the default theme keeps the size of the checkbox',
      (tester) async {
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiCheckbox(value: false, onChanged: (_) {}),
    );
    expect(_boxSize(tester), const Size.square(24));
  });

  testWidgets('size is the width and the height of the box', (tester) async {
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiCheckbox(
        value: false,
        onChanged: (_) {},
        // What both shadcn/ui (`size-4`) and Ant Design
        // (`controlInteractiveSize`) use.
        theme: _withDimens(size: 16),
      ),
    );
    expect(_boxSize(tester), const Size.square(16));
  });

  testWidgets('size does not change the tap target of minTapTargetSize',
      (tester) async {
    await pumpAndSettleComponent(
      tester,
      Center(
        child: ImpaktfullUiCheckbox(
          value: false,
          onChanged: (_) {},
          theme: _withDimens(size: 16, minTapTargetSize: const Size.square(48)),
        ),
      ),
    );
    expect(_boxSize(tester), const Size.square(16));
    expect(
      tester.getSize(find.byType(ImpaktfullUiMinTapTarget)),
      const Size.square(48),
    );
  });

  testWidgets('iconSize is the size of the check mark', (tester) async {
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiCheckbox(
        value: true,
        onChanged: (_) {},
        theme: _withDimens(size: 16, iconSize: 14),
      ),
    );
    expect(
      tester.getSize(find.byType(ImpaktfullUiAssetWidget)),
      const Size.square(14),
    );
  });

  testWidgets('iconSize is the size of the indeterminate mark', (tester) async {
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiCheckbox.indeterminate(
        value: null,
        onChanged: (_) {},
        theme: _withDimens(iconSize: 12),
      ),
    );
    expect(
      tester.getSize(find.byType(ImpaktfullUiAssetWidget)),
      const Size.square(12),
    );
  });

  testWidgets('borderWidth is the width of the border of the box',
      (tester) async {
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiCheckbox(
        value: false,
        onChanged: (_) {},
        theme: _withDimens(borderWidth: 3),
      ),
    );
    expect(_borders(tester).first.width, 3);
    expect(_borders(tester).first.color, _theme.colors.borderColor);
  });

  testWidgets('activeBorderWidth is the width of the border of a checked box',
      (tester) async {
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiCheckbox(
        value: true,
        onChanged: (_) {},
        theme: _withDimens(activeBorderWidth: 4),
      ),
    );
    final borders = _borders(tester);
    expect(borders.last.width, 4);
    expect(borders.last.color, _theme.colors.activeColor);
  });

  testWidgets('the default theme keeps the border widths of the box',
      (tester) async {
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiCheckbox(value: true, onChanged: (_) {}),
    );
    expect(_borders(tester).map((border) => border.width), [1, 2]);
  });
}

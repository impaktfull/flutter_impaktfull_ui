import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';
import '../_inputs_test_helpers.dart';

/// Freezes what the size and state tokens of `ImpaktfullUiInputFieldTheme` do:
/// a field whose height is declared instead of derived, and a focused field
/// with a border and a ring of its own.
void main() {
  setUp(() => setupComponentTest());

  final theme = defaultComponentsTheme.inputField;

  /// A field of Ant Design's `controlHeight: 32` with `paddingInline: 11`.
  ImpaktfullUiInputFieldTheme antSized() => theme.copyWith(
        dimens: theme.dimens.copyWith(
          minHeight: 32,
          contentPadding: EdgeInsets.zero,
          padding: const EdgeInsetsDirectional.only(start: 11, end: 11),
        ),
      );

  /// A field of shadcn/ui's `h-9` with `px-3`.
  ImpaktfullUiInputFieldTheme shadcnSized() => theme.copyWith(
        dimens: theme.dimens.copyWith(
          minHeight: 36,
          contentPadding: EdgeInsets.zero,
          padding: const EdgeInsetsDirectional.only(start: 12, end: 12),
        ),
      );

  runComponentTest(
    fileName: 'impaktfull_ui_input_field_theme',
    columns: 2,
    goldenTests: () => [
      GoldenTest(
        description: 'default',
        child: goldenSized(ImpaktfullUiInputField(
          label: 'Default',
          value: 'The height comes from the padding',
          onChanged: (_) {},
        )),
      ),
      GoldenTest(
        description: 'minHeight 32',
        child: goldenSized(ImpaktfullUiInputField(
          label: 'minHeight 32',
          value: 'A declared height',
          onChanged: (_) {},
          theme: antSized(),
        )),
      ),
      GoldenTest(
        description: 'minHeight 36',
        child: goldenSized(ImpaktfullUiInputField(
          label: 'minHeight 36',
          value: 'A declared height',
          onChanged: (_) {},
          theme: shadcnSized(),
        )),
      ),
      GoldenTest(
        description: 'minHeight 64',
        child: goldenSized(ImpaktfullUiInputField(
          label: 'minHeight 64',
          value: 'A taller field',
          onChanged: (_) {},
          theme: theme.copyWith(
            dimens: theme.dimens.copyWith(minHeight: 64),
          ),
        )),
      ),
      GoldenTest(
        description: 'borderWidth 2 and a thick icon',
        child: goldenSized(ImpaktfullUiInputField(
          label: 'borderWidth 2',
          value: 'A 2px border',
          leadingIcon: ImpaktfullUiTheme.getDefault().assets.icons.search,
          onChanged: (_) {},
          theme: theme.copyWith(
            dimens: theme.dimens.copyWith(borderWidth: 2, iconSize: 28),
          ),
        )),
      ),
      GoldenTest(
        description: 'a focused border and ring',
        // The only autofocus field of the group: two fields cannot hold the
        // focus at the same time.
        child: goldenSized(ImpaktfullUiInputField(
          label: 'Focused',
          value: 'A border and a ring on focus',
          autofocus: true,
          onChanged: (_) {},
          theme: antSized().copyWith(
            colors: theme.colors.copyWith(
              borderFocused: const Color(0xFF1677FF),
              // Ant Design's `activeShadow` is `rgba(5,145,255,0.1)`; the
              // golden uses a visible alpha, so the ring shows in the image.
              focusRing: const Color(0x660591FF),
            ),
            dimens: antSized().dimens.copyWith(focusRingWidth: 3),
          ),
        )),
      ),
    ],
  );
}

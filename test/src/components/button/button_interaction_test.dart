import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';
import '../_inputs_test_helpers.dart';

void main() {
  Finder touchFeedback() => find.descendant(
        of: find.byType(ImpaktfullUiButton),
        matching: find.byType(ImpaktfullUiTouchFeedback),
      );

  group('onTap', () {
    testWidgets('is called once for every tap', (tester) async {
      var taps = 0;
      await pumpAndSettleComponent(
        tester,
        ImpaktfullUiButton(
          type: ImpaktfullUiButtonType.primary,
          title: 'Save',
          onTap: () => taps++,
        ),
      );
      await tester.tap(find.text('Save'));
      await tester.pump();
      expect(taps, 1);
      await tester.tap(find.text('Save'));
      await tester.pump();
      expect(taps, 2);
    });

    for (final type in ImpaktfullUiButtonType.values) {
      testWidgets('works for the $type type', (tester) async {
        var taps = 0;
        await pumpAndSettleComponent(
          tester,
          ImpaktfullUiButton(
            type: type,
            title: 'Save',
            onTap: () => taps++,
          ),
        );
        await tester.tap(find.text('Save'));
        await tester.pump();
        expect(taps, 1);
      });
    }

    testWidgets('a button without onTap and onAsyncTap is disabled',
        (tester) async {
      await pumpAndSettleComponent(
        tester,
        const ImpaktfullUiButton(
          type: ImpaktfullUiButtonType.primary,
          title: 'Save',
        ),
      );
      final opacity = tester.widget<Opacity>(find
          .descendant(
            of: find.byType(ImpaktfullUiButton),
            matching: find.byType(Opacity),
          )
          .first);
      expect(opacity.opacity, 0.5);
      expect(tester.widget<ImpaktfullUiTouchFeedback>(touchFeedback()).onTap,
          isNull);
      await tester.tap(find.text('Save'), warnIfMissed: false);
      await tester.pump();
      expect(tester.takeException(), isNull);
    });

    testWidgets('onTap is used again after the parent enables the button',
        (tester) async {
      var taps = 0;
      final enabled = ValueNotifier(false);
      await pumpAndSettleComponent(
        tester,
        ValueListenableBuilder<bool>(
          valueListenable: enabled,
          builder: (context, isEnabled, child) => ImpaktfullUiButton(
            type: ImpaktfullUiButtonType.primary,
            title: 'Save',
            onTap: isEnabled ? () => taps++ : null,
          ),
        ),
      );
      await tester.tap(find.text('Save'), warnIfMissed: false);
      await tester.pump();
      expect(taps, 0);

      enabled.value = true;
      await tester.pumpAndSettle();
      await tester.tap(find.text('Save'));
      await tester.pump();
      expect(taps, 1);
    });
  });

  group('onAsyncTap', () {
    testWidgets('an error does not keep the button loading', (tester) async {
      var taps = 0;
      await pumpComponent(
        tester,
        ImpaktfullUiButton(
          type: ImpaktfullUiButtonType.primary,
          title: 'Save',
          onAsyncTap: () async {
            taps++;
            throw Exception('failed');
          },
        ),
      );
      final originalDebugPrint = debugPrint;
      debugPrint = (message, {wrapWidth}) {};
      await tester.tap(find.text('Save'));
      await tester.pump();
      await tester.pump();
      expect(find.byType(ImpaktfullUiLoadingIndicator), findsNothing);
      await tester.tap(find.text('Save'));
      await tester.pump();
      await tester.pump();
      debugPrint = originalDebugPrint;
      expect(taps, 2);
    });

    testWidgets('disposing while running does not throw', (tester) async {
      final completer = Completer<void>();
      await pumpComponent(
        tester,
        ImpaktfullUiButton(
          type: ImpaktfullUiButtonType.primary,
          title: 'Save',
          onAsyncTap: () => completer.future,
        ),
      );
      await tester.tap(find.text('Save'));
      await tester.pump();
      await pumpComponent(tester, const SizedBox());
      completer.complete();
      await tester.pump();
      expect(tester.takeException(), isNull);
    });
  });

  testWidgets('isLoading from the parent is updated', (tester) async {
    final isLoading = ValueNotifier(true);
    await pumpComponent(
      tester,
      ValueListenableBuilder<bool>(
        valueListenable: isLoading,
        builder: (context, loading, child) => ImpaktfullUiButton(
          type: ImpaktfullUiButtonType.primary,
          title: 'Save',
          isLoading: loading,
          onTap: () {},
        ),
      ),
    );
    expect(find.byType(ImpaktfullUiLoadingIndicator), findsOneWidget);
    isLoading.value = false;
    await tester.pumpAndSettle();
    expect(find.byType(ImpaktfullUiLoadingIndicator), findsNothing);
  });

  group('keyboard', () {
    for (final key in [LogicalKeyboardKey.enter, LogicalKeyboardKey.space]) {
      testWidgets('${key.keyLabel} activates the focused button',
          (tester) async {
        var taps = 0;
        await pumpAndSettleComponent(
          tester,
          ImpaktfullUiButton(
            type: ImpaktfullUiButtonType.primary,
            title: 'Save',
            onTap: () => taps++,
          ),
        );
        await tester.sendKeyEvent(LogicalKeyboardKey.tab);
        await tester.pump();
        await tester.sendKeyEvent(key);
        await tester.pump();
        expect(taps, 1);
      });
    }

    testWidgets('canRequestFocus false can not be focused', (tester) async {
      var taps = 0;
      await pumpAndSettleComponent(
        tester,
        ImpaktfullUiButton(
          type: ImpaktfullUiButtonType.primary,
          title: 'Save',
          canRequestFocus: false,
          onTap: () => taps++,
        ),
      );
      await tester.sendKeyEvent(LogicalKeyboardKey.tab);
      await tester.pump();
      await tester.sendKeyEvent(LogicalKeyboardKey.enter);
      await tester.pump();
      expect(taps, 0);
    });

    group(
      'raised',
      () {
        testWidgets('a raised button can be activated with the keyboard',
            (tester) async {
          var taps = 0;
          await pumpAndSettleComponent(
            tester,
            ImpaktfullUiButton(
              type: ImpaktfullUiButtonType.primary,
              title: 'Save',
              theme: defaultComponentsTheme.button.copyWith(
                config: const ImpaktfullUiButtonConfig(isRaised: true),
              ),
              onTap: () => taps++,
            ),
          );
          await tester.sendKeyEvent(LogicalKeyboardKey.tab);
          await tester.pump();
          await tester.sendKeyEvent(LogicalKeyboardKey.enter);
          await tester.pump();
          expect(taps, 1);
        });
      },
    );
  });

  testWidgets('a raised button calls onTap when tapped', (tester) async {
    var taps = 0;
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiButton(
        type: ImpaktfullUiButtonType.primary,
        title: 'Save',
        theme: defaultComponentsTheme.button.copyWith(
          config: const ImpaktfullUiButtonConfig(isRaised: true),
        ),
        onTap: () => taps++,
      ),
    );
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();
    expect(taps, 1);
  });

  testWidgets('shows the leading and trailing assets', (tester) async {
    final trailing = ImpaktfullUiAsset.icon(Icons.abc);
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiButton(
        type: ImpaktfullUiButtonType.primary,
        title: 'Save',
        leadingAsset: customTestAsset,
        trailingAsset: trailing,
        onTap: () {},
      ),
    );
    expect(
        find.byWidgetPredicate(isAssetWidget(customTestAsset)), findsOneWidget);
    expect(find.byWidgetPredicate(isAssetWidget(trailing)), findsOneWidget);
  });

  testWidgets('shows the tooltip', (tester) async {
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiButton(
        type: ImpaktfullUiButtonType.primary,
        title: 'Save',
        tooltip: 'Save the file',
        onTap: () {},
      ),
    );
    expect(tester.widget<ImpaktfullUiTouchFeedback>(touchFeedback()).tooltip,
        'Save the file');
  });

  testWidgets('the theme override is used', (tester) async {
    final theme = defaultComponentsTheme.button;
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiButton(
        type: ImpaktfullUiButtonType.primary,
        title: 'Save',
        theme: theme.copyWith(
          colors: theme.colors.copyWith(primary: customTestColor),
          textStyles: theme.textStyles.copyWith(
            primary: theme.textStyles.primary.copyWith(color: customTestColor),
          ),
        ),
        onTap: () {},
      ),
    );
    expect(tester.widget<ImpaktfullUiTouchFeedback>(touchFeedback()).color,
        customTestColor);
    expect(
        tester.widget<Text>(find.text('Save')).style?.color, customTestColor);
  });
}

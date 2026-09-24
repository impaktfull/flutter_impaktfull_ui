import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/font_loader.dart';

/// Proves that the barrier of a modal is themeable: its color and the blur of
/// the page below it. The defaults are the hardcoded values from before the
/// tokens existed: `Colors.black54` and a sigma of 8.

/// The theme with [barrier] and [barrierBlurSigma] on its modal theme.
ImpaktfullUiTheme _themeWithBarrier({
  Color? barrier,
  double? barrierBlurSigma,
}) {
  final theme = ImpaktfullUiTheme.getDefault();
  final modal = theme.components.modal;
  return theme.copyWith(
    components: theme.components.copyWith(
      modal: modal.copyWith(
        colors: modal.colors.copyWith(barrier: barrier),
        dimens: modal.dimens.copyWith(barrierBlurSigma: barrierBlurSigma),
      ),
    ),
  );
}

/// Pumps an app with [theme] and shows a modal in it.
Future<void> _showModal(
  WidgetTester tester, {
  ImpaktfullUiTheme? theme,
  bool hasBlurredBackground = false,
}) async {
  late BuildContext appContext;
  await tester.pumpWidget(
    ImpaktfullUiApp(
      showDebugFlag: false,
      title: 'test',
      impaktfullUiTheme: theme,
      home: Builder(
        builder: (context) {
          appContext = context;
          return const SizedBox.expand();
        },
      ),
    ),
  );
  await tester.pumpAndSettle();
  unawaited(ImpaktfullUiModal.showSimple<void>(
    context: appContext,
    title: 'Title',
    hasBlurredBackground: hasBlurredBackground,
  ));
  await tester.pumpAndSettle();
}

/// The color of the barrier behind the modal.
Color? _barrierColor(WidgetTester tester) => tester
    .widget<AnimatedModalBarrier>(find.byType(AnimatedModalBarrier))
    .color
    .value;

void main() {
  setUpAll(() async => loadImpaktfullUiFonts());

  group('barrier', () {
    testWidgets('is Colors.black54 by default', (tester) async {
      await _showModal(tester);
      expect(_barrierColor(tester), Colors.black54);
      expect(
        ImpaktfullUiTheme.getDefault().components.modal.colors.barrier,
        Colors.black54,
      );
    });

    testWidgets('of the theme is the color of the barrier', (tester) async {
      await _showModal(
        tester,
        theme: _themeWithBarrier(barrier: const Color(0x80FF0000)),
      );
      expect(_barrierColor(tester), const Color(0x80FF0000));
    });

    testWidgets('is not painted when it is transparent', (tester) async {
      // A fully transparent barrier color makes Flutter skip the animated
      // barrier: nothing is painted behind the modal.
      await _showModal(
        tester,
        theme: _themeWithBarrier(barrier: Colors.transparent),
      );
      expect(find.byType(AnimatedModalBarrier), findsNothing);
    });
  });

  group('barrierBlurSigma', () {
    testWidgets('is 8 by default', (tester) async {
      await _showModal(tester, hasBlurredBackground: true);
      expect(
        tester.widget<BackdropFilter>(find.byType(BackdropFilter)).filter,
        ImageFilter.blur(sigmaX: 8, sigmaY: 8),
      );
      expect(
        ImpaktfullUiTheme.getDefault().components.modal.dimens.barrierBlurSigma,
        8,
      );
    });

    testWidgets('of the theme is how much the page below is blurred',
        (tester) async {
      await _showModal(
        tester,
        hasBlurredBackground: true,
        theme: _themeWithBarrier(barrierBlurSigma: 24),
      );
      expect(
        tester.widget<BackdropFilter>(find.byType(BackdropFilter)).filter,
        ImageFilter.blur(sigmaX: 24, sigmaY: 24),
      );
    });

    testWidgets('is not used without hasBlurredBackground', (tester) async {
      await _showModal(tester, theme: _themeWithBarrier(barrierBlurSigma: 24));
      expect(find.byType(BackdropFilter), findsNothing);
    });
  });

  group('the theme classes', () {
    test('copyWith changes the barrier and keeps the other colors', () {
      final colors = ImpaktfullUiTheme.getDefault().components.modal.colors;
      final changed = colors.copyWith(barrier: const Color(0xFF00FF00));
      expect(changed.barrier, const Color(0xFF00FF00));
      expect(changed.background, colors.background);
      expect(colors.copyWith(), colors);
    });

    test('copyWith changes the blur and keeps the other dimens', () {
      final dimens = ImpaktfullUiTheme.getDefault().components.modal.dimens;
      final changed = dimens.copyWith(barrierBlurSigma: 2);
      expect(changed.barrierBlurSigma, 2);
      expect(changed.padding, dimens.padding);
      expect(dimens.copyWith(), dimens);
    });

    test('compare by value', () {
      final colors = ImpaktfullUiTheme.getDefault().components.modal.colors;
      expect(colors.copyWith(barrier: const Color(0xFF00FF00)),
          isNot(colors.copyWith()));
      final dimens = ImpaktfullUiTheme.getDefault().components.modal.dimens;
      expect(dimens.copyWith(barrierBlurSigma: 2), isNot(dimens.copyWith()));
    });
  });
}

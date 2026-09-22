import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

/// Pumps [child] in an [ImpaktfullUiApp], optionally with the "reduce
/// motion" setting of the platform ([disableAnimations]) and a [theme].
Future<void> pumpAccessibilityApp(
  WidgetTester tester,
  Widget child, {
  bool disableAnimations = false,
  bool settle = true,
  ImpaktfullUiTheme? theme,
  ImpaktfullUiLocalizations localizations = const ImpaktfullUiLocalizations(),
  TextDirection textDirection = TextDirection.ltr,
}) async {
  await tester.pumpWidget(
    ImpaktfullUiApp(
      showDebugFlag: false,
      title: 'impaktfull app',
      impaktfullUiTheme: theme,
      localizations: localizations,
      home: Builder(
        builder: (context) => MediaQuery(
          data: MediaQuery.of(context).copyWith(
            disableAnimations:
                disableAnimations || MediaQuery.of(context).disableAnimations,
          ),
          child: Directionality(
            textDirection: textDirection,
            child: ImpaktfullUiContainer(
              color: Colors.white,
              child: child,
            ),
          ),
        ),
      ),
    ),
  );
  if (settle) {
    await tester.pumpAndSettle();
  } else {
    await tester.pump();
  }
}

/// The semantics node of the first [Semantics] widget in [of]: the node of a
/// component that wraps its content in `Semantics(container: true, ...)`.
SemanticsNode semanticsOf(WidgetTester tester, Finder of) =>
    tester.getSemantics(
      find.descendant(of: of, matching: find.byType(Semantics)).first,
    );

/// The default theme with a 48x48 tap target for checkboxes, radio buttons
/// and switches.
ImpaktfullUiTheme themeWithMinTapTargets() {
  final theme = ImpaktfullUiTheme.getDefault();
  final components = theme.components;
  return theme.copyWith(
    components: components.copyWith(
      checkbox: components.checkbox.copyWith(
        dimens: components.checkbox.dimens
            .copyWith(minTapTargetSize: const Size.square(48)),
      ),
      radioButton: components.radioButton.copyWith(
        dimens: components.radioButton.dimens
            .copyWith(minTapTargetSize: const Size.square(48)),
      ),
      switchTheme: components.switchTheme.copyWith(
        dimens: components.switchTheme.dimens
            .copyWith(minTapTargetSize: const Size.square(48)),
      ),
    ),
  );
}

/// The semantics node with [label].
SemanticsNode semanticsWithLabel(String label) =>
    find.semantics.byLabel(label).evaluate().single;

/// A finder for the semantics nodes with [tooltip].
SemanticsFinder findSemanticsByTooltip(String tooltip) =>
    find.semantics.byPredicate((node) => node.tooltip == tooltip);

/// The semantics node with [tooltip].
SemanticsNode semanticsWithTooltip(String tooltip) =>
    findSemanticsByTooltip(tooltip).evaluate().single;

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

/// The logical screen size of a phone, used by the building block goldens.
const phoneSize = Size(390, 844);

/// The logical screen size of a desktop, used by the building block goldens.
const desktopSize = Size(1280, 800);

/// Pumps [home] in an [ImpaktfullUiApp] and waits for the animations to
/// settle.
Future<void> pumpImpaktfullUiApp(
  WidgetTester tester,
  Widget home, {
  ImpaktfullUiTheme? theme,
  ImpaktfullUiLocalizations localizations = const ImpaktfullUiLocalizations(),
  List<ImpaktfullUiOverridableComponent<Widget, ImpaktfullUiComponentTheme>>
      overrideComponents = const [],
  List<NavigatorObserver> navigatorObservers = const [],
  Size? screenSize,
  bool settle = true,
}) async {
  if (screenSize != null) {
    tester.view.physicalSize = screenSize;
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
  }
  await tester.pumpWidget(
    ImpaktfullUiApp(
      showDebugFlag: false,
      title: 'impaktfull app',
      impaktfullUiTheme: theme,
      localizations: localizations,
      overrideComponents: overrideComponents,
      navigatorObservers: navigatorObservers,
      home: home,
    ),
  );
  if (settle) {
    await tester.pumpAndSettle();
  } else {
    await tester.pump();
  }
}

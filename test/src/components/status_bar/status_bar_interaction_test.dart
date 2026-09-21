import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

void main() {
  Future<SystemUiOverlayStyle> pump(
    WidgetTester tester,
    ImpaktfullUiStatusBar statusBar,
  ) async {
    await tester.pumpWidget(statusBar);
    return tester
        .widget<AnnotatedRegion<SystemUiOverlayStyle>>(
            find.byType(AnnotatedRegion<SystemUiOverlayStyle>))
        .value;
  }

  // `isDark` means dark status bar icons (for a light background).
  final dark = SystemUiOverlayStyle.dark
      .copyWith(systemNavigationBarColor: Colors.transparent);
  final light = SystemUiOverlayStyle.light
      .copyWith(systemNavigationBarColor: Colors.transparent);

  testWidgets('dark', (tester) async {
    expect(
      await pump(tester, const ImpaktfullUiStatusBar.dark(child: SizedBox())),
      dark,
    );
  });

  testWidgets('light', (tester) async {
    expect(
      await pump(tester, const ImpaktfullUiStatusBar.light(child: SizedBox())),
      light,
    );
  });

  testWidgets('custom', (tester) async {
    expect(
      await pump(
        tester,
        const ImpaktfullUiStatusBar.custom(isDark: false, child: SizedBox()),
      ),
      light,
    );
    expect(
      await pump(
        tester,
        const ImpaktfullUiStatusBar.custom(isDark: true, child: SizedBox()),
      ),
      dark,
    );
  });

  final backgroundCases = <Color, String>{
    Colors.white: 'dark',
    Colors.yellow: 'dark',
    Colors.black: 'light',
    Colors.indigo: 'light',
  };
  for (final entry in backgroundCases.entries) {
    testWidgets('on background ${entry.key} uses ${entry.value} icons',
        (tester) async {
      expect(
        await pump(
          tester,
          ImpaktfullUiStatusBar.onBackgroundColor(
            backgroundColor: entry.key,
            child: const SizedBox(),
          ),
        ),
        entry.value == 'dark' ? dark : light,
      );
    });
  }

  testWidgets('screen uses the nav bar background', (tester) async {
    await tester.pumpWidget(const ImpaktfullUiApp(
      title: 'app',
      showDebugFlag: false,
      home: ImpaktfullUiScreen(title: 'Title', child: SizedBox()),
    ));
    await tester.pumpAndSettle();
    final statusBar = tester.widget<ImpaktfullUiStatusBar>(find.descendant(
      of: find.byType(ImpaktfullUiScreen),
      matching: find.byType(ImpaktfullUiStatusBar),
    ));
    final context = tester.element(find.byType(ImpaktfullUiScreen));
    expect(
      statusBar.backgroundColor,
      ImpaktfullUiNavBarTheme.of(context).colors.background,
    );
  });

  testWidgets('shows the child', (tester) async {
    await tester.pumpWidget(const Directionality(
      textDirection: TextDirection.ltr,
      child: ImpaktfullUiStatusBar.dark(child: Text('child')),
    ));
    expect(find.text('child'), findsOneWidget);
  });
}

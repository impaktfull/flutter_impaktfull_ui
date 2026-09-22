import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../_core_test_helpers.dart';

/// Pumps the licenses and waits until they are loaded.
///
/// On the VM they are loaded while the app settles. In Chrome the license
/// stream completes in real time, outside the fake time of the widget test,
/// so this also waits a bit of real time and pumps until the loading
/// indicator is gone.
Future<void> _pumpLicenses(
  WidgetTester tester,
  Widget home, {
  ImpaktfullUiLocalizations localizations = const ImpaktfullUiLocalizations(),
  Size? screenSize,
}) async {
  await pumpImpaktfullUiApp(
    tester,
    home,
    localizations: localizations,
    screenSize: screenSize,
  );
  final loading = find.byType(ImpaktfullUiLoadingIndicator);
  for (var i = 0; i < 250 && loading.evaluate().isNotEmpty; i++) {
    await tester.runAsync(
      () => Future<void>.delayed(const Duration(milliseconds: 20)),
    );
    await tester.pump();
  }
  expect(loading, findsNothing, reason: 'The licenses did not load');
  await tester.pumpAndSettle();
}

void main() {
  setUp(() {
    LicenseRegistry.reset();
    LicenseRegistry.addLicense(
      () => Stream.fromIterable([
        const LicenseEntryWithLineBreaks(
            ['impaktfull_ui'], 'Copyright impaktfull, MIT License'),
        const LicenseEntryWithLineBreaks(['alchemist'], 'MIT License'),
        const LicenseEntryWithLineBreaks(['zeta', 'beta'], 'Shared License'),
        const LicenseEntryWithLineBreaks(['beta'], 'Second License'),
        const LicenseEntryWithLineBreaks(
            ['other'], 'Contributions by impaktfull'),
      ]),
    );
  });
  tearDown(LicenseRegistry.reset);

  List<String> shownPackages(WidgetTester tester) => tester
      .widgetList<ImpaktfullUiAccordion>(find.byType(ImpaktfullUiAccordion))
      .map((e) => e.title)
      .toList();

  testWidgets('shows every package sorted by name', (tester) async {
    await _pumpLicenses(tester, const ImpaktfullUiBBLicenses(),
        screenSize: desktopSize);
    expect(shownPackages(tester),
        ['alchemist', 'beta', 'impaktfull_ui', 'other', 'zeta']);
  });

  testWidgets('expanding a package shows all of its licenses', (tester) async {
    await _pumpLicenses(tester, const ImpaktfullUiBBLicenses(),
        screenSize: desktopSize);
    // beta has 2 licenses, so its accordion is not animated and only builds
    // the licenses when it is expanded.
    final betaLicenses = find.byWidgetPredicate((widget) =>
        widget is ImpaktfullUiMarkdown &&
        widget.data == 'Shared License\n\n---\n\nSecond License');
    expect(betaLicenses, findsNothing);

    await tester.tap(find.text('beta'));
    await tester.pumpAndSettle();
    expect(betaLicenses, findsOneWidget);

    await tester.tap(find.text('beta'));
    await tester.pumpAndSettle();
    expect(betaLicenses, findsNothing);
  });

  testWidgets('searching filters on the package name', (tester) async {
    await _pumpLicenses(tester, const ImpaktfullUiBBLicenses(),
        screenSize: desktopSize);
    await tester.enterText(find.byType(TextField), 'ALCH');
    await tester.pumpAndSettle();
    expect(shownPackages(tester), ['alchemist']);
  });

  testWidgets('searching for impaktfull also finds licenses by impaktfull',
      (tester) async {
    await _pumpLicenses(tester, const ImpaktfullUiBBLicenses(),
        screenSize: desktopSize);
    await tester.enterText(find.byType(TextField), 'impaktfull');
    await tester.pumpAndSettle();
    expect(shownPackages(tester), ['impaktfull_ui', 'other']);
  });

  testWidgets('shows the placeholder when nothing matches', (tester) async {
    await _pumpLicenses(tester, const ImpaktfullUiBBLicenses(),
        screenSize: desktopSize);
    await tester.enterText(find.byType(TextField), 'does not exist');
    await tester.pumpAndSettle();
    expect(shownPackages(tester), isEmpty);
    expect(find.text('No licenses found'), findsOneWidget);
  });

  testWidgets('on a phone the search field is toggled with the search action',
      (tester) async {
    await _pumpLicenses(tester, const ImpaktfullUiBBLicenses(),
        screenSize: phoneSize);
    expect(find.byType(TextField), findsNothing);
    await tester.tap(find.byType(ImpaktfullUiIconButton));
    await tester.pumpAndSettle();
    expect(find.byType(TextField), findsOneWidget);
    await tester.tap(find.byType(ImpaktfullUiIconButton));
    await tester.pumpAndSettle();
    expect(find.byType(TextField), findsNothing);
  });

  testWidgets('on a desktop the search field is always shown', (tester) async {
    await _pumpLicenses(tester, const ImpaktfullUiBBLicenses(),
        screenSize: desktopSize);
    expect(find.byType(TextField), findsOneWidget);
    expect(find.byType(ImpaktfullUiIconButton), findsNothing);
  });

  testWidgets('closing it while the licenses load does not throw',
      (tester) async {
    final entries = StreamController<LicenseEntry>();
    LicenseRegistry.addLicense(() => entries.stream);
    await pumpImpaktfullUiApp(tester, const ImpaktfullUiBBLicenses(),
        settle: false);
    await tester.pumpWidget(const SizedBox());
    await entries.close();
    await tester.pump();
    expect(tester.takeException(), isNull);
  });

  testWidgets('tapping back calls onBackTapped', (tester) async {
    var backTaps = 0;
    await _pumpLicenses(
      tester,
      ImpaktfullUiBBLicenses(onBackTapped: () => backTaps++),
      screenSize: desktopSize,
    );
    await tester.tap(find.byType(ImpaktfullUiIconButton));
    await tester.pumpAndSettle();
    expect(backTaps, 1);
  });

  group('localizations', () {
    const dutch = ImpaktfullUiBBLicenseLocalizations(
      title: 'Licenties',
      searchTooltip: 'Zoeken',
      searchPlaceholder: 'Zoek een licentie',
      noLicensesFound: 'Geen licenties gevonden',
    );

    Future<void> expectDutch(WidgetTester tester) async {
      expect(find.text('Licenties'), findsOneWidget);
      expect(find.text('Zoek een licentie'), findsOneWidget);
      await tester.enterText(find.byType(TextField), 'does not exist');
      await tester.pumpAndSettle();
      expect(find.text('Geen licenties gevonden'), findsOneWidget);
    }

    testWidgets('shows the default texts', (tester) async {
      await _pumpLicenses(tester, const ImpaktfullUiBBLicenses(),
          screenSize: desktopSize);
      expect(find.text('Licenses'), findsOneWidget);
      expect(find.text('Search for any license'), findsOneWidget);
    });

    testWidgets('of the widget are applied', (tester) async {
      await _pumpLicenses(
        tester,
        const ImpaktfullUiBBLicenses(localizations: dutch),
        screenSize: desktopSize,
      );
      await expectDutch(tester);
    });

    testWidgets('of ImpaktfullUiApp are applied', (tester) async {
      await _pumpLicenses(
        tester,
        const ImpaktfullUiBBLicenses(),
        localizations: const ImpaktfullUiLocalizations(bbLicenses: dutch),
        screenSize: desktopSize,
      );
      await expectDutch(tester);
    });

    testWidgets('the search tooltip on a phone', (tester) async {
      await _pumpLicenses(
        tester,
        const ImpaktfullUiBBLicenses(localizations: dutch),
        screenSize: phoneSize,
      );
      final action = tester
          .widget<ImpaktfullUiIconButton>(find.byType(ImpaktfullUiIconButton));
      expect(action.tooltip, 'Zoeken');
    });
  });
}

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/network_image_util.dart';
import '../../_core_test_helpers.dart';
import '../../components/_data_display_test_helpers.dart';

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
  ImpaktfullUiTheme? theme,
  Size? screenSize,
}) async {
  await pumpImpaktfullUiApp(
    tester,
    home,
    localizations: localizations,
    theme: theme,
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

  group('custom licenses', () {
    const custom = ImpaktfullUiLicense(
      name: 'Photo by Jane Doe',
      licenses: ['Free to use under the Pexels license'],
    );

    testWidgets('are shown above the licenses of the packages', (tester) async {
      await _pumpLicenses(
        tester,
        const ImpaktfullUiBBLicenses(customLicenses: [custom]),
        screenSize: desktopSize,
      );
      expect(shownPackages(tester), [
        'Photo by Jane Doe',
        'alchemist',
        'beta',
        'impaktfull_ui',
        'other',
        'zeta',
      ]);
    });

    testWidgets('keep the order they are passed in', (tester) async {
      await _pumpLicenses(
        tester,
        const ImpaktfullUiBBLicenses(customLicenses: [
          ImpaktfullUiLicense(name: 'zzz photo', licenses: ['a']),
          custom,
        ]),
        screenSize: desktopSize,
      );
      expect(shownPackages(tester).take(2), ['zzz photo', 'Photo by Jane Doe']);
    });

    testWidgets('are searched on their name like the packages', (tester) async {
      await _pumpLicenses(
        tester,
        const ImpaktfullUiBBLicenses(customLicenses: [custom]),
        screenSize: desktopSize,
      );
      await tester.enterText(find.byType(TextField), 'JANE');
      await tester.pumpAndSettle();
      expect(shownPackages(tester), ['Photo by Jane Doe']);

      await tester.enterText(find.byType(TextField), 'alch');
      await tester.pumpAndSettle();
      expect(shownPackages(tester), ['alchemist']);
    });

    testWidgets('expanding one shows its license text', (tester) async {
      await _pumpLicenses(
        tester,
        const ImpaktfullUiBBLicenses(customLicenses: [custom]),
        screenSize: desktopSize,
      );
      await tester.tap(find.text('Photo by Jane Doe'));
      await tester.pumpAndSettle();
      expect(
        find.byWidgetPredicate((widget) =>
            widget is ImpaktfullUiMarkdown &&
            widget.data == 'Free to use under the Pexels license'),
        findsOneWidget,
      );
    });

    testWidgets('licenses added to the LicenseRegistry still show up',
        (tester) async {
      LicenseRegistry.addLicense(
        () => Stream.fromIterable([
          const LicenseEntryWithLineBreaks(['registered'], 'Registered'),
        ]),
      );
      await _pumpLicenses(
        tester,
        const ImpaktfullUiBBLicenses(customLicenses: [custom]),
        screenSize: desktopSize,
      );
      expect(shownPackages(tester), contains('registered'));
      expect(shownPackages(tester).first, 'Photo by Jane Doe');
    });
  });

  group('a license with an image', () {
    final bundle = TestAssetBundle({'assets/photo.png': testPngBytes});

    const imageLicense = ImpaktfullUiLicense(
      name: 'Photo by Jane Doe',
      licenses: ['Free to use under the Pexels license'],
      image: ImpaktfullUiAsset.pixel('photo.png', directory: 'assets'),
      imageSemanticLabel: 'A mountain at sunrise',
    );

    Future<void> pumpExpanded(
      WidgetTester tester, {
      ImpaktfullUiLicense license = imageLicense,
      ImpaktfullUiTheme? theme,
    }) async {
      await _pumpLicenses(
        tester,
        DefaultAssetBundle(
          bundle: bundle,
          child: ImpaktfullUiBBLicenses(customLicenses: [license]),
        ),
        theme: theme,
        screenSize: desktopSize,
      );
      await tester.tap(find.text(license.name));
      await tester.pumpAndSettle();
    }

    /// The asset widget of the image of the license, not the icons of the
    /// screen around it.
    ImpaktfullUiAssetWidget licenseImage(WidgetTester tester) =>
        tester.widget<ImpaktfullUiAssetWidget>(find.byWidgetPredicate(
          (widget) =>
              widget is ImpaktfullUiAssetWidget &&
              (widget.asset?.pixelAsset == 'photo.png' ||
                  widget.asset?.networkUrl != null),
        ));

    testWidgets('renders the image with its semantics label', (tester) async {
      await pumpExpanded(tester);
      final asset = licenseImage(tester);
      expect(asset.asset?.pixelAsset, 'photo.png');
      expect(asset.semanticLabel, 'A mountain at sunrise');
      // Contain keeps the aspect ratio of the image.
      expect(asset.fit, BoxFit.contain);
      expect(asset.height, 160);
      expect(find.bySemanticsLabel('A mountain at sunrise'), findsOneWidget);
    });

    testWidgets('falls back to the name as the semantics label',
        (tester) async {
      await pumpExpanded(
        tester,
        license: const ImpaktfullUiLicense(
          name: 'Photo by John Doe',
          licenses: ['Free to use'],
          image: ImpaktfullUiAsset.pixel('photo.png', directory: 'assets'),
        ),
      );
      expect(licenseImage(tester).semanticLabel, 'Photo by John Doe');
    });

    testWidgets('sizes the image with the theme tokens', (tester) async {
      final base = ImpaktfullUiTheme.getDefault();
      final theme = base.copyWith(
        components: base.components.copyWith(
          bbLicenses: base.components.bbLicenses.copyWith(
            dimens: base.components.bbLicenses.dimens.copyWith(imageHeight: 64),
          ),
        ),
      );
      await pumpExpanded(tester, theme: theme);
      expect(licenseImage(tester).height, 64);
    });

    testWidgets('a broken network image does not throw', (tester) async {
      await pumpExpanded(
        tester,
        license: const ImpaktfullUiLicense(
          name: 'Photo by Jane Doe',
          licenses: ['Free to use'],
          image: ImpaktfullUiAsset.network(brokenImageUrl),
        ),
      );
      await waitForBrokenNetworkImage(tester, brokenImageUrl);
      expect(tester.takeException(), isNull);
      expect(find.text('Photo by Jane Doe'), findsOneWidget);
    });

    testWidgets('expanding a license without an image adds no asset',
        (tester) async {
      await _pumpLicenses(
        tester,
        const ImpaktfullUiBBLicenses(),
        screenSize: desktopSize,
      );
      final assets = find.byType(ImpaktfullUiAssetWidget);
      final before = assets.evaluate().length;
      await tester.tap(find.text('alchemist'));
      await tester.pumpAndSettle();
      expect(assets.evaluate().length, before);
      expect(
        find.byWidgetPredicate((widget) =>
            widget is ImpaktfullUiMarkdown && widget.data == 'MIT License'),
        findsOneWidget,
      );
    });
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

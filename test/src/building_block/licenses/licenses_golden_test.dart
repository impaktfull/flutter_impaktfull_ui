import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/font_loader.dart';
import '../../_core_golden_helpers.dart';
import '../../components/_data_display_golden_helpers.dart';

void main() {
  setUp(() async {
    await loadImpaktfullUiFonts();
    LicenseRegistry.reset();
    LicenseRegistry.addLicense(
      () => Stream.fromIterable([
        const LicenseEntryWithLineBreaks(['impaktfull_ui'], 'MIT License'),
        const LicenseEntryWithLineBreaks(['alchemist'], 'MIT License'),
        const LicenseEntryWithLineBreaks(['flutter'], 'BSD License'),
      ]),
    );
  });
  tearDown(LicenseRegistry.reset);

  runScreenGoldenTest(
    fileName: 'impaktfull_ui_bb_licenses',
    wrapInScreen: false,
    builder: () => ImpaktfullUiBBLicenses(onBackTapped: () {}),
  );

  final bundle = TestAssetBundle({'assets/photo.png': testPngBytes});
  const imageCredit = ImpaktfullUiLicense(
    name: 'Photo by Jane Doe',
    licenses: ['Free to use under the Pexels license'],
    image: ImpaktfullUiAsset.pixel('photo.png', directory: 'assets'),
    imageSemanticLabel: 'A mountain at sunrise',
  );

  runScreenGoldenTest(
    fileName: 'impaktfull_ui_bb_licenses_custom_image',
    wrapInScreen: false,
    // Expands the custom license in every scenario, so the image is visible.
    pumpBeforeTest: (tester) async {
      await tester.pumpAndSettle();
      final title = find.text(imageCredit.name);
      for (var i = title.evaluate().length - 1; i >= 0; i--) {
        await tester.tap(title.at(i), warnIfMissed: false);
        await tester.pumpAndSettle();
      }
      await pumpAssets(tester);
    },
    builder: () => DefaultAssetBundle(
      bundle: bundle,
      child: ImpaktfullUiBBLicenses(
        onBackTapped: () {},
        customLicenses: const [imageCredit],
      ),
    ),
  );
}

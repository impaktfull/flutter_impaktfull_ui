import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/font_loader.dart';
import '../../_core_test_helpers.dart';

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
}

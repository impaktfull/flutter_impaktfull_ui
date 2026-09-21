import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';
import '../_data_display_test_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  // Tests never hit the network: the test binding answers every http request
  // with a 400, so an avatar with a url shows the error fallback of
  // ImpaktfullUiNetworkImage on top of the placeholder.
  runComponentTest(
    fileName: 'impaktfull_ui_avatar',
    columns: 4,
    goldenTests: () => [
      for (final size in [24.0, 40.0, 64.0])
        GoldenTest(
          description: 'placeholder $size',
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: ImpaktfullUiAvatar(url: null, width: size, height: size),
          ),
        ),
      GoldenTest(
        description: 'custom placeholder asset',
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ImpaktfullUiAvatar(
            url: null,
            placeholderAsset: testIcon,
            width: 64,
            height: 64,
            onTap: () {},
          ),
        ),
      ),
    ],
  );

  runComponentTest(
    fileName: 'impaktfull_ui_avatar_broken_url',
    goldenTests: () => [
      GoldenTest(
        description: 'broken url (debug error fallback)',
        child: const Padding(
          padding: EdgeInsets.all(8),
          child: ImpaktfullUiAvatar(
            url: 'https://example.com/avatar.png',
            width: 120,
            height: 120,
          ),
        ),
      ),
    ],
  );
}

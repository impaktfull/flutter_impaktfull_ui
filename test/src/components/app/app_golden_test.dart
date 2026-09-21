import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';

void main() {
  setUp(() => setupComponentTest());

  runComponentTest(
    fileName: 'impaktfull_app',
    goldenTests: () => [
      GoldenTest(
        description: 'App',
        child: ImpaktfullUiApp(
          title: 'impaktfull app',
          home: Container(
            width: 400,
            height: 400,
            color: theme.colors.accent,
          ),
        ),
      ),
    ],
  );

  Widget home() => Container(
        width: 200,
        height: 200,
        color: theme.colors.card,
      );

  runComponentTest(
    fileName: 'impaktfull_app_banners',
    columns: 3,
    goldenTests: () => [
      GoldenTest(
        description: 'No banners',
        child: ImpaktfullUiApp(
          title: 'impaktfull app',
          showDebugFlag: false,
          home: home(),
        ),
      ),
      GoldenTest(
        description: 'Flavor banner',
        child: ImpaktfullUiApp(
          title: 'impaktfull app',
          showDebugFlag: false,
          flavorBannerText: 'DEV',
          home: home(),
        ),
      ),
      GoldenTest(
        description: 'Flavor banner, custom color',
        child: ImpaktfullUiApp(
          title: 'impaktfull app',
          showDebugFlag: false,
          flavorBannerText: 'STAGING',
          flavorBannerColor: Colors.orange,
          home: home(),
        ),
      ),
    ],
  );
}

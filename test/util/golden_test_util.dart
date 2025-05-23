import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui/src/components/container/container.dart';

import 'font_loader.dart';
import 'golden_test_describtor.dart';
import 'golden_test_variant.dart';

setupComponentTest() async {
  await loadImpaktfullUiFonts();
}

Future<void> runComponentTest({
  required String fileName,
  required List<GoldenTest> Function() goldenTests,
  ImpaktfullUiTheme? theme,
  ImpaktfullUiTestFontLoader? fontLoader,
  int columns = 1,
}) async {
  AlchemistConfig.runWithConfig(
    config: AlchemistConfig(
      platformGoldensConfig: PlatformGoldensConfig(
        platforms: {HostPlatform.macOS},
      ),
      goldenTestTheme: GoldenTestTheme(
        backgroundColor: const Color.fromARGB(0, 0, 0, 0),
        borderColor: const Color.fromARGB(255, 0, 0, 0),
        nameTextStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
    ),
    run: () {
      goldenTest(
        'renders correctly',
        fileName: fileName,
        builder: () => ImpaktfullUiAutoLayout.vertical(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GoldenTestGroup(
              columns: columns,
              children: goldenTests()
                  .map(
                    (e) => GoldenTestDescribtor(
                      description: e.description,
                      child: Builder(builder: (context) {
                        final child = e.child;
                        if (child is ImpaktfullUiApp) {
                          return child;
                        }
                        return ImpaktfullUiApp(
                          showDebugFlag: false,
                          title: 'impaktfull app',
                          home: ImpaktfullUiContainer(
                            color: Colors.transparent,
                            child: child,
                          ),
                        );
                      }),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      );
    },
  );
}

import 'dart:convert';

import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../util/golden_test_variant.dart';

/// Shared helpers for the data display golden and interaction tests.

/// A long text to check wrapping and ellipsis.
const longText =
    'This is a very long text that does not fit on a single line, so it '
    'should wrap or be truncated by the component that shows it';

final _icons = ImpaktfullUiTheme.getDefault().assets.icons;

/// Icons of the default theme: they use an icon font that is available in
/// tests, so the goldens never depend on an asset bundle.
final testIcon = _icons.home;
final testIcon2 = _icons.settings;
final testIcon3 = _icons.user;

/// Finds the [ImpaktfullUiAssetWidget]s that show [asset].
///
/// [ImpaktfullUiAsset] has no `==`, and every `ImpaktfullUiTheme.getDefault()`
/// creates new instances, so the assets are compared by what they show.
Finder findAsset(ImpaktfullUiAsset? asset) => find.byWidgetPredicate(
      (widget) =>
          widget is ImpaktfullUiAssetWidget &&
          widget.asset != null &&
          asset != null &&
          widget.asset!.icon == asset.icon &&
          widget.asset!.getAssetName() == asset.getAssetName(),
    );

/// Gives a golden a fixed size: most data display components need bounded
/// constraints (lists, tables, charts) or fill the width they get.
Widget goldenBox({
  required Widget child,
  double width = 320,
  double? height,
  EdgeInsetsGeometry padding = const EdgeInsets.all(8),
}) =>
    SizedBox(
      width: width,
      height: height,
      child: Padding(
        padding: padding,
        child: child,
      ),
    );

/// Freezes every animation below it (the skeleton shimmer, lottie files, the
/// chat typing indicator, ...), so goldens are stable and `pumpAndSettle`
/// does not time out.
Widget frozen(Widget child) => TickerMode(
      enabled: false,
      child: child,
    );

/// A fixed point in time for the chat and other time based components.
final fixedDate = DateTime(2024, 3, 14, 9, 30);

/// Same as `runComponentTest` of `test/util/golden_test_util.dart`, but with a
/// custom [pumpBeforeTest]: for components with a never ending animation
/// (e.g. an indeterminate [CircularProgressIndicator]) that should be captured
/// at a fixed moment instead of at the very first frame.
void runComponentTestWithPump({
  required String fileName,
  required List<GoldenTest> Function() goldenTests,
  required PumpAction pumpBeforeTest,
  int columns = 1,
}) {
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
        pumpBeforeTest: pumpBeforeTest,
        builder: () => GoldenTestGroup(
          columns: columns,
          children: goldenTests()
              .map(
                (e) => ImpaktfullUiApp(
                  showDebugFlag: false,
                  title: 'impaktfull app',
                  home: ImpaktfullUiContainer(
                    color: Colors.transparent,
                    child: e.child,
                  ),
                ),
              )
              .toList(),
        ),
      );
    },
  );
}

/// A 16x16 checkerboard png (purple and orange).
final testPngBytes = base64Decode(
  'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAJElEQVR4nGP4v5ThPz5cnfgfL2Y'
  'YNWBYGEBIASELRg0YFgYAAOpevp8Ffn5VAAAAAElFTkSuQmCC',
);

/// A 24x24 svg: a purple circle with an orange square.
const testSvg = '<svg xmlns="http://www.w3.org/2000/svg" width="24" '
    'height="24" viewBox="0 0 24 24"><circle cx="12" cy="12" r="12" '
    'fill="#7B61FF"/><rect x="6" y="6" width="12" height="12" '
    'fill="#FFA500"/></svg>';

/// Serves in memory files as assets, so svg and pixel assets can be tested
/// without adding test files to the asset bundle of the package. Every other
/// key is loaded from the real bundle (e.g. the lottie files of the package).
class TestAssetBundle extends CachingAssetBundle {
  final Map<String, List<int>> files;

  TestAssetBundle(this.files);

  /// The keys that were requested, to check the full asset paths.
  final requestedKeys = <String>[];

  @override
  Future<ByteData> load(String key) async {
    requestedKeys.add(key);
    final file = files[key];
    if (file == null) return rootBundle.load(key);
    return ByteData.sublistView(Uint8List.fromList(file));
  }
}

/// Loads svg, pixel and lottie assets before a golden is taken: they are
/// decoded asynchronously, which does not happen in the fake async zone of a
/// widget test.
Future<void> pumpAssets(WidgetTester tester) async {
  await precacheImages(tester);
  for (var i = 0; i < 3; i++) {
    await tester.runAsync(
      () => Future<void>.delayed(const Duration(milliseconds: 50)),
    );
    await tester.pump();
  }
}

/// Pumps [widget] in an [ImpaktfullUiApp] with a fixed [size], so layout
/// based tests do not depend on the default 800x600 test view.
Future<void> pumpSized(
  WidgetTester tester,
  Widget widget, {
  Size size = const Size(400, 600),
  bool settle = true,
}) async {
  await tester.pumpWidget(
    ImpaktfullUiApp(
      showDebugFlag: false,
      title: 'impaktfull app',
      home: Align(
        alignment: Alignment.topLeft,
        child: SizedBox.fromSize(
          size: size,
          child: widget,
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

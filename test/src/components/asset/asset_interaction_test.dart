import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:lottie/lottie.dart';

import '../../../util/test_util.dart';
import '../_data_display_test_helpers.dart';

void main() {
  group('ImpaktfullUiAsset paths', () {
    test('only the type that is passed has a path', () {
      const svg = ImpaktfullUiAsset.svg('a.svg');
      expect(svg.getFullSvgAsset(), 'a.svg');
      expect(svg.getFullPixelAsset(), isNull);
      expect(svg.getFullLottieAsset(), isNull);
      expect(svg.getFullRiveAsset(), isNull);
      expect(svg.icon, isNull);
    });

    test('the directory is added with a single slash', () {
      expect(
        const ImpaktfullUiAsset.svg('a.svg', directory: 'assets/icons')
            .getFullSvgAsset(),
        'assets/icons/a.svg',
      );
      expect(
        const ImpaktfullUiAsset.pixel('a.png', directory: 'assets/images/')
            .getFullPixelAsset(),
        'assets/images/a.png',
      );
    });

    test('the suffix is added before the extension', () {
      expect(
        const ImpaktfullUiAsset.svg(
          'logo.svg',
          directory: 'assets',
          suffix: 'dark',
        ).getFullSvgAsset(),
        'assets/logo_dark.svg',
      );
      expect(
        const ImpaktfullUiAsset.lottie('loading.json', suffix: 'dark')
            .getFullLottieAsset(),
        'loading_dark.json',
      );
    });

    test('a file without an extension gets no suffix', () {
      expect(
        const ImpaktfullUiAsset.pixel('logo', suffix: 'dark')
            .getFullPixelAsset(),
        'logo',
      );
    });

    test('only rive assets get the package in the path', () {
      expect(
        const ImpaktfullUiAsset.rive(
          'a.riv',
          directory: 'assets/rive',
          package: 'my_package',
        ).getFullRiveAsset(),
        'packages/my_package/assets/rive/a.riv',
      );
      expect(
        const ImpaktfullUiAsset.svg('a.svg', package: 'my_package')
            .getFullSvgAsset(),
        'a.svg',
      );
    });

    test('getAssetName returns the name of the asset', () {
      expect(const ImpaktfullUiAsset.svg('a.svg').getAssetName(), 'a.svg');
      expect(const ImpaktfullUiAsset.pixel('a.png').getAssetName(), 'a.png');
      expect(
        const ImpaktfullUiAsset.lottie('a.json').getAssetName(),
        'a.json',
      );
      expect(const ImpaktfullUiAsset.rive('a.riv').getAssetName(), 'a.riv');
      expect(testIcon.getAssetName(), testIcon.icon.toString());
    });
  });

  group('ImpaktfullUiAssetWidget', () {
    final bundle = TestAssetBundle({
      'assets/test.svg': utf8.encode(testSvg),
      'assets/test.png': testPngBytes,
    });

    Widget withBundle(Widget child) => DefaultAssetBundle(
          bundle: bundle,
          child: Center(child: child),
        );

    testWidgets('null shows nothing', (tester) async {
      await pumpAndSettleComponent(
        tester,
        const Center(child: ImpaktfullUiAssetWidget(asset: null)),
      );
      expect(find.byType(Icon), findsNothing);
      expect(tester.getSize(find.byType(ImpaktfullUiAssetWidget)), Size.zero);
    });

    testWidgets('icon: size, else the largest of width and height',
        (tester) async {
      Future<double?> iconSize(ImpaktfullUiAssetWidget widget) async {
        await pumpAndSettleComponent(tester, Center(child: widget));
        return tester.widget<Icon>(find.byType(Icon)).size;
      }

      expect(
        await iconSize(ImpaktfullUiAssetWidget(asset: testIcon, size: 20)),
        20,
      );
      expect(
        await iconSize(
          ImpaktfullUiAssetWidget(asset: testIcon, width: 10, height: 30),
        ),
        30,
      );
      expect(
        await iconSize(ImpaktfullUiAssetWidget(asset: testIcon, width: 12)),
        12,
      );
      expect(
        await iconSize(ImpaktfullUiAssetWidget(asset: testIcon, height: 14)),
        14,
      );
    });

    testWidgets('icon: the color is used', (tester) async {
      await pumpAndSettleComponent(
        tester,
        Center(
          child: ImpaktfullUiAssetWidget(asset: testIcon, color: Colors.red),
        ),
      );
      expect(tester.widget<Icon>(find.byType(Icon)).color, Colors.red);
    });

    testWidgets('svg: loads the full path from the bundle with the color',
        (tester) async {
      await pumpAndSettleComponent(
        tester,
        withBundle(
          const ImpaktfullUiAssetWidget(
            asset: ImpaktfullUiAsset.svg('test.svg', directory: 'assets'),
            color: Colors.red,
            size: 24,
          ),
        ),
      );
      final svg = tester.widget<SvgPicture>(find.byType(SvgPicture));
      expect(
          svg.colorFilter, const ColorFilter.mode(Colors.red, BlendMode.srcIn));
      expect(svg.fit, BoxFit.contain);
      expect(svg.width, 24);
      await tester.runAsync(
        () => Future<void>.delayed(const Duration(milliseconds: 50)),
      );
      expect(bundle.requestedKeys, contains('assets/test.svg'));
    });

    testWidgets('pixel: loads the full path with the fit', (tester) async {
      await pumpAndSettleComponent(
        tester,
        withBundle(
          const ImpaktfullUiAssetWidget(
            asset: ImpaktfullUiAsset.pixel('test.png', directory: 'assets'),
            width: 32,
            height: 16,
            fit: BoxFit.fill,
          ),
        ),
      );
      final image = tester.widget<Image>(find.byType(Image));
      expect((image.image as AssetImage).assetName, 'assets/test.png');
      expect(image.fit, BoxFit.fill);
      expect(tester.getSize(find.byType(ImpaktfullUiAssetWidget)),
          const Size(32, 16));
    });

    testWidgets('lottie: loads the lottie of the package', (tester) async {
      await pumpComponent(
        tester,
        const Center(
          child: ImpaktfullUiAssetWidget(
            asset: ImpaktfullUiAsset.lottie(
              'loading.json',
              directory: 'assets/lottie',
            ),
            size: 48,
          ),
        ),
      );
      expect(find.byType(Lottie), findsOneWidget);
      expect(tester.getSize(find.byType(ImpaktfullUiAssetWidget)),
          const Size(48, 48));
    });

    testWidgets('overrideColor keeps an existing color', (tester) async {
      final widget = ImpaktfullUiAssetWidget(
        asset: testIcon,
        color: Colors.green,
      );
      expect(widget.overrideColor(Colors.red), same(widget));
    });
  });
}

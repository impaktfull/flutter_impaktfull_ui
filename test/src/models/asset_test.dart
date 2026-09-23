import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

void main() {
  group('constructors', () {
    test('svg only sets the svg asset', () {
      const asset = ImpaktfullUiAsset.svg(
        'logo.svg',
        directory: 'assets/svg',
        package: 'my_package',
        suffix: 'dark',
      );
      expect(asset.svgAsset, 'logo.svg');
      expect(asset.pixelAsset, isNull);
      expect(asset.lottieAsset, isNull);
      expect(asset.riveAsset, isNull);
      expect(asset.icon, isNull);
      expect(asset.directory, 'assets/svg');
      expect(asset.package, 'my_package');
      expect(asset.suffix, 'dark');
    });

    test('pixel only sets the pixel asset', () {
      const asset = ImpaktfullUiAsset.pixel('logo.png');
      expect(asset.pixelAsset, 'logo.png');
      expect(asset.svgAsset, isNull);
      expect(asset.lottieAsset, isNull);
      expect(asset.riveAsset, isNull);
      expect(asset.icon, isNull);
      expect(asset.directory, isNull);
      expect(asset.package, isNull);
      expect(asset.suffix, isNull);
    });

    test('lottie only sets the lottie asset', () {
      const asset = ImpaktfullUiAsset.lottie('loading.json');
      expect(asset.lottieAsset, 'loading.json');
      expect(asset.svgAsset, isNull);
      expect(asset.pixelAsset, isNull);
      expect(asset.riveAsset, isNull);
      expect(asset.icon, isNull);
    });

    test('rive only sets the rive asset', () {
      const asset = ImpaktfullUiAsset.rive('animation.riv');
      expect(asset.riveAsset, 'animation.riv');
      expect(asset.svgAsset, isNull);
      expect(asset.pixelAsset, isNull);
      expect(asset.lottieAsset, isNull);
      expect(asset.icon, isNull);
    });

    test('network only sets the url, without directory, package or suffix', () {
      const asset = ImpaktfullUiAsset.network('https://example.com/a.png');
      expect(asset.networkUrl, 'https://example.com/a.png');
      expect(asset.svgAsset, isNull);
      expect(asset.pixelAsset, isNull);
      expect(asset.lottieAsset, isNull);
      expect(asset.riveAsset, isNull);
      expect(asset.icon, isNull);
      expect(asset.directory, isNull);
      expect(asset.package, isNull);
      expect(asset.suffix, isNull);
    });

    test('the other constructors do not set a network url', () {
      expect(const ImpaktfullUiAsset.svg('a.svg').networkUrl, isNull);
      expect(const ImpaktfullUiAsset.pixel('a.png').networkUrl, isNull);
      expect(const ImpaktfullUiAsset.lottie('a.json').networkUrl, isNull);
      expect(const ImpaktfullUiAsset.rive('a.riv').networkUrl, isNull);
      expect(const ImpaktfullUiAsset.icon(Icons.add).networkUrl, isNull);
    });

    test('icon only sets the icon, without directory, package or suffix', () {
      const asset = ImpaktfullUiAsset.icon(Icons.add);
      expect(asset.icon, Icons.add);
      expect(asset.svgAsset, isNull);
      expect(asset.pixelAsset, isNull);
      expect(asset.lottieAsset, isNull);
      expect(asset.riveAsset, isNull);
      expect(asset.directory, isNull);
      expect(asset.package, isNull);
      expect(asset.suffix, isNull);
    });
  });

  group('getAssetName', () {
    test('returns the asset of every type', () {
      expect(const ImpaktfullUiAsset.svg('a.svg').getAssetName(), 'a.svg');
      expect(const ImpaktfullUiAsset.pixel('a.png').getAssetName(), 'a.png');
      expect(const ImpaktfullUiAsset.lottie('a.json').getAssetName(), 'a.json');
      expect(const ImpaktfullUiAsset.rive('a.riv').getAssetName(), 'a.riv');
      expect(
        const ImpaktfullUiAsset.network('https://example.com/a.png')
            .getAssetName(),
        'https://example.com/a.png',
      );
    });

    test('does not include the directory or suffix', () {
      const asset =
          ImpaktfullUiAsset.svg('a.svg', directory: 'dir', suffix: 'dark');
      expect(asset.getAssetName(), 'a.svg');
    });

    test('returns the icon as a string', () {
      const asset = ImpaktfullUiAsset.icon(Icons.add);
      expect(asset.getAssetName(), Icons.add.toString());
    });
  });

  group('copyWith', () {
    test('keeps the network url and changes matchTextDirection', () {
      const asset = ImpaktfullUiAsset.network('https://example.com/a.png');
      final copy = asset.copyWith(matchTextDirection: true);
      expect(copy.networkUrl, 'https://example.com/a.png');
      expect(copy.matchTextDirection, isTrue);
      expect(copy.svgAsset, isNull);
      expect(copy.pixelAsset, isNull);
    });
  });

  group('full path', () {
    test('returns null for another asset type', () {
      const asset = ImpaktfullUiAsset.svg('a.svg');
      expect(asset.getFullPixelAsset(), isNull);
      expect(asset.getFullLottieAsset(), isNull);
      expect(asset.getFullRiveAsset(), isNull);
      const network = ImpaktfullUiAsset.network('https://example.com/a.png');
      expect(network.getFullPixelAsset(), isNull);
      expect(network.getFullSvgAsset(), isNull);
      expect(const ImpaktfullUiAsset.icon(Icons.add).getFullSvgAsset(), isNull);
    });

    test('is the asset without a directory', () {
      expect(const ImpaktfullUiAsset.svg('a.svg').getFullSvgAsset(), 'a.svg');
      expect(
          const ImpaktfullUiAsset.pixel('a.png').getFullPixelAsset(), 'a.png');
      expect(const ImpaktfullUiAsset.lottie('a.json').getFullLottieAsset(),
          'a.json');
      expect(const ImpaktfullUiAsset.rive('a.riv').getFullRiveAsset(), 'a.riv');
    });

    test('adds the directory with a single slash', () {
      expect(
        const ImpaktfullUiAsset.svg('a.svg', directory: 'assets/svg')
            .getFullSvgAsset(),
        'assets/svg/a.svg',
      );
      expect(
        const ImpaktfullUiAsset.svg('a.svg', directory: 'assets/svg/')
            .getFullSvgAsset(),
        'assets/svg/a.svg',
      );
    });

    test('adds the suffix before the extension', () {
      expect(
        const ImpaktfullUiAsset.pixel(
          'logo.png',
          directory: 'assets/images',
          suffix: 'dark',
        ).getFullPixelAsset(),
        'assets/images/logo_dark.png',
      );
      expect(
        const ImpaktfullUiAsset.lottie('loading.json', suffix: 'dark')
            .getFullLottieAsset(),
        'loading_dark.json',
      );
    });

    test('only replaces the last extension', () {
      expect(
        const ImpaktfullUiAsset.pixel('logo.v2.png', suffix: 'dark')
            .getFullPixelAsset(),
        'logo.v2_dark.png',
      );
    });

    test('ignores the suffix for an asset without an extension', () {
      expect(
        const ImpaktfullUiAsset.svg('logo', suffix: 'dark').getFullSvgAsset(),
        'logo',
      );
    });

    test('does not change the directory when adding the suffix', () {
      expect(
        const ImpaktfullUiAsset.svg(
          'logo',
          directory: 'assets/v1.0',
          suffix: 'dark',
        ).getFullSvgAsset(),
        'assets/v1.0/logo',
      );
      expect(
        const ImpaktfullUiAsset.svg(
          'icon.svg',
          directory: 'assets/icons.svg',
          suffix: 'dark',
        ).getFullSvgAsset(),
        'assets/icons.svg/icon_dark.svg',
      );
    });

    test('only the rive asset gets the packages/<package>/ prefix', () {
      const rive = ImpaktfullUiAsset.rive(
        'animation.riv',
        directory: 'assets/rive',
        package: 'impaktfull_ui',
        suffix: 'dark',
      );
      expect(rive.getFullRiveAsset(),
          'packages/impaktfull_ui/assets/rive/animation_dark.riv');

      // Svg, pixel and lottie assets pass the package to the asset loader.
      const svg = ImpaktfullUiAsset.svg(
        'a.svg',
        directory: 'assets/svg',
        package: 'impaktfull_ui',
      );
      expect(svg.getFullSvgAsset(), 'assets/svg/a.svg');
    });

    test('rive with a package and without a directory', () {
      expect(
        const ImpaktfullUiAsset.rive('a.riv', package: 'pkg')
            .getFullRiveAsset(),
        'packages/pkg/a.riv',
      );
    });
  });
}

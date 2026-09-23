import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../_core_test_helpers.dart';

class _CustomTheme {
  final Color brand;

  const _CustomTheme(this.brand);
}

class _OtherCustomTheme {
  const _OtherCustomTheme();
}

Future<BuildContext> _pumpContext(
  WidgetTester tester, {
  ImpaktfullUiTheme? theme,
}) async {
  late BuildContext context;
  await pumpImpaktfullUiApp(
    tester,
    Builder(builder: (c) {
      context = c;
      return const SizedBox();
    }),
    theme: theme,
  );
  return context;
}

void main() {
  group('getDefault', () {
    test('uses the impaktfull colors', () {
      final theme = ImpaktfullUiTheme.getDefault();
      expect(theme.label, 'impaktfull Theme');
      expect(theme.colors.primary, const Color(0xFF1A1A1A));
      expect(theme.colors.accent, const Color(0xFF7d64f2));
      expect(theme.colors.secondary, const Color(0xFF7d64f2));
      expect(theme.customThemeOrNull, isNull);
    });

    test('uses the impaktfull_ui package for its assets', () {
      final theme = ImpaktfullUiTheme.getDefault();
      expect(theme.assets.lotties.loading.package, 'impaktfull_ui');
      expect(theme.assets.lotties.loading.getFullLottieAsset(),
          'assets/lottie/loading.json');
    });

    // impaktfull_ui ships no images, so its logo shows nothing instead of
    // pointing at an asset that is not in the package.
    test('has no logo of its own', () {
      final theme = ImpaktfullUiTheme.getDefault();
      expect(theme.assets.images.logo.isNone, isTrue);
      expect(theme.assets.images.splashLogo.isNone, isTrue);
      expect(theme.assets.images.logo.getFullSvgAsset(), isNull);
    });

    test('uses another package for its assets', () {
      final theme = ImpaktfullUiTheme.getDefault(package: 'my_app');
      expect(theme.assets.images.logo.package, 'my_app');
      expect(theme.assets.lotties.loading.package, 'my_app');
      expect(
          theme.assets.images.logo.getFullSvgAsset(), 'assets/images/logo.svg');
    });

    test('uses the logo of the app itself without a package', () {
      final theme = ImpaktfullUiTheme.getDefault(package: null);
      expect(theme.assets.images.logo.package, isNull);
      expect(
          theme.assets.images.logo.getFullSvgAsset(), 'assets/images/logo.svg');
      expect(theme.assets.images.splashLogo.getFullSvgAsset(),
          'assets/images/splash_logo.svg');
    });

    // The package asks for these families but does not ship them: an app
    // bundles them itself (like the example app), passes its own, or passes
    // null for the font of the platform.
    test('asks for the impaktfull font families', () {
      final theme = ImpaktfullUiTheme.getDefault();
      expect(theme.textStyles.onCanvas.display.large.fontFamily, 'Ubuntu');
      expect(theme.textStyles.onCanvas.text.medium.fontFamily, 'Geologica');
      final withFonts = ImpaktfullUiTheme.getDefault(
        fontFamilyDisplay: 'Display',
        fontFamilyText: 'Text',
      );
      expect(withFonts.textStyles.onCanvas.display.large.fontFamily, 'Display');
      expect(withFonts.textStyles.onCanvas.text.medium.fontFamily, 'Text');
      final systemFont = ImpaktfullUiTheme.getDefault(
        fontFamilyDisplay: null,
        fontFamilyText: null,
      );
      expect(systemFont.textStyles.onCanvas.display.large.fontFamily, isNull);
      expect(systemFont.textStyles.onCanvas.text.medium.fontFamily, isNull);
    });

    test('keeps the custom theme', () {
      final theme = ImpaktfullUiTheme.getDefault(
          customTheme: const _CustomTheme(Colors.red));
      expect(theme.customTheme.brand, Colors.red);
      expect(theme.customThemeOrNull, isNotNull);
    });

    test('customTheme throws when it is not set', () {
      final theme = ImpaktfullUiTheme.getDefault();
      expect(() => theme.customTheme, throwsException);
    });

    // The assetSuffix is for the app's own asset variants: impaktfull_ui
    // ships no suffixed variants of its bundled assets.
    test('does not add the asset suffix to the bundled assets', () {
      final theme = ImpaktfullUiTheme.getDefault(assetSuffix: 'dark');
      final loading = theme.assets.lotties.loading;
      expect(loading.package, 'impaktfull_ui');
      expect(loading.suffix, isNull);
      expect(loading.getFullLottieAsset(), 'assets/lottie/loading.json');
      expect(theme.assets.images.logo.isNone, isTrue);
      expect(theme.assets.images.splashLogo.isNone, isTrue);
    });

    test('passes the asset suffix to the assets of another package', () {
      final theme =
          ImpaktfullUiTheme.getDefault(package: 'my_app', assetSuffix: 'dark');
      expect(theme.assets.lotties.loading.getFullLottieAsset(),
          'assets/lottie/loading_dark.json');
      expect(theme.assets.images.logo.getFullSvgAsset(),
          'assets/images/logo_dark.svg');
    });
  });

  group('getDefaultDark', () {
    test('keeps the accent and flips the neutral colors', () {
      final light = ImpaktfullUiTheme.getDefault();
      final dark = ImpaktfullUiTheme.getDefaultDark();
      expect(dark.label, 'impaktfull Dark Theme');
      expect(dark.brightness, Brightness.dark);
      expect(dark.colors.accent, light.colors.accent);
      expect(dark.colors.secondary, light.colors.secondary);
      expect(dark.colors.error, light.colors.error);
      expect(dark.colors.success, light.colors.success);
      expect(dark.colors.canvas, isNot(light.colors.canvas));
      expect(dark.colors.card, isNot(light.colors.card));
      expect(dark.colors.text, isNot(light.colors.text));
      // The light primary is a near-black neutral, the dark one a
      // near-white one with dark text on it.
      expect(dark.colors.primary, const Color(0xFFF5F5F5));
      expect(dark.colors.textOnPrimary, const Color(0xFF1A1A1A));
      // The fonts are the same in both variants.
      expect(dark.textStyles.onCanvas.text.medium.fontFamily,
          light.textStyles.onCanvas.text.medium.fontFamily);
    });

    test('the component themes follow the dark colors', () {
      final dark = ImpaktfullUiTheme.getDefaultDark();
      expect(dark.components.card.colors.background, dark.colors.card);
      expect(dark.components.screen.colors.background, dark.colors.canvas);
      expect(dark.textStyles.onCanvas.text.medium.color, dark.colors.text);
    });
  });

  group('custom', () {
    test('sets the given colors', () {
      final theme = ImpaktfullUiTheme.custom(
        label: 'custom',
        primary: Colors.red,
        accent: Colors.green,
        secondary: Colors.blue,
        tertiary: Colors.orange,
        canvas: Colors.white,
        card: Colors.black,
        border: Colors.pink,
        shadow: Colors.purple,
        text: Colors.teal,
        textSecondary: Colors.lime,
        textTertiary: Colors.brown,
        textOnAccent: Colors.cyan,
        textOnSecondary: Colors.amber,
      );
      expect(theme.label, 'custom');
      expect(theme.colors.primary, Colors.red);
      expect(theme.colors.accent, Colors.green);
      expect(theme.colors.secondary, Colors.blue);
      expect(theme.colors.tertiary, Colors.orange);
      expect(theme.colors.canvas, Colors.white);
      expect(theme.colors.card, Colors.black);
      expect(theme.colors.border, Colors.pink);
      expect(theme.colors.shadow, Colors.purple);
      expect(theme.colors.text, Colors.teal);
      expect(theme.colors.textSecondary, Colors.lime);
      expect(theme.colors.textTertiary, Colors.brown);
      expect(theme.colors.textOnAccent, Colors.cyan);
      expect(theme.colors.textOnSecondary, Colors.amber);
    });

    test('sets the border radius and fonts', () {
      final radius = BorderRadius.circular(3);
      final theme = ImpaktfullUiTheme.custom(
        primary: Colors.red,
        accent: Colors.green,
        secondary: Colors.blue,
        borderRadiusExtraSmall: radius,
        borderRadiusSmall: radius,
        borderRadius: radius,
        borderRadiusLarge: radius,
        borderRadiusExtraLarge: radius,
        fontFamilyDisplay: 'Display',
        fontFamilyText: 'Text',
      );
      expect(theme.dimens.borderRadiusExtraSmall, radius);
      expect(theme.dimens.borderRadiusSmall, radius);
      expect(theme.dimens.borderRadius, radius);
      expect(theme.dimens.borderRadiusLarge, radius);
      expect(theme.dimens.borderRadiusExtraLarge, radius);
      expect(theme.textStyles.onCanvas.display.large.fontFamily, 'Display');
      expect(theme.textStyles.onCanvas.text.medium.fontFamily, 'Text');
    });

    test('passes the package and asset suffix to the lottie assets', () {
      final theme = ImpaktfullUiTheme.custom(
        primary: Colors.red,
        accent: Colors.green,
        secondary: Colors.blue,
        package: 'my_app',
        assetSuffix: 'dark',
      );
      expect(theme.assets.lotties.loading.package, 'my_app');
      expect(theme.assets.lotties.loading.getFullLottieAsset(),
          'assets/lottie/loading_dark.json');
    });

    test('passes the asset suffix to the image assets of the app', () {
      final theme = ImpaktfullUiTheme.custom(
        primary: Colors.red,
        accent: Colors.green,
        secondary: Colors.blue,
        package: null,
        assetSuffix: 'dark',
      );
      expect(theme.assets.images.logo.getFullSvgAsset(),
          'assets/images/logo_dark.svg');
      expect(theme.assets.images.splashLogo.getFullSvgAsset(),
          'assets/images/splash_logo_dark.svg');
    });

    test('does not add the asset suffix to the bundled assets', () {
      final theme = ImpaktfullUiTheme.custom(
        primary: Colors.red,
        accent: Colors.green,
        secondary: Colors.blue,
        assetSuffix: 'dark',
      );
      expect(theme.assets.lotties.loading.getFullLottieAsset(),
          'assets/lottie/loading.json');
      expect(theme.assets.images.logo.isNone, isTrue);
    });

    test('a dark brightness uses the dark defaults', () {
      final theme = ImpaktfullUiTheme.custom(
        primary: Colors.red,
        accent: Colors.green,
        secondary: Colors.blue,
        brightness: Brightness.dark,
      );
      expect(theme.brightness, Brightness.dark);
      expect(theme.colors.canvas, const Color(0xFF0C0E12));
      expect(theme.colors.card, const Color(0xFF16181D));
    });

    test('an app asset with a suffix and a dot in its directory', () {
      final asset = ImpaktfullUiAssetTheme.getImageAssetForPackage(
        assetFileName: 'v1.2/logo.png',
        assetSuffix: 'dark',
      );
      expect(asset.getFullPixelAsset(), 'assets/images/v1.2/logo_dark.png');
    });
  });

  group('of and maybeOf', () {
    testWidgets('of returns the theme of the ImpaktfullUiApp', (tester) async {
      final theme = ImpaktfullUiTheme.custom(
        primary: Colors.red,
        accent: Colors.green,
        secondary: Colors.blue,
      );
      final context = await _pumpContext(tester, theme: theme);
      expect(ImpaktfullUiTheme.of(context), same(theme));
      expect(ImpaktfullUiTheme.maybeOf(context), same(theme));
    });

    testWidgets('ImpaktfullUiApp uses getDefault without a theme',
        (tester) async {
      final context = await _pumpContext(tester);
      expect(ImpaktfullUiTheme.of(context).label, 'impaktfull Theme');
    });

    testWidgets('of with the type of the custom theme', (tester) async {
      final theme = ImpaktfullUiTheme.getDefault(
          customTheme: const _CustomTheme(Colors.red));
      final context = await _pumpContext(tester, theme: theme);
      final result = ImpaktfullUiTheme.of<_CustomTheme>(context);
      expect(result.customTheme.brand, Colors.red);
    });

    testWidgets('of with another type than the custom theme throws',
        (tester) async {
      final theme = ImpaktfullUiTheme.getDefault(
          customTheme: const _CustomTheme(Colors.red));
      final context = await _pumpContext(tester, theme: theme);
      expect(
        () => ImpaktfullUiTheme.of<_OtherCustomTheme>(context),
        throwsA(isA<Exception>().having((e) => e.toString(), 'message',
            contains('Custom theme is not of type _OtherCustomTheme'))),
      );
    });

    testWidgets('maybeOf returns null without an ImpaktfullUiApp',
        (tester) async {
      late BuildContext context;
      await tester.pumpWidget(Builder(builder: (c) {
        context = c;
        return const SizedBox();
      }));
      expect(ImpaktfullUiTheme.maybeOf(context), isNull);
    });

    testWidgets('ImpaktfullUiThemeBuilder builds with the theme',
        (tester) async {
      final theme = ImpaktfullUiTheme.getDefault();
      ImpaktfullUiTheme? built;
      await pumpImpaktfullUiApp(
        tester,
        ImpaktfullUiThemeBuilder(builder: (context, theme) {
          built = theme;
          return const SizedBox();
        }),
        theme: theme,
      );
      expect(built, same(theme));
    });

    testWidgets('a new theme rebuilds the dependents', (tester) async {
      final light = ImpaktfullUiTheme.getDefault();
      final dark = ImpaktfullUiTheme.custom(
        primary: Colors.white,
        accent: Colors.white,
        secondary: Colors.white,
        canvas: Colors.black,
      );
      final themes = <ImpaktfullUiTheme>[];
      Widget build(ImpaktfullUiTheme theme) => ImpaktfullUiApp(
            showDebugFlag: false,
            title: 'test',
            impaktfullUiTheme: theme,
            home: ImpaktfullUiThemeBuilder(builder: (context, theme) {
              themes.add(theme);
              return const SizedBox();
            }),
          );
      await tester.pumpWidget(build(light));
      await tester.pumpWidget(build(dark));
      expect(themes.first, same(light));
      expect(themes.last, same(dark));
    });
  });

  group('copyWith', () {
    test('keeps the custom theme', () {
      final theme = ImpaktfullUiTheme.getDefault(
          customTheme: const _CustomTheme(Colors.red));
      final copy = theme.copyWith(label: 'copy');
      expect(copy.label, 'copy');
      expect(copy.customTheme.brand, Colors.red);
      expect(copy.colors, same(theme.colors));
    });
  });
}

// Every theme class compares by value: a theme that is built again with the
// same tokens is equal to the one before it, so nothing that reads it is
// rebuilt. That every class declares `==` and `hashCode` is checked for all
// themes in theme_equality_source_test.dart, this file checks the behaviour.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../_core_test_helpers.dart';

/// The custom theme of an app, without a `==` of its own.
class _CustomTheme {
  final Color brand;

  _CustomTheme(this.brand);
}

/// Expects that [a] and [b] are two instances with the same value.
void _expectEqual(Object a, Object b) {
  expect(a, isNot(same(b)), reason: 'the test needs two instances');
  expect(a, b);
  expect(b, a);
  expect(a.hashCode, b.hashCode);
  expect({a, b}, hasLength(1));
}

void main() {
  final theme = ImpaktfullUiTheme.getDefault();

  group('ImpaktfullUiTheme', () {
    test('two default themes are equal and share a hashCode', () {
      _expectEqual(ImpaktfullUiTheme.getDefault(), theme);
    });

    test('two default dark themes are equal and share a hashCode', () {
      _expectEqual(
        ImpaktfullUiTheme.getDefaultDark(),
        ImpaktfullUiTheme.getDefaultDark(),
      );
    });

    test('the light and the dark theme are not equal', () {
      expect(theme, isNot(ImpaktfullUiTheme.getDefaultDark()));
    });

    test('two themes with the same tokens are equal', () {
      ImpaktfullUiTheme<Object> build() =>
          ImpaktfullUiDefaultTheme.withMinimalChanges(
            label: 'app',
            primary: const Color(0xFF007AFF),
            accent: const Color(0xFF5856D6),
            secondary: const Color(0xFFFF9500),
            borderRadius: BorderRadius.circular(8),
          );
      _expectEqual(build(), build());
    });

    test('a theme with another token is not equal', () {
      ImpaktfullUiTheme<Object> build(Color accent) =>
          ImpaktfullUiDefaultTheme.withMinimalChanges(
            primary: const Color(0xFF007AFF),
            accent: accent,
            secondary: const Color(0xFFFF9500),
          );
      expect(
        build(const Color(0xFF5856D6)),
        isNot(build(const Color(0xFF34C759))),
      );
    });

    // One changed token per group of the root theme: every group is part of
    // the value, none of them is forgotten in `==`.
    test('a changed token makes it unequal, in every group', () {
      expect(theme.copyWith(label: 'other'), isNot(theme));
      expect(theme.copyWith(brightness: Brightness.dark), isNot(theme));
      expect(
        theme.copyWith(
          assets: theme.assets.copyWith(
            images: theme.assets.images.copyWith(
              logo: const ImpaktfullUiAsset.svg('logo.svg'),
            ),
          ),
        ),
        isNot(theme),
      );
      expect(
        theme.copyWith(colors: theme.colors.copyWith(accent: Colors.red)),
        isNot(theme),
      );
      expect(
        theme.copyWith(
          textStyles: theme.textStyles.copyWith(
            onCanvas: theme.textStyles.onCanvas.copyWith(
              text: theme.textStyles.onCanvas.text.copyWith(
                medium: const TextStyle(fontSize: 42),
              ),
            ),
          ),
        ),
        isNot(theme),
      );
      expect(
        theme.copyWith(
          dimens: theme.dimens.copyWith(borderRadius: BorderRadius.zero),
        ),
        isNot(theme),
      );
      expect(
        theme.copyWith(
          durations: theme.durations.copyWith(short: const Duration(days: 1)),
        ),
        isNot(theme),
      );
      expect(
        theme.copyWith(shadows: theme.shadows.copyWith(small: const [])),
        isNot(theme),
      );
      expect(
        theme.copyWith(
          components: theme.components.copyWith(
            card: theme.components.card.copyWith(
              colors: theme.components.card.colors.copyWith(
                background: Colors.red,
              ),
            ),
          ),
        ),
        isNot(theme),
      );
    });

    test('copyWith without arguments keeps the value', () {
      _expectEqual(theme.copyWith(), theme);
    });

    // The custom theme of an app is part of the value. It is compared with
    // its own `==`: a class without one is only equal to itself.
    test('the custom theme is part of the value', () {
      final custom = _CustomTheme(const Color(0xFF007AFF));
      _expectEqual(
        ImpaktfullUiTheme.getDefault(customTheme: custom),
        ImpaktfullUiTheme.getDefault(customTheme: custom),
      );
      expect(
        ImpaktfullUiTheme.getDefault(customTheme: custom),
        isNot(ImpaktfullUiTheme.getDefault(
          customTheme: _CustomTheme(const Color(0xFF007AFF)),
        )),
      );
      expect(
        ImpaktfullUiTheme.getDefault(customTheme: custom),
        isNot(ImpaktfullUiTheme.getDefault<_CustomTheme>()),
      );
    });

    // Two themes with a different type argument are never equal, in both
    // directions: `==` stays symmetric.
    test('a theme with another custom theme type is not equal', () {
      final typed = ImpaktfullUiTheme.getDefault(
        customTheme: _CustomTheme(Colors.red),
      );
      expect(theme == typed, isFalse);
      expect(typed == theme, isFalse);
    });
  });

  group('the global themes', () {
    test('colors', () {
      _expectEqual(theme.colors, theme.colors.copyWith());
      expect(theme.colors.copyWith(accent: Colors.red), isNot(theme.colors));
      expect(theme.colors, isNot(ImpaktfullUiTheme.getDefaultDark().colors));
    });

    test('text styles', () {
      _expectEqual(theme.textStyles, theme.textStyles.copyWith());
      _expectEqual(
        theme.textStyles.onCanvas,
        theme.textStyles.onCanvas.copyWith(),
      );
      _expectEqual(
        theme.textStyles.onCanvas.text,
        theme.textStyles.onCanvas.text.copyWith(),
      );
      expect(
        theme.textStyles.onCanvas.text.copyWith(
          medium: const TextStyle(fontSize: 42),
        ),
        isNot(theme.textStyles.onCanvas.text),
      );
    });

    test('dimens', () {
      _expectEqual(theme.dimens, theme.dimens.copyWith());
      expect(
        theme.dimens.copyWith(borderRadiusLarge: BorderRadius.zero),
        isNot(theme.dimens),
      );
    });

    test('durations', () {
      _expectEqual(theme.durations, theme.durations.copyWith());
      expect(
        theme.durations.copyWith(medium: const Duration(seconds: 3)),
        isNot(theme.durations),
      );
    });

    // The shadows are lists: they are compared by their content, not by the
    // identity of the list.
    test('shadows compare the content of their lists', () {
      ImpaktfullUiShadowsTheme shadows(double blurRadius) =>
          ImpaktfullUiShadowsTheme(
            extraSmall: [BoxShadow(blurRadius: blurRadius)],
            small: [BoxShadow(blurRadius: blurRadius)],
            medium: [BoxShadow(blurRadius: blurRadius)],
            large: [BoxShadow(blurRadius: blurRadius)],
            extraLarge: [BoxShadow(blurRadius: blurRadius)],
          );
      _expectEqual(shadows(2), shadows(2));
      expect(shadows(2), isNot(shadows(4)));
      expect(shadows(2).copyWith(small: const []), isNot(shadows(2)));
      _expectEqual(theme.shadows, theme.shadows.copyWith());
    });

    test('assets', () {
      _expectEqual(theme.assets, theme.assets.copyWith());
      _expectEqual(theme.assets.icons, theme.assets.icons.copyWith());
      _expectEqual(theme.assets.images, theme.assets.images.copyWith());
      _expectEqual(theme.assets.lotties, theme.assets.lotties.copyWith());
      expect(
        theme.assets.icons.copyWith(
          close: const ImpaktfullUiAsset.svg('close.svg'),
        ),
        isNot(theme.assets.icons),
      );
      expect(
        theme.assets.lotties.copyWith(loading: const ImpaktfullUiAsset.none()),
        isNot(theme.assets.lotties),
      );
    });
  });

  group('component themes', () {
    final other = ImpaktfullUiTheme.getDefault();

    test('two default component themes are equal', () {
      _expectEqual(theme.components, other.components);
      _expectEqual(theme.components.button, other.components.button);
      _expectEqual(theme.components.card, other.components.card);
      _expectEqual(theme.components.inputField, other.components.inputField);
      _expectEqual(theme.components.skeleton, other.components.skeleton);
      _expectEqual(theme.components.calendar, other.components.calendar);
      _expectEqual(theme.components.markdown, other.components.markdown);
    });

    test('a changed token makes a component theme unequal', () {
      final card = theme.components.card;
      expect(
        card.copyWith(colors: card.colors.copyWith(background: Colors.red)),
        isNot(card),
      );
      expect(
        card.copyWith(dimens: card.dimens.copyWith(borderWidth: 42)),
        isNot(card),
      );
      expect(
        card.copyWith(shadows: card.shadows.copyWith(card: const [])),
        isNot(card),
      );
      final button = theme.components.button;
      expect(
        button.copyWith(
          config: button.config.copyWith(
            vibrateOnTap: !button.config.vibrateOnTap,
          ),
        ),
        isNot(button),
      );
    });

    test('a changed component theme makes the components theme unequal', () {
      expect(
        theme.components.copyWith(
          card: theme.components.card.copyWith(
            dimens: theme.components.card.dimens.copyWith(borderWidth: 42),
          ),
        ),
        isNot(theme.components),
      );
    });

    // Every instance of a theme without tokens is the same value, so a parent
    // that holds one can still be equal.
    test('a theme without tokens is equal to every instance of it', () {
      // Two instances instead of the canonical constant one, to compare them.
      // ignore: prefer_const_constructors
      final colors = ImpaktfullUiAccordionColorTheme();
      // ignore: prefer_const_constructors
      _expectEqual(colors, ImpaktfullUiAccordionColorTheme());
      expect(colors, isNot(const ImpaktfullUiAccordionDimensTheme()));
    });

    test('ImpaktfullUiButtonConfig', () {
      const config = ImpaktfullUiButtonConfig(isRaised: true, elevation: 2);
      _expectEqual(config, config.copyWith());
      expect(config.copyWith(elevation: 4), isNot(config));
      expect(config.copyWith(vibrateOnTap: true), isNot(config));
    });

    test('ImpaktfullUiFluidPaddingBreakPoint', () {
      ImpaktfullUiFluidPaddingDimensTheme dimens(double padding) =>
          ImpaktfullUiFluidPaddingDimensTheme(
            breakPoints: [
              ImpaktfullUiFluidPaddingBreakPoint(
                label: 'phone',
                maxWidth: 600,
                padding: padding,
              ),
            ],
          );
      _expectEqual(dimens(16), dimens(16));
      expect(dimens(16), isNot(dimens(24)));
      expect(
        dimens(16),
        isNot(const ImpaktfullUiFluidPaddingDimensTheme(breakPoints: [])),
      );
    });

    // `ImpaktfullUiComponentsTheme` builds a lookup map the first time a
    // component theme is read from it. It is derived from the fields, so it
    // is not part of the value.
    testWidgets('the cached lookup map does not break the equality',
        (tester) async {
      final used = ImpaktfullUiTheme.getDefault();
      await pumpImpaktfullUiApp(
        tester,
        Builder(builder: (context) {
          ImpaktfullUiComponentsTheme.of<ImpaktfullUiButtonTheme>(context);
          return const SizedBox();
        }),
        theme: used,
      );
      _expectEqual(used.components, theme.components);
      _expectEqual(used, theme);
    });
  });

  group('ImpaktfullUiAsset', () {
    ImpaktfullUiAsset svg(String asset, {String? package}) =>
        ImpaktfullUiAsset.svg(asset, package: package);
    ImpaktfullUiAsset icon(IconData icon) => ImpaktfullUiAsset.icon(icon);
    ImpaktfullUiAsset network(String url) => ImpaktfullUiAsset.network(url);

    test('two assets with the same value are equal', () {
      _expectEqual(
          svg('icon.svg', package: 'app'), svg('icon.svg', package: 'app'));
      _expectEqual(icon(Icons.close), icon(Icons.close));
      _expectEqual(network('https://example.com/a.png'),
          network('https://example.com/a.png'));
      _expectEqual(
        const ImpaktfullUiAsset.none(),
        const ImpaktfullUiAsset.none().copyWith(),
      );
    });

    test('every part of the asset is part of the value', () {
      const asset = ImpaktfullUiAsset.svg(
        'icon.svg',
        directory: 'assets',
        package: 'app',
        suffix: 'dark',
      );
      expect(asset, isNot(const ImpaktfullUiAsset.svg('other.svg')));
      expect(
        asset,
        isNot(const ImpaktfullUiAsset.svg(
          'icon.svg',
          directory: 'images',
          package: 'app',
          suffix: 'dark',
        )),
      );
      expect(
        asset,
        isNot(const ImpaktfullUiAsset.svg(
          'icon.svg',
          directory: 'assets',
          package: 'other',
          suffix: 'dark',
        )),
      );
      expect(
        asset,
        isNot(const ImpaktfullUiAsset.svg(
          'icon.svg',
          directory: 'assets',
          package: 'app',
        )),
      );
      expect(asset, isNot(asset.copyWith(matchTextDirection: true)));
      expect(
        const ImpaktfullUiAsset.svg('icon.svg'),
        isNot(const ImpaktfullUiAsset.pixel('icon.svg')),
      );
      expect(
        const ImpaktfullUiAsset.lottie('a.json'),
        isNot(const ImpaktfullUiAsset.rive('a.json')),
      );
      expect(icon(Icons.close), isNot(icon(Icons.check)));
      expect(
        const ImpaktfullUiAsset.none(),
        isNot(const ImpaktfullUiAsset.svg('icon.svg')),
      );
    });
  });
}

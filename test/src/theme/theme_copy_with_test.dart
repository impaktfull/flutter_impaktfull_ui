import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

// That every theme class has a complete copyWith is checked for all themes in
// theme_copy_with_source_test.dart. This file checks the behaviour on a few
// representative themes.
void main() {
  final theme = ImpaktfullUiTheme.getDefault();

  group('copyWith without arguments keeps every value', () {
    test('ImpaktfullUiCardTheme', () {
      final card = theme.components.card;
      final copy = card.copyWith();
      expect(copy, isNot(same(card)));
      expect(copy.colors, same(card.colors));
      expect(copy.dimens, same(card.dimens));
      expect(copy.shadows, same(card.shadows));

      final dimens = card.dimens.copyWith();
      expect(dimens.borderRadius, card.dimens.borderRadius);
      expect(dimens.borderWidth, card.dimens.borderWidth);
      expect(dimens.padding, card.dimens.padding);
    });

    test('ImpaktfullUiButtonTheme keeps shadow', () {
      final button = theme.components.button;
      expect(button.shadow, isNotNull);
      final copy = button.copyWith();
      expect(copy.colors, same(button.colors));
      expect(copy.config, same(button.config));
      expect(copy.dimens, same(button.dimens));
      expect(copy.durations, same(button.durations));
      expect(copy.shadow, same(button.shadow));
      expect(copy.textStyles, same(button.textStyles));
    });

    test('ImpaktfullUiComponentsTheme', () {
      final copy = theme.components.copyWith();
      expect(copy.button, same(theme.components.button));
      expect(copy.card, same(theme.components.card));
      expect(copy.carousel, same(theme.components.carousel));
      expect(copy.wysiwyg, same(theme.components.wysiwyg));
    });
  });

  group('copyWith changes only the given value', () {
    test('ImpaktfullUiCardDimensTheme.borderRadius', () {
      final card = theme.components.card;
      final radius = BorderRadius.circular(42);
      final copy = card.copyWith(
        dimens: card.dimens.copyWith(borderRadius: radius),
      );
      expect(copy.dimens.borderRadius, radius);
      expect(copy.dimens.borderWidth, card.dimens.borderWidth);
      expect(copy.dimens.padding, card.dimens.padding);
      expect(copy.colors, same(card.colors));
      expect(copy.shadows, same(card.shadows));
    });

    test('ImpaktfullUiBadgeColorTheme.primaryBackground', () {
      final colors = theme.components.badge.colors;
      const color = Color(0xFF123456);
      final copy = colors.copyWith(primaryBackground: color);
      expect(copy.primaryBackground, color);
      expect(copy.primaryText, colors.primaryText);
      expect(copy.successBackground, colors.successBackground);
    });

    test('ImpaktfullUiButtonTheme.shadows', () {
      const shadow = ImpaktfullUiButtonShadowsTheme(
        primary: [BoxShadow(blurRadius: 4)],
        secondary: [],
        destructive: [],
      );
      final copy = theme.components.button.copyWith(shadows: shadow);
      expect(copy.shadows, same(shadow));
    });
  });

  testWidgets('a single token changed through ImpaktfullUiTheme.copyWith',
      (tester) async {
    final radius = BorderRadius.circular(42);
    final customTheme = theme.copyWith(
      components: theme.components.copyWith(
        card: theme.components.card.copyWith(
          dimens: theme.components.card.dimens.copyWith(borderRadius: radius),
        ),
      ),
    );
    late ImpaktfullUiCardTheme cardTheme;
    late ImpaktfullUiButtonTheme buttonTheme;
    await tester.pumpWidget(
      ImpaktfullUiApp(
        title: 'copyWith',
        showDebugFlag: false,
        impaktfullUiTheme: customTheme,
        home: Builder(
          builder: (context) {
            cardTheme = ImpaktfullUiCardTheme.of(context);
            buttonTheme = ImpaktfullUiButtonTheme.of(context);
            return const SizedBox();
          },
        ),
      ),
    );
    expect(cardTheme.dimens.borderRadius, radius);
    expect(cardTheme.dimens.padding, theme.components.card.dimens.padding);
    expect(buttonTheme, same(theme.components.button));
  });
}

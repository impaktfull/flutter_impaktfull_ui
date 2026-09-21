import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/screen_size_util.dart';

enum _SizeClass { small, medium, large, extraLarge }

void main() {
  // Default breakpoints: small 600, medium 1024, large 1440, extraLarge 1920.
  final cases = <double, _SizeClass>{
    1: _SizeClass.small,
    599: _SizeClass.small,
    600: _SizeClass.small,
    601: _SizeClass.small,
    1023: _SizeClass.small,
    1024: _SizeClass.small,
    1025: _SizeClass.medium,
    1439: _SizeClass.medium,
    1440: _SizeClass.medium,
    1441: _SizeClass.large,
    1919: _SizeClass.large,
    1920: _SizeClass.large,
    1921: _SizeClass.extraLarge,
    3000: _SizeClass.extraLarge,
  };

  /// The helpers follow the theme breakpoints (`breakpointSmall` is the
  /// largest small width, ...). This differs from build(), see
  /// doc/migrations/1.0.0.md.
  Map<String, bool> expectedHelpers(
    double width,
    ImpaktfullUiResponsiveLayoutDimensTheme dimens,
  ) =>
      {
        'isSmallOrSmaller': width <= dimens.breakpointSmall,
        'isMediumOrSmaller': width <= dimens.breakpointMedium,
        'isLargeOrSmaller': width <= dimens.breakpointLarge,
        'isSmallOrBigger': true,
        'isMediumOrBigger': width > dimens.breakpointMedium,
        'isLargeOrBigger': width > dimens.breakpointLarge,
        'isExtraLargeOrBigger': width >= dimens.breakpointLarge,
      };

  Map<String, bool> helpers(BuildContext context,
          {ImpaktfullUiResponsiveLayoutTheme? overrideTheme}) =>
      {
        'isSmallOrSmaller': ImpaktfullUiResponsiveLayout.isSmallOrSmaller(
            context,
            overrideTheme: overrideTheme),
        'isMediumOrSmaller': ImpaktfullUiResponsiveLayout.isMediumOrSmaller(
            context,
            overrideTheme: overrideTheme),
        'isLargeOrSmaller': ImpaktfullUiResponsiveLayout.isLargeOrSmaller(
            context,
            overrideTheme: overrideTheme),
        'isSmallOrBigger': ImpaktfullUiResponsiveLayout.isSmallOrBigger(context,
            overrideTheme: overrideTheme),
        'isMediumOrBigger': ImpaktfullUiResponsiveLayout.isMediumOrBigger(
            context,
            overrideTheme: overrideTheme),
        'isLargeOrBigger': ImpaktfullUiResponsiveLayout.isLargeOrBigger(context,
            overrideTheme: overrideTheme),
        'isExtraLargeOrBigger':
            ImpaktfullUiResponsiveLayout.isExtraLargeOrBigger(context,
                overrideTheme: overrideTheme),
      };

  Map<String, bool> extensionHelpers(BuildContext context) => {
        'isSmallOrSmaller': context.isSmallScreenOrSmaller,
        'isMediumOrSmaller': context.isMediumScreenOrSmaller,
        'isLargeOrSmaller': context.isLargeScreenOrSmaller,
        'isSmallOrBigger': context.isSmallScreenOrBigger,
        'isMediumOrBigger': context.isMediumScreenOrBigger,
        'isLargeOrBigger': context.isLargeScreenOrBigger,
        'isExtraLargeOrBigger': context.isExtraLargeScreenOrBigger,
      };

  Widget layout({ImpaktfullUiResponsiveLayoutTheme? theme}) =>
      ImpaktfullUiResponsiveLayout(
        theme: theme,
        small: (context) => const Text('small'),
        medium: (context) => const Text('medium'),
        large: (context) => const Text('large'),
        extraLarge: (context) => const Text('extraLarge'),
      );

  for (final entry in cases.entries) {
    final width = entry.key;
    final sizeClass = entry.value;
    testWidgets('width $width is ${sizeClass.name}', (tester) async {
      setScreenSize(tester, Size(width, 800));
      late BuildContext context;
      await tester.pumpWidget(ImpaktfullUiApp(
        title: 'app',
        showDebugFlag: false,
        home: Builder(builder: (c) {
          context = c;
          return layout();
        }),
      ));

      final dimens = ImpaktfullUiResponsiveLayoutTheme.of(context).dimens;
      // build() picks the builder of the size class.
      expect(find.text(sizeClass.name), findsOneWidget);
      expect(helpers(context), expectedHelpers(width, dimens));
      expect(extensionHelpers(context), expectedHelpers(width, dimens));
    });
  }

  testWidgets('helpers and build() use the override theme', (tester) async {
    const overrideTheme = ImpaktfullUiResponsiveLayoutTheme(
      assets: ImpaktfullUiResponsiveLayoutAssetsTheme(),
      colors: ImpaktfullUiResponsiveLayoutColorTheme(),
      dimens: ImpaktfullUiResponsiveLayoutDimensTheme(
        breakpointSmall: 100,
        breakpointMedium: 200,
        breakpointLarge: 300,
        breakpointExtraLarge: 400,
      ),
      textStyles: ImpaktfullUiResponsiveLayoutTextStyleTheme(),
    );
    final overrideCases = <double, _SizeClass>{
      100: _SizeClass.small,
      101: _SizeClass.small,
      200: _SizeClass.small,
      201: _SizeClass.medium,
      300: _SizeClass.medium,
      301: _SizeClass.large,
      400: _SizeClass.large,
      401: _SizeClass.extraLarge,
    };
    for (final entry in overrideCases.entries) {
      setScreenSize(tester, Size(entry.key, 800));
      late BuildContext context;
      await tester.pumpWidget(ImpaktfullUiApp(
        title: 'app',
        showDebugFlag: false,
        home: Builder(builder: (c) {
          context = c;
          return layout(theme: overrideTheme);
        }),
      ));
      expect(find.text(entry.value.name), findsOneWidget,
          reason: 'width ${entry.key}');
      expect(
        helpers(context, overrideTheme: overrideTheme),
        expectedHelpers(entry.key, overrideTheme.dimens),
        reason: 'width ${entry.key}',
      );
    }
  });

  testWidgets('falls back to smaller builders', (tester) async {
    setScreenSize(tester, const Size(3000, 800));
    await tester.pumpWidget(ImpaktfullUiApp(
      title: 'app',
      showDebugFlag: false,
      home: ImpaktfullUiResponsiveLayout(
        small: (context) => const Text('small'),
        medium: (context) => const Text('medium'),
      ),
    ));
    expect(find.text('medium'), findsOneWidget);
  });

  testWidgets('explicit results at the default boundaries', (tester) async {
    // width: [isSmallOrSmaller, isMediumOrSmaller, isLargeOrSmaller,
    //   isSmallOrBigger, isMediumOrBigger, isLargeOrBigger,
    //   isExtraLargeOrBigger]
    final table = <double, List<bool>>{
      1: [true, true, true, true, false, false, false],
      600: [true, true, true, true, false, false, false],
      601: [false, true, true, true, false, false, false],
      1024: [false, true, true, true, false, false, false],
      1025: [false, false, true, true, true, false, false],
      1439: [false, false, true, true, true, false, false],
      // Known overlap: isLargeOrSmaller and isExtraLargeOrBigger are both
      // true at exactly breakpointLarge.
      1440: [false, false, true, true, true, false, true],
      1441: [false, false, false, true, true, true, true],
      3000: [false, false, false, true, true, true, true],
    };
    for (final entry in table.entries) {
      setScreenSize(tester, Size(entry.key, 800));
      late BuildContext context;
      await tester.pumpWidget(ImpaktfullUiApp(
        title: 'app',
        showDebugFlag: false,
        home: Builder(builder: (c) {
          context = c;
          return const SizedBox();
        }),
      ));
      expect(helpers(context).values.toList(), entry.value,
          reason: 'width ${entry.key}');
      expect(extensionHelpers(context).values.toList(), entry.value,
          reason: 'width ${entry.key}');
    }
  });
}

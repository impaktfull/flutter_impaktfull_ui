import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../_core_test_helpers.dart';

typedef _Result = Map<String, bool>;

void main() {
  final dimens =
      ImpaktfullUiTheme.getDefault().components.responsiveLayout.dimens;

  Future<bool> isExtraLargeFor(WidgetTester tester, double width) async {
    late bool result;
    await pumpImpaktfullUiApp(
      tester,
      Builder(builder: (context) {
        result = context.isExtraLargeScreenOrBigger;
        return const SizedBox();
      }),
      screenSize: Size(width, 800),
    );
    return result;
  }

  Future<_Result> resultsFor(WidgetTester tester, double width) async {
    late _Result result;
    await pumpImpaktfullUiApp(
      tester,
      Builder(builder: (context) {
        result = {
          'smallOrBigger': context.isSmallScreenOrBigger,
          'mediumOrBigger': context.isMediumScreenOrBigger,
          'largeOrBigger': context.isLargeScreenOrBigger,
          'smallOrSmaller': context.isSmallScreenOrSmaller,
          'mediumOrSmaller': context.isMediumScreenOrSmaller,
          'largeOrSmaller': context.isLargeScreenOrSmaller,
        };
        return const SizedBox();
      }),
      screenSize: Size(width, 800),
    );
    return result;
  }

  test('the default breakpoints are ascending', () {
    expect(dimens.breakpointSmall, lessThan(dimens.breakpointMedium));
    expect(dimens.breakpointMedium, lessThan(dimens.breakpointLarge));
    expect(dimens.breakpointLarge, lessThan(dimens.breakpointExtraLarge));
  });

  testWidgets('a small screen', (tester) async {
    final result = await resultsFor(tester, dimens.breakpointSmall);
    expect(result, {
      'smallOrBigger': true,
      'mediumOrBigger': false,
      'largeOrBigger': false,
      'smallOrSmaller': true,
      'mediumOrSmaller': true,
      'largeOrSmaller': true,
    });
  });

  testWidgets('a medium screen', (tester) async {
    final result = await resultsFor(tester, dimens.breakpointSmall + 1);
    expect(result, {
      'smallOrBigger': true,
      'mediumOrBigger': false,
      'largeOrBigger': false,
      'smallOrSmaller': false,
      'mediumOrSmaller': true,
      'largeOrSmaller': true,
    });
  });

  testWidgets('just above the medium breakpoint', (tester) async {
    final result = await resultsFor(tester, dimens.breakpointMedium + 1);
    expect(result, {
      'smallOrBigger': true,
      'mediumOrBigger': true,
      'largeOrBigger': false,
      'smallOrSmaller': false,
      'mediumOrSmaller': false,
      'largeOrSmaller': true,
    });
  });

  testWidgets('just above the large breakpoint', (tester) async {
    final result = await resultsFor(tester, dimens.breakpointLarge + 1);
    expect(result, {
      'smallOrBigger': true,
      'mediumOrBigger': true,
      'largeOrBigger': true,
      'smallOrSmaller': false,
      'mediumOrSmaller': false,
      'largeOrSmaller': false,
    });
  });

  testWidgets('just above the extra large breakpoint', (tester) async {
    final result = await resultsFor(tester, dimens.breakpointExtraLarge + 1);
    expect(result, {
      'smallOrBigger': true,
      'mediumOrBigger': true,
      'largeOrBigger': true,
      'smallOrSmaller': false,
      'mediumOrSmaller': false,
      'largeOrSmaller': false,
    });
  });

  testWidgets('an extra large screen is extra large or bigger', (tester) async {
    expect(
        await isExtraLargeFor(tester, dimens.breakpointExtraLarge + 1), isTrue);
  });

  // isExtraLargeOrBigger is true from breakpointLarge (>=), not above
  // breakpointExtraLarge like ImpaktfullUiResponsiveLayout.build. This is
  // kept on purpose until 1.0.0, see "Planned breaking changes" in
  // doc/migrations/1.0.0.md.
  testWidgets('extra large or bigger starts at the large breakpoint',
      (tester) async {
    expect(await isExtraLargeFor(tester, dimens.breakpointLarge - 1), isFalse);
    expect(await isExtraLargeFor(tester, dimens.breakpointLarge), isTrue);
    expect(await isExtraLargeFor(tester, dimens.breakpointExtraLarge), isTrue);
  });
}

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/src/util/file_size/file_size_calculation_util.dart';

void main() {
  String calculate(int bytes) =>
      FileSizeCalculationUtil.calculateFileSize(bytes);

  test('0 bytes', () {
    expect(calculate(0), '0 B');
  });

  test('bytes', () {
    expect(calculate(1), '1.00 B');
    expect(calculate(1023), '1023.00 B');
  });

  test('uses 1024 as the base for every unit', () {
    expect(calculate(1024), '1.00 KB');
    expect(calculate(1024 * 1024), '1.00 MB');
    expect(calculate(1024 * 1024 * 1024), '1.00 GB');
    expect(calculate(1024 * 1024 * 1024 * 1024), '1.00 TB');
  });

  test('rounds to 2 decimals', () {
    expect(calculate(1536), '1.50 KB');
    expect(calculate(1500), '1.46 KB');
    expect(calculate(5 * 1024 * 1024 + 256 * 1024), '5.25 MB');
  });

  test('PB and EB', () {
    expect(calculate(1024 * 1024 * 1024 * 1024 * 1024), '1.00 PB');
    expect(calculate(1024 * 1024 * 1024 * 1024 * 1024 * 1024), '1.00 EB');
  });

  test('the largest int stays in EB', () {
    // 2^63 - 1 bytes is just below 8 EB.
    expect(calculate(0x7FFFFFFFFFFFFFFF), '8.00 EB');
  });

  group('with a locale', () {
    Future<BuildContext> pumpLocale(WidgetTester tester, Locale locale) async {
      late BuildContext context;
      await tester.pumpWidget(
        Localizations(
          locale: locale,
          delegates: const [DefaultWidgetsLocalizations.delegate],
          child: Builder(builder: (c) {
            context = c;
            return const SizedBox();
          }),
        ),
      );
      return context;
    }

    testWidgets('uses the decimal separator of the locale', (tester) async {
      final context = await pumpLocale(tester, const Locale('nl'));
      expect(FileSizeCalculationUtil.calculateFileSize(1536, context: context),
          '1,50 KB');
    });

    testWidgets('formats PB and EB in a non English locale', (tester) async {
      final context = await pumpLocale(tester, const Locale('nl'));
      String calculateNl(int bytes) =>
          FileSizeCalculationUtil.calculateFileSize(bytes, context: context);
      const pb = 1024 * 1024 * 1024 * 1024 * 1024;
      expect(calculateNl(pb), '1,00 PB');
      expect(calculateNl(pb * 1536 ~/ 1024), '1,50 PB');
      expect(calculateNl(pb * 1024), '1,00 EB');
      expect(calculateNl(0x7FFFFFFFFFFFFFFF), '8,00 EB');
    });

    testWidgets('formats PB with the English separator for en', (tester) async {
      final context = await pumpLocale(tester, const Locale('en'));
      expect(
          FileSizeCalculationUtil.calculateFileSize(
              1024 * 1024 * 1024 * 1024 * 1024,
              context: context),
          '1.00 PB');
    });
  });
}

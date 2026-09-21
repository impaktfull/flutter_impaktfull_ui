import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';
import '../_data_display_test_helpers.dart';

void main() {
  final metricTheme = ImpaktfullUiTheme.getDefault().components.metric;

  Future<void> pumpMetric(WidgetTester tester, Widget metric) =>
      pumpAndSettleComponent(
        tester,
        Align(
          alignment: Alignment.topLeft,
          child: SizedBox(width: 320, child: metric),
        ),
      );

  testWidgets('onTap is called when the card is tapped', (tester) async {
    var taps = 0;
    await pumpMetric(
      tester,
      ImpaktfullUiMetric(title: 'Users', value: '10', onTap: () => taps++),
    );
    await tester.tap(find.text('10'));
    expect(taps, 1);
  });

  testWidgets('onMoreTapped is called by the more button', (tester) async {
    var taps = 0;
    var moreTaps = 0;
    await pumpMetric(
      tester,
      ImpaktfullUiMetric(
        title: 'Users',
        value: '10',
        onTap: () => taps++,
        onMoreTapped: () => moreTaps++,
      ),
    );
    await tester.tap(findAsset(metricTheme.assets.more));
    expect(moreTaps, 1);
    expect(taps, 0);
  });

  testWidgets('without onMoreTapped there is no more button', (tester) async {
    await pumpMetric(
      tester,
      const ImpaktfullUiMetric(title: 'Users', value: '10'),
    );
    expect(findAsset(metricTheme.assets.more), findsNothing);
  });

  testWidgets('actions are shown below a divider and can be tapped',
      (tester) async {
    var taps = 0;
    await pumpMetric(
      tester,
      ImpaktfullUiMetric(
        title: 'Users',
        value: '10',
        actions: [
          ImpaktfullUiButton(
            type: ImpaktfullUiButtonType.secondary,
            title: 'Details',
            onTap: () => taps++,
          ),
        ],
      ),
    );
    expect(find.byType(ImpaktfullUiDivider), findsOneWidget);
    await tester.tap(find.text('Details'));
    expect(taps, 1);
  });

  testWidgets('without actions there is no divider', (tester) async {
    await pumpMetric(
      tester,
      const ImpaktfullUiMetric(title: 'Users', value: '10'),
    );
    expect(find.byType(ImpaktfullUiDivider), findsNothing);
  });

  final impactStyles = {
    ImpaktfullUiMetricImpactType.positive: metricTheme.textStyles.value2Growth,
    ImpaktfullUiMetricImpactType.neutral: metricTheme.textStyles.value2Neutral,
    ImpaktfullUiMetricImpactType.negative: metricTheme.textStyles.value2Decline,
    ImpaktfullUiMetricImpactType.branded: metricTheme.textStyles.value2Branded,
    ImpaktfullUiMetricImpactType.custom: metricTheme.textStyles.value2Custom,
  };
  for (final MapEntry(key: impactType, value: style) in impactStyles.entries) {
    testWidgets('$impactType uses its own style for the extra value',
        (tester) async {
      await pumpMetric(
        tester,
        ImpaktfullUiMetric(
          title: 'Users',
          value: '10',
          extraTextValue: '5%',
          leadingExtraTextValue: testIcon2,
          impactType: impactType,
        ),
      );
      expect(tester.widget<Text>(find.text('5%')).style, style);
      expect(
        tester.widget<ImpaktfullUiAssetWidget>(findAsset(testIcon2)).color,
        style.color,
      );
    });
  }

  testWidgets('leadingBuilder wins over leadingAsset', (tester) async {
    await pumpMetric(
      tester,
      ImpaktfullUiMetric(
        title: 'Users',
        value: '10',
        leadingAsset: testIcon,
        leadingBuilder: (context) => const Text('Leading'),
      ),
    );
    expect(find.text('Leading'), findsOneWidget);
    expect(findAsset(testIcon), findsNothing);
  });

  testWidgets('left and bottom value builders are shown', (tester) async {
    await pumpMetric(
      tester,
      ImpaktfullUiMetric(
        title: 'Users',
        value: '10',
        leftValueBuilder: (context) => const Text('Left'),
        bottomValueBuilder: (context) => const Text('Bottom'),
      ),
    );
    expect(find.text('Left'), findsOneWidget);
    expect(find.text('Bottom'), findsOneWidget);
    expect(
      tester.getTopLeft(find.text('Bottom')).dy,
      greaterThan(tester.getTopLeft(find.text('10')).dy),
    );
  });

  testWidgets('a long title is truncated on one line', (tester) async {
    await pumpMetric(
      tester,
      const ImpaktfullUiMetric(title: longText, value: '10'),
    );
    final text = tester.widget<Text>(find.text(longText));
    expect(text.maxLines, 1);
    expect(text.overflow, TextOverflow.ellipsis);
    expect(tester.takeException(), isNull);
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';
import '../_data_display_test_helpers.dart';

void main() {
  final placeholderTheme =
      ImpaktfullUiTheme.getDefault().components.placeholder;

  testWidgets('shows the title and subtitle with the theme styles',
      (tester) async {
    await pumpAndSettleComponent(
      tester,
      const ImpaktfullUiPlaceholder(title: 'Title', subtitle: 'Subtitle'),
    );
    expect(tester.widget<Text>(find.text('Title')).style,
        placeholderTheme.textStyles.title);
    expect(tester.widget<Text>(find.text('Subtitle')).style,
        placeholderTheme.textStyles.subtitle);
  });

  testWidgets('custom styles replace the theme styles', (tester) async {
    const titleStyle = TextStyle(fontSize: 30);
    const subtitleStyle = TextStyle(fontSize: 10);
    await pumpAndSettleComponent(
      tester,
      const ImpaktfullUiPlaceholder(
        title: 'Title',
        subtitle: 'Subtitle',
        titleStyle: titleStyle,
        subtitleStyle: subtitleStyle,
      ),
    );
    expect(tester.widget<Text>(find.text('Title')).style, titleStyle);
    expect(tester.widget<Text>(find.text('Subtitle')).style, subtitleStyle);
  });

  testWidgets('the asset gets the size of the theme', (tester) async {
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiPlaceholder(asset: testIcon, title: 'Title'),
    );
    final asset = tester.widget<ImpaktfullUiAssetWidget>(findAsset(testIcon));
    expect(asset.width, placeholderTheme.dimens.assetWidth);
    expect(asset.height, placeholderTheme.dimens.assetHeight);
  });

  testWidgets('assetBuilder wins over asset', (tester) async {
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiPlaceholder(
        asset: testIcon,
        assetBuilder: (context) => const Text('Builder'),
        title: 'Title',
      ),
    );
    expect(find.text('Builder'), findsOneWidget);
    expect(findAsset(testIcon), findsNothing);
  });

  testWidgets('showAsset false hides the asset', (tester) async {
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiPlaceholder(
        asset: testIcon,
        assetBuilder: (context) => const Text('Builder'),
        showAsset: false,
        title: 'Title',
      ),
    );
    expect(find.text('Builder'), findsNothing);
    expect(findAsset(testIcon), findsNothing);
  });

  testWidgets('actions can be tapped', (tester) async {
    var taps = 0;
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiPlaceholder(
        title: 'Title',
        actions: [
          ImpaktfullUiButton(
            type: ImpaktfullUiButtonType.primary,
            title: 'Action',
            onTap: () => taps++,
          ),
        ],
      ),
    );
    await tester.tap(find.text('Action'));
    expect(taps, 1);
  });

  testWidgets('uses the margin that is passed', (tester) async {
    const margin = EdgeInsets.all(27);
    await pumpAndSettleComponent(
      tester,
      const ImpaktfullUiPlaceholder(title: 'Title', margin: margin),
    );
    expect(
      find.byWidgetPredicate(
        (widget) => widget is Padding && widget.padding == margin,
      ),
      findsOneWidget,
    );
  });

  testWidgets('without a title and subtitle there is no text', (tester) async {
    await pumpAndSettleComponent(tester, const ImpaktfullUiPlaceholder());
    expect(find.byType(Text), findsNothing);
  });
}

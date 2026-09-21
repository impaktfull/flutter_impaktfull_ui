import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';
import '../_data_display_test_helpers.dart';

void main() {
  final sectionTitleTheme =
      ImpaktfullUiTheme.getDefault().components.sectionTitle;

  bool hasPadding(EdgeInsetsGeometry padding) => find
      .byWidgetPredicate(
        (widget) => widget is Padding && widget.padding == padding,
      )
      .evaluate()
      .isNotEmpty;

  testWidgets('actions can be tapped', (tester) async {
    var taps = 0;
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiSectionTitle(
        title: 'Title',
        actions: [
          ImpaktfullUiIconButton(asset: testIcon, onTap: () => taps++),
        ],
      ),
    );
    await tester.tap(findAsset(testIcon));
    expect(taps, 1);
  });

  testWidgets('without actions the default margin is used', (tester) async {
    await pumpAndSettleComponent(
      tester,
      const ImpaktfullUiSectionTitle(title: 'Title'),
    );
    expect(hasPadding(sectionTitleTheme.dimens.margin), isTrue);
  });

  testWidgets('only icon buttons use the icon button margin', (tester) async {
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiSectionTitle(
        title: 'Title',
        actions: [ImpaktfullUiIconButton(asset: testIcon, onTap: () {})],
      ),
    );
    expect(
      hasPadding(sectionTitleTheme.dimens.marginWithIconButtonActions),
      isTrue,
    );
  });

  for (final (size, iconButtonMargin) in [
    (ImpaktfullUiButtonSize.small, true),
    (ImpaktfullUiButtonSize.large, false),
  ]) {
    testWidgets(
        'a $size button uses the icon button margin: '
        '$iconButtonMargin', (tester) async {
      await pumpAndSettleComponent(
        tester,
        ImpaktfullUiSectionTitle(
          title: 'Title',
          actions: [
            ImpaktfullUiButton(
              type: ImpaktfullUiButtonType.tertiary,
              size: size,
              title: 'Action',
              onTap: () {},
            ),
          ],
        ),
      );
      expect(
        hasPadding(iconButtonMargin
            ? sectionTitleTheme.dimens.marginWithIconButtonActions
            : sectionTitleTheme.dimens.margin),
        isTrue,
      );
    });
  }

  testWidgets('a custom margin wins', (tester) async {
    const margin = EdgeInsets.all(31);
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiSectionTitle(
        title: 'Title',
        margin: margin,
        actions: [ImpaktfullUiIconButton(asset: testIcon, onTap: () {})],
      ),
    );
    expect(hasPadding(margin), isTrue);
  });

  testWidgets('uses the text align and style', (tester) async {
    await pumpAndSettleComponent(
      tester,
      const ImpaktfullUiSectionTitle(
        title: 'Title',
        textAlign: TextAlign.center,
      ),
    );
    final text = tester.widget<Text>(find.text('Title'));
    expect(text.textAlign, TextAlign.center);
    expect(text.style, sectionTitleTheme.textStyles.title);
  });
}

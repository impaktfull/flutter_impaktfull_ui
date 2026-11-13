import 'package:material_ui/material_ui.dart';
import 'package:flutter/rendering.dart';
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

  /// The left and right edge of the glyphs of [text] in its paragraph.
  (double, double) glyphEdges(WidgetTester tester, String text) {
    final paragraph = tester.renderObject<RenderParagraph>(find.text(text));
    final boxes = paragraph.getBoxesForSelection(
      TextSelection(baseOffset: 0, extentOffset: text.length),
    );
    return (boxes.first.left, boxes.last.right);
  }

  group('overline and subtitle', () {
    testWidgets('without them only the title row is shown', (tester) async {
      await pumpAndSettleComponent(
        tester,
        const ImpaktfullUiSectionTitle(title: 'Title'),
      );
      expect(find.byType(Text), findsOneWidget);
      expect(
        find.descendant(
          of: find.byType(ImpaktfullUiSectionTitle),
          matching: find.byType(Column),
        ),
        findsNothing,
      );
    });

    testWidgets('renders the overline above and the subtitle under the title',
        (tester) async {
      await pumpAndSettleComponent(
        tester,
        const ImpaktfullUiSectionTitle(
          overline: 'STEP 2 OF 3',
          title: 'Choose a class',
          subtitle: 'Only classes you teach are shown',
        ),
      );
      final overline = tester.getRect(find.text('STEP 2 OF 3'));
      final title = tester.getRect(find.text('Choose a class'));
      final subtitle =
          tester.getRect(find.text('Only classes you teach are shown'));
      expect(
        title.top - overline.bottom,
        sectionTitleTheme.dimens.overlineSpacing,
      );
      expect(
        subtitle.top - title.bottom,
        sectionTitleTheme.dimens.subtitleSpacing,
      );
      expect(
        tester.widget<Text>(find.text('STEP 2 OF 3')).style,
        sectionTitleTheme.textStyles.overline,
      );
      expect(
        tester
            .widget<Text>(find.text('Only classes you teach are shown'))
            .style,
        sectionTitleTheme.textStyles.subtitle,
      );
    });

    testWidgets('renders only the subtitle', (tester) async {
      await pumpAndSettleComponent(
        tester,
        const ImpaktfullUiSectionTitle(title: 'Title', subtitle: 'Subtitle'),
      );
      expect(find.byType(Text), findsNWidgets(2));
      expect(find.text('Subtitle'), findsOneWidget);
    });

    testWidgets('renders only the overline', (tester) async {
      await pumpAndSettleComponent(
        tester,
        const ImpaktfullUiSectionTitle(title: 'Title', overline: 'Overline'),
      );
      expect(find.byType(Text), findsNWidgets(2));
      expect(find.text('Overline'), findsOneWidget);
    });

    testWidgets('a theme without their styles uses the title style',
        (tester) async {
      await pumpAndSettleComponent(
        tester,
        ImpaktfullUiSectionTitle(
          overline: 'Overline',
          title: 'Title',
          subtitle: 'Subtitle',
          theme: sectionTitleTheme.copyWith(
            textStyles: ImpaktfullUiSectionTitleTextStyleTheme(
              title: sectionTitleTheme.textStyles.title,
            ),
          ),
        ),
      );
      for (final text in ['Overline', 'Subtitle']) {
        expect(
          tester.widget<Text>(find.text(text)).style,
          sectionTitleTheme.textStyles.title,
        );
      }
    });

    testWidgets('textAlign applies to every line', (tester) async {
      await pumpAndSettleComponent(
        tester,
        const ImpaktfullUiSectionTitle(
          overline: 'Overline',
          title: 'Title',
          subtitle: 'Subtitle',
          textAlign: TextAlign.center,
        ),
      );
      for (final text in ['Overline', 'Title', 'Subtitle']) {
        expect(
            tester.widget<Text>(find.text(text)).textAlign, TextAlign.center);
      }
    });

    testWidgets('the actions are centred on the text block', (tester) async {
      await pumpAndSettleComponent(
        tester,
        ImpaktfullUiSectionTitle(
          overline: 'Overline',
          title: 'Title',
          subtitle: 'Subtitle',
          actions: [ImpaktfullUiIconButton(asset: testIcon, onTap: () {})],
        ),
      );
      final overline = tester.getRect(find.text('Overline'));
      final subtitle = tester.getRect(find.text('Subtitle'));
      final title = tester.getRect(find.text('Title'));
      final action = tester.getRect(find.byType(ImpaktfullUiIconButton));
      expect(
        action.center.dy,
        moreOrLessEquals((overline.top + subtitle.bottom) / 2),
      );
      // The spacing between the lines does not grow with the actions.
      expect(
        title.top - overline.bottom,
        sectionTitleTheme.dimens.overlineSpacing,
      );
      expect(
        subtitle.top - title.bottom,
        sectionTitleTheme.dimens.subtitleSpacing,
      );
    });

    for (final (direction, startsLeft) in [
      (TextDirection.ltr, true),
      (TextDirection.rtl, false),
    ]) {
      testWidgets('every line starts at the start in $direction',
          (tester) async {
        await pumpAndSettleComponent(
          tester,
          Directionality(
            textDirection: direction,
            child: ImpaktfullUiSectionTitle(
              overline: 'Overline',
              title: 'Title',
              subtitle: 'Subtitle',
              actions: [ImpaktfullUiIconButton(asset: testIcon, onTap: () {})],
            ),
          ),
        );
        final action = tester.getRect(find.byType(ImpaktfullUiIconButton));
        final title = tester.getRect(find.text('Title'));
        expect(action.center.dx > title.center.dx, startsLeft);
        for (final text in ['Overline', 'Title', 'Subtitle']) {
          final width = tester.getSize(find.text(text)).width;
          final (left, right) = glyphEdges(tester, text);
          if (startsLeft) {
            expect(left, moreOrLessEquals(0, epsilon: 1));
          } else {
            expect(right, moreOrLessEquals(width, epsilon: 1));
          }
        }
      });
    }
  });
}

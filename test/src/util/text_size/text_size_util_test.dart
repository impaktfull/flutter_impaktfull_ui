import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/src/util/text_size/text_size_util.dart';

void main() {
  // The test font (Ahem-like) renders every glyph as a square of fontSize.
  const style = TextStyle(fontSize: 10);

  Future<BuildContext> pumpContext(
    WidgetTester tester, {
    TextDirection direction = TextDirection.ltr,
  }) async {
    late BuildContext context;
    await tester.pumpWidget(
      Directionality(
        textDirection: direction,
        child: Builder(builder: (c) {
          context = c;
          return const SizedBox();
        }),
      ),
    );
    return context;
  }

  testWidgets('measures the width of a single line', (tester) async {
    final context = await pumpContext(tester);
    expect(
      TextSizeUtil.getTextWidth(context: context, text: 'abcd', style: style),
      40,
    );
  });

  testWidgets('empty text has no width', (tester) async {
    final context = await pumpContext(tester);
    expect(
      TextSizeUtil.getTextWidth(context: context, text: '', style: style),
      0,
    );
  });

  testWidgets('scales with the font size', (tester) async {
    final context = await pumpContext(tester);
    final small =
        TextSizeUtil.getTextWidth(context: context, text: 'abc', style: style);
    final large = TextSizeUtil.getTextWidth(
      context: context,
      text: 'abc',
      style: const TextStyle(fontSize: 20),
    );
    expect(large, small * 2);
  });

  testWidgets('multi line text returns the widest line', (tester) async {
    final context = await pumpContext(tester);
    expect(
      TextSizeUtil.getTextWidth(
        context: context,
        text: 'ab\nabcdef',
        style: style,
        maxLines: 2,
      ),
      60,
    );
  });

  testWidgets('works in a right to left context', (tester) async {
    final context = await pumpContext(tester, direction: TextDirection.rtl);
    expect(
      TextSizeUtil.getTextWidth(context: context, text: 'abcd', style: style),
      40,
    );
  });

  testWidgets('throws without a Directionality', (tester) async {
    late BuildContext context;
    await tester.pumpWidget(Builder(builder: (c) {
      context = c;
      return const SizedBox();
    }));
    expect(
      () =>
          TextSizeUtil.getTextWidth(context: context, text: 'a', style: style),
      throwsA(isA<FlutterError>()),
    );
  });
}

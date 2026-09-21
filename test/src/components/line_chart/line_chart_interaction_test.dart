import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui/src/components/line_chart/painter/line_chart_painter.dart';

import '../_data_display_test_helpers.dart';

/// Records what the painter draws.
class _RecordingCanvas implements Canvas {
  final paths = <(Path, Paint)>[];
  final rects = <(Rect, Paint)>[];

  @override
  void drawPath(Path path, Paint paint) => paths.add((path, paint));

  @override
  void drawRect(Rect rect, Paint paint) => rects.add((rect, paint));

  @override
  dynamic noSuchMethod(Invocation invocation) => null;
}

void main() {
  final lineChartTheme = ImpaktfullUiTheme.getDefault().components.lineChart;

  ImpaktfullUiLineChartItemData<double, double> data(
    List<double> values, {
    ImpaktfullUiLineChartItemStyle? style,
  }) =>
      ImpaktfullUiLineChartItemData<double, double>(
        points: [
          for (final (index, value) in values.indexed)
            ImpaktfullUiLineChartItemDataItem(x: index.toDouble(), y: value),
        ],
        offsetBuilder: (x, y) => Offset(x, y),
        style: style,
      );

  Widget chart(List<ImpaktfullUiLineChartItemData<double, double>> data) =>
      Center(
        child: ImpaktfullUiLineChart<double, double>(
          width: 200,
          height: 100,
          data: data,
        ),
      );

  ImpaktfullUiLineChartPainter painter(WidgetTester tester) => tester
      .widget<CustomPaint>(find.descendant(
        of: find.byType(ImpaktfullUiLineChart<double, double>),
        matching: find.byType(CustomPaint),
      ))
      .painter! as ImpaktfullUiLineChartPainter;

  _RecordingCanvas paint(WidgetTester tester) {
    final canvas = _RecordingCanvas();
    painter(tester).paint(canvas, const Size(200, 100));
    return canvas;
  }

  testWidgets('has the size that is passed', (tester) async {
    await pumpSized(
        tester,
        chart([
          data(const [1, 2, 3])
        ]));
    expect(
      tester.getSize(find.byType(ImpaktfullUiLineChart<double, double>)),
      const Size(200, 100),
    );
  });

  testWidgets('draws the background and one path per line', (tester) async {
    await pumpSized(
      tester,
      chart([
        data(const [1, 2, 3]),
        data(const [3, 2, 1]),
      ]),
    );
    final canvas = paint(tester);
    expect(canvas.rects.single.$1, Offset.zero & const Size(200, 100));
    expect(
      canvas.rects.single.$2.color,
      isSameColorAs(lineChartTheme.colors.backgroundColor),
    );
    expect(canvas.paths.length, 2);
  });

  testWidgets('uses the theme for lines without a style', (tester) async {
    await pumpSized(
        tester,
        chart([
          data(const [1, 2, 3])
        ]));
    final linePaint = paint(tester).paths.single.$2;
    expect(linePaint.color, isSameColorAs(lineChartTheme.colors.lineColor));
    expect(linePaint.strokeWidth, lineChartTheme.dimens.strokeWidth);
  });

  testWidgets('uses the color and stroke width of the style', (tester) async {
    await pumpSized(
      tester,
      chart([
        data(
          const [1, 2, 3],
          style: ImpaktfullUiLineChartItemStyle(
            lineColor: Colors.red,
            strokeWidth: 6,
          ),
        ),
      ]),
    );
    final linePaint = paint(tester).paths.single.$2;
    expect(linePaint.color, isSameColorAs(Colors.red));
    expect(linePaint.strokeWidth, 6);
  });

  testWidgets('a gradient is drawn below the line', (tester) async {
    await pumpSized(
      tester,
      chart([
        data(
          const [1, 2, 3],
          style: ImpaktfullUiLineChartItemStyle(gradientEnabled: true),
        ),
      ]),
    );
    final paths = paint(tester).paths;
    expect(paths.length, 2);
    // The gradient is drawn first and fills up to the bottom.
    expect(paths.first.$2.shader, isNotNull);
    expect(paths.first.$1.getBounds().bottom, 100);
    expect(paths.last.$2.shader, isNull);
  });

  testWidgets('a curved line goes through the same start and end',
      (tester) async {
    Future<Rect> bounds({required bool isCurved}) async {
      await pumpSized(
        tester,
        chart([
          data(
            const [0, 10, 0, 10],
            style: ImpaktfullUiLineChartItemStyle(isCurved: isCurved),
          ),
        ]),
      );
      return paint(tester).paths.single.$1.getBounds();
    }

    final straight = await bounds(isCurved: false);
    final curved = await bounds(isCurved: true);
    expect(curved.left, straight.left);
    expect(curved.right, straight.right);
    // A curve does not reach the peaks of the straight line.
    expect(curved.top, greaterThanOrEqualTo(straight.top));
  });

  testWidgets('an empty line draws nothing and does not throw', (tester) async {
    await pumpSized(tester, chart([data(const [])]));
    expect(paint(tester).paths, isEmpty);
    expect(tester.takeException(), isNull);
  });

  testWidgets('does not repaint when rebuilt with the same data',
      (tester) async {
    final lines = [
      data(const [1, 2, 3])
    ];
    late StateSetter setState;
    await pumpSized(
      tester,
      StatefulBuilder(
        builder: (context, setter) {
          setState = setter;
          return chart(lines);
        },
      ),
    );
    final oldPainter = painter(tester);
    setState(() {});
    await tester.pump();
    expect(painter(tester).shouldRepaint(oldPainter), isFalse);
  });

  testWidgets('repaints when a line is added by the parent', (tester) async {
    var lines = [
      data(const [1, 2, 3])
    ];
    late StateSetter setState;
    await pumpSized(
      tester,
      StatefulBuilder(
        builder: (context, setter) {
          setState = setter;
          return chart(lines);
        },
      ),
    );
    final oldPainter = painter(tester);
    setState(() => lines = [
          ...lines,
          data(const [3, 2, 1])
        ]);
    await tester.pump();
    expect(painter(tester).shouldRepaint(oldPainter), isTrue);
    expect(paint(tester).paths.length, 2);
  });

  testWidgets('repaints when the theme changes', (tester) async {
    final lines = [
      data(const [1, 2, 3])
    ];
    ImpaktfullUiLineChartTheme? theme;
    late StateSetter setState;
    await pumpSized(
      tester,
      StatefulBuilder(
        builder: (context, setter) {
          setState = setter;
          return ImpaktfullUiLineChart<double, double>(
            width: 200,
            height: 100,
            data: lines,
            theme: theme,
          );
        },
      ),
    );
    final oldPainter = painter(tester);
    setState(
      () => theme = ImpaktfullUiLineChartTheme(
        assets: lineChartTheme.assets,
        colors: const ImpaktfullUiLineChartColorTheme(
          lineColor: Colors.red,
          backgroundColor: Colors.black,
        ),
        dimens: lineChartTheme.dimens,
        textStyles: lineChartTheme.textStyles,
      ),
    );
    await tester.pump();
    expect(painter(tester).shouldRepaint(oldPainter), isTrue);
    expect(paint(tester).paths.single.$2.color, isSameColorAs(Colors.red));
  });

  testWidgets(
    'a new theme of the parent replaces the line color of the old theme',
    (tester) async {
      final lines = [
        data(const [1, 2, 3])
      ];
      ImpaktfullUiLineChartTheme theme(Color lineColor) =>
          ImpaktfullUiLineChartTheme(
            assets: lineChartTheme.assets,
            colors: ImpaktfullUiLineChartColorTheme(
              lineColor: lineColor,
              backgroundColor: lineChartTheme.colors.backgroundColor,
            ),
            dimens: lineChartTheme.dimens,
            textStyles: lineChartTheme.textStyles,
          );
      var lineColor = Colors.green;
      late StateSetter setState;
      await pumpSized(
        tester,
        StatefulBuilder(
          builder: (context, setter) {
            setState = setter;
            return ImpaktfullUiLineChart<double, double>(
              width: 200,
              height: 100,
              data: lines,
              theme: theme(lineColor),
            );
          },
        ),
      );
      setState(() => lineColor = Colors.red);
      await tester.pump();
      expect(paint(tester).paths.single.$2.color, isSameColorAs(Colors.red));
    },
  );

  testWidgets(
    'a gradient with more than 2 colors and no stops does not throw',
    (tester) async {
      await pumpSized(
        tester,
        chart([
          data(
            const [1, 2, 3],
            style: ImpaktfullUiLineChartItemStyle(
              gradientEnabled: true,
              gradientColors: const [Colors.red, Colors.green, Colors.blue],
            ),
          ),
        ]),
      );
      expect(tester.takeException(), isNull);
    },
  );
}

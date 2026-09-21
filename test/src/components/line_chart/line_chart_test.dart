import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui/src/components/line_chart/model/line_chart_painter_data.dart';
import 'package:impaktfull_ui/src/components/line_chart/painter/line_chart_painter.dart';

class _PathRecordingCanvas implements Canvas {
  final paths = <Path>[];

  @override
  void drawPath(Path path, Paint paint) => paths.add(path);

  @override
  void drawRect(Rect rect, Paint paint) {}

  @override
  dynamic noSuchMethod(Invocation invocation) => null;
}

ImpaktfullUiLineChartPainterData _painterData(List<Offset> points) {
  final xs = points.map((point) => point.dx);
  final ys = points.map((point) => point.dy);
  return ImpaktfullUiLineChartPainterData(
    points: points,
    minX: xs.reduce((a, b) => a < b ? a : b),
    maxX: xs.reduce((a, b) => a > b ? a : b),
    minY: ys.reduce((a, b) => a < b ? a : b),
    maxY: ys.reduce((a, b) => a > b ? a : b),
    lineColor: null,
    strokeWidth: 2,
    isCurved: false,
    gradientEnabled: false,
    gradientColors: null,
    gradientStops: const [0, 1],
  );
}

ImpaktfullUiLineChartPainter _painter(
  List<ImpaktfullUiLineChartPainterData> data,
) =>
    ImpaktfullUiLineChartPainter(
      data: data,
      backgroundColor: const Color(0xFFFFFFFF),
      defaultLineColor: const Color(0xFF000000),
      defaultStrokeWidth: 2,
    );

/// Paints on a 102x102 canvas: with a stroke width of 2 the line is drawn in
/// the rect (1, 1, 101, 101).
Rect _paint(ImpaktfullUiLineChartPainter painter) {
  final canvas = _PathRecordingCanvas();
  painter.paint(canvas, const Size(102, 102));
  return canvas.paths.single.getBounds();
}

void main() {
  group('ImpaktfullUiLineChartItemData', () {
    test('the range includes 0 for positive values', () {
      final data = ImpaktfullUiLineChartItemData<double, double>(
        points: [
          ImpaktfullUiLineChartItemDataItem(x: 10, y: 50),
          ImpaktfullUiLineChartItemDataItem(x: 20, y: 100),
        ],
        offsetBuilder: (x, y) => Offset(x, y),
      );
      expect(data.minX, 0);
      expect(data.maxX, 20);
      expect(data.minY, 0);
      expect(data.maxY, 100);
    });

    test('the range includes 0 and the negative min for negative values', () {
      final data = ImpaktfullUiLineChartItemData<double, double>(
        points: [
          ImpaktfullUiLineChartItemDataItem(x: -10, y: -50),
          ImpaktfullUiLineChartItemDataItem(x: -5, y: -20),
        ],
        offsetBuilder: (x, y) => Offset(x, y),
      );
      expect(data.minX, -10);
      expect(data.maxX, 0);
      expect(data.minY, -50);
      expect(data.maxY, 0);
    });

    test('explicit min and max are used, no points is 0', () {
      final data = ImpaktfullUiLineChartItemData<double, double>(
        points: [],
        offsetBuilder: (x, y) => Offset(x, y),
        minY: -1,
      );
      expect(data.minY, -1);
      expect(data.maxY, 0);
    });
  });

  group('ImpaktfullUiLineChartPainter', () {
    test('the axis includes 0 for positive values', () {
      final bounds = _paint(_painter([
        _painterData(const [Offset(1, 50), Offset(2, 100)]),
      ]));
      // x: 0..2 and y: 0..100 on a 100x100 drawing area.
      expect(bounds.left, closeTo(51, 0.001));
      expect(bounds.right, closeTo(101, 0.001));
      expect(bounds.top, closeTo(1, 0.001));
      expect(bounds.bottom, closeTo(51, 0.001));
    });

    test('the axis includes 0 and the negative min for negative values', () {
      final bounds = _paint(_painter([
        _painterData(const [Offset(1, -50), Offset(2, -20)]),
      ]));
      // y: -50..0, so -20 is at 60% from the bottom.
      expect(bounds.top, closeTo(41, 0.001));
      expect(bounds.bottom, closeTo(101, 0.001));
    });

    test('equal values draw a flat line', () {
      final bounds = _paint(_painter([
        _painterData(const [Offset(1, 5), Offset(2, 5), Offset(3, 5)]),
      ]));
      // y: 0..5, so 5 is the top.
      expect(bounds.top, closeTo(1, 0.001));
      expect(bounds.height, 0);
    });

    test('all values 0 are drawn in the middle instead of NaN', () {
      final bounds = _paint(_painter([
        _painterData(const [Offset(0, 0), Offset(0, 0)]),
      ]));
      expect(bounds.left, closeTo(51, 0.001));
      expect(bounds.top, closeTo(51, 0.001));
      expect(bounds.height, 0);
    });

    test('a single point does not produce NaN', () {
      final bounds = _paint(_painter([
        _painterData(const [Offset(1, 5)]),
      ]));
      expect(bounds.left, closeTo(101, 0.001));
      expect(bounds.top, closeTo(1, 0.001));
    });

    test('repaints when the data changes', () {
      final data = [
        _painterData(const [Offset(0, 0), Offset(1, 1)]),
      ];
      expect(_painter(data).shouldRepaint(_painter(data)), isFalse);
      expect(
        _painter(data).shouldRepaint(_painter([
          _painterData(const [Offset(0, 0), Offset(1, 2)]),
        ])),
        isTrue,
      );
    });
  });

  testWidgets('ImpaktfullUiLineChart repaints with new data', (tester) async {
    var points = [
      ImpaktfullUiLineChartItemDataItem<double, double>(x: 0, y: 0),
      ImpaktfullUiLineChartItemDataItem<double, double>(x: 1, y: 1),
    ];
    late StateSetter setState;
    await tester.pumpWidget(
      ImpaktfullUiApp(
        showDebugFlag: false,
        title: 'impaktfull app',
        home: StatefulBuilder(
          builder: (context, setter) {
            setState = setter;
            return ImpaktfullUiLineChart<double, double>(
              width: 100,
              height: 100,
              data: [
                ImpaktfullUiLineChartItemData(
                  points: points,
                  offsetBuilder: (x, y) => Offset(x, y),
                ),
              ],
            );
          },
        ),
      ),
    );
    ImpaktfullUiLineChartPainter painter() => tester
        .widget<CustomPaint>(find.descendant(
          of: find.byType(ImpaktfullUiLineChart<double, double>),
          matching: find.byType(CustomPaint),
        ))
        .painter! as ImpaktfullUiLineChartPainter;
    final oldPainter = painter();

    setState(() => points = [
          ...points,
          ImpaktfullUiLineChartItemDataItem<double, double>(x: 2, y: 5),
        ]);
    await tester.pump();
    expect(painter().shouldRepaint(oldPainter), isTrue);
  });
}

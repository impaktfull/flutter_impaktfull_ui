import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/src/components/app/app.dart';
import 'package:impaktfull_ui/src/components/container/container.dart';

Future<void> pumpAndSettleComponent(WidgetTester tester, Widget widget) async {
  final app = ImpaktfullUiApp(
    showDebugFlag: false,
    title: 'impaktfull app',
    home: ImpaktfullUiContainer(
      color: Colors.transparent,
      child: widget,
    ),
  );

  await tester.pumpWidget(app);
  await tester.pumpAndSettle();
}

extension CommonFindersExtension on CommonFinders {
  T findWidget<T extends Widget>(
      WidgetTester tester, Type type, bool Function(T) condition) {
    final value = byType(type);
    expect(value, findsAtLeast(1));
    final results = value.evaluate();
    for (final result in results) {
      final widget = result.widget as T;
      if (condition(widget)) {
        return widget;
      }
    }
    throw Exception('Widget not found');
  }

  List<T> findWidgets<T extends Widget>(
      WidgetTester tester, Type type, bool Function(T) condition) {
    final value = byType(type);
    expect(value, findsAtLeast(1));
    final results = value.evaluate();
    final widgets = <T>[];
    for (final result in results) {
      final widget = result.widget as T;
      if (condition(widget)) {
        widgets.add(widget);
      }
    }
    return widgets;
  }
}

import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';

void main() {
  const leading = ImpaktfullUiAsset.icon(IconData(0xe000));

  testWidgets('uses leadingSize of the theme', (tester) async {
    final defaultTheme = ImpaktfullUiTheme.getDefault().components.listItem;
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiListItem(
        title: 'Title',
        leading: leading,
        theme: ImpaktfullUiListItemTheme(
          assets: defaultTheme.assets,
          colors: defaultTheme.colors,
          dimens: const ImpaktfullUiListItemDimensTheme(leadingSize: 40),
          textStyles: defaultTheme.textStyles,
        ),
      ),
    );
    final leadingWidget = find.byWidgetPredicate(
      (widget) => widget is ImpaktfullUiAssetWidget && widget.asset == leading,
    );
    expect(leadingWidget, findsOneWidget);
    expect(tester.widget<ImpaktfullUiAssetWidget>(leadingWidget).size, 40);
    expect(tester.getSize(leadingWidget), const Size(40, 40));
  });

  testWidgets('onAsyncTap is not called again while it is running',
      (tester) async {
    var calls = 0;
    final completer = Completer<void>();
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiListItem(
        title: 'Title',
        onAsyncTap: () {
          calls++;
          return completer.future;
        },
      ),
    );
    await tester.tap(find.text('Title'));
    await tester.pump();
    await tester.tap(find.text('Title'));
    await tester.pump();
    expect(calls, 1);

    completer.complete();
    await tester.pumpAndSettle();
    await tester.tap(find.text('Title'));
    await tester.pump();
    expect(calls, 2);
  });
}

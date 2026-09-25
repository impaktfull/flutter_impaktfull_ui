import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';
import '../../_core_test_helpers.dart';

void main() {
  testWidgets('calls onTap when tapped', (tester) async {
    var taps = 0;
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiNotification(
        title: 'Title',
        onTap: () => taps++,
      ),
    );

    await tester.tap(find.text('Title'));
    await tester.pumpAndSettle();
    expect(taps, 1);
  });

  testWidgets('the close button does not trigger onTap', (tester) async {
    var taps = 0;
    var closeTaps = 0;
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiNotification(
        title: 'Title',
        onTap: () => taps++,
        onCloseTapped: () => closeTaps++,
      ),
    );

    await tester.tap(find.byType(ImpaktfullUiIconButton));
    await tester.pumpAndSettle();
    expect(closeTaps, 1);
    expect(taps, 0);
  });

  group('the close button', () {
    /// The notification of [theme] with a title of one line and a close
    /// button, which is the snack both design systems show.
    Future<void> pumpClosable(
      WidgetTester tester,
      ImpaktfullUiTheme theme,
    ) =>
        pumpImpaktfullUiApp(
          tester,
          Center(
            child: SizedBox(
              width: 400,
              child: ImpaktfullUiNotification(
                title: 'On add tapped',
                type: ImpaktfullUiNotificationType.success,
                onCloseTapped: () {},
              ),
            ),
          ),
          theme: theme,
        );

    for (final entry in <String, ImpaktfullUiTheme>{
      'the default theme': ImpaktfullUiTheme.getDefault(),
      'shadcn/ui': ImpaktfullUiShadcnTheme.light(),
      'Ant Design': ImpaktfullUiAntDesignTheme.light(),
    }.entries) {
      testWidgets('fits inside the notification of ${entry.key}',
          (tester) async {
        await pumpClosable(tester, entry.value);
        final notification =
            tester.getRect(find.byType(ImpaktfullUiNotification));
        final close = tester.getRect(find.byType(ImpaktfullUiIconButton));
        expect(
          notification.deflate(4).containsRect(close),
          isTrue,
          reason: 'the close button stays clear of the rounded corner of the '
              'notification, which clips it: $close in $notification',
        );
      });
    }

    testWidgets('closePadding and closeIconSize size it', (tester) async {
      final base = ImpaktfullUiTheme.getDefault();
      final notification = base.components.notification;
      await pumpAndSettleComponent(
        tester,
        SizedBox(
          width: 400,
          child: ImpaktfullUiNotification(
            title: 'On add tapped',
            onCloseTapped: () {},
            theme: notification.copyWith(
              dimens: notification.dimens.copyWith(
                closeIconSize: 12,
                closePadding: const EdgeInsets.all(2),
              ),
            ),
          ),
        ),
      );
      expect(
        tester.getSize(find.byType(ImpaktfullUiIconButton)),
        const Size(16, 16),
      );
    });
  });
}

extension on Rect {
  /// `this.` is needed: `contains` alone is the matcher of `flutter_test`.
  bool containsRect(Rect other) =>
      this.contains(other.topLeft) && this.contains(other.bottomRight);
}

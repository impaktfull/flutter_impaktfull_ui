import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';

void main() {
  group('isLoading', () {
    testWidgets('shows the loading indicator when isLoading is true',
        (tester) async {
      await pumpComponent(
        tester,
        ImpaktfullUiButton(
          type: ImpaktfullUiButtonType.primary,
          title: 'Save',
          isLoading: true,
          onTap: () {},
        ),
      );
      expect(find.byType(ImpaktfullUiLoadingIndicator), findsOneWidget);
    });

    testWidgets('does not call onTap while isLoading is true', (tester) async {
      var taps = 0;
      await pumpComponent(
        tester,
        ImpaktfullUiButton(
          type: ImpaktfullUiButtonType.primary,
          title: 'Save',
          isLoading: true,
          onTap: () => taps++,
        ),
      );
      await tester.tap(find.byType(ImpaktfullUiButton), warnIfMissed: false);
      await tester.pump();
      expect(taps, 0);
    });

    testWidgets('does not show the loading indicator by default',
        (tester) async {
      await pumpComponent(
        tester,
        ImpaktfullUiButton(
          type: ImpaktfullUiButtonType.primary,
          title: 'Save',
          onTap: () {},
        ),
      );
      expect(find.byType(ImpaktfullUiLoadingIndicator), findsNothing);
    });

    testWidgets('onAsyncTap is only called once while it is running',
        (tester) async {
      final completer = Completer<void>();
      var taps = 0;
      await pumpComponent(
        tester,
        ImpaktfullUiButton(
          type: ImpaktfullUiButtonType.primary,
          title: 'Save',
          onAsyncTap: () {
            taps++;
            return completer.future;
          },
        ),
      );
      await tester.tap(find.byType(ImpaktfullUiButton));
      await tester.pump();
      expect(find.byType(ImpaktfullUiLoadingIndicator), findsOneWidget);
      await tester.tap(find.byType(ImpaktfullUiButton), warnIfMissed: false);
      await tester.pump();
      expect(taps, 1);
      completer.complete();
      await tester.pump();
      expect(find.byType(ImpaktfullUiLoadingIndicator), findsNothing);
    });
  });
}

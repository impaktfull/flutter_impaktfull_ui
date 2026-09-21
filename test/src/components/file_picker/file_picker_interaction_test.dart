import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/font_loader.dart';
import '../../../util/test_util.dart';
import '../_inputs_test_helpers.dart';

void main() {
  Widget wrap(Widget child) =>
      Center(child: SizedBox(width: 400, child: child));

  const data = ImpaktfullUiFilePickerData(
    title: 'file.pdf',
    subtitle: 'Uploading',
    size: 2048,
    progress: 0.5,
  );

  ImpaktfullUiTouchFeedback outerTouchFeedback(WidgetTester tester) =>
      tester.widget<ImpaktfullUiTouchFeedback>(find
          .descendant(
            of: find.byType(ImpaktfullUiFilePicker),
            matching: find.byType(ImpaktfullUiTouchFeedback),
          )
          .first);

  group('empty', () {
    testWidgets('tapping calls onTap', (tester) async {
      var taps = 0;
      await pumpAndSettleComponent(
        tester,
        wrap(ImpaktfullUiFilePicker(
          title: 'Upload',
          subtitle: 'PDF only',
          onTap: () => taps++,
        )),
      );
      expect(find.text('Upload'), findsOneWidget);
      expect(find.text('PDF only'), findsOneWidget);
      await tester.tap(find.text('Upload'));
      await tester.pump();
      expect(taps, 1);
    });

    testWidgets('without onTap nothing happens', (tester) async {
      await pumpAndSettleComponent(
        tester,
        wrap(const ImpaktfullUiFilePicker(title: 'Upload')),
      );
      await tester.tap(find.text('Upload'), warnIfMissed: false);
      await tester.pump();
      expect(tester.takeException(), isNull);
      expect(outerTouchFeedback(tester).onTap, isNull);
    });
  });

  group('with data', () {
    testWidgets('onTap is not used', (tester) async {
      await pumpAndSettleComponent(
        tester,
        wrap(ImpaktfullUiFilePicker(data: data, onTap: () {})),
      );
      expect(outerTouchFeedback(tester).onTap, isNull);
    });

    testWidgets('shows the title, subtitle and size', (tester) async {
      await pumpAndSettleComponent(
        tester,
        wrap(const ImpaktfullUiFilePicker(
          data: data,
          progressType: ImpaktfullUiFilePickerProgressType.text,
        )),
      );
      expect(find.text('file.pdf'), findsOneWidget);
      expect(find.text('Uploading - 2.00 KB - 50%', findRichText: true),
          findsOneWidget);
    });

    testWidgets('the progress line is shown for progressLine', (tester) async {
      await pumpAndSettleComponent(
        tester,
        wrap(const ImpaktfullUiFilePicker(
          data: data,
          progressType: ImpaktfullUiFilePickerProgressType.progressLine,
        )),
      );
      final indicator = tester.widget<ImpaktfullUiProgressIndicator>(
          find.byType(ImpaktfullUiProgressIndicator));
      expect(indicator.value, 0.5);
      expect(indicator.showText, isFalse);
    });

    testWidgets('the progress line has a text for progressLineWithText',
        (tester) async {
      await pumpAndSettleComponent(
        tester,
        wrap(const ImpaktfullUiFilePicker(data: data)),
      );
      expect(
        tester
            .widget<ImpaktfullUiProgressIndicator>(
                find.byType(ImpaktfullUiProgressIndicator))
            .showText,
        isTrue,
      );
    });

    testWidgets('without progress no progress is shown', (tester) async {
      await pumpAndSettleComponent(
        tester,
        wrap(const ImpaktfullUiFilePicker(
          data: ImpaktfullUiFilePickerData(title: 'file.pdf'),
        )),
      );
      expect(find.byType(ImpaktfullUiProgressIndicator), findsNothing);
    });

    testWidgets('the delete button calls onDeleteTapped', (tester) async {
      var deletes = 0;
      await pumpAndSettleComponent(
        tester,
        wrap(ImpaktfullUiFilePicker(
          data: data,
          onDeleteTapped: () => deletes++,
        )),
      );
      await tester.tap(find.byType(ImpaktfullUiIconButton));
      await tester.pump();
      expect(deletes, 1);
    });

    testWidgets('a long title does not overlap the delete button',
        (tester) async {
      const title = 'a_very_long_file_name_that_does_not_fit_on_a_single_line'
          '_of_the_file_picker.pdf';
      await loadImpaktfullUiFonts();
      await pumpAndSettleComponent(
        tester,
        wrap(ImpaktfullUiFilePicker(
          data: const ImpaktfullUiFilePickerData(title: title),
          onDeleteTapped: () {},
        )),
      );
      final titleEnd = tester.getTopRight(find.text(title)).dx;
      final deleteStart =
          tester.getTopLeft(find.byType(ImpaktfullUiAssetWidget).last).dx;
      expect(titleEnd, lessThanOrEqualTo(deleteStart));
    });

    testWidgets('without onDeleteTapped there is no delete button',
        (tester) async {
      await pumpAndSettleComponent(
        tester,
        wrap(const ImpaktfullUiFilePicker(data: data)),
      );
      expect(find.byType(ImpaktfullUiIconButton), findsNothing);
    });

    testWidgets('the retry button calls onRetryTapped', (tester) async {
      final theme = defaultComponentsTheme.filePicker;
      var retries = 0;
      await pumpAndSettleComponent(
        tester,
        wrap(ImpaktfullUiFilePicker(
          data: data,
          onRetryTapped: () => retries++,
        )),
      );
      expect(find.text('Failed to upload, please try again later'),
          findsOneWidget);
      expect(find.byType(ImpaktfullUiProgressIndicator), findsNothing);
      expect((outerTouchFeedback(tester).border as Border).top.color,
          theme.colors.borderError);
      await tester.tap(find.text('Retry'));
      await tester.pump();
      expect(retries, 1);
    });

    testWidgets('the leading builder replaces the file icon', (tester) async {
      await pumpAndSettleComponent(
        tester,
        wrap(ImpaktfullUiFilePicker(
          data: data,
          leadingBuilder: (context) => const Text('Leading'),
        )),
      );
      expect(find.text('Leading'), findsOneWidget);
      expect(find.byType(ImpaktfullUiAssetWidget), findsNothing);
    });

    testWidgets('a new progress from the parent is shown', (tester) async {
      final progress = ValueNotifier(0.1);
      await pumpAndSettleComponent(
        tester,
        wrap(ValueListenableBuilder<double>(
          valueListenable: progress,
          builder: (context, value, child) => ImpaktfullUiFilePicker(
            progressType: ImpaktfullUiFilePickerProgressType.text,
            data: ImpaktfullUiFilePickerData(title: 'file', progress: value),
          ),
        )),
      );
      expect(find.text('10%', findRichText: true), findsOneWidget);
      progress.value = 0.999;
      await tester.pumpAndSettle();
      expect(find.text('100%', findRichText: true), findsOneWidget);
    });
  });

  testWidgets('the theme override is used', (tester) async {
    final theme = defaultComponentsTheme.filePicker;
    await pumpAndSettleComponent(
      tester,
      wrap(ImpaktfullUiFilePicker(
        data: data,
        onDeleteTapped: () {},
        theme: theme.copyWith(
          colors: theme.colors.copyWith(
            background: customTestColor,
            border: Colors.black,
          ),
          assets: theme.assets.copyWith(delete: customTestAsset),
        ),
      )),
    );
    final touchFeedback = outerTouchFeedback(tester);
    expect(touchFeedback.color, customTestColor);
    expect((touchFeedback.border as Border).top.color, Colors.black);
    expect(
      tester
          .widget<ImpaktfullUiIconButton>(find.byType(ImpaktfullUiIconButton))
          .asset,
      same(customTestAsset),
    );
  });

  group(
    'progress indicator color',
    () {
      testWidgets('the progress indicator color of the theme is used',
          (tester) async {
        final theme = defaultComponentsTheme.filePicker;
        await pumpAndSettleComponent(
          tester,
          wrap(ImpaktfullUiFilePicker(
            data: data,
            theme: theme.copyWith(
              colors: theme.colors.copyWith(progressIndicator: customTestColor),
            ),
          )),
        );
        expect(
          tester
              .widget<ImpaktfullUiProgressIndicator>(
                  find.byType(ImpaktfullUiProgressIndicator))
              .color,
          customTestColor,
        );
      });
    },
  );
}

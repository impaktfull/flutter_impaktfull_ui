import 'package:material_ui/material_ui.dart';
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

  group('the colours of the type', () {
    final base = ImpaktfullUiTheme.getDefault().components.notification;

    /// One tint, one text colour and one border colour per type, all
    /// different from each other and from the shared ones.
    const tints = {
      ImpaktfullUiNotificationType.success: (
        background: Color(0xFFF6FFED),
        text: Color(0xFF135200),
      ),
      ImpaktfullUiNotificationType.warning: (
        background: Color(0xFFFFFBE6),
        text: Color(0xFF874D00),
      ),
      ImpaktfullUiNotificationType.error: (
        background: Color(0xFFFFF2F0),
        text: Color(0xFF820014),
      ),
      ImpaktfullUiNotificationType.info: (
        background: Color(0xFFE6F4FF),
        text: Color(0xFF003EB3),
      ),
      ImpaktfullUiNotificationType.branded: (
        background: Color(0xFFF9F0FF),
        text: Color(0xFF391085),
      ),
    };

    final tinted = base.copyWith(
      colors: base.colors.copyWith(
        successBackground:
            tints[ImpaktfullUiNotificationType.success]!.background,
        successText: tints[ImpaktfullUiNotificationType.success]!.text,
        warningBackground:
            tints[ImpaktfullUiNotificationType.warning]!.background,
        warningText: tints[ImpaktfullUiNotificationType.warning]!.text,
        errorBackground: tints[ImpaktfullUiNotificationType.error]!.background,
        errorText: tints[ImpaktfullUiNotificationType.error]!.text,
        infoBackground: tints[ImpaktfullUiNotificationType.info]!.background,
        infoText: tints[ImpaktfullUiNotificationType.info]!.text,
        brandedBackground:
            tints[ImpaktfullUiNotificationType.branded]!.background,
        brandedText: tints[ImpaktfullUiNotificationType.branded]!.text,
        matchBorderWithType: true,
      ),
    );

    Color typeColor(ImpaktfullUiNotificationType type) => switch (type) {
          ImpaktfullUiNotificationType.success => base.colors.success,
          ImpaktfullUiNotificationType.warning => base.colors.warning,
          ImpaktfullUiNotificationType.error => base.colors.error,
          ImpaktfullUiNotificationType.info => base.colors.info,
          ImpaktfullUiNotificationType.branded => base.colors.branded,
        };

    for (final type in ImpaktfullUiNotificationType.values) {
      testWidgets('${type.name} uses its background, text and border',
          (tester) async {
        await pumpAndSettleComponent(
          tester,
          SizedBox(
            width: 400,
            child: ImpaktfullUiNotification(
              title: 'Title',
              subtitle: 'Subtitle',
              type: type,
              onCloseTapped: () {},
              theme: tinted,
            ),
          ),
        );
        final decoration = _decorationOf(tester);
        expect(decoration.color, tints[type]!.background);
        expect((decoration.border! as Border).top.color, typeColor(type));
        expect(_textStyleOf(tester, 'Title').color, tints[type]!.text);
        expect(_textStyleOf(tester, 'Subtitle').color, tints[type]!.text);
        expect(
          tester
              .widget<ImpaktfullUiIconButton>(
                  find.byType(ImpaktfullUiIconButton))
              .color,
          tints[type]!.text,
        );
      });
    }

    testWidgets('the chevron of onTap takes the text colour', (tester) async {
      await pumpAndSettleComponent(
        tester,
        SizedBox(
          width: 400,
          child: ImpaktfullUiNotification(
            title: 'Title',
            type: ImpaktfullUiNotificationType.info,
            onTap: () {},
            theme: tinted,
          ),
        ),
      );
      final chevron = tester.widget<ImpaktfullUiAssetWidget>(
        find
            .descendant(
              of: find.byType(ImpaktfullUiNotification),
              matching: find.byType(ImpaktfullUiAssetWidget),
            )
            .last,
      );
      expect(chevron.color, tints[ImpaktfullUiNotificationType.info]!.text);
    });

    testWidgets('a type without colours of its own uses the shared ones',
        (tester) async {
      // Only the error type is tinted.
      final theme = base.copyWith(
        colors: base.colors.copyWith(
          errorBackground: const Color(0xFFFFF2F0),
          errorText: const Color(0xFF820014),
        ),
      );
      await pumpAndSettleComponent(
        tester,
        SizedBox(
          width: 400,
          child: ImpaktfullUiNotification(
            title: 'Title',
            subtitle: 'Subtitle',
            type: ImpaktfullUiNotificationType.warning,
            onCloseTapped: () {},
            theme: theme,
          ),
        ),
      );
      final decoration = _decorationOf(tester);
      expect(decoration.color, base.colors.background);
      expect((decoration.border! as Border).top.color, base.colors.border);
      expect(_textStyleOf(tester, 'Title'), base.textStyles.title);
      expect(_textStyleOf(tester, 'Subtitle'), base.textStyles.subtitle);
      expect(
        tester
            .widget<ImpaktfullUiIconButton>(find.byType(ImpaktfullUiIconButton))
            .color,
        base.textStyles.title.color,
      );
    });

    testWidgets('the default theme has no colours per type', (tester) async {
      final colors = base.colors;
      expect(colors.successBackground, isNull);
      expect(colors.warningBackground, isNull);
      expect(colors.errorBackground, isNull);
      expect(colors.infoBackground, isNull);
      expect(colors.brandedBackground, isNull);
      expect(colors.successText, isNull);
      expect(colors.warningText, isNull);
      expect(colors.errorText, isNull);
      expect(colors.infoText, isNull);
      expect(colors.brandedText, isNull);
    });

    testWidgets('a snack of show takes the colours of its type',
        (tester) async {
      final app = ImpaktfullUiTheme.getDefault();
      await pumpImpaktfullUiApp(
        tester,
        const SizedBox.expand(),
        theme: app.copyWith(
          components: app.components.copyWith(notification: tinted),
        ),
      );

      ImpaktfullUiNotification.show(
        title: 'Not saved',
        subtitle: 'Try again',
        type: ImpaktfullUiNotificationType.error,
        showDuration: const Duration(seconds: 2),
      );
      await tester.pumpAndSettle();
      final error = tints[ImpaktfullUiNotificationType.error]!;
      expect(_decorationOf(tester).color, error.background);
      expect(_textStyleOf(tester, 'Not saved').color, error.text);
      expect(_textStyleOf(tester, 'Try again').color, error.text);

      // Let the show duration and the hide animation end, so no timer is
      // pending at the end of the test.
      await tester.pump(const Duration(seconds: 2));
      await tester.pumpAndSettle();
      await tester.pump(const Duration(seconds: 1));
      await tester.pumpAndSettle();
      expect(find.text('Not saved'), findsNothing);
    });
  });
}

/// The decoration of the box of the only notification on screen.
BoxDecoration _decorationOf(WidgetTester tester) {
  final container = tester.widget<Container>(
    find
        .descendant(
          of: find.byType(ImpaktfullUiNotification),
          matching: find.byType(Container),
        )
        .first,
  );
  return container.decoration! as BoxDecoration;
}

TextStyle _textStyleOf(WidgetTester tester, String text) =>
    tester.widget<Text>(find.text(text)).style!;

extension on Rect {
  /// `this.` is needed: `contains` alone is the matcher of `flutter_test`.
  bool containsRect(Rect other) =>
      this.contains(other.topLeft) && this.contains(other.bottomRight);
}

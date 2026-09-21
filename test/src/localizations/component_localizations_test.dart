import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../util/font_loader.dart';
import '../../util/screen_size_util.dart';
import '../../util/test_util.dart';

/// Pumps [child] in an [ImpaktfullUiApp] with app-wide [localizations].
Future<void> _pumpWithAppLocalizations(
  WidgetTester tester,
  ImpaktfullUiLocalizations localizations,
  Widget child,
) async {
  await tester.pumpWidget(
    ImpaktfullUiApp(
      title: 'app',
      showDebugFlag: false,
      localizations: localizations,
      home: ImpaktfullUiContainer(
        color: Colors.transparent,
        child: child,
      ),
    ),
  );
  await tester.pumpAndSettle();
}

/// A button that runs [onTap] with a context below the app.
Widget _opener(void Function(BuildContext context) onTap) => Builder(
      builder: (context) => ImpaktfullUiButton(
        type: ImpaktfullUiButtonType.primary,
        title: 'open',
        onTap: () => onTap(context),
      ),
    );

const _galleryItems = [
  ImpaktfullUiGalleryItem(
    title: 'Red',
    child:
        ColoredBox(color: Colors.red, child: SizedBox(width: 50, height: 50)),
  ),
  ImpaktfullUiGalleryItem(
    title: 'Blue',
    child:
        ColoredBox(color: Colors.blue, child: SizedBox(width: 50, height: 50)),
  ),
  ImpaktfullUiGalleryItem(
    title: 'Green',
    child:
        ColoredBox(color: Colors.green, child: SizedBox(width: 50, height: 50)),
  ),
];

void main() {
  setUpAll(() async => loadImpaktfullUiFonts());

  group('ImpaktfullUiLocalizations', () {
    testWidgets('falls back to the English defaults without an app',
        (tester) async {
      late ImpaktfullUiPaginationLocalizations localizations;
      await tester.pumpWidget(
        Builder(builder: (context) {
          localizations = ImpaktfullUiPaginationLocalizations.of(context);
          return const SizedBox();
        }),
      );
      expect(localizations.pageLabel(1, 2), 'Page 1 of 2');
    });

    test('copyWith replaces one localization and keeps the others', () {
      const localizations = ImpaktfullUiLocalizations();
      final copy = localizations.copyWith(
        pagination: ImpaktfullUiPaginationLocalizations(
          pageLabel: (page, amountOfPages) => 'Pagina $page van $amountOfPages',
        ),
      );
      expect(copy.pagination.pageLabel(1, 2), 'Pagina 1 van 2');
      expect(copy.calendar, same(localizations.calendar));
      expect(copy.bbLogin, same(localizations.bbLogin));
    });

    test('every localization has a copyWith', () {
      expect(
        const ImpaktfullUiCalendarLocalizations()
            .copyWith(todayBtn: 'Vandaag')
            .todayBtn,
        'Vandaag',
      );
      expect(
        const ImpaktfullUiNavBarLocalizations()
            .copyWith(backTooltip: 'Terug')
            .backTooltip,
        'Terug',
      );
      expect(
        const ImpaktfullUiListViewLocalizations()
            .copyWith(refreshBtnLabel: 'Vernieuwen')
            .refreshBtnLabel,
        'Vernieuwen',
      );
      expect(
        const ImpaktfullUiGridViewLocalizations()
            .copyWith(refreshBtnLabel: 'Vernieuwen')
            .refreshBtnLabel,
        'Vernieuwen',
      );
      expect(
        const ImpaktfullUiBBLoginLocalizations()
            .copyWith(loginBtn: 'Inloggen')
            .loginBtn,
        'Inloggen',
      );
      expect(
        const ImpaktfullUiBBLicensesLocalizations()
            .copyWith(title: 'Licenties')
            .title,
        'Licenties',
      );
      expect(
        const ImpaktfullUiWysiwygLocalizations()
            .copyWith(boldTooltip: 'Vet')
            .tooltipFor(ImpaktfullUiWysiwygAction.bold),
        'Vet',
      );
    });

    test('the English defaults are the texts the components always showed', () {
      const localizations = ImpaktfullUiLocalizations();
      expect(localizations.pagination.pageLabel(2, 10), 'Page 2 of 10');
      expect(localizations.calendar.multiDayProgress(1, 3), '(1/3 days)');
      expect(localizations.masterDetail.breadcrumb('Users', 'John'),
          'Users > John');
      for (final action in ImpaktfullUiWysiwygAction.values) {
        expect(localizations.wysiwyg.tooltipFor(action), action.tooltip);
      }
    });
  });

  group('Components', () {
    testWidgets('Calendar week: today button', (tester) async {
      setScreenSize(tester, const Size(1400, 1000));
      await pumpAndSettleComponent(
        tester,
        ImpaktfullUiCalendar(
          type: ImpaktfullUiCalendarType.week,
          selectedDate: DateTime(2024, 5, 15),
          events: const [],
          onEventTap: (_) {},
          localizations: const ImpaktfullUiCalendarLocalizations(
            todayBtn: 'Vandaag',
          ),
        ),
      );
      expect(find.text('Vandaag'), findsOneWidget);
      expect(find.text('Today'), findsNothing);
    });

    testWidgets('Calendar list: no events, all day and multi-day labels',
        (tester) async {
      final localizations = ImpaktfullUiCalendarLocalizations(
        allDay: 'Hele dag',
        multiDayProgress: (day, amountOfDays) => '[$day van $amountOfDays]',
        noEventsFound: 'Geen evenementen',
      );
      await pumpAndSettleComponent(
        tester,
        ImpaktfullUiCalendar(
          type: ImpaktfullUiCalendarType.list,
          selectedDate: DateTime(2099, 1, 1),
          events: const [],
          onEventTap: (_) {},
          localizations: localizations,
        ),
      );
      expect(find.text('Geen evenementen'), findsOneWidget);

      await _pumpWithAppLocalizations(
        tester,
        ImpaktfullUiLocalizations(calendar: localizations),
        ImpaktfullUiCalendar(
          type: ImpaktfullUiCalendarType.list,
          selectedDate: DateTime(2099, 1, 1),
          events: [
            ImpaktfullUiCalendarEvent(
              title: 'Holiday',
              startDate: DateTime(2099, 1, 1),
              endDate: DateTime(2099, 1, 2).endOfTheDay,
            ),
          ],
          onEventTap: (_) {},
        ),
      );
      expect(find.text('[1 van 2] Hele dag'), findsOneWidget);
      expect(find.text('[2 van 2] Hele dag'), findsOneWidget);
    });

    testWidgets('DatePicker: select a year title', (tester) async {
      await pumpAndSettleComponent(
        tester,
        ImpaktfullUiDatePicker(
          selectedDate: DateTime(2023, 7, 6),
          onDateChanged: (_) {},
          localizations: const ImpaktfullUiDatePickerLocalizations(
            selectYearTitle: 'Kies een jaar',
          ),
        ),
      );
      await tester.tap(find.text('July 2023'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('2023'));
      await tester.pumpAndSettle();
      expect(find.text('Kies een jaar'), findsOneWidget);
    });

    testWidgets('DatePicker: modal buttons', (tester) async {
      await _pumpWithAppLocalizations(
        tester,
        const ImpaktfullUiLocalizations(
          datePicker: ImpaktfullUiDatePickerLocalizations(
            cancelBtn: 'Annuleren',
            applyBtn: 'Toepassen',
          ),
        ),
        _opener((context) => ImpaktfullUiDatePicker.showModal(
              context: context,
              selectedDate: DateTime(2023, 7, 6),
            )),
      );
      await tester.tap(find.text('open'));
      await tester.pumpAndSettle();
      expect(find.text('Annuleren'), findsOneWidget);
      expect(find.text('Toepassen'), findsOneWidget);
    });

    testWidgets('DatePicker: range modal buttons', (tester) async {
      await pumpAndSettleComponent(
        tester,
        _opener((context) => ImpaktfullUiDatePicker.showRangeModal(
              context: context,
              localizations: const ImpaktfullUiDatePickerLocalizations(
                cancelBtn: 'Annuleren',
                applyBtn: 'Toepassen',
              ),
            )),
      );
      await tester.tap(find.text('open'));
      await tester.pumpAndSettle();
      expect(find.text('Annuleren'), findsOneWidget);
      expect(find.text('Toepassen'), findsOneWidget);
    });

    testWidgets('DateTimePicker: modal buttons', (tester) async {
      await pumpAndSettleComponent(
        tester,
        _opener((context) => ImpaktfullUiDateTimePicker.showModal(
              context: context,
              value: DateTime(2023, 7, 6, 14, 30),
              localizations: const ImpaktfullUiDateTimePickerLocalizations(
                cancelBtn: 'Annuleren',
                applyBtn: 'Toepassen',
              ),
            )),
      );
      await tester.tap(find.text('open'));
      await tester.pumpAndSettle();
      expect(find.text('Annuleren'), findsOneWidget);
      expect(find.text('Toepassen'), findsOneWidget);
      expect(find.text('Cancel'), findsNothing);
    });

    testWidgets('Pagination: page label', (tester) async {
      await pumpAndSettleComponent(
        tester,
        ImpaktfullUiPagination.withAmountOfPages(
          page: 1,
          itemsPerPage: 10,
          amountOfPages: 5,
          onLoadPage: (_) {},
          localizations: ImpaktfullUiPaginationLocalizations(
            pageLabel: (page, amountOfPages) =>
                'Pagina $page van $amountOfPages',
          ),
        ),
      );
      expect(find.text('Pagina 2 van 5'), findsOneWidget);
    });

    testWidgets('CmsHeader: tooltips', (tester) async {
      await pumpAndSettleComponent(
        tester,
        ImpaktfullUiAutoLayout.vertical(
          mainAxisSize: MainAxisSize.min,
          children: [
            ImpaktfullUiCmsHeader(
              onBackTapped: () {},
              localizations: const ImpaktfullUiCmsHeaderLocalizations(
                backTooltip: 'Terug',
              ),
            ),
            ImpaktfullUiCmsHeader(
              onDrawerTapped: () {},
              localizations: const ImpaktfullUiCmsHeaderLocalizations(
                drawerOpenTooltip: 'Menu openen',
              ),
            ),
            ImpaktfullUiCmsHeader(
              onDrawerTapped: () {},
              isDrawerOpen: true,
              localizations: const ImpaktfullUiCmsHeaderLocalizations(
                drawerCloseTooltip: 'Menu sluiten',
              ),
            ),
          ],
        ),
      );
      expect(find.byTooltip('Terug'), findsOneWidget);
      expect(find.byTooltip('Menu openen'), findsOneWidget);
      expect(find.byTooltip('Menu sluiten'), findsOneWidget);
    });

    testWidgets('AdaptiveNavBar: nav bar and cms header tooltips',
        (tester) async {
      setScreenSize(tester, const Size(400, 800));
      await pumpAndSettleComponent(
        tester,
        ImpaktfullUiAdaptiveNavBar(
          title: 'Title',
          onBackTapped: () {},
          navBarLocalizations: const ImpaktfullUiNavBarLocalizations(
            backTooltip: 'Terug (klein)',
          ),
          cmsHeaderLocalizations: const ImpaktfullUiCmsHeaderLocalizations(
            backTooltip: 'Terug (groot)',
          ),
        ),
      );
      expect(find.byTooltip('Terug (klein)'), findsOneWidget);

      setScreenSize(tester, const Size(1600, 800));
      await tester.pumpAndSettle();
      expect(find.byTooltip('Terug (groot)'), findsOneWidget);
    });

    testWidgets('Gallery: fullscreen tooltips', (tester) async {
      await pumpAndSettleComponent(
        tester,
        const ImpaktfullUiGallery(
          items: _galleryItems,
          noDataLabel: 'No items',
          localizations: ImpaktfullUiGalleryLocalizations(
            closeFullscreenTooltip: 'Sluiten',
            previousTooltip: 'Vorige',
            nextTooltip: 'Volgende',
          ),
        ),
      );
      await tester.tap(find.byWidget(_galleryItems[1].child()));
      await tester.pumpAndSettle();
      expect(find.byTooltip('Sluiten'), findsOneWidget);
      expect(find.byTooltip('Vorige'), findsOneWidget);
      expect(find.byTooltip('Volgende'), findsOneWidget);
    });

    testWidgets('Wysiwyg: buttons and action tooltips', (tester) async {
      await pumpAndSettleComponent(
        tester,
        ImpaktfullUiWysiwyg(
          text: 'Hello',
          onChanged: (_) {},
          localizations: const ImpaktfullUiWysiwygLocalizations(
            previewBtn: 'Voorbeeld',
            editorBtn: 'Bewerken',
            boldTooltip: 'Vet',
          ),
        ),
      );
      expect(find.byTooltip('Vet'), findsOneWidget);
      expect(find.byTooltip('Bold'), findsNothing);
      // The enum keeps its English tooltip.
      expect(ImpaktfullUiWysiwygAction.bold.tooltip, 'Bold');
      await tester.tap(find.text('Voorbeeld'));
      await tester.pumpAndSettle();
      expect(find.text('Bewerken'), findsOneWidget);
    });

    testWidgets('FilePicker: upload failed and retry', (tester) async {
      await pumpAndSettleComponent(
        tester,
        ImpaktfullUiFilePicker(
          data: const ImpaktfullUiFilePickerData(title: 'file.pdf'),
          onRetryTapped: () {},
          localizations: const ImpaktfullUiFilePickerLocalizations(
            uploadFailed: 'Uploaden mislukt',
            retryBtn: 'Opnieuw',
          ),
        ),
      );
      expect(find.text('Uploaden mislukt'), findsOneWidget);
      expect(find.text('Opnieuw'), findsOneWidget);
    });

    testWidgets('ColorInputField: color picker title', (tester) async {
      await pumpAndSettleComponent(
        tester,
        ImpaktfullUiColorInputField(
          initialColor: Colors.red,
          colorPickerType: ImpaktfullUiColorPickerType.simple,
          onChanged: (_) {},
          localizations: const ImpaktfullUiColorInputFieldLocalizations(
            colorPickerTitle: 'Kies een kleur',
          ),
        ),
      );
      await tester.tap(find.byType(ImpaktfullUiTouchFeedback).first);
      await tester.pumpAndSettle();
      expect(find.text('Kies een kleur'), findsOneWidget);
    });

    testWidgets('OptionSelector: no options', (tester) async {
      await pumpAndSettleComponent(
        tester,
        const ImpaktfullUiOptionSelector<String>(
          options: [],
          localizations: ImpaktfullUiOptionSelectorLocalizations(
            noOptions: 'Geen opties',
          ),
        ),
      );
      expect(find.text('Geen opties'), findsOneWidget);
    });

    testWidgets('Chat: typing indicator semantics label', (tester) async {
      final handle = tester.ensureSemantics();
      final typing = StreamController<List<String>>();
      addTearDown(typing.close);
      await pumpComponent(
        tester,
        ImpaktfullUiChat(
          items: [
            ImpaktfullUiChatItem(
              senderId: 'other',
              message: 'Hello',
              timestamp: DateTime(2024, 1, 1, 12),
            ),
          ],
          senderConfig: const ImpaktfullUiChatSenderConfig.oneToOne(
            me: ImpaktfullUiChatSender(id: 'me'),
            other: ImpaktfullUiChatSender(id: 'other', name: 'Jan'),
          ),
          senderIdsTypingStream: typing.stream,
          localizations: ImpaktfullUiChatLocalizations(
            typingLabel: (name) => '$name is aan het typen',
          ),
        ),
      );
      typing.add(['other']);
      await tester.pump();
      await tester.pump();
      expect(find.bySemanticsLabel('Jan is aan het typen'), findsOneWidget);
      handle.dispose();
      // Let the typing dots start, then stop the repeating animation.
      await tester.pump(const Duration(seconds: 1));
      await tester.pumpWidget(const SizedBox());
    });

    testWidgets('MasterDetail: breadcrumb', (tester) async {
      setScreenSize(tester, const Size(1600, 800));
      await tester.pumpWidget(
        ImpaktfullUiApp(
          title: 'app',
          showDebugFlag: false,
          home: Material(
            child: ImpaktfullUiMasterDetail(
              title: 'Master',
              navigation: const Text('navigation'),
              localizations: ImpaktfullUiMasterDetailLocalizations(
                breadcrumb: (title, subtitle) => '$title / $subtitle',
              ),
              detail: (context) => const ImpaktfullUiMasterDetailItemScreen(
                title: 'Users',
                subtitle: 'John',
                keepOriginalMasterTitle: true,
                child: Text('detail'),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text('Users / John'), findsOneWidget);
    });
  });

  group('Building blocks', () {
    testWidgets('ForgetPassword', (tester) async {
      await pumpAndSettleComponent(
        tester,
        ImpaktfullUiBBForgetPassword(
          email: '',
          onChangedEmail: (_) {},
          onResetPasswordTapped: () async {},
          onBackToLoginTapped: () {},
          localizations: const ImpaktfullUiBBForgetPasswordLocalizations(
            title: 'Wachtwoord vergeten?',
            resetPasswordBtn: 'Wachtwoord herstellen',
            backToLoginBtn: 'Terug naar inloggen',
          ),
        ),
      );
      expect(find.text('Wachtwoord vergeten?'), findsOneWidget);
      expect(find.text('Wachtwoord herstellen'), findsOneWidget);
      expect(find.text('Terug naar inloggen'), findsOneWidget);
      expect(find.text('Email'), findsOneWidget);
    });

    testWidgets('Register', (tester) async {
      await _pumpWithAppLocalizations(
        tester,
        const ImpaktfullUiLocalizations(
          bbRegister: ImpaktfullUiBBRegisterLocalizations(
            title: 'Hallo!',
            registerBtn: 'Registreren',
          ),
        ),
        ImpaktfullUiBBRegister(
          email: '',
          password: '',
          onChangedEmail: (_) {},
          onChangedPassword: (_) {},
          onRegisterTapped: () async {},
        ),
      );
      expect(find.text('Hallo!'), findsOneWidget);
      expect(find.text('Registreren'), findsOneWidget);
      expect(find.text('Create your account to get started'), findsOneWidget);
    });

    testWidgets('VerifyRegisterCode', (tester) async {
      await pumpAndSettleComponent(
        tester,
        ImpaktfullUiBBVerifyRegisterCode(
          code: '',
          onChangedVerificationCode: (_) {},
          onVerifyCodeTapped: () async {},
          onBackTapped: () {},
          localizations: const ImpaktfullUiBBVerifyRegisterCodeLocalizations(
            title: 'Je hebt post',
            verifyBtn: 'Verifiëren',
            backBtn: 'Terug',
          ),
        ),
      );
      expect(find.text('Je hebt post'), findsOneWidget);
      expect(find.text('Verifiëren'), findsOneWidget);
      expect(find.text('Terug'), findsOneWidget);
    });

    testWidgets('NotFound', (tester) async {
      await pumpAndSettleComponent(
        tester,
        const ImpaktfullUiBBNotFound(
          localizations: ImpaktfullUiBBNotFoundLocalizations(
            title: 'Pagina niet gevonden',
          ),
        ),
      );
      expect(find.text('Pagina niet gevonden'), findsOneWidget);
      expect(find.text('We were not able to find this page'), findsOneWidget);
    });

    testWidgets('Login', (tester) async {
      await pumpAndSettleComponent(
        tester,
        ImpaktfullUiBBLogin(
          email: '',
          password: '',
          onChangedEmail: (_) {},
          onChangedPassword: (_) {},
          onLoginTapped: () async {},
          localizations: const ImpaktfullUiBBLoginLocalizations()
              .copyWith(title: 'Welkom terug!'),
        ),
      );
      expect(find.text('Welkom terug!'), findsOneWidget);
    });
  });
}

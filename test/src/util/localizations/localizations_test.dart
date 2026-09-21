import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../_core_test_helpers.dart';

class _UnknownLocalizations extends ImpaktfullUiComponentLocalizations {
  const _UnknownLocalizations();
}

void main() {
  const localizations = ImpaktfullUiLocalizations(
    bbLogin: ImpaktfullUiBBLoginLocalizations(title: 'Welkom terug!'),
    bbLicenses: ImpaktfullUiBBLicenseLocalizations(title: 'Licenties'),
    navBar: ImpaktfullUiNavBarLocalizations(),
    listView: ImpaktfullUiListViewLocalizations(),
    gridView: ImpaktfullUiGridViewLocalizations(),
  );

  Future<BuildContext> pumpContext(
    WidgetTester tester, {
    ImpaktfullUiLocalizations localizations = localizations,
  }) async {
    late BuildContext context;
    await pumpImpaktfullUiApp(
      tester,
      Builder(builder: (c) {
        context = c;
        return const SizedBox();
      }),
      localizations: localizations,
    );
    return context;
  }

  testWidgets('of returns the configured localizations per type',
      (tester) async {
    final context = await pumpContext(tester);
    expect(
        ImpaktfullUiLocalizations.of<ImpaktfullUiBBLoginLocalizations>(context),
        same(localizations.bbLogin));
    expect(
        ImpaktfullUiLocalizations.of<ImpaktfullUiBBLicenseLocalizations>(
            context),
        same(localizations.bbLicenses));
    expect(
        ImpaktfullUiLocalizations.of<ImpaktfullUiNavBarLocalizations>(context),
        same(localizations.navBar));
    expect(
        ImpaktfullUiLocalizations.of<ImpaktfullUiListViewLocalizations>(
            context),
        same(localizations.listView));
    expect(
        ImpaktfullUiLocalizations.of<ImpaktfullUiGridViewLocalizations>(
            context),
        same(localizations.gridView));
  });

  testWidgets('the static of of a localization class uses the configurator',
      (tester) async {
    final context = await pumpContext(tester);
    expect(ImpaktfullUiBBLoginLocalizations.of(context).title, 'Welkom terug!');
    expect(ImpaktfullUiBBLicenseLocalizations.of(context).title, 'Licenties');
  });

  testWidgets('ImpaktfullUiApp uses the default localizations', (tester) async {
    final context = await pumpContext(
      tester,
      localizations: const ImpaktfullUiLocalizations(),
    );
    expect(ImpaktfullUiBBLoginLocalizations.of(context).title,
        const ImpaktfullUiBBLoginLocalizations().title);
    expect(ImpaktfullUiBBLicenseLocalizations.of(context).title, 'Licenses');
  });

  testWidgets('an unknown localization type throws', (tester) async {
    final context = await pumpContext(tester);
    expect(
      () => ImpaktfullUiLocalizations.of<_UnknownLocalizations>(context),
      throwsA(isA<Exception>().having(
          (e) => e.toString(), 'message', contains('_UnknownLocalizations'))),
    );
  });

  test('the default localizations are in English', () {
    const login = ImpaktfullUiBBLoginLocalizations();
    expect(login.title, 'Welcome back!');
    expect(login.subtitle, 'Log in to your account to continue');
    expect(login.emailInputLabel, 'Email');
    expect(login.passwordInputLabel, 'Password');
    expect(login.loginBtn, 'Login');
    expect(login.createNewAccountBtn, 'Create new account');
    const licenses = ImpaktfullUiBBLicenseLocalizations();
    expect(licenses.searchTooltip, 'Search');
    expect(licenses.searchPlaceholder, 'Search for any license');
    expect(licenses.noLicensesFound, 'No licenses found');
  });
}

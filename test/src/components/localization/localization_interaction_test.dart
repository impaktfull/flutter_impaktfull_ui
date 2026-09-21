import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui/src/components/localization/localization_provider.dart';

void main() {
  const appLocalizations = ImpaktfullUiLocalizations(
    listView: ImpaktfullUiListViewLocalizations(refreshBtnLabel: 'Vernieuwen'),
    gridView: ImpaktfullUiGridViewLocalizations(refreshBtnLabel: 'Actualiser'),
  );

  Future<void> pumpApp(
    WidgetTester tester,
    Widget child, {
    ImpaktfullUiLocalizations localizations = appLocalizations,
  }) async {
    await tester.pumpWidget(
      ImpaktfullUiApp(
        showDebugFlag: false,
        title: 'impaktfull app',
        localizations: localizations,
        home: child,
      ),
    );
    await tester.pumpAndSettle();
  }

  test('the default localizations are English', () {
    const localizations = ImpaktfullUiLocalizations();
    expect(localizations.listView.refreshBtnLabel, 'Refresh');
    expect(localizations.gridView.refreshBtnLabel, 'Refresh');
  });

  testWidgets('of returns the localizations of the component type',
      (tester) async {
    late ImpaktfullUiListViewLocalizations listView;
    late ImpaktfullUiGridViewLocalizations gridView;
    await pumpApp(
      tester,
      Builder(
        builder: (context) {
          listView = ImpaktfullUiLocalizations.of(context);
          gridView = ImpaktfullUiLocalizations.of(context);
          return const SizedBox();
        },
      ),
    );
    expect(listView.refreshBtnLabel, 'Vernieuwen');
    expect(gridView.refreshBtnLabel, 'Actualiser');
  });

  testWidgets('the provider prefers the localizations that are passed',
      (tester) async {
    final labels = <String>[];
    await pumpApp(
      tester,
      Column(
        children: [
          ImpaktfullUiLocalizationProvider<ImpaktfullUiListViewLocalizations>(
            localizations: null,
            builder: (context, localizations) {
              labels.add(localizations.refreshBtnLabel);
              return const SizedBox();
            },
          ),
          ImpaktfullUiLocalizationProvider<ImpaktfullUiListViewLocalizations>(
            localizations: const ImpaktfullUiListViewLocalizations(
              refreshBtnLabel: 'Reload',
            ),
            builder: (context, localizations) {
              labels.add(localizations.refreshBtnLabel);
              return const SizedBox();
            },
          ),
        ],
      ),
    );
    expect(labels, ['Vernieuwen', 'Reload']);
  });

  testWidgets('components rebuild when the app localizations change',
      (tester) async {
    Widget listView() => SizedBox(
          width: 300,
          height: 300,
          child: ImpaktfullUiListView<int>.builder(
            items: const [],
            itemBuilder: (context, item, index) => const SizedBox(),
            onRefresh: () async {},
            placeholderData: const ImpaktfullUiListViewPlaceholderData(
              title: 'Empty',
            ),
          ),
        );
    await pumpApp(tester, listView());
    expect(find.text('Vernieuwen'), findsOneWidget);
    await pumpApp(
      tester,
      listView(),
      localizations: const ImpaktfullUiLocalizations(),
    );
    expect(find.text('Refresh'), findsOneWidget);
  });
}

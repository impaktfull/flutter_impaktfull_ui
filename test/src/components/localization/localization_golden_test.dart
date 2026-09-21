import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';
import '../_data_display_test_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  const placeholderData = ImpaktfullUiListViewPlaceholderData(title: 'Empty');

  Widget listView({ImpaktfullUiListViewLocalizations? localizations}) =>
      goldenBox(
        width: 200,
        height: 200,
        child: ImpaktfullUiListView<int>.builder(
          items: const [],
          itemBuilder: (context, item, index) => const SizedBox(),
          onRefresh: () async {},
          localizations: localizations,
          placeholderData: placeholderData,
        ),
      );

  Widget gridView({ImpaktfullUiGridViewLocalizations? localizations}) =>
      goldenBox(
        width: 200,
        height: 200,
        child: ImpaktfullUiGridView<int>.builder(
          items: const [],
          itemBuilder: (context, item, index) => const SizedBox(),
          crossAxisCount: (context, config) => 2,
          onRefresh: () async {},
          localizations: localizations,
          placeholderData: const ImpaktfullUiGridViewPlaceholderData(
            title: 'Empty',
          ),
        ),
      );

  Widget app(Widget child) => ImpaktfullUiApp(
        showDebugFlag: false,
        title: 'impaktfull app',
        localizations: const ImpaktfullUiLocalizations(
          listView: ImpaktfullUiListViewLocalizations(
            refreshBtnLabel: 'Vernieuwen',
          ),
          gridView: ImpaktfullUiGridViewLocalizations(
            refreshBtnLabel: 'Actualiser',
          ),
        ),
        home: ImpaktfullUiContainer(color: Colors.transparent, child: child),
      );

  runComponentTest(
    fileName: 'impaktfull_ui_localization',
    columns: 3,
    goldenTests: () => [
      GoldenTest(
        description: 'list view: default localizations',
        child: listView(),
      ),
      GoldenTest(
        description: 'list view: localizations of the app',
        child: app(listView()),
      ),
      GoldenTest(
        description: 'list view: localizations of the component win',
        child: app(
          listView(
            localizations: const ImpaktfullUiListViewLocalizations(
              refreshBtnLabel: 'Reload',
            ),
          ),
        ),
      ),
      GoldenTest(
        description: 'grid view: default localizations',
        child: gridView(),
      ),
      GoldenTest(
        description: 'grid view: localizations of the app',
        child: app(gridView()),
      ),
      GoldenTest(
        description: 'grid view: localizations of the component win',
        child: app(
          gridView(
            localizations: const ImpaktfullUiGridViewLocalizations(
              refreshBtnLabel: 'Reload',
            ),
          ),
        ),
      ),
    ],
  );
}

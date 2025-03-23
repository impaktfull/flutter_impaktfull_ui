import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/items/refreshindicator/refreshindicator_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class RefreshIndicatorLibraryVariant
    extends ComponentLibraryVariant<RefreshIndicatorLibraryPrimaryInputs> {
  const RefreshIndicatorLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(
      BuildContext context, RefreshIndicatorLibraryPrimaryInputs inputs) {
    return [
      SizedBox(
        width: double.infinity,
        height: 400,
        child: ImpaktfullUiRefreshIndicator(
          onRefresh: () async => Future.delayed(const Duration(seconds: 3)),
          child: ImpaktfullUiListView.builder(
            spacing: 8,
            items: List.generate(100, (i) => i),
            itemBuilder: (context, item, index) => Container(
              color: ImpaktfullUiTheme.of(context).colors.accent,
              child: Text(
                item.toString(),
                style: theme.textStyles.onPrimary.text.large,
                textAlign: TextAlign.center,
              ),
            ),
            placeholderData: const ImpaktfullUiListViewPlaceholderData(
              title: 'No values',
            ),
          ),
        ),
      ),
    ];
  }

  @override
  RefreshIndicatorLibraryPrimaryInputs inputs() =>
      RefreshIndicatorLibraryPrimaryInputs();
}

class RefreshIndicatorLibraryPrimaryInputs
    extends RefreshIndicatorLibraryInputs {}

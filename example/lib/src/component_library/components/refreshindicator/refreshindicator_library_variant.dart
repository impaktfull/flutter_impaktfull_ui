import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/components/refreshindicator/refreshindicator_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class RefreshIndicatorLibraryVariant extends ComponentLibraryVariant<RefreshIndicatorLibraryPrimaryInputs> {
  const RefreshIndicatorLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(BuildContext context, RefreshIndicatorLibraryPrimaryInputs inputs) {
    return [
      SizedBox(
        width: double.infinity,
        height: 400,
        child: ImpaktfullUiRefreshIndicator(
          onRefresh: () async => Future.delayed(const Duration(seconds: 3)),
          child: ImpaktfullUiListView(
            children: [
              Container(
                height: 1000,
                color: Colors.amber,
              ),
            ],
          ),
        ),
      ),
    ];
  }

  @override
  RefreshIndicatorLibraryPrimaryInputs inputs() => RefreshIndicatorLibraryPrimaryInputs();
}

class RefreshIndicatorLibraryPrimaryInputs extends RefreshIndicatorLibraryInputs {}

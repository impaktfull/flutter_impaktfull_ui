import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/components/simple_list_item/simple_list_item_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class SimpleListItemLibraryVariant
    extends ComponentLibraryVariant<SimpleListItemLibraryPrimaryInputs> {
  const SimpleListItemLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(
      BuildContext context, SimpleListItemLibraryPrimaryInputs inputs) {
    return [
      ImpaktfullUiSimpleListItem(
        title: 'Settings',
        subtitle: 'Change all your settings here',
        leadingWidgetBuilder: (context) => ImpaktfullUiAssetWidget(
          asset: theme.assets.icons.settings,
        ),
        trailingWidgetBuilder: (context) => ImpaktfullUiAssetWidget(
          asset: theme.assets.icons.chevronRight,
        ),
        onTap: () {
          ImpaktfullUiNotification.show(
            title: 'Callback',
            subtitle: 'Tapped on SimpleListItem',
          );
        },
      ),
    ];
  }

  @override
  SimpleListItemLibraryPrimaryInputs inputs() =>
      SimpleListItemLibraryPrimaryInputs();
}

class SimpleListItemLibraryPrimaryInputs extends SimpleListItemLibraryInputs {}

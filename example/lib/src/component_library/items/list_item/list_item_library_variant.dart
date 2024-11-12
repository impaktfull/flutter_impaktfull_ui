import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/items/list_item/list_item_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class ListItemLibraryVariant
    extends ComponentLibraryVariant<ListItemLibraryPrimaryInputs> {
  final ImpaktfullUiListItemType type;

  const ListItemLibraryVariant(this.type);

  @override
  String get title => type.name;

  @override
  List<Widget> build(
      BuildContext context, ListItemLibraryPrimaryInputs inputs) {
    return [
      ImpaktfullUiListItem(
        leading: theme.assets.icons.settings,
        title: 'Title',
        subtitle: 'My subtitle',
        type: type,
        onAsyncTap: () async {
          await Future.delayed(const Duration(seconds: 3));
          ImpaktfullUiNotification.show(title: 'Loading completed');
        },
      ),
    ];
  }

  @override
  ListItemLibraryPrimaryInputs inputs() => ListItemLibraryPrimaryInputs();
}

class ListItemLibraryPrimaryInputs extends ListItemLibraryInputs {}

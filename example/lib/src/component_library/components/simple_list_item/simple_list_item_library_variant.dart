import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/components/simple_list_item/simple_list_item_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class SimpleListItemLibraryVariant
    extends ComponentLibraryVariant<SimpleListItemLibraryPrimaryInputs> {
  final ImpaktfullUiSimpleListItemType type;

  const SimpleListItemLibraryVariant(
    this.type,
  );

  @override
  String get title => type.name;

  @override
  List<Widget> build(
      BuildContext context, SimpleListItemLibraryPrimaryInputs inputs) {
    return [
      ImpaktfullUiSimpleListItem(
        title: inputs.title.value ?? '',
        subtitle: inputs.subtitle.value ?? '',
        type: type,
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

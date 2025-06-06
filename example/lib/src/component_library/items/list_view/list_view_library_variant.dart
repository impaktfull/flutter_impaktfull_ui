import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/items/list_view/list_view_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/widget/component/components_library_variant_descriptor.dart';

class ListViewLibraryVariant
    extends ComponentLibraryVariant<ListViewLibraryPrimaryInputs> {
  const ListViewLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(
      BuildContext context, ListViewLibraryPrimaryInputs inputs) {
    return [
      ComponentsLibraryVariantDescriptor(
        height: 400,
        child: ImpaktfullUiListView.builder(
          onRefresh: () async => Future.delayed(const Duration(seconds: 3)),
          spacing: 8,
          leadingBuilder: (context) => const Icon(Icons.arrow_back),
          trailingBuilder: (context) => const Icon(Icons.arrow_forward),
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
    ];
  }

  @override
  ListViewLibraryPrimaryInputs inputs() => ListViewLibraryPrimaryInputs();
}

class ListViewLibraryPrimaryInputs extends ListViewLibraryInputs {}

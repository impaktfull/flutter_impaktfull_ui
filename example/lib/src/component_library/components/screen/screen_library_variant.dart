import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/components/screen/screen_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/widget/components/components_library_variant_descriptor.dart';

class ScreenLibraryVariant
    extends ComponentLibraryVariant<ScreenLibraryPrimaryInputs> {
  const ScreenLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(BuildContext context, ScreenLibraryPrimaryInputs inputs) {
    return [
      ComponentsLibraryVariantDescriptor(
        height: 500,
        width: 300,
        child: ImpaktfullUiScreen(
          title: inputs.title.value ?? '',
          subtitle: inputs.subtitle.value ?? '',
          onBackTapped: () => ImpaktfullUiNotification.show(title: 'Go back!'),
          fab: ImpaktfullUiFloatingActionButton(
            asset: theme.assets.icons.add,
            onTap: () => ImpaktfullUiNotification.show(title: 'On fab tapped'),
          ),
          child: ImpaktfullUiListView.separated(
            items: List.generate(100, (index) => 'Item $index'),
            padding: const EdgeInsets.all(16),
            itemBuilder: (context, item, index) => ImpaktfullUiListItem(
              title: item,
              onTap: () =>
                  ImpaktfullUiNotification.show(title: 'On `$item` tapped'),
            ),
            noDataLabel: 'No data',
          ),
        ),
      ),
      ComponentsLibraryVariantDescriptor(
        height: 500,
        width: 300,
        child: ImpaktfullUiScreen(
          title: inputs.title.value ?? '',
          subtitle: inputs.subtitle.value ?? '',
          onBackTapped: () => ImpaktfullUiNotification.show(title: 'Go back!'),
          fab: ImpaktfullUiFloatingActionButton(
            asset: theme.assets.icons.add,
            onTap: () => ImpaktfullUiNotification.show(title: 'On fab tapped'),
          ),
          bottomChild: ImpaktfullUiBottomNavigation(
            items: [
              ImpaktfullUiBottomNavigationItem(
                asset: theme.assets.icons.home,
                label: 'Home',
                onTap: () =>
                    ImpaktfullUiNotification.show(title: 'On home tapped'),
                isSelected: false,
              ),
              ImpaktfullUiBottomNavigationItem(
                asset: theme.assets.icons.settings,
                label: 'Settings',
                onTap: () =>
                    ImpaktfullUiNotification.show(title: 'On settings tapped'),
                isSelected: true,
              ),
            ],
          ),
          child: Center(
            child: Text(
              'No data available',
              style: theme.textStyles.onCanvas.text.small,
            ),
          ),
        ),
      ),
    ];
  }

  @override
  ScreenLibraryPrimaryInputs inputs() => ScreenLibraryPrimaryInputs();
}

class ScreenLibraryPrimaryInputs extends ScreenLibraryInputs {}

import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/items/adaptive_nav_bar/adaptive_nav_bar_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class AdaptiveNavBarLibraryVariant
    extends ComponentLibraryVariant<AdaptiveNavBarLibraryPrimaryInputs> {
  const AdaptiveNavBarLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(
      BuildContext context, AdaptiveNavBarLibraryPrimaryInputs inputs) {
    return [
      ImpaktfullUiAdaptiveNavBar(
        title: 'Title',
        subtitle: 'Subtitle',
        onBackTapped: () => ImpaktfullUiNotification.show(title: 'Back tapped'),
      ),
      ImpaktfullUiAdaptiveNavBar(
        title: 'Title',
        subtitle: 'Subtitle',
        onBackTapped: () => ImpaktfullUiNotification.show(title: 'Back tapped'),
        actions: [
          ImpaktfullUiAdaptiveNavBarActionItem(
            title: 'Refresh',
            asset: const ImpaktfullUiAsset.icon(Icons.refresh),
            onAsyncTap: () async {
              await Future.delayed(const Duration(seconds: 2));
              return ImpaktfullUiNotification.show(title: 'On refresh tapped');
            },
            type: ImpaktfullUiAdaptiveNavBarActionItemType.secondary,
          ),
          ImpaktfullUiAdaptiveNavBarActionItem(
            title: 'Action',
            asset: const ImpaktfullUiAsset.icon(Icons.add),
            onTap: () => ImpaktfullUiNotification.show(title: 'Action tapped'),
            type: ImpaktfullUiAdaptiveNavBarActionItemType.primary,
          ),
        ],
      ),
    ];
  }

  @override
  AdaptiveNavBarLibraryPrimaryInputs inputs() =>
      AdaptiveNavBarLibraryPrimaryInputs();
}

class AdaptiveNavBarLibraryPrimaryInputs extends AdaptiveNavBarLibraryInputs {}

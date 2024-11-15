import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/items/master_detail/master_detail_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/widget/component/components_library_variant_descriptor.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class MasterDetailLibraryVariant
    extends ComponentLibraryVariant<MasterDetailLibraryPrimaryInputs> {
  const MasterDetailLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(
      BuildContext context, MasterDetailLibraryPrimaryInputs inputs) {
    return [
      ComponentsLibraryVariantDescriptor(
        height: 500,
        child: ImpaktfullUiMasterDetail(
          title: 'Master Detail',
          navigation: Container(
            color: theme.colors.accent,
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
            child: ImpaktfullUiButton(
              leadingAsset: ImpaktfullUiAsset.icon(PhosphorIcons.folderOpen()),
              onTap: () => inputs.hasDetail.updateState(true),
              type: ImpaktfullUiButtonType.secondaryGrey,
            ),
          ),
          onBackTapped: () =>
              ImpaktfullUiNotification.show(title: 'Back tapped'),
          onCloseDetail: () => inputs.hasDetail.updateState(false),
          closeDetailBeforeMaster: true,
          detail: (context) {
            if (inputs.hasDetail.value != true) return null;
            return ImpaktfullUiMasterDetailItemScreen(
              title: 'Detail',
              subtitle: 'Subtitle',
              keepOriginalMasterTitle: true,
              actions: [
                ImpaktfullUiAdaptiveNavBarActionItem(
                  asset: theme.assets.icons.add,
                  title: 'Add new item',
                  onTap: () => ImpaktfullUiNotification.show(
                      title: 'On `Add new item` tapped'),
                ),
              ],
              child: Container(
                color: theme.colors.card2,
                height: double.infinity,
                alignment: Alignment.center,
                child: const Text('Detail is open!!'),
              ),
            );
          },
        ),
      ),
    ];
  }

  @override
  MasterDetailLibraryPrimaryInputs inputs() =>
      MasterDetailLibraryPrimaryInputs();
}

class MasterDetailLibraryPrimaryInputs extends MasterDetailLibraryInputs {}

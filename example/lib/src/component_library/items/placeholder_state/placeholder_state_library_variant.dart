import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/items/placeholder_state/placeholder_state_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class PlaceholderStateLibraryVariant
    extends ComponentLibraryVariant<PlaceholderStateLibraryPrimaryInputs> {
  const PlaceholderStateLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(
      BuildContext context, PlaceholderStateLibraryPrimaryInputs inputs) {
    return [
      ImpaktfullUiPlaceholderState(
        title: 'Confetti for everyone!!',
        subtitle:
            'You are ready for your party! Start by inviting your friends.',
        asset: ImpaktfullUiAsset.icon(PhosphorIcons.confetti()),
      ),
      ImpaktfullUiPlaceholderState(
        title: 'Confetti for everyone!!',
        subtitle:
            'You are ready for your party! Start by inviting your friends.',
        asset: ImpaktfullUiAsset.icon(PhosphorIcons.confetti()),
        actions: [
          ImpaktfullUiButton(
            type: ImpaktfullUiButtonType.secondary,
            title: 'Create a party group',
            onTap: () =>
                ImpaktfullUiNotification.show(title: 'Party group is created!'),
          ),
          ImpaktfullUiButton(
            type: ImpaktfullUiButtonType.primary,
            title: 'Invite friends',
            onTap: () =>
                ImpaktfullUiNotification.show(title: '5 users invited!'),
          ),
        ],
      ),
    ];
  }

  @override
  PlaceholderStateLibraryPrimaryInputs inputs() =>
      PlaceholderStateLibraryPrimaryInputs();
}

class PlaceholderStateLibraryPrimaryInputs
    extends PlaceholderStateLibraryInputs {}

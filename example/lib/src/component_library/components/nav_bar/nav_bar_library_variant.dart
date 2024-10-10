import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/components/nav_bar/nav_bar_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class NavBarLibraryVariant
    extends ComponentLibraryVariant<NavBarLibraryPrimaryInputs> {
  const NavBarLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(BuildContext context, NavBarLibraryPrimaryInputs inputs) {
    return [
      ImpaktfullUiNavBar(
        title: inputs.title.value ?? '',
        subtitle: inputs.subtitle.value ?? '',
        onBackTapped: () => ImpaktfullUiNotification.show(title: 'Go back!'),
        isFullScreen: inputs.isFullScreen.value ?? false,
        actions: [
          ImpaktfullUiIconButton(
            onTap: () => ImpaktfullUiNotification.show(title: 'Add'),
            asset: theme.assets.icons.add,
          ),
        ],
      ),
      ImpaktfullUiNavBar(
        title: inputs.title.value ?? '',
        subtitle: inputs.subtitle.value ?? '',
        onBackTapped: () => ImpaktfullUiNotification.show(title: 'Go back!'),
        isFullScreen: inputs.isFullScreen.value ?? false,
        actions: [
          ImpaktfullUiIconButton(
            onTap: () => ImpaktfullUiNotification.show(
              title: 'Confetti for everyone!',
              type: ImpaktfullUiNotificationType.branded,
            ),
            asset: theme.assets.icons.confetti,
            color: theme.colors.accent,
          ),
          ImpaktfullUiIconButton(
            onTap: () => ImpaktfullUiNotification.show(title: 'Edit'),
            asset: theme.assets.icons.edit,
          ),
          ImpaktfullUiIconButton(
            onTap: () => ImpaktfullUiNotification.show(title: 'Add'),
            asset: theme.assets.icons.add,
          ),
        ],
      ),
      ImpaktfullUiNavBar(
        title: inputs.title.value ?? '',
        subtitle: inputs.subtitle.value ?? '',
        onBackTapped: () => ImpaktfullUiNotification.show(title: 'Go back!'),
        isFullScreen: inputs.isFullScreen.value ?? false,
        bottomChild: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: ImpaktfullUiButton(
              type: ImpaktfullUiButtonType.primary,
              title: 'Add',
              onTap: () {},
            ),
          ),
        ),
      ),
    ];
  }

  @override
  NavBarLibraryPrimaryInputs inputs() => NavBarLibraryPrimaryInputs();
}

class NavBarLibraryPrimaryInputs extends NavBarLibraryInputs {}

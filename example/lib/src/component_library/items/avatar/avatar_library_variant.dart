import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/items/avatar/avatar_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/util/network_images.dart';

class AvatarLibraryVariant
    extends ComponentLibraryVariant<AvatarLibraryPrimaryInputs> {
  const AvatarLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(BuildContext context, AvatarLibraryPrimaryInputs inputs) {
    return [
      ImpaktfullUiAvatar(
        url: NetworkImages.profilePicture,
        onTap: () => ImpaktfullUiNotification.show(title: 'Avatar tapped'),
      ),
      ImpaktfullUiAvatar(
        url: null,
        onTap: () =>
            ImpaktfullUiNotification.show(title: 'Empty Avatar tapped'),
      ),
    ];
  }

  @override
  AvatarLibraryPrimaryInputs inputs() => AvatarLibraryPrimaryInputs();
}

class AvatarLibraryPrimaryInputs extends AvatarLibraryInputs {}

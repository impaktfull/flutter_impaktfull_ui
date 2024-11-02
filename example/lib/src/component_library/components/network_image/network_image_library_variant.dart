import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/components/network_image/network_image_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/util/network_images.dart';

class NetworkImageLibraryVariant extends ComponentLibraryVariant<NetworkImageLibraryPrimaryInputs> {
  const NetworkImageLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(BuildContext context, NetworkImageLibraryPrimaryInputs inputs) {
    return [
      const ImpaktfullUiNetworkImage(
        url: NetworkImages.profilePicture,
      ),
    ];
  }

  @override
  NetworkImageLibraryPrimaryInputs inputs() => NetworkImageLibraryPrimaryInputs();
}

class NetworkImageLibraryPrimaryInputs extends NetworkImageLibraryInputs {}

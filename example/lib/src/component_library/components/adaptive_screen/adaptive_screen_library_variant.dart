import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/components/adaptive_screen/adaptive_screen_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/widget/component/components_library_variant_descriptor.dart';

class AdaptiveScreenLibraryVariant extends ComponentLibraryVariant<AdaptiveScreenLibraryPrimaryInputs> {
  const AdaptiveScreenLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(BuildContext context, AdaptiveScreenLibraryPrimaryInputs inputs) {
    return [
      ComponentsLibraryVariantDescriptor(
        height: 500,
        child: ImpaktfullUiAdaptiveScreen(
          title: 'Title',
          subtitle: 'Subtitle',
          onBackTapped: () => ImpaktfullUiNotification.show(title: 'Go back!'),
          builder: (context) => const Center(
            child: Text('Small'),
          ),
          mediumBuilder: (context) => const Center(
            child: Text('Medium and up'),
          ),
        ),
      ),
      ComponentsLibraryVariantDescriptor(
        height: 500,
        child: ImpaktfullUiAdaptiveScreen(
          title: 'Title',
          subtitle: 'Subtitle',
          onBackTapped: () => ImpaktfullUiNotification.show(title: 'Go back!'),
          builder: (context) => const Center(
            child: Text('All sizes'),
          ),
        ),
      ),
    ];
  }

  @override
  AdaptiveScreenLibraryPrimaryInputs inputs() => AdaptiveScreenLibraryPrimaryInputs();
}

class AdaptiveScreenLibraryPrimaryInputs extends AdaptiveScreenLibraryInputs {}

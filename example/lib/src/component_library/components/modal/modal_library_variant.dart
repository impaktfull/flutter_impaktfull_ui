import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/components/modal/modal_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/navigator/navigator.dart';
import 'package:impaktfull_ui_example/src/widget/component/components_library_variant_descriptor.dart';

class ModalLibraryVariant
    extends ComponentLibraryVariant<ModalLibraryPrimaryInputs> {
  const ModalLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(BuildContext context, ModalLibraryPrimaryInputs inputs) {
    return [
      for (final headerChildLocation in [
        null,
        ...ImpaktfullUiModalHeaderChildLocation.values,
      ]) ...[
        ComponentsLibraryVariantDescriptor(
          title: 'headerChildLocation: $headerChildLocation',
          child: ImpaktfullUiButton(
            type: ImpaktfullUiButtonType.primary,
            title: 'Show modal',
            onTap: () => ImpaktfullUiModal.showSimple(
              context: context,
              headerChildLocation: headerChildLocation,
              headerIcon: const ImpaktfullUiAsset.icon(Icons.people),
              title: 'Title',
              subtitle:
                  'This is quite a long subtitle that should wrap to the next line',
              hasBlurredBackground: inputs.showBackgroundBlur.value ?? false,
              showDividers: inputs.showDividers.value ?? false,
              barrierDismissible: inputs.enableDismissBarrier.value ?? true,
              onCloseTapped: () async => true,
              child: ImpaktfullUiAutoLayout.vertical(
                children: [
                  Text(
                    'Testing',
                    style: ImpaktfullUiTheme.of(context)
                        .textStyles
                        .onCanvas
                        .text
                        .medium,
                  ),
                ],
              ),
              actions: [
                for (final index in List.generate(
                    inputs.amountOfActions.value ?? 1, (index) => index)) ...[
                  ImpaktfullUiButton(
                    type: ImpaktfullUiButtonType
                        .values[index % ImpaktfullUiButtonType.values.length],
                    title: 'Action $index',
                    onTap: () => ImpaktfullUiNavigator.instance.goBack(),
                  ),
                ],
              ],
            ),
          ),
        ),
      ],
    ];
  }

  @override
  ModalLibraryPrimaryInputs inputs() => ModalLibraryPrimaryInputs();
}

class ModalLibraryPrimaryInputs extends ModalLibraryInputs {}

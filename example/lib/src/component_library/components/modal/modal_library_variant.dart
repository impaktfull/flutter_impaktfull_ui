import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/components/modal/modal_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/widget/components/components_library_variant_descriptor.dart';

class ModalLibraryVariant extends ComponentLibraryVariant<ModalLibraryPrimaryInputs> {
  const ModalLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(BuildContext context, ModalLibraryPrimaryInputs inputs) {
    return [
      for (final hasBlurredBackground in [false, true]) ...[
        for (final headerChildLocation in ImpaktfullUiModalHeaderChildLocation.values) ...[
          for (final amountOfActions in [1, 2, 3]) ...[
            ComponentsLibraryVariantDescriptor(
              title:
                  'hasBlurredBackground: $hasBlurredBackground | headerChildLocation: $headerChildLocation | amountOfActions: $amountOfActions',
              child: ImpaktfullUiButton(
                type: ImpaktfullUiButtonType.primary,
                title: 'Show modal',
                onTap: () => ImpaktfullUiModal.show(
                  context: context,
                  headerChildLocation: headerChildLocation,
                  headerIcon: Icons.people,
                  title: 'Title',
                  subtitle: 'Subtitle',
                  hasBlurredBackground: hasBlurredBackground,
                  onCloseTapped: () async => true,
                  child: ImpaktfullUiAutoLayout.vertical(
                    children: [
                      Text(
                        'Testing',
                        style: ImpaktfullUiTheme.of(context).textStyles.onCanvas.text.medium,
                      ),
                    ],
                  ),
                  actions: [
                    for (final index in List.generate(amountOfActions, (index) => index)) ...[
                      ImpaktfullUiButton(
                        type: ImpaktfullUiButtonType.values[index % ImpaktfullUiButtonType.values.length],
                        title: 'Action $index',
                        onTap: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ],
      ],
    ];
  }

  @override
  ModalLibraryPrimaryInputs inputs() => ModalLibraryPrimaryInputs();
}

class ModalLibraryPrimaryInputs extends ModalLibraryInputs {}

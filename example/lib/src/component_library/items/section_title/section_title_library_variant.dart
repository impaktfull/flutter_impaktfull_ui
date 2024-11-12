import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/items/section_title/section_title_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/widget/component/components_library_variant_descriptor.dart';

class SectionTitleLibraryVariant
    extends ComponentLibraryVariant<SectionTitleLibraryPrimaryInputs> {
  const SectionTitleLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(
      BuildContext context, SectionTitleLibraryPrimaryInputs inputs) {
    return [
      ComponentsLibraryVariantDescriptor(
        wrapWithCard: true,
        child: ImpaktfullUiSectionTitle(
          title: inputs.title.value ?? '',
          actions: [
            ImpaktfullUiIconButton(
              onTap: () =>
                  ImpaktfullUiNotification.show(title: 'On add tapped'),
              asset: theme.assets.icons.add,
            ),
          ],
        ),
      ),
      ComponentsLibraryVariantDescriptor(
        wrapWithCard: true,
        child: ImpaktfullUiSectionTitle(
          title: inputs.title.value ?? '',
          actions: [
            ImpaktfullUiButton(
              onTap: () => ImpaktfullUiNotification.show(
                title: 'On refresh tapped',
                type: ImpaktfullUiNotificationType.info,
              ),
              title: 'Refresh',
              type: ImpaktfullUiButtonType.secondaryGrey,
              size: ImpaktfullUiButtonSize.extraSmall,
            ),
            ImpaktfullUiIconButton(
              onTap: () => ImpaktfullUiNotification.show(
                title: 'On confetti tapped',
                type: ImpaktfullUiNotificationType.branded,
              ),
              asset: theme.assets.icons.confetti,
              color: theme.colors.accent,
            ),
            ImpaktfullUiIconButton(
              onTap: () =>
                  ImpaktfullUiNotification.show(title: 'On add tapped'),
              asset: theme.assets.icons.add,
            ),
          ],
        ),
      ),
      ComponentsLibraryVariantDescriptor(
        wrapWithCard: true,
        child: ImpaktfullUiSectionTitle(
          title: inputs.title.value ?? '',
        ),
      ),
    ];
  }

  @override
  SectionTitleLibraryPrimaryInputs inputs() =>
      SectionTitleLibraryPrimaryInputs();
}

class SectionTitleLibraryPrimaryInputs extends SectionTitleLibraryInputs {}

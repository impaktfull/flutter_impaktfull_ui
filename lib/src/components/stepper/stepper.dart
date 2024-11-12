import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/asset/asset_widget.dart';
import 'package:impaktfull_ui_2/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui_2/src/components/stepper/model/stepper_alignment.dart';
import 'package:impaktfull_ui_2/src/components/stepper/model/stepper_item.dart';
import 'package:impaktfull_ui_2/src/components/stepper/stepper_style.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';

export 'stepper_style.dart';
export 'model/stepper_item.dart';
export 'model/stepper_alignment.dart';

part 'stepper.describe.dart';

class ImpaktfullUiStepper extends StatelessWidget
    with ComponentDescriptorMixin {
  final ImpaktfullUiStepperOrientation orientation;
  final List<ImpaktfullUiStepperItem> items;
  final ImpaktfullUiStepperTheme? theme;

  int get currentStep => items.indexWhere((element) => !element.isCompleted);
  int get amountOfSteps => items.length;

  const ImpaktfullUiStepper({
    required this.items,
    this.orientation = ImpaktfullUiStepperOrientation.horizontal,
    this.theme,
    super.key,
  });

  ImpaktfullUiStepper.simple({
    required int currentStep,
    required int amountOfSteps,
    this.theme,
    super.key,
  })  : items = List.generate(
            amountOfSteps,
            (index) =>
                ImpaktfullUiStepperItem(isCompleted: index < currentStep)),
        orientation = ImpaktfullUiStepperOrientation.horizontal;

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuilder<ImpaktfullUiStepperTheme>(
      overrideComponentTheme: theme,
      builder: (context, componentTheme) {
        final ImpaktfullUiAutoLayoutOrientation autoLayoutOrientation;
        var spacing = componentTheme.dimens.spacing;
        if (orientation == ImpaktfullUiStepperOrientation.horizontal) {
          autoLayoutOrientation = ImpaktfullUiAutoLayoutOrientation.horizontal;
        } else {
          autoLayoutOrientation = ImpaktfullUiAutoLayoutOrientation.vertical;
          spacing = spacing * 3;
        }
        return ImpaktfullUiAutoLayout(
          orientation: autoLayoutOrientation,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: spacing,
          children: [
            for (final item in items) ...[
              Builder(
                builder: (context) {
                  final i = items.indexOf(item);
                  final crossAxisAlignment = item.asset == null
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.center;
                  final textAlign =
                      item.asset == null ? TextAlign.start : TextAlign.center;
                  final useExpanded = autoLayoutOrientation ==
                      ImpaktfullUiAutoLayoutOrientation.horizontal;
                  final child = ImpaktfullUiAutoLayout.vertical(
                    crossAxisAlignment: crossAxisAlignment,
                    mainAxisSize: MainAxisSize.min,
                    spacing: 8,
                    children: [
                      if (item.asset == null) ...[
                        Container(
                          height: componentTheme.dimens.height,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: i < currentStep
                                ? componentTheme.colors.activeStep
                                : componentTheme.colors.inactiveStep,
                            borderRadius: componentTheme.dimens.borderRadius,
                          ),
                        ),
                      ] else ...[
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: i < currentStep
                                  ? componentTheme.colors.assetBorderCompleted
                                  : componentTheme.colors.assetBorder,
                              width: 1,
                            ),
                            color: i < currentStep
                                ? componentTheme.colors.assetBackgroundCompleted
                                : componentTheme.colors.assetBackground,
                            borderRadius: componentTheme.dimens.borderRadius,
                          ),
                          padding: const EdgeInsets.all(8),
                          child: ImpaktfullUiAssetWidget(
                            asset: item.asset!,
                            color: i < currentStep
                                ? componentTheme.colors.assetColorCompleted
                                : componentTheme.colors.assetColor,
                          ),
                        ),
                      ],
                      if (item.title != null) ...[
                        ImpaktfullUiAutoLayout.vertical(
                          crossAxisAlignment: crossAxisAlignment,
                          children: [
                            Text(
                              item.title!,
                              style: componentTheme.textStyles.title,
                              textAlign: textAlign,
                            ),
                            if (item.subtitle != null) ...[
                              Text(
                                item.subtitle!,
                                style: componentTheme.textStyles.subtitle,
                                textAlign: textAlign,
                              ),
                            ],
                          ],
                        ),
                      ],
                    ],
                  );
                  if (useExpanded) {
                    return Expanded(child: child);
                  }
                  return child;
                },
              ),
            ],
          ],
        );
      },
    );
  }

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}

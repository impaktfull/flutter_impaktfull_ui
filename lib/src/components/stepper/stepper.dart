import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/asset/asset_widget.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/stepper/model/stepper_alignment.dart';
import 'package:impaktfull_ui/src/components/stepper/model/stepper_item.dart';
import 'package:impaktfull_ui/src/components/stepper/stepper_style.dart';
import 'package:impaktfull_ui/src/util/accessibility/accessibility.localizations.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'stepper_style.dart';
export 'model/stepper_item.dart';
export 'model/stepper_alignment.dart';

class ImpaktfullUiStepper extends StatelessWidget {
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
    return ImpaktfullUiOverridableComponentBuilder(
      component: this,
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
        // All items before the first incomplete item are active. When every
        // item is completed, [currentStep] is -1 and every item is active.
        final activeSteps = currentStep == -1 ? items.length : currentStep;
        final localizations =
            ImpaktfullUiAccessibilityLocalizations.of(context);
        return ImpaktfullUiAutoLayout(
          orientation: autoLayoutOrientation,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: spacing,
          children: [
            for (var i = 0; i < items.length; i++) ...[
              Builder(
                builder: (context) {
                  final item = items[i];
                  final crossAxisAlignment = item.asset == null
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.center;
                  final textAlign =
                      item.asset == null ? TextAlign.start : TextAlign.center;
                  final useExpanded = autoLayoutOrientation ==
                      ImpaktfullUiAutoLayoutOrientation.horizontal;
                  final String? semanticValue;
                  if (item.isCompleted) {
                    semanticValue = localizations.stepCompleted;
                  } else if (i == currentStep) {
                    semanticValue = localizations.stepCurrent;
                  } else {
                    semanticValue = null;
                  }
                  final child = Semantics(
                    container: true,
                    label: localizations.stepLabel(i + 1, items.length),
                    value: semanticValue,
                    child: ImpaktfullUiAutoLayout.vertical(
                      crossAxisAlignment: crossAxisAlignment,
                      mainAxisSize: MainAxisSize.min,
                      spacing: 8,
                      children: [
                        if (item.asset == null) ...[
                          Container(
                            height: componentTheme.dimens.height,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: i < activeSteps
                                  ? componentTheme.colors.activeStep
                                  : componentTheme.colors.inactiveStep,
                              borderRadius: componentTheme.dimens.borderRadius,
                            ),
                          ),
                        ] else ...[
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: i < activeSteps
                                    ? componentTheme.colors.assetBorderCompleted
                                    : componentTheme.colors.assetBorder,
                                width: 1,
                              ),
                              color: i < activeSteps
                                  ? componentTheme
                                      .colors.assetBackgroundCompleted
                                  : componentTheme.colors.assetBackground,
                              borderRadius: componentTheme.dimens.borderRadius,
                            ),
                            padding: componentTheme.dimens.padding,
                            child: ImpaktfullUiAssetWidget(
                              asset: item.asset!,
                              color: i < activeSteps
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
                    ),
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
}

import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui_2/src/components/stepper/model/stepper_item.dart';
import 'package:impaktfull_ui_2/src/components/stepper/stepper_style.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';

export 'stepper_style.dart';
export 'model/stepper_item.dart';

part 'stepper.describe.dart';

class ImpaktfullUiStepper extends StatelessWidget
    with ComponentDescriptorMixin {
  final List<ImpaktfullUiStepperItem> items;
  final ImpaktfullUiStepperTheme? theme;

  int get currentStep => items.indexWhere((element) => !element.isCompleted);
  int get amountOfSteps => items.length;

  const ImpaktfullUiStepper({
    required this.items,
    this.theme,
    super.key,
  });

  ImpaktfullUiStepper.simple({
    required int currentStep,
    required int amountOfSteps,
    this.theme,
    super.key,
  }) : items = List.generate(
            amountOfSteps,
            (index) =>
                ImpaktfullUiStepperItem(isCompleted: index < currentStep));

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiStepperTheme>(
      overrideComponentTheme: theme,
      builder: (context, componentTheme) => ImpaktfullUiAutoLayout.horizontal(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: componentTheme.dimens.spacing,
        children: [
          for (final item in items) ...[
            Expanded(
              child: Builder(
                builder: (context) {
                  final i = items.indexOf(item);
                  return ImpaktfullUiAutoLayout.vertical(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 16,
                    children: [
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
                      if (item.title != null) ...[
                        ImpaktfullUiAutoLayout.vertical(
                          children: [
                            Text(
                              item.title!,
                              style: componentTheme.textStyles.title,
                            ),
                            if (item.subtitle != null) ...[
                              Text(
                                item.subtitle!,
                                style: componentTheme.textStyles.subtitle,
                              ),
                            ],
                          ],
                        ),
                      ],
                    ],
                  );
                },
              ),
            ),
          ],
        ],
      ),
    );
  }

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}

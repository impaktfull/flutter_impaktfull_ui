import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/asset/asset_widget.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/password_strength_indicator/model/password_strength_indicator_requirement.dart';
import 'package:impaktfull_ui/src/components/password_strength_indicator/password_strength_indicator_style.dart';
import 'package:impaktfull_ui/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui/src/util/descriptor/component_descriptor_mixin.dart';

export 'password_strength_indicator_style.dart';
export 'model/password_strength_indicator_requirement.dart';

part 'password_strength_indicator.describe.dart';

class ImpaktfullUiPasswordStrengthIndicator extends StatelessWidget
    with ComponentDescriptorMixin {
  final int? strengthIndicatorIndex;
  final List<Color>? strengthIndicators;
  final List<PasswordStrengthIndicatorRequirement> requirements;
  final ImpaktfullUiPasswordStrengthIndicatorTheme? theme;

  const ImpaktfullUiPasswordStrengthIndicator({
    required this.strengthIndicatorIndex,
    required this.requirements,
    this.strengthIndicators,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuilder<
        ImpaktfullUiPasswordStrengthIndicatorTheme>(
      overrideComponentTheme: theme,
      builder: (context, componentTheme) {
        final strengthIndicators =
            this.strengthIndicators ?? componentTheme.colors.strengthIndicators;
        final color = _getColor(
            componentTheme, strengthIndicators, strengthIndicatorIndex);
        return ImpaktfullUiAutoLayout.vertical(
          mainAxisSize: MainAxisSize.min,
          spacing: 12,
          children: [
            ImpaktfullUiAutoLayout.horizontal(
              spacing: componentTheme.dimens.spacing,
              children: [
                for (var i = 0; i < strengthIndicators.length; i++) ...[
                  Expanded(
                    child: AnimatedContainer(
                      duration: componentTheme.durations.colorChangeDuration,
                      decoration: BoxDecoration(
                        color: _hasColor(i)
                            ? color
                            : componentTheme.colors.strengthIndicatorBackground,
                        borderRadius:
                            componentTheme.dimens.strengthIndicatorBorderRadius,
                      ),
                      height: 4,
                    ),
                  ),
                ],
              ],
            ),
            ImpaktfullUiAutoLayout.vertical(
              spacing: componentTheme.dimens.requirementSpacing,
              children: [
                for (final requirement in requirements) ...[
                  ImpaktfullUiAutoLayout.horizontal(
                    spacing: 8,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (componentTheme.assets.leadingRequerementIsMet !=
                              null &&
                          componentTheme.assets.leadingRequerement != null) ...[
                        ImpaktfullUiAssetWidget(
                          asset: requirement.isMet
                              ? componentTheme.assets.leadingRequerementIsMet
                              : componentTheme.assets.leadingRequerement,
                          size: 16,
                          color: requirement.isMet
                              ? componentTheme.colors.requirementAssetIsMet
                              : componentTheme.colors.requirementAsset,
                        ),
                      ],
                      Expanded(
                        child: Text(
                          requirement.requirement,
                          style: requirement.isMet
                              ? componentTheme.textStyles.requirementIsMet
                              : componentTheme.textStyles.requirement,
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  String describe(BuildContext context) => _describeInstance(context, this);

  Color _getColor(
    ImpaktfullUiPasswordStrengthIndicatorTheme componentTheme,
    List<Color> strengthIndicators,
    int? strengthIndicatorIndex,
  ) {
    if (strengthIndicatorIndex == null) {
      return componentTheme.colors.strengthIndicatorBackground;
    }
    if (strengthIndicatorIndex < 0) {
      throw Exception('Strength indicator index cannot be negative');
    }
    if (strengthIndicators.length < strengthIndicatorIndex) {
      throw Exception('Strength indicator index is out of bounds');
    }

    return strengthIndicators[strengthIndicatorIndex];
  }

  bool _hasColor(int i) {
    final strengthIndicatorIndex = this.strengthIndicatorIndex;
    if (strengthIndicatorIndex == null) {
      return false;
    }
    return i <= strengthIndicatorIndex;
  }
}

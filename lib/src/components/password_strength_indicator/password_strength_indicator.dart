import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/asset/asset_widget.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/password_strength_indicator/model/password_strength_indicator_requirement.dart';
import 'package:impaktfull_ui/src/components/password_strength_indicator/password_strength_indicator_style.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'password_strength_indicator_style.dart';
export 'model/password_strength_indicator_requirement.dart';

class ImpaktfullUiPasswordStrengthIndicator extends StatelessWidget {
  final int? strengthIndicatorIndex;
  final List<Color>? strengthIndicators;
  final List<ImpaktfullUiPasswordStrengthIndicatorRequirement> requirements;
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
    return ImpaktfullUiOverridableComponentBuilder(
      component: this,
      overrideComponentTheme: theme,
      builder: (context, componentTheme) {
        final strengthIndicators =
            this.strengthIndicators ?? componentTheme.colors.strengthIndicators;
        final index = _getClampedIndex(strengthIndicators);
        final color = _getColor(componentTheme, strengthIndicators, index);
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
                        color: _hasColor(i, index)
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
                      if (componentTheme.assets.leadingRequirementIsMet !=
                              null &&
                          componentTheme.assets.leadingRequirement != null) ...[
                        ImpaktfullUiAssetWidget(
                          asset: requirement.isMet
                              ? componentTheme.assets.leadingRequirementIsMet
                              : componentTheme.assets.leadingRequirement,
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

  Color _getColor(
    ImpaktfullUiPasswordStrengthIndicatorTheme componentTheme,
    List<Color> strengthIndicators,
    int? index,
  ) {
    if (index == null) {
      return componentTheme.colors.strengthIndicatorBackground;
    }
    return strengthIndicators[index];
  }

  /// The [strengthIndicatorIndex] clamped to the available
  /// [strengthIndicators], or null when no indicator should be colored.
  int? _getClampedIndex(List<Color> strengthIndicators) {
    final strengthIndicatorIndex = this.strengthIndicatorIndex;
    if (strengthIndicatorIndex == null) return null;
    if (strengthIndicatorIndex < 0) return null;
    if (strengthIndicators.isEmpty) return null;
    if (strengthIndicatorIndex >= strengthIndicators.length) {
      return strengthIndicators.length - 1;
    }
    return strengthIndicatorIndex;
  }

  bool _hasColor(int i, int? index) {
    if (index == null) return false;
    return i <= index;
  }
}

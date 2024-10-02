import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';

export 'horizontal_tab_style.dart';
part 'horizontal_tab.describe.dart';

class ImpaktfullUiHorizontalTabConfig<T> {
  final String label;
  final String? badge;
  final T value;
  final ImpaktfullUiBadgeType? badgeType;

  ImpaktfullUiHorizontalTabConfig({
    required this.label,
    required this.value,
    this.badge,
    this.badgeType,
  });
}

class ImpaktfullUiHorizontalTab extends StatelessWidget
    with ComponentDescriptorMixin {
  final String label;
  final String? badge;
  final ImpaktfullUiBadgeType? badgeType;
  final bool isSelected;
  final VoidCallback onTap;
  final ImpaktfullUiHorizontalTabTheme? theme;

  const ImpaktfullUiHorizontalTab({
    required this.label,
    required this.onTap,
    this.badge,
    this.badgeType,
    this.isSelected = false,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiHorizontalTabTheme>(
      overrideComponentTheme: theme,
      builder: (context, theme, componentTheme) => ImpaktfullUiTouchFeedback(
        onTap: onTap,
        borderRadius: componentTheme.dimens.borderRadius,
        color: isSelected
            ? componentTheme.colors.backgroundSelectedTab
            : componentTheme.colors.backgroundUnSelectedTab,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 8,
          ),
          child: ImpaktfullUiAutoLayout.horizontal(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                label,
                style: isSelected
                    ? componentTheme.textStyles.selected
                    : componentTheme.textStyles.unselected,
              ),
              if (badge != null) ...[
                const SizedBox(width: 8),
                ImpaktfullUiBadge(
                  type: isSelected
                      ? ImpaktfullUiBadgeType.primary
                      : badgeType ?? ImpaktfullUiBadgeType.primary,
                  size: ImpaktfullUiBadgeSize.small,
                  label: badge,
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}

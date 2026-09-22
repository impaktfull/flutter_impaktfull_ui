import 'package:flutter/widgets.dart';
import 'package:flutter/semantics.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/badge/badge.dart';
import 'package:impaktfull_ui/src/components/horizontal_tab/horizontal_tab.dart';
import 'package:impaktfull_ui/src/components/interaction_feedback/touch_feedback/touch_feedback.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'horizontal_tab_style.dart';

class ImpaktfullUiHorizontalTabConfig<T> {
  final String title;
  final String? badge;
  final T value;
  final ImpaktfullUiBadgeType? badgeType;

  ImpaktfullUiHorizontalTabConfig({
    // `title` becomes `required` again in 1.0.0, when `label` is removed.
    String? title,
    @Deprecated('Use title instead. Will be removed in 1.0.0.') String? label,
    required this.value,
    this.badge,
    this.badgeType,
  })  : assert(title != null || label != null, 'title is required'),
        title = (title ?? label) as String;

  @Deprecated('Use title instead. Will be removed in 1.0.0.')
  String get label => title;
}

class ImpaktfullUiHorizontalTab extends StatelessWidget {
  final String title;
  final String? badge;
  final ImpaktfullUiBadgeType? badgeType;
  final bool isSelected;
  final VoidCallback onTap;
  final ImpaktfullUiHorizontalTabTheme? theme;

  const ImpaktfullUiHorizontalTab({
    // `title` becomes `required` again in 1.0.0, when `label` is removed.
    String? title,
    @Deprecated('Use title instead. Will be removed in 1.0.0.') String? label,
    required this.onTap,
    this.badge,
    this.badgeType,
    this.isSelected = false,
    this.theme,
    super.key,
  })  : assert(title != null || label != null, 'title is required'),
        title = (title ?? label) as String;

  @Deprecated('Use title instead. Will be removed in 1.0.0.')
  String get label => title;

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      component: this,
      overrideComponentTheme: theme,
      builder: (context, componentTheme) => Semantics(
        container: true,
        role: SemanticsRole.tab,
        button: true,
        selected: isSelected,
        child: ImpaktfullUiTouchFeedback(
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
                  title,
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
                    title: badge,
                  ),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}

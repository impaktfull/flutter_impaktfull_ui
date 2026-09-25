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
      builder: (context, componentTheme) {
        final touchFeedback = ImpaktfullUiTouchFeedbackTheme.of(context);
        return Semantics(
          container: true,
          role: SemanticsRole.tab,
          button: true,
          selected: isSelected,
          child: ImpaktfullUiTouchFeedback(
            onTap: onTap,
            // A tab lives in the scrolling strip of
            // `ImpaktfullUiHorizontalTabs`, which clips to its viewport, so
            // the focus ring is drawn against the inside of the tab instead
            // of around it. Around it, only its left and right sides would
            // survive the clip.
            theme: touchFeedback.copyWith(
              focusRing: touchFeedback.focusRing.inset,
            ),
            borderRadius: componentTheme.dimens.borderRadius,
            color: isSelected
                ? componentTheme.colors.backgroundSelectedTab
                : componentTheme.colors.backgroundUnSelectedTab,
            child: _buildContent(componentTheme),
          ),
        );
      },
    );
  }

  /// The title of the tab, with the bar under it when there is one.
  ///
  /// The bar is painted over the bottom of the tab instead of taking a place
  /// of its own, so a theme without one (`selectedMarker` is `null`) renders
  /// what it always did, down to the pixel.
  Widget _buildContent(ImpaktfullUiHorizontalTabTheme componentTheme) {
    final dimens = componentTheme.dimens;
    final content = Padding(
      padding: dimens.padding,
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
            SizedBox(width: dimens.badgeSpacing),
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
    );
    final markerColor = componentTheme.colors.selectedMarker;
    if (markerColor == null || !isSelected) return content;
    final marker = Container(
      height: dimens.selectedMarkerHeight,
      width: dimens.selectedMarkerWidth,
      decoration: BoxDecoration(
        color: markerColor,
        borderRadius: dimens.selectedMarkerBorderRadius,
      ),
    );
    return Stack(
      children: [
        content,
        PositionedDirectional(
          start: 0,
          end: 0,
          bottom: 0,
          child: dimens.selectedMarkerWidth == null
              ? marker
              : Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: marker,
                ),
        ),
      ],
    );
  }
}

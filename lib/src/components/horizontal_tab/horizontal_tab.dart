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
        final hoverBackground = componentTheme.colors.backgroundHoveredTab;
        return Semantics(
          container: true,
          role: SemanticsRole.tab,
          button: true,
          selected: isSelected,
          child: _HoverBuilder(
            builder: (context, isHovered) => ImpaktfullUiTouchFeedback(
              onTap: onTap,
              // A tab lives in the scrolling strip of
              // `ImpaktfullUiHorizontalTabs`, which clips to its viewport, so
              // the focus ring is drawn against the inside of the tab instead
              // of around it. Around it, only its left and right sides would
              // survive the clip.
              theme: touchFeedback.copyWith(
                focusRing: touchFeedback.focusRing.inset,
                // A tab that says what its hover looks like owns both the
                // hover and the pressed overlay: a tab of Ant Design shows
                // neither and changes the colour of its title instead.
                colors: hoverBackground == null
                    ? null
                    : touchFeedback.colors.copyWith(
                        hover: hoverBackground,
                        highlight: hoverBackground,
                      ),
              ),
              borderRadius: componentTheme.dimens.borderRadius,
              color: isSelected
                  ? componentTheme.colors.backgroundSelectedTab
                  : componentTheme.colors.backgroundUnSelectedTab,
              child: _buildContent(componentTheme, isHovered: isHovered),
            ),
          ),
        );
      },
    );
  }

  /// The style of the title.
  ///
  /// The selected tab keeps its own style while the pointer is over it: its
  /// colour already says that it is the selected one.
  TextStyle _textStyle(
    ImpaktfullUiHorizontalTabTheme componentTheme, {
    required bool isHovered,
  }) {
    final textStyles = componentTheme.textStyles;
    if (isSelected) return textStyles.selected;
    if (isHovered) return textStyles.hovered ?? textStyles.unselected;
    return textStyles.unselected;
  }

  /// The title of the tab, with the bar under it when there is one.
  ///
  /// The bar is painted over the bottom of the tab instead of taking a place
  /// of its own, so a theme without one (`selectedMarker` is `null`) renders
  /// what it always did, down to the pixel.
  Widget _buildContent(
    ImpaktfullUiHorizontalTabTheme componentTheme, {
    required bool isHovered,
  }) {
    final dimens = componentTheme.dimens;
    final content = Padding(
      padding: dimens.padding,
      child: ImpaktfullUiAutoLayout.horizontal(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: _textStyle(componentTheme, isHovered: isHovered),
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

/// Rebuilds its child while the pointer enters and leaves it.
///
/// `ImpaktfullUiHorizontalTab` stays a `StatelessWidget`: only the part that
/// reads the hover needs the state.
class _HoverBuilder extends StatefulWidget {
  final Widget Function(BuildContext context, bool isHovered) builder;

  const _HoverBuilder({required this.builder});

  @override
  State<_HoverBuilder> createState() => _HoverBuilderState();
}

class _HoverBuilderState extends State<_HoverBuilder> {
  var _isHovered = false;

  void _onHoverChanged(bool isHovered) {
    if (_isHovered == isHovered) return;
    setState(() => _isHovered = isHovered);
  }

  @override
  Widget build(BuildContext context) => MouseRegion(
        onEnter: (_) => _onHoverChanged(true),
        onExit: (_) => _onHoverChanged(false),
        child: widget.builder(context, _isHovered),
      );
}

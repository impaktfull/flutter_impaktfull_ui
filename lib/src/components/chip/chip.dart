import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/components/asset/asset_widget.dart';
import 'package:impaktfull_ui/src/components/chip/chip_style.dart';
import 'package:impaktfull_ui/src/components/interaction_feedback/touch_feedback/touch_feedback.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/widget/accessibility/min_tap_target.dart';
import 'package:impaktfull_ui/src/widget/layout/shrink_wrap_row.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'chip_style.dart';

/// A selectable chip: a pill that is on or off, for filters and for picking
/// one or more options (Material's `FilterChip` and `ChoiceChip`, the
/// outline `Toggle` of shadcn/ui, Ant Design's `Tag.CheckableTag`).
///
/// The chip does not keep its own state: it shows [value] and calls [onTap],
/// and the app changes [value]. There is no group widget: put the chips in a
/// [Wrap] (or a horizontal list) and decide in [onTap] whether one or more of
/// them can be selected.
///
/// ```dart
/// Wrap(
///   spacing: 8,
///   runSpacing: 8,
///   children: [
///     for (final category in categories)
///       ImpaktfullUiChip(
///         title: category.name,
///         value: selected.contains(category),
///         onTap: () => _onCategoryTapped(category),
///       ),
///   ],
/// )
/// ```
///
/// Screen readers announce it as a button with a selected state. Pass `null`
/// as [onTap] to disable it.
class ImpaktfullUiChip extends StatelessWidget {
  /// The text of the chip, which is also what screen readers announce.
  final String title;

  /// Whether the chip is selected.
  final bool value;

  /// Called when the chip is tapped, or activated with enter or space. The
  /// chip is disabled when this is null.
  final VoidCallback? onTap;

  /// An optional asset before the [title], in the color of the title.
  final ImpaktfullUiAsset? leading;

  final ImpaktfullUiChipTheme? theme;

  const ImpaktfullUiChip({
    required this.title,
    required this.value,
    required this.onTap,
    this.leading,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      component: this,
      overrideComponentTheme: theme,
      builder: (context, componentTheme) {
        final colors = componentTheme.colors;
        final dimens = componentTheme.dimens;
        final textStyles = componentTheme.textStyles;
        final leading = this.leading;
        final textColor = value ? colors.textSelected : colors.text;
        final textStyle = (value ? textStyles.titleSelected : textStyles.title)
            .copyWith(color: textColor);
        return Semantics(
          container: true,
          button: true,
          selected: value,
          enabled: onTap != null,
          child: ImpaktfullUiMinTapTarget(
            minSize: dimens.minTapTargetSize,
            onTap: onTap,
            child: Opacity(
              opacity: onTap == null ? dimens.disabledOpacity : 1,
              child: ImpaktfullUiTouchFeedback(
                onTap: onTap,
                color: value ? colors.backgroundSelected : colors.background,
                border: Border.all(
                  color: value ? colors.borderSelected : colors.border,
                  width: dimens.borderWidth,
                ),
                borderRadius: dimens.borderRadius,
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: dimens.minHeight),
                  child: Padding(
                    padding: dimens.padding,
                    // With a bounded width (e.g. in a Wrap) a long title is
                    // truncated, without one (e.g. in a horizontal list) the
                    // chip keeps the width of its title.
                    child: ImpaktfullUiShrinkWrapRow(
                      children: [
                        if (leading != null) ...[
                          ImpaktfullUiAssetWidget(
                            asset: leading,
                            color: textColor,
                            size: dimens.iconSize,
                          ),
                          SizedBox(width: dimens.spacing),
                        ],
                        Flexible(
                          child: Text(
                            title,
                            style: textStyle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

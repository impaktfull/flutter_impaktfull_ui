import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/checkbox/checkbox.dart';
import 'package:impaktfull_ui/src/components/table_header_item/table_header_item.dart';
import 'package:impaktfull_ui/src/components/interaction_feedback/touch_feedback/touch_feedback.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';

export 'table_header_item_style.dart';
export 'table_header_item_type.dart';

class ImpaktfullUiTableHeaderItem extends StatelessWidget {
  final ImpaktfullUiTableHeaderItemType type;
  final String? title;
  final VoidCallback? onTap;
  final bool? ascending;
  final ImpaktfullUiTableHeaderItemTheme? theme;
  final bool? isSelected;
  final ValueChanged<bool?>? onChanged;
  final EdgeInsets? _padding;

  const ImpaktfullUiTableHeaderItem({
    this.title,
    this.onTap,
    this.ascending,

    /// The padding of the header cell. Without one, the `padding` of the
    /// [ImpaktfullUiTableHeaderItemTheme] is used (16 horizontal by default).
    EdgeInsets? padding,
    this.theme,
    super.key,
  })  : type = ImpaktfullUiTableHeaderItemType.text,
        _padding = padding,
        isSelected = false,
        onChanged = null;

  const ImpaktfullUiTableHeaderItem.checkbox({
    required this.isSelected,
    required this.onChanged,
    this.title,
    this.onTap,
    this.ascending,

    /// The padding of the header cell. Without one, the `padding` of the
    /// [ImpaktfullUiTableHeaderItemTheme] is used (16 horizontal by default).
    EdgeInsets? padding,
    this.theme,
    super.key,
  })  : type = ImpaktfullUiTableHeaderItemType.checkbox,
        _padding = padding;

  /// The padding that was passed to the constructor, or
  /// `EdgeInsets.symmetric(horizontal: 16)` (the padding of the default
  /// theme) when none was passed. Without a padding, the header cell uses the
  /// `padding` of the [ImpaktfullUiTableHeaderItemTheme].
  ///
  /// It is nullable because it was a nullable field before the padding became
  /// a token, so code that reads it keeps compiling without a warning. It
  /// never returns null.
  EdgeInsets? get padding =>
      _padding ?? const EdgeInsets.symmetric(horizontal: 16);

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      component: this,
      overrideComponentTheme: theme,
      builder: (context, componentTheme) {
        final isCheckbox = type == ImpaktfullUiTableHeaderItemType.checkbox;
        if (title == null && !isCheckbox) {
          return SizedBox(height: componentTheme.dimens.minHeight);
        }
        return ImpaktfullUiTouchFeedback(
          onTap: onTap,
          child: Container(
            constraints:
                BoxConstraints(minHeight: componentTheme.dimens.minHeight),
            padding: _padding ?? componentTheme.dimens.padding,
            child: ImpaktfullUiAutoLayout.horizontal(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: componentTheme.dimens.spacing,
              children: [
                if (isCheckbox) ...[
                  ImpaktfullUiCheckbox.indeterminate(
                    value: isSelected,
                    onChanged: onChanged,
                  ),
                ],
                if (title != null) ...[
                  Expanded(
                    child: Text.rich(
                      style: componentTheme.textStyles.title,
                      maxLines: 1,
                      overflow: TextOverflow.visible,
                      TextSpan(
                        children: [
                          TextSpan(
                            text: title ?? '',
                          ),
                          if (ascending == true) ...[
                            WidgetSpan(
                              child: SizedBox(
                                width: componentTheme.dimens.sortIconSpacing,
                              ),
                            ),
                            WidgetSpan(
                              alignment: PlaceholderAlignment.middle,
                              child: Icon(
                                PhosphorIcons.caretUp,
                                size: componentTheme.dimens.sortIconSize,
                                color: componentTheme.colors.sortIcon,
                              ),
                            ),
                          ] else if (ascending == false) ...[
                            WidgetSpan(
                              child: SizedBox(
                                width: componentTheme.dimens.sortIconSpacing,
                              ),
                            ),
                            WidgetSpan(
                              alignment: PlaceholderAlignment.middle,
                              child: Icon(
                                PhosphorIcons.caretDown,
                                size: componentTheme.dimens.sortIconSize,
                                color: componentTheme.colors.sortIcon,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}

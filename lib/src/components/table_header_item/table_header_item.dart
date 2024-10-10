import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui_2/src/components/checkbox/checkbox.dart';
import 'package:impaktfull_ui_2/src/components/table_header_item/table_header_item.dart';
import 'package:impaktfull_ui_2/src/components/table_header_item/table_header_item_type.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/components/touch_feedback/touch_feedback.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

export 'table_header_item_style.dart';

class ImpaktfullUiTableHeaderItem extends StatelessWidget {
  final ImpaktfullUiTableHeaderItemType type;
  final String? title;
  final VoidCallback? onTap;
  final bool? ascending;
  final EdgeInsets? padding;
  final ImpaktfullUiTableHeaderItemTheme? theme;
  final bool? isSelected;
  final ValueChanged<bool?>? onChanged;

  const ImpaktfullUiTableHeaderItem({
    this.title,
    this.onTap,
    this.ascending,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 16,
    ),
    this.theme,
    super.key,
  })  : type = ImpaktfullUiTableHeaderItemType.text,
        isSelected = false,
        onChanged = null;

  const ImpaktfullUiTableHeaderItem.checkbox({
    required this.isSelected,
    required this.onChanged,
    this.title,
    this.onTap,
    this.ascending,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 16,
    ),
    this.theme,
    super.key,
  }) : type = ImpaktfullUiTableHeaderItemType.checkbox;

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiTableHeaderItemTheme>(
      overrideComponentTheme: theme,
      builder: (context, componentTheme) {
        if (title == null) return const SizedBox(height: 48);
        return ImpaktfullUiTouchFeedback(
          onTap: onTap,
          child: Container(
            constraints: const BoxConstraints(minHeight: 48),
            padding: padding,
            child: ImpaktfullUiAutoLayout.horizontal(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 8,
              children: [
                if (type == ImpaktfullUiTableHeaderItemType.checkbox) ...[
                  ImpaktfullUiCheckBox.indermediate(
                    value: isSelected,
                    onChanged: onChanged!,
                  ),
                ],
                Text(
                  title ?? '',
                  style: componentTheme.textStyles.title,
                ),
                if (ascending == true) ...[
                  Icon(
                    PhosphorIcons.caretUp(),
                    size: 16,
                  ),
                ] else if (ascending == false) ...[
                  Icon(
                    PhosphorIcons.caretDown(),
                    size: 16,
                  ),
                ],
                const Spacer(),
              ],
            ),
          ),
        );
      },
    );
  }
}

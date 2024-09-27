import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

export 'table_header_item_style.dart';

class ImpaktfullUiTableHeaderItem extends StatelessWidget {
  final String? title;
  final VoidCallback? onTap;
  final bool? ascending;
  final EdgeInsets? padding;
  final ImpaktfullUiTableHeaderItemTheme? theme;

  const ImpaktfullUiTableHeaderItem({
    this.title,
    this.onTap,
    this.ascending,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 16,
    ),
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiTableHeaderItemTheme>(
      overrideComponentTheme: theme,
      builder: (context, theme, componentTheme) => ImpaktfullUiTouchFeedback(
        onTap: onTap,
        child: Container(
          constraints: const BoxConstraints(minHeight: 48),
          padding: padding,
          child: ImpaktfullUiAutoLayout.horizontal(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 8,
            children: [
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
      ),
    );
  }
}

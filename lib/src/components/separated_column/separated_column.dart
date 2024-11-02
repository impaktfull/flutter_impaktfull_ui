import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/divider/divider.dart';
import 'package:impaktfull_ui/src/components/section_title/section_title.dart';
import 'package:impaktfull_ui/src/components/separated_column/separated_column_style.dart';
import 'package:impaktfull_ui/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui/src/util/descriptor/component_descriptor_mixin.dart';

export 'separated_column_style.dart';

part 'separated_column.describe.dart';

class ImpaktfullUiSeparatedColumn extends StatelessWidget with ComponentDescriptorMixin {
  final String? title;
  final List<Widget> children;
  final bool showFirstDivider;
  final bool showLastDivider;
  final EdgeInsetsGeometry? titleMargin;
  final EdgeInsetsGeometry? separatorMargin;
  final ImpaktfullUiSeparatedColumnTheme? theme;

  const ImpaktfullUiSeparatedColumn({
    required this.children,
    this.title,
    this.showFirstDivider = false,
    this.showLastDivider = false,
    this.titleMargin,
    this.separatorMargin,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiSeparatedColumnTheme>(
      overrideComponentTheme: theme,
      builder: (context, componentTheme) => ImpaktfullUiAutoLayout.vertical(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null) ...[
            ImpaktfullUiSectionTitle(
              title: title!,
              margin: titleMargin ?? componentTheme.dimens.titleMargin,
            ),
          ],
          Container(
            decoration: BoxDecoration(
              color: componentTheme.colors.background,
              borderRadius: componentTheme.dimens.borderRadius,
              border: componentTheme.colors.border == null
                  ? null
                  : Border.all(
                      color: componentTheme.colors.border!,
                      width: 1,
                      strokeAlign: BorderSide.strokeAlignInside,
                    ),
            ),
            child: ClipRRect(
              borderRadius: componentTheme.dimens.borderRadius,
              child: ImpaktfullUiAutoLayout.vertical(
                children: children.isEmpty
                    ? []
                    : [
                        for (int i = 0; i < children.length; i++) ...[
                          if (i > 0 || showFirstDivider) ...[
                            ImpaktfullUiDivider(
                              margin: separatorMargin ?? componentTheme.dimens.separatorMargin,
                            ),
                          ],
                          children[i],
                        ],
                        if (showLastDivider) ...[
                          ImpaktfullUiDivider(
                            margin: separatorMargin ?? componentTheme.dimens.separatorMargin,
                          ),
                        ]
                      ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}

import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui_2/src/components/clamped_fractionally_sized_box/clamped_fractionally_sized_box.dart';
import 'package:impaktfull_ui_2/src/components/unified_screen_layout/unified_screen_layout_style.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';

export 'unified_screen_layout_style.dart';

part 'unified_screen_layout.describe.dart';

class ImpaktfullUiUnifiedScreenLayout extends StatelessWidget
    with ComponentDescriptorMixin {
  final Widget centerChild;
  final WidgetBuilder? topBuilder;
  final WidgetBuilder? bottomBuilder;
  final Widget? Function(BuildContext)? startBuilder;
  final Widget? Function(BuildContext)? endBuilder;
  final Alignment alignment;
  final ImpaktfullUiUnifiedScreenLayoutTheme? theme;

  const ImpaktfullUiUnifiedScreenLayout({
    required this.centerChild,
    this.topBuilder,
    this.bottomBuilder,
    this.startBuilder,
    this.endBuilder,
    this.alignment = Alignment.center,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuilder<
        ImpaktfullUiUnifiedScreenLayoutTheme>(
      overrideComponentTheme: theme,
      builder: (context, componentTheme) {
        final startWidget = startBuilder?.call(context);
        final endWidget = endBuilder?.call(context);
        return ImpaktfullUiAutoLayout.horizontal(
          children: [
            if (startWidget != null) startWidget,
            Expanded(
              child: Padding(
                padding: componentTheme.dimens.centerPadding
                    .add(MediaQuery.paddingOf(context)),
                child: ImpaktfullUiClampedFractionallySizedBox(
                  widthFactor: componentTheme.dimens.centerWidthFactor,
                  minWidth: componentTheme.dimens.centerMinWidth,
                  maxWidth: componentTheme.dimens.centerMaxWidth,
                  child: ImpaktfullUiAutoLayout.vertical(
                    mainAxisAlignment: _getMainAxisAlignment(alignment),
                    children: [
                      if (topBuilder != null) ...[
                        Expanded(
                          child: topBuilder!(context),
                        ),
                      ],
                      centerChild,
                      if (bottomBuilder != null) ...[
                        Expanded(
                          child: bottomBuilder!(context),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
            if (endWidget != null) endWidget,
          ],
        );
      },
    );
  }

  @override
  String describe(BuildContext context) => _describeInstance(context, this);

  MainAxisAlignment _getMainAxisAlignment(Alignment alignment) {
    if (alignment == Alignment.center) {
      return MainAxisAlignment.center;
    }
    if (alignment.y < 1) {
      return MainAxisAlignment.start;
    }
    return MainAxisAlignment.end;
  }
}

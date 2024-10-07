import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/fluid_padding/fluid_padding_breakpoint.dart';
import 'package:impaktfull_ui_2/src/components/fluid_padding/fluid_padding_style.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';
import 'package:impaktfull_ui_2/src/util/extension/list_extension.dart';

export 'fluid_padding_style.dart';
export 'fluid_padding_breakpoint.dart';

part 'fluid_padding.describe.dart';

class ImpaktfullUiFluidPadding extends StatelessWidget
    with ComponentDescriptorMixin {
  final List<ImpaktfullUiFluidPaddingBreakPoint>? breakPoints;
  final Widget child;
  final ImpaktfullUiFluidPaddingTheme? theme;

  const ImpaktfullUiFluidPadding({
    required this.child,
    this.breakPoints,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiFluidPaddingTheme>(
      overrideComponentTheme: theme,
      builder: (context, theme, componentTheme) {
        final width = MediaQuery.of(context).size.width;
        final breakPoints =
            this.breakPoints ?? componentTheme.dimens.breakPoints;
        final breakPoint = breakPoints
            .firstWhereOrNull((element) => element.matchesWidth(width));
        if (breakPoint == null) return child;
        final padding = breakPoint.getPadding(width);
        if (padding == null) return child;
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: padding),
          child: child,
        );
      },
    );
  }

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}
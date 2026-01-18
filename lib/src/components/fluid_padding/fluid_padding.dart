import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/fluid_padding/fluid_padding_breakpoint.dart';
import 'package:impaktfull_ui/src/components/fluid_padding/fluid_padding_style.dart';
import 'package:impaktfull_ui/src/util/extension/list_extension.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'fluid_padding_style.dart';
export 'fluid_padding_breakpoint.dart';

class ImpaktfullUiFluidPadding extends StatelessWidget {
  final List<ImpaktfullUiFluidPaddingBreakPoint>? breakPoints;
  final double topPadding;
  final double bottomPadding;
  final Widget child;
  final ImpaktfullUiFluidPaddingTheme? theme;

  const ImpaktfullUiFluidPadding({
    required this.child,
    this.topPadding = 0,
    this.bottomPadding = 0,
    this.breakPoints,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      component: this,
      overrideComponentTheme: theme,
      builder: (context, componentTheme) {
        final width = MediaQuery.sizeOf(context).width;
        final breakPoints =
            this.breakPoints ?? componentTheme.dimens.breakPoints;
        final breakPoint = breakPoints
            .firstWhereOrNull((element) => element.matchesWidth(width));
        if (breakPoint == null) return child;
        final padding = breakPoint.getPadding(width);
        if (padding == null) return child;
        return Padding(
          padding: EdgeInsetsDirectional.only(
            start: padding,
            end: padding,
            top: topPadding,
            bottom: bottomPadding,
          ),
          child: child,
        );
      },
    );
  }
}

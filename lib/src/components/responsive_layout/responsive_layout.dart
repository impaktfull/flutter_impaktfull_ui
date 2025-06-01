import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/responsive_layout/responsive_layout_style.dart';
import 'package:impaktfull_ui/src/util/descriptor/component_descriptor_mixin.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'responsive_layout_style.dart';

part 'responsive_layout.describe.dart';

class ImpaktfullUiResponsiveLayout extends StatelessWidget
    with ComponentDescriptorMixin {
  final WidgetBuilder small;
  final WidgetBuilder? medium;
  final WidgetBuilder? large;
  final WidgetBuilder? extraLarge;
  final ImpaktfullUiResponsiveLayoutTheme? theme;

  const ImpaktfullUiResponsiveLayout({
    required this.small,
    this.medium,
    this.large,
    this.extraLarge,
    this.theme,
    super.key,
  });

  static bool isSmallOrSmaller(BuildContext context,
      {ImpaktfullUiResponsiveLayoutTheme? overrideTheme}) {
    final screenSize = MediaQuery.sizeOf(context);
    final componentTheme =
        overrideTheme ?? ImpaktfullUiResponsiveLayoutTheme.of(context);
    return screenSize.width <= componentTheme.dimens.breakpointSmall;
  }

  static bool isMediumOrSmaller(BuildContext context,
      {ImpaktfullUiResponsiveLayoutTheme? overrideTheme}) {
    final screenSize = MediaQuery.sizeOf(context);
    final componentTheme =
        overrideTheme ?? ImpaktfullUiResponsiveLayoutTheme.of(context);
    return screenSize.width <= componentTheme.dimens.breakpointMedium;
  }

  static bool isLargeOrSmaller(BuildContext context,
      {ImpaktfullUiResponsiveLayoutTheme? overrideTheme}) {
    final screenSize = MediaQuery.sizeOf(context);
    final componentTheme =
        overrideTheme ?? ImpaktfullUiResponsiveLayoutTheme.of(context);
    return screenSize.width <= componentTheme.dimens.breakpointLarge;
  }

  static bool isSmallOrBigger(BuildContext context,
      {ImpaktfullUiResponsiveLayoutTheme? overrideTheme}) {
    final screenSize = MediaQuery.sizeOf(context);
    final componentTheme =
        overrideTheme ?? ImpaktfullUiResponsiveLayoutTheme.of(context);
    return screenSize.width <= componentTheme.dimens.breakpointSmall;
  }

  static bool isMediumOrBigger(BuildContext context,
      {ImpaktfullUiResponsiveLayoutTheme? overrideTheme}) {
    final screenSize = MediaQuery.sizeOf(context);
    final componentTheme =
        overrideTheme ?? ImpaktfullUiResponsiveLayoutTheme.of(context);
    return screenSize.width > componentTheme.dimens.breakpointMedium;
  }

  static bool isLargeOrBigger(BuildContext context,
      {ImpaktfullUiResponsiveLayoutTheme? overrideTheme}) {
    final screenSize = MediaQuery.sizeOf(context);
    final componentTheme =
        overrideTheme ?? ImpaktfullUiResponsiveLayoutTheme.of(context);
    return screenSize.width > componentTheme.dimens.breakpointLarge;
  }

  static bool isExtraLargeOrBigger(BuildContext context,
      {ImpaktfullUiResponsiveLayoutTheme? overrideTheme}) {
    final screenSize = MediaQuery.sizeOf(context);
    final componentTheme =
        overrideTheme ?? ImpaktfullUiResponsiveLayoutTheme.of(context);
    return screenSize.width >= componentTheme.dimens.breakpointLarge;
  }

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      component: this,
      overrideComponentTheme: theme,
      builder: (context, componentTheme) {
        final screenSize = MediaQuery.sizeOf(context);
        final screenWidth = screenSize.width;
        if (screenWidth > componentTheme.dimens.breakpointExtraLarge) {
          return extraLarge?.call(context) ??
              large?.call(context) ??
              medium?.call(context) ??
              small(context);
        } else if (screenWidth > componentTheme.dimens.breakpointLarge) {
          return large?.call(context) ??
              medium?.call(context) ??
              small(context);
        } else if (screenWidth > componentTheme.dimens.breakpointMedium) {
          return medium?.call(context) ?? small(context);
        } else {
          return small(context);
        }
      },
    );
  }

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}

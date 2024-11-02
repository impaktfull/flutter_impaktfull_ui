import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/responsive_layout/responsive_layout_style.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';

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

  static bool isSmall(BuildContext context,
      {ImpaktfullUiResponsiveLayoutTheme? overrideTheme}) {
    final screenSize = MediaQuery.sizeOf(context);
    final componentTheme =
        overrideTheme ?? ImpaktfullUiResponsiveLayoutTheme.of(context);
    return screenSize.width < componentTheme.dimens.breakpointSmall;
  }

  static bool isMedium(BuildContext context,
      {ImpaktfullUiResponsiveLayoutTheme? overrideTheme}) {
    final screenSize = MediaQuery.sizeOf(context);
    final componentTheme =
        overrideTheme ?? ImpaktfullUiResponsiveLayoutTheme.of(context);
    return screenSize.width < componentTheme.dimens.breakpointMedium;
  }

  static bool isLarge(BuildContext context,
      {ImpaktfullUiResponsiveLayoutTheme? overrideTheme}) {
    final screenSize = MediaQuery.sizeOf(context);
    final componentTheme =
        overrideTheme ?? ImpaktfullUiResponsiveLayoutTheme.of(context);
    return screenSize.width < componentTheme.dimens.breakpointLarge;
  }

  static bool isExtraLarge(BuildContext context,
      {ImpaktfullUiResponsiveLayoutTheme? overrideTheme}) {
    final screenSize = MediaQuery.sizeOf(context);
    final componentTheme =
        overrideTheme ?? ImpaktfullUiResponsiveLayoutTheme.of(context);
    return screenSize.width > componentTheme.dimens.breakpointLarge;
  }

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiResponsiveLayoutTheme>(
      overrideComponentTheme: theme,
      builder: (context, componentTheme) {
        final screenSize = MediaQuery.sizeOf(context);
        if (screenSize.width < componentTheme.dimens.breakpointSmall) {
          return small(context);
        } else if (screenSize.width < componentTheme.dimens.breakpointMedium) {
          return medium?.call(context) ?? small(context);
        } else if (screenSize.width < componentTheme.dimens.breakpointLarge) {
          return large?.call(context) ??
              medium?.call(context) ??
              small(context);
        } else {
          return extraLarge?.call(context) ??
              large?.call(context) ??
              medium?.call(context) ??
              small(context);
        }
      },
    );
  }

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}

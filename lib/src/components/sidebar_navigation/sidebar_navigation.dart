import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/sidebar_navigation/sidebar_navigation_style.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';

export 'sidebar_navigation_style.dart';

part 'sidebar_navigation.describe.dart';

class ImpaktfullUiSidebarNavigation extends StatelessWidget
    with ComponentDescriptorMixin {
  final ImpaktfullUiSidebarNavigationTheme? theme;

  const ImpaktfullUiSidebarNavigation({
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<
        ImpaktfullUiSidebarNavigationTheme>(
      overrideComponentTheme: theme,
      builder: (context, theme, componentTheme) => Container(),
    );
  }

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}

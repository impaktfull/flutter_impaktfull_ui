import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/tab_bar/tab_bar_style.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';

export 'tab_bar_style.dart';

part 'tab_bar.describe.dart';

class ImpaktfullUiTabBar extends StatelessWidget with ComponentDescriptorMixin {
  final ImpaktfullUiTabBarTheme? theme;

  const ImpaktfullUiTabBar({
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiTabBarTheme>(
      overrideComponentTheme: theme,
      builder: (context, theme, componentTheme) => Container(),
    );
  }

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}

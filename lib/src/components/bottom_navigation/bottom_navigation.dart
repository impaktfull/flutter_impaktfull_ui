import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/bottom_navigation/bottom_navigation_style.dart';
import 'package:impaktfull_ui/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui/src/util/descriptor/component_descriptor_mixin.dart';

export 'bottom_navigation_style.dart';

part 'bottom_navigation.describe.dart';

class ImpaktfullUiBottomNavigation extends StatelessWidget
    with ComponentDescriptorMixin {
  final List<Widget> items;
  final ImpaktfullUiBottomNavigationTheme? theme;

  const ImpaktfullUiBottomNavigation({
    required this.items,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuilder<ImpaktfullUiBottomNavigationTheme>(
      overrideComponentTheme: theme,
      builder: (context, componentTheme) => Container(
        decoration: BoxDecoration(
          color: componentTheme.colors.background,
          boxShadow: [
            if (componentTheme.shadows.background != null)
              ...componentTheme.shadows.background!,
          ],
        ),
        child: SafeArea(
          top: false,
          child: ImpaktfullUiAutoLayout.horizontal(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: items,
          ),
        ),
      ),
    );
  }

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}

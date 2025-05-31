import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/bottom_actions/bottom_actions_style.dart';
import 'package:impaktfull_ui/src/util/descriptor/component_descriptor_mixin.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component.dart';

export 'bottom_actions_style.dart';

part 'bottom_actions.describe.dart';

class ImpaktfullUiBottomActions extends StatelessWidget
    with ComponentDescriptorMixin {
  final List<Widget> children;
  final ImpaktfullUiBottomActionsTheme? theme;
  final bool removeBottomSafeArea;

  const ImpaktfullUiBottomActions({
    required this.children,
    this.theme,
    this.removeBottomSafeArea = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      component: this,
      overrideComponentTheme: theme,
      builder: (context, componentTheme) => MediaQuery.removePadding(
        context: context,
        removeBottom: removeBottomSafeArea,
        child: Builder(
          builder: (context) => Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: componentTheme.colors.background,
              boxShadow: componentTheme.shadows.shadow,
            ),
            padding: componentTheme.dimens.padding
                .add(MediaQuery.paddingOf(context)),
            child: ImpaktfullUiAutoLayout.vertical(
              spacing: componentTheme.dimens.spacing,
              children: children,
            ),
          ),
        ),
      ),
    );
  }

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}

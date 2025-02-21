import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/adaptive_nav_bar/model/adaptive_nav_bar_action.dart';
import 'package:impaktfull_ui/src/components/cms_header/cms_header.dart';
import 'package:impaktfull_ui/src/components/horizontal_tabs/horizontal_tabs.dart';
import 'package:impaktfull_ui/src/components/input_field/input_field.dart';
import 'package:impaktfull_ui/src/components/nav_bar/nav_bar.dart';
import 'package:impaktfull_ui/src/components/responsive_layout/responsive_layout.dart';
import 'package:impaktfull_ui/src/util/descriptor/component_descriptor_mixin.dart';

export 'model/adaptive_nav_bar_action.dart';
export 'model/adaptive_nav_bar_action_type.dart';

part 'adaptive_nav_bar.describe.dart';

class ImpaktfullUiAdaptiveNavBar extends StatelessWidget
    with ComponentDescriptorMixin {
  final String? title;
  final String? badge;
  final String? subtitle;
  final VoidCallback? onBackTapped;
  final VoidCallback? onDrawerTapped;
  final bool isDrawerOpen;
  final Widget? bottomChild;
  final List<ImpaktfullUiAdaptiveNavBarActionItem> actions;

  const ImpaktfullUiAdaptiveNavBar({
    this.title,
    this.badge,
    this.subtitle,
    this.onBackTapped,
    this.onDrawerTapped,
    this.bottomChild,
    this.isDrawerOpen = false,
    this.actions = const [],
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (title == null &&
        subtitle == null &&
        badge == null &&
        onBackTapped == null &&
        bottomChild == null &&
        onDrawerTapped == null &&
        actions.isEmpty) {
      return const SizedBox.shrink();
    }
    return ImpaktfullUiResponsiveLayout(
      small: (context) => ImpaktfullUiNavBar(
        title: title,
        subtitle: subtitle,
        onBackTapped: onBackTapped,
        bottomChild: bottomChild == null
            ? null
            : Builder(
                builder: (context) {
                  if (_shouldAddPadding(bottomChild)) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        bottom: 8,
                      ),
                      child: bottomChild!,
                    );
                  }
                  return bottomChild!;
                },
              ),
        onDrawerTapped: onDrawerTapped,
        isDrawerOpen: isDrawerOpen,
        actions: actions.map((e) => e.small()).toList(),
      ),
      medium: (context) => ImpaktfullUiCmsHeader(
        title: title,
        badge: badge,
        subtitle: subtitle,
        bottomChild: bottomChild,
        onBackTapped: onBackTapped,
        onDrawerTapped: onDrawerTapped,
        isDrawerOpen: isDrawerOpen,
        actions: actions.map((e) => e.medium()).toList(),
      ),
    );
  }

  @override
  String describe(BuildContext context) => _describeInstance(context, this);

  bool _shouldAddPadding(Widget? bottomChild) {
    if (bottomChild == null) return false;
    if (bottomChild is ImpaktfullUiHorizontalTabs) return true;
    if (bottomChild is ImpaktfullUiInputField) return true;
    return false;
  }
}

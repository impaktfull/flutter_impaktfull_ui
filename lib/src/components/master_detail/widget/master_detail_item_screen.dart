import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';

class MasterDetailItemScreen extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final bool keepOriginalMasterTitle;
  final List<ImpaktfullUiAdaptiveNavBarActionItem> actions;
  final Widget? headerBottomChild;
  final Widget child;

  const MasterDetailItemScreen({
    required this.child,
    this.title,
    this.subtitle,
    this.headerBottomChild,
    this.keepOriginalMasterTitle = false,
    this.actions = const [],
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    _overrideMasterScreen(context);
    return child;
  }

  void _overrideMasterScreen(BuildContext context) {
    final masterDetail = ImpaktfullUiMasterDetail.of(context);
    if (context.isMediumScreenOrSmaller) {
      masterDetail.setSubtitle(subtitle);
      masterDetail.setTitle(title);
    } else if (keepOriginalMasterTitle) {
      if (subtitle != null) {
        masterDetail.setSubtitle('$title > $subtitle');
      } else {
        masterDetail.setSubtitle(title);
      }
      masterDetail.setTitle(null);
    } else {
      masterDetail.setSubtitle(subtitle);
      masterDetail.setTitle(title);
    }
    masterDetail.setActions(actions);
    masterDetail.setHeaderBottomChild(headerBottomChild);
  }
}

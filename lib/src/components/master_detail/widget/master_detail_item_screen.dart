import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

class ImpaktfullUiMasterDetailItemScreen extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final bool keepOriginalMasterTitle;
  final List<ImpaktfullUiAdaptiveNavBarActionItem> actions;
  final Widget? headerBottomChild;
  final Widget child;

  const ImpaktfullUiMasterDetailItemScreen({
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
    return FocusScope(
      child: child,
    );
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

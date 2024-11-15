import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';

export 'widget/master_detail_item_screen.dart';

part 'master_detail.describe.dart';

class ImpaktfullUiMasterDetail extends StatefulWidget
    with ComponentDescriptorMixin {
  final String? title;
  final String? subtitle;
  final Widget? headerBottomChild;
  final Widget navigation;
  final Widget? Function(BuildContext context)? detail;
  final Widget? emptyDetail;
  final VoidCallback? onBackTapped;
  final VoidCallback? onCloseDetail;
  final bool closeDetailBeforeMaster;
  final int detailFlex;
  final List<ImpaktfullUiAdaptiveNavBarActionItem> actions;

  const ImpaktfullUiMasterDetail({
    required this.navigation,
    required this.detail,
    this.title,
    this.subtitle,
    this.headerBottomChild,
    this.emptyDetail,
    this.detailFlex = 3,
    this.actions = const [],
    this.onBackTapped,
    this.onCloseDetail,
    this.closeDetailBeforeMaster = false,
    super.key,
  });

  static ImpaktfullUiMasterDetailState of(BuildContext context) {
    final state =
        context.findAncestorStateOfType<ImpaktfullUiMasterDetailState>();
    if (state == null) {
      throw FlutterError('No ImpaktfullUiMasterDetail found in context');
    }
    return state;
  }

  @override
  State<ImpaktfullUiMasterDetail> createState() =>
      ImpaktfullUiMasterDetailState();

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}

class ImpaktfullUiMasterDetailState extends State<ImpaktfullUiMasterDetail> {
  String? _overrideTitle;
  String? _overrideSubtitle;
  List<ImpaktfullUiAdaptiveNavBarActionItem>? _overrideActions;
  Widget? _overrideHeaderBottomChild;

  @override
  void didUpdateWidget(covariant ImpaktfullUiMasterDetail oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.detail == null) {
      _overrideActions = [];
      _overrideTitle = null;
      _overrideSubtitle = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final detail = widget.detail?.call(context);
    return ImpaktfullUiAdaptiveScreen(
      title: _overrideTitle ?? widget.title,
      subtitle: _overrideSubtitle ?? widget.subtitle,
      actions: _overrideActions ?? widget.actions,
      onBackTapped: () => _onBackTapped(context),
      headerBottomChild: _overrideHeaderBottomChild ?? widget.headerBottomChild,
      builder: (context) {
        if (widget.onCloseDetail != null && detail == null) {
          return widget.navigation;
        }
        return detail ?? widget.emptyDetail ?? const SizedBox.shrink();
      },
      mediumBuilder: (context) => ImpaktfullUiAutoLayout.horizontal(
        children: [
          Expanded(
            child: widget.navigation,
          ),
          const ImpaktfullUiDivider(vertical: true),
          Expanded(
            flex: widget.detailFlex,
            child: detail ?? widget.emptyDetail ?? const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  void setTitle(String? title) {
    if (_overrideTitle == title) return;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (!mounted) return;
      setState(() => _overrideTitle = title);
    });
  }

  void setSubtitle(String? subtitle) {
    if (_overrideSubtitle == subtitle) return;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (!mounted) return;
      setState(() => _overrideSubtitle = subtitle);
    });
  }

  void setActions(List<ImpaktfullUiAdaptiveNavBarActionItem>? actions) {
    if (_overrideActions == actions) return;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (!mounted) return;
      setState(() => _overrideActions = actions);
    });
  }

  void setHeaderBottomChild(Widget? headerBottomChild) {
    if (_overrideHeaderBottomChild == headerBottomChild) return;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (!mounted) return;
      setState(() => _overrideHeaderBottomChild = headerBottomChild);
    });
  }

  void _onBackTapped(BuildContext context) {
    if ((context.isMediumScreenOrSmaller || widget.closeDetailBeforeMaster) &&
        widget.detail != null) {
      widget.onCloseDetail?.call();
      return;
    }
    return widget.onBackTapped?.call();
  }
}

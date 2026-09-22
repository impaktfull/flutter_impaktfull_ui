import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

export 'master_detail.localizations.dart';
export 'widget/master_detail_item_screen.dart';

class ImpaktfullUiMasterDetail extends StatefulWidget {
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

  /// The texts of the master detail. Defaults to the localizations of the
  /// app.
  final ImpaktfullUiMasterDetailLocalizations? localizations;

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
    this.localizations,
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
}

class ImpaktfullUiMasterDetailState extends State<ImpaktfullUiMasterDetail> {
  String? _overrideTitle;
  String? _overrideSubtitle;
  List<ImpaktfullUiAdaptiveNavBarActionItem>? _overrideActions;
  Widget? _overrideHeaderBottomChild;

  /// Rebuilds only the header when an override changes. Rebuilding the whole
  /// state would build the detail again, which calls the setters again (with
  /// new list/widget instances) and would never stop rebuilding.
  final _overridesNotifier = _ImpaktfullUiMasterDetailOverridesNotifier();
  var _isOverrideNotificationScheduled = false;

  @override
  void didUpdateWidget(covariant ImpaktfullUiMasterDetail oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.detail == null) {
      _clearOverrides();
    }
  }

  @override
  void dispose() {
    _overridesNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final detail = widget.detail?.call(context);
    if (detail == null) {
      // The detail is closed (also when it is closed without the back
      // button): the header shows the master again.
      _clearOverrides();
    }
    final onBackTappedEnabled = _onBackTappedEnabled(context, detail);
    return ListenableBuilder(
      listenable: _overridesNotifier,
      builder: (context, _) => ImpaktfullUiAdaptiveScreen(
        title: _overrideTitle ?? widget.title,
        subtitle: _overrideSubtitle ?? widget.subtitle,
        actions: _overrideActions ?? widget.actions,
        onBackTapped: onBackTappedEnabled ? () => _onBackTapped(context) : null,
        headerBottomChild:
            _overrideHeaderBottomChild ?? widget.headerBottomChild,
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
      ),
    );
  }

  void setTitle(String? title) {
    if (_overrideTitle == title) return;
    _overrideTitle = title;
    _notifyOverridesChanged();
  }

  void setSubtitle(String? subtitle) {
    if (_overrideSubtitle == subtitle) return;
    _overrideSubtitle = subtitle;
    _notifyOverridesChanged();
  }

  void setActions(List<ImpaktfullUiAdaptiveNavBarActionItem>? actions) {
    if (_overrideActions == actions) return;
    _overrideActions = actions;
    _notifyOverridesChanged();
  }

  void setHeaderBottomChild(Widget? headerBottomChild) {
    if (_overrideHeaderBottomChild == headerBottomChild) return;
    _overrideHeaderBottomChild = headerBottomChild;
    _notifyOverridesChanged();
  }

  void _notifyOverridesChanged() {
    final phase = SchedulerBinding.instance.schedulerPhase;
    final isBuilding = phase == SchedulerPhase.persistentCallbacks ||
        phase == SchedulerPhase.midFrameMicrotasks;
    if (!isBuilding) {
      if (mounted) _overridesNotifier.notify();
      return;
    }
    // The setters are called while the detail builds: the header can only be
    // rebuilt once this frame is done.
    if (_isOverrideNotificationScheduled) return;
    _isOverrideNotificationScheduled = true;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _isOverrideNotificationScheduled = false;
      if (!mounted) return;
      _overridesNotifier.notify();
    });
  }

  bool _onBackTappedEnabled(BuildContext context, Widget? detail) {
    if (_closesDetailOnBack(context, detail)) return true;
    return widget.onBackTapped != null;
  }

  /// Whether back closes the detail: only when a detail is open, on smaller
  /// screens (where the detail replaces the navigation) or when
  /// [ImpaktfullUiMasterDetail.closeDetailBeforeMaster] is enabled.
  bool _closesDetailOnBack(BuildContext context, Widget? detail) {
    if (widget.onCloseDetail == null || detail == null) return false;
    return ImpaktfullUiResponsiveLayout.isMediumOrSmaller(context) ||
        widget.closeDetailBeforeMaster;
  }

  void _onBackTapped(BuildContext context) {
    final detail = widget.detail?.call(context);
    if (_closesDetailOnBack(context, detail)) {
      widget.onCloseDetail?.call();
      _clearOverrides();
      _notifyOverridesChanged();
      return;
    }
    widget.onBackTapped?.call();
  }

  void _clearOverrides() {
    _overrideActions = null;
    _overrideTitle = null;
    _overrideSubtitle = null;
    _overrideHeaderBottomChild = null;
  }
}

class _ImpaktfullUiMasterDetailOverridesNotifier extends ChangeNotifier {
  void notify() => notifyListeners();
}

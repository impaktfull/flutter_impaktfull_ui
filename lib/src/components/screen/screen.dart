import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/nav_bar/nav_bar.dart';
import 'package:impaktfull_ui/src/components/screen/screen.style.dart';
import 'package:impaktfull_ui/src/components/status_bar/status_bar.dart';
import 'package:impaktfull_ui/src/util/descriptor/component_descriptor_mixin.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'screen.style.dart';

part 'screen.describe.dart';

class ImpaktfullUiScreen extends StatefulWidget with ComponentDescriptorMixin {
  final String? title;
  final String? subtitle;
  final VoidCallback? onBackTapped;
  final bool centerTitle;
  final bool isFullScreen;
  final bool canPop;
  final VoidCallback? onPopInvoked;
  final Widget? drawer;
  final bool isDrawerEnabled;
  final Widget child;
  final List<Widget> actions;
  final Alignment fabAlignment;
  final Widget? fab;
  final Widget? bottomNavBarChild;
  final Widget? bottomChild;
  final ImpaktfullUiScreenTheme? theme;

  const ImpaktfullUiScreen({
    required this.child,
    this.title,
    this.subtitle,
    this.drawer,
    this.isDrawerEnabled = false,
    this.onBackTapped,
    this.centerTitle = false,
    this.isFullScreen = false,
    this.canPop = true,
    this.onPopInvoked,
    this.actions = const [],
    this.fabAlignment = Alignment.bottomRight,
    this.fab,
    this.bottomNavBarChild,
    this.bottomChild,
    this.theme,
    super.key,
  });

  static ImpaktfullUiScreenState of(BuildContext context) {
    final ImpaktfullUiScreenState? result =
        context.findAncestorStateOfType<ImpaktfullUiScreenState>();
    assert(result != null,
        'No ImpaktfullUImpaktfullUiScreenStateiScreen found in context');
    return result!;
  }

  @override
  State<ImpaktfullUiScreen> createState() => ImpaktfullUiScreenState();

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}

class ImpaktfullUiScreenState extends State<ImpaktfullUiScreen> {
  final _scaffoldState = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      component: widget,
      overrideComponentTheme: widget.theme,
      builder: (context, componentTheme) {
        final hasNavbar = widget.onBackTapped != null ||
            widget.title != null ||
            widget.subtitle != null ||
            widget.actions.isNotEmpty ||
            widget.bottomNavBarChild != null;
        final hasBottomChild = widget.bottomChild != null;
        return PopScope(
          onPopInvokedWithResult: (didPop, result) =>
              widget.onPopInvoked?.call(),
          canPop: widget.canPop,
          child: ClipRect(
            child: GestureDetector(
              excludeFromSemantics: true,
              onTap: () => FocusScope.of(context).unfocus(),
              child: ImpaktfullUiStatusBar.onBackgroundColor(
                backgroundColor: hasNavbar
                    ? ImpaktfullUiNavBarTheme.of(context).colors.background
                    : componentTheme.colors.background,
                child: Scaffold(
                  key: _scaffoldState,
                  backgroundColor: componentTheme.colors.background,
                  drawer: widget.drawer == null
                      ? null
                      : ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.sizeOf(context).width - 64,
                          ),
                          child: widget.drawer,
                        ),
                  body: ImpaktfullUiAutoLayout.vertical(
                    children: [
                      if (hasNavbar) ...[
                        ImpaktfullUiNavBar(
                          onBackTapped: widget.drawer == null
                              ? widget.onBackTapped
                              : null,
                          onDrawerTapped:
                              widget.drawer == null && !widget.isDrawerEnabled
                                  ? null
                                  : openDrawer,
                          isDrawerOpen: _isDrawerOpen(context),
                          centerTitle: widget.centerTitle,
                          isFullScreen: widget.isFullScreen,
                          title: widget.title,
                          subtitle: widget.subtitle,
                          actions: widget.actions,
                          bottomChild: widget.bottomNavBarChild,
                        ),
                      ],
                      Expanded(
                        child: SizedBox(
                          width: double.infinity,
                          child: MediaQuery.removePadding(
                            context: context,
                            removeTop: hasNavbar,
                            removeBottom: hasBottomChild,
                            child: Builder(
                              builder: (context) => Stack(
                                alignment: widget.fabAlignment,
                                children: [
                                  Positioned.fill(
                                    child: SizedBox(
                                      child: widget.child,
                                    ),
                                  ),
                                  if (widget.fab != null) ...[
                                    Padding(
                                      padding: const EdgeInsets.all(16)
                                          .add(MediaQuery.paddingOf(context)),
                                      child: widget.fab!,
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      if (widget.bottomChild != null) ...[
                        MediaQuery.removePadding(
                          context: context,
                          removeTop: hasNavbar,
                          child: widget.bottomChild!,
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  bool get isDrawerOpen {
    final state = _scaffoldState.currentState;
    if (state == null) return false;
    return state.isDrawerOpen;
  }

  bool get isDrawerClosed {
    final state = _scaffoldState.currentState;
    if (state == null) return true;
    return !state.isDrawerOpen;
  }

  void openDrawer() => _getScaffoldState()?.openDrawer();

  void closeDrawer() => _getScaffoldState()?.closeDrawer();

  ScaffoldState? _getScaffoldState() {
    if (_scaffoldState.currentState?.widget.drawer != null) {
      return _scaffoldState.currentState;
    }
    final context = _scaffoldState.currentContext;
    if (context == null) return null;
    final state = _findDrawer(context);
    if (state == null) return null;
    return state._getScaffoldState();
  }

  ImpaktfullUiScreenState? _findDrawer(BuildContext context) {
    final state = context.findAncestorStateOfType<ImpaktfullUiScreenState>();
    if (state == null) return null;
    if (state.widget.drawer == null) {
      final parentContext =
          context.findAncestorStateOfType<ImpaktfullUiScreenState>()?.context;
      if (parentContext == null) return null;
      return _findDrawer(parentContext);
    }
    return state;
  }

  bool _isDrawerOpen(BuildContext context) {
    var isDrawerOpen = _scaffoldState.currentState?.isDrawerOpen;
    isDrawerOpen ??= Scaffold.maybeOf(context)?.isDrawerOpen;
    return isDrawerOpen ?? false;
  }
}

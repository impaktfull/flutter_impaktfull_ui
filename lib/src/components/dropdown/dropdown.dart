import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:impaktfull_ui/src/components/button/button.dart';
import 'package:impaktfull_ui/src/components/dropdown/widget/dropdown_overlay.dart';
import 'package:impaktfull_ui/src/components/dropdown/dropdown_style.dart';
import 'package:impaktfull_ui/src/components/list_view/list_view.dart';
import 'package:impaktfull_ui/src/util/animation/animation_util.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'dropdown_style.dart';

/// The edge of the button the dropdown is aligned to.
///
/// Left and right follow the reading direction: in a right-to-left layout
/// (e.g. Arabic or Hebrew) [bottomLeft] aligns the dropdown to the right edge
/// of the button, the start of the reading direction.
enum ImpaktfullUiDropdownAlignment {
  bottomCenter(AlignmentDirectional.bottomCenter),
  bottomLeft(AlignmentDirectional.bottomStart),
  bottomRight(AlignmentDirectional.bottomEnd);

  final AlignmentDirectional _alignment;

  const ImpaktfullUiDropdownAlignment(this._alignment);
}

class ImpaktfullUiDropdownItem<T> {
  final String title;
  final T value;

  const ImpaktfullUiDropdownItem({
    // `title` becomes `required` again in 1.0.0, when `label` is removed.
    String? title,
    @Deprecated('Use title instead. Will be removed in 1.0.0.') String? label,
    required this.value,
  })  : assert(title != null || label != null, 'title is required'),
        title = (title ?? label) as String;

  @Deprecated('Use title instead. Will be removed in 1.0.0.')
  String get label => title;
}

class ImpaktfullUiDropdown<T> extends StatefulWidget {
  final double? childWidth;
  final double? height;
  final Widget? child;
  final WidgetBuilder? button;
  final String? buttonTitle;
  final List<ImpaktfullUiDropdownItem<T>>? items;
  final Widget Function(
    BuildContext context,
    ImpaktfullUiDropdownItem<T> item,
    int index,
    ImpaktfullUiDropdownController controller,
  )? itemBuilder;
  final String? noDataLabel;
  final bool fullWidth;
  final ImpaktfullUiDropdownAlignment alignment;
  final ImpaktfullUiDropdownTheme? theme;
  final ImpaktfullUiDropdownController? controller;

  const ImpaktfullUiDropdown({
    required Widget this.child,
    this.controller,
    this.button,
    String? buttonTitle,
    @Deprecated('Use buttonTitle instead. Will be removed in 1.0.0.')
    String? buttonText,
    this.childWidth,
    this.alignment = ImpaktfullUiDropdownAlignment.bottomCenter,
    this.height = 300,
    this.fullWidth = false,
    this.theme,
    super.key,
  })  : items = null,
        itemBuilder = null,
        noDataLabel = null,
        buttonTitle = buttonTitle ?? buttonText,
        assert(button != null || buttonTitle != null || buttonText != null,
            'Either button or buttonTitle must be provided');

  const ImpaktfullUiDropdown.builder({
    required List<ImpaktfullUiDropdownItem<T>> this.items,
    required this.itemBuilder,
    required String this.noDataLabel,
    this.controller,
    this.button,
    String? buttonTitle,
    @Deprecated('Use buttonTitle instead. Will be removed in 1.0.0.')
    String? buttonText,
    this.childWidth,
    this.alignment = ImpaktfullUiDropdownAlignment.bottomCenter,
    this.height = 300,
    this.fullWidth = false,
    this.theme,
    super.key,
  })  : child = null,
        buttonTitle = buttonTitle ?? buttonText,
        assert(button != null || buttonTitle != null || buttonText != null,
            'Either button or buttonTitle must be provided');

  @Deprecated('Use buttonTitle instead. Will be removed in 1.0.0.')
  String? get buttonText => buttonTitle;

  @override
  @override
  State<ImpaktfullUiDropdown<T>> createState() =>
      _ImpaktfullUiDropdownState<T>();
}

class _ImpaktfullUiDropdownState<T> extends State<ImpaktfullUiDropdown<T>>
    with SingleTickerProviderStateMixin
    implements ImpaktfullUiDropdownControllerListener {
  late ImpaktfullUiDropdownController _controller;

  final _link = LayerLink();
  final OverlayPortalController _tooltipController = OverlayPortalController();
  late AnimationController _animationController;
  late Animation<double> _curvedAnimation;
  double? _buttonWidth;
  var _isButtonWidthSyncScheduled = false;
  final _overlayFocusNode = FocusNode(debugLabel: 'ImpaktfullUiDropdown');
  FocusNode? _focusBeforeOpen;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? ImpaktfullUiDropdownController();
    _controller._listener = this;
    // The durations come from the theme in `didChangeDependencies`, which
    // runs before the first build.
    _animationController = AnimationController(vsync: this);
    _curvedAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
      reverseCurve: Curves.easeIn,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final componentTheme =
        widget.theme ?? ImpaktfullUiDropdownTheme.of(context);
    final duration = ImpaktfullUiAnimationUtil.duration(
        context, componentTheme.durations.overlay);
    _animationController.duration = duration;
    _animationController.reverseDuration = duration;
  }

  @override
  void didUpdateWidget(covariant ImpaktfullUiDropdown<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller == widget.controller) return;
    if (_controller._listener == this) {
      _controller._listener = null;
    }
    _controller = widget.controller ?? ImpaktfullUiDropdownController();
    _controller._listener = this;
  }

  @override
  void dispose() {
    if (_controller._listener == this) {
      _controller._listener = null;
    }
    // The overlay is removed together with the OverlayPortal, so there is
    // nothing to animate anymore.
    _animationController.dispose();
    _overlayFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = widget.childWidth ?? _buttonWidth ?? 0;
    final targetAnchor =
        widget.alignment._alignment.resolve(Directionality.of(context));
    return ImpaktfullUiOverridableComponentBuilder(
      component: widget,
      overrideComponentTheme: widget.theme,
      builder: (context, componentTheme) => PopScope(
        onPopInvokedWithResult: (didPop, result) => _tooltipController.hide(),
        child: CompositedTransformTarget(
          link: _link,
          child: OverlayPortal(
            controller: _tooltipController,
            overlayChildBuilder: (BuildContext context) => GestureDetector(
              onTap: _hide,
              // Screen readers dismiss the dropdown with the dismiss action
              // of the overlay (and the escape key closes it).
              excludeFromSemantics: true,
              child: ColoredBox(
                color: Colors.transparent,
                child: CompositedTransformFollower(
                  link: _link,
                  targetAnchor: targetAnchor,
                  offset: _getTranslateOffset(targetAnchor, width),
                  child: FadeTransition(
                    opacity: _curvedAnimation,
                    child: Align(
                      // rtl-ignore: the follower is positioned in physical
                      // coordinates, the target anchor is already resolved.
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: componentTheme.dimens.spacing,
                        ),
                        child: _buildOverlaySemantics(
                          ImpaktfullUiDropdownOverlay(
                            width: width,
                            height: widget.height,
                            theme: componentTheme,
                            borderRadius: componentTheme.dimens.borderRadius,
                            child: Builder(
                              builder: (context) {
                                if (widget.child != null) return widget.child!;
                                return ImpaktfullUiListView<
                                    ImpaktfullUiDropdownItem<T>>.builder(
                                  items: widget.items!,
                                  itemBuilder: (context, item, index) =>
                                      widget.itemBuilder!(
                                          context, item, index, _controller),
                                  placeholderData:
                                      ImpaktfullUiListViewPlaceholderData(
                                    title: widget.noDataLabel!,
                                  ),
                                  shrinkWrap: true,
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                _scheduleButtonWidthSync();
                // The button announces whether the dropdown is open.
                return MergeSemantics(
                  child: Semantics(
                    expanded: _tooltipController.isShowing,
                    child: Builder(builder: (context) {
                      if (widget.button != null) return widget.button!(context);
                      return ImpaktfullUiButton(
                        onTap: _onTapButton,
                        type: ImpaktfullUiButtonType.secondaryGrey,
                        fullWidth: widget.fullWidth,
                        trailingAsset: _tooltipController.isShowing
                            ? componentTheme.assets.dropUp
                            : componentTheme.assets.dropDown,
                        title: widget.buttonTitle,
                      );
                    }),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  /// The overlay is a dismissible group for screen readers. It takes the
  /// keyboard focus when it opens: the arrow keys and tab move through the
  /// items, escape closes it and gives the focus back to the button.
  Widget _buildOverlaySemantics(Widget child) {
    return Semantics(
      container: true,
      explicitChildNodes: true,
      onDismiss: _hide,
      child: Shortcuts(
        shortcuts: const <ShortcutActivator, Intent>{
          SingleActivator(LogicalKeyboardKey.escape): DismissIntent(),
          SingleActivator(LogicalKeyboardKey.arrowDown): NextFocusIntent(),
          SingleActivator(LogicalKeyboardKey.arrowUp): PreviousFocusIntent(),
        },
        child: Actions(
          actions: <Type, Action<Intent>>{
            DismissIntent: CallbackAction<DismissIntent>(
              onInvoke: (_) => _hide(),
            ),
          },
          child: FocusTraversalGroup(
            child: Focus(
              focusNode: _overlayFocusNode,
              skipTraversal: true,
              child: child,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _hide() async {
    if (!_tooltipController.isShowing) return;
    await _animationController.reverse();
    if (!mounted) return;
    // The dropdown could have been reopened while the reverse animation ran.
    if (_animationController.status != AnimationStatus.dismissed) return;
    _restoreFocus();
    _tooltipController.hide();
    setState(() {});
  }

  Future<void> _open() async {
    if (!mounted) return;
    _setButtonWidth(context.size!.width);
    // Show the overlay first so the fade in animation is visible.
    _tooltipController.show();
    setState(() {});
    _moveFocusToOverlay();
    await _animationController.forward();
  }

  /// Keyboard users continue in the dropdown after opening it.
  void _moveFocusToOverlay() {
    _focusBeforeOpen = FocusManager.instance.primaryFocus;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || !_tooltipController.isShowing) return;
      _overlayFocusNode.requestFocus();
    });
  }

  /// Gives the focus back to the element that had it before the dropdown
  /// opened (the button), when the focus is still in the dropdown.
  void _restoreFocus() {
    final focusBeforeOpen = _focusBeforeOpen;
    _focusBeforeOpen = null;
    final isFocusInOverlay = _overlayFocusNode.hasFocus;
    if (!isFocusInOverlay) return;
    if (focusBeforeOpen != null && focusBeforeOpen.context != null) {
      focusBeforeOpen.requestFocus();
    } else {
      _overlayFocusNode.unfocus();
    }
  }

  Future<void> _onTapButton() async {
    if (_tooltipController.isShowing &&
        _animationController.status != AnimationStatus.reverse) {
      await _hide();
    } else {
      await _open();
    }
  }

  /// Moves the dropdown so it ends at the right edge of the button when it is
  /// anchored there, or centers it below the button.
  Offset _getTranslateOffset(Alignment targetAnchor, double width) {
    if (targetAnchor.x == 1) return Offset(-width, 0);
    if (targetAnchor.x == 0) return Offset(-(width / 2), 0);
    return Offset.zero;
  }

  void _setButtonWidth(double width) {
    setState(() => _buttonWidth = width);
  }

  void _scheduleButtonWidthSync() {
    if (_isButtonWidthSyncScheduled) return;
    _isButtonWidthSyncScheduled = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _isButtonWidthSyncScheduled = false;
      if (!mounted) return;
      final renderObject = context.findRenderObject();
      if (renderObject is! RenderBox || !renderObject.hasSize) return;
      final width = renderObject.size.width;
      if (width == _buttonWidth) return;
      _setButtonWidth(width);
    });
  }

  @override
  bool get isOpen => _tooltipController.isShowing;

  @override
  Future<void> closeDropdown() async => _hide();

  @override
  Future<void> openDropdown() async => _open();
}

class ImpaktfullUiDropdownController {
  ImpaktfullUiDropdownControllerListener? _listener;
  bool get isOpen => _listener?.isOpen ?? false;
  Future<void> close() async => _listener?.closeDropdown();

  Future<void> open() async => _listener?.openDropdown();
}

abstract class ImpaktfullUiDropdownControllerListener {
  bool get isOpen;

  Future<void> closeDropdown();

  Future<void> openDropdown();
}

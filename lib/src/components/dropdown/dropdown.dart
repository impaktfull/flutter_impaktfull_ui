import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/button/button.dart';
import 'package:impaktfull_ui/src/components/dropdown/widget/dropdown_overlay.dart';
import 'package:impaktfull_ui/src/components/dropdown/dropdown_style.dart';
import 'package:impaktfull_ui/src/components/list_view/list_view.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'dropdown_style.dart';

enum ImpaktfullUiDropdownAlignment {
  bottomCenter(Alignment.bottomCenter),
  bottomLeft(Alignment.bottomLeft),
  bottomRight(Alignment.bottomRight);

  final Alignment _alignment;

  const ImpaktfullUiDropdownAlignment(this._alignment);
}

class ImpaktfullUiDropdownItem<T> {
  final String label;
  final T value;

  const ImpaktfullUiDropdownItem({
    required this.label,
    required this.value,
  });
}

class ImpaktfullUiDropdown<T> extends StatefulWidget {
  final double? childWidth;
  final double? height;
  final Widget? child;
  final WidgetBuilder? button;
  final String? buttonText;
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
    this.buttonText,
    this.childWidth,
    this.alignment = ImpaktfullUiDropdownAlignment.bottomCenter,
    this.height = 300,
    this.fullWidth = false,
    this.theme,
    super.key,
  })  : items = null,
        itemBuilder = null,
        noDataLabel = null,
        assert(button != null || buttonText != null,
            'Either button or buttonText must be provided');

  const ImpaktfullUiDropdown.builder({
    required List<ImpaktfullUiDropdownItem<T>> this.items,
    required this.itemBuilder,
    required String this.noDataLabel,
    this.controller,
    this.button,
    this.buttonText,
    this.childWidth,
    this.alignment = ImpaktfullUiDropdownAlignment.bottomCenter,
    this.height = 300,
    this.fullWidth = false,
    this.theme,
    super.key,
  })  : child = null,
        assert(button != null || buttonText != null,
            'Either button or buttonText must be provided');

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

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? ImpaktfullUiDropdownController();
    _controller._listener = this;
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      reverseDuration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _curvedAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
      reverseCurve: Curves.easeIn,
    );
  }

  @override
  void dispose() {
    if (_controller._listener == this) {
      _controller._listener = null;
    }
    // The overlay is removed together with the OverlayPortal, so there is
    // nothing to animate anymore.
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = widget.childWidth ?? _buttonWidth ?? 0;
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
              child: ColoredBox(
                color: Colors.transparent,
                child: CompositedTransformFollower(
                  link: _link,
                  targetAnchor: widget.alignment._alignment,
                  offset: _getTranslateOffset(width),
                  child: FadeTransition(
                    opacity: _curvedAnimation,
                    child: Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: ImpaktfullUiDropdownOverlay(
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
            child: LayoutBuilder(
              builder: (context, constraints) {
                _scheduleButtonWidthSync();
                if (widget.button != null) return widget.button!(context);
                return ImpaktfullUiButton(
                  onTap: _onTapButton,
                  type: ImpaktfullUiButtonType.secondaryGrey,
                  fullWidth: widget.fullWidth,
                  trailingAsset: _tooltipController.isShowing
                      ? componentTheme.assets.dropUp
                      : componentTheme.assets.dropDown,
                  title: widget.buttonText,
                );
              },
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
    _tooltipController.hide();
    setState(() {});
  }

  Future<void> _open() async {
    if (!mounted) return;
    _setButtonWidth(context.size!.width);
    // Show the overlay first so the fade in animation is visible.
    _tooltipController.show();
    setState(() {});
    await _animationController.forward();
  }

  Future<void> _onTapButton() async {
    if (_tooltipController.isShowing &&
        _animationController.status != AnimationStatus.reverse) {
      await _hide();
    } else {
      await _open();
    }
  }

  Offset _getTranslateOffset(double width) {
    switch (widget.alignment) {
      case ImpaktfullUiDropdownAlignment.bottomRight:
        return Offset(-width, 0);
      case ImpaktfullUiDropdownAlignment.bottomCenter:
        return Offset(-(width / 2), 0);
      default:
        return const Offset(0, 0);
    }
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

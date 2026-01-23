import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/button/button.dart';
import 'package:impaktfull_ui/src/components/dropdown/widget/dropdown_overlay.dart';
import 'package:impaktfull_ui/src/components/dropdown/dropdown_style.dart';
import 'package:impaktfull_ui/src/components/list_view/list_view.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'dropdown_style.dart';

enum ImpaktfullUiAlignment {
  bottomCenter(Alignment.bottomCenter),
  bottomLeft(Alignment.bottomLeft),
  bottomRight(Alignment.bottomRight);

  final Alignment _alignment;

  const ImpaktfullUiAlignment(this._alignment);
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
  final ImpaktfullUiAlignment alignment;
  final ImpaktfullUiDropdownTheme? theme;
  final ImpaktfullUiDropdownController? controller;

  const ImpaktfullUiDropdown({
    required Widget this.child,
    this.controller,
    this.button,
    this.buttonText,
    this.childWidth,
    this.alignment = ImpaktfullUiAlignment.bottomCenter,
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
    this.alignment = ImpaktfullUiAlignment.bottomCenter,
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
  static OverlayPortalController? _globalToolTipController;

  late ImpaktfullUiDropdownController _controller;

  final _link = LayerLink();
  final OverlayPortalController _tooltipController = OverlayPortalController();
  late AnimationController _animationController;
  late Animation<double> _curvedAnimation;
  double? _buttonWidth;

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
    _controller._listener = null;
    _animationController.dispose();
    _hide();
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
                _updateButtonWidth(constraints.maxWidth);
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
    if (_globalToolTipController == null) return;
    if (_globalToolTipController != _tooltipController) return;
    await _animationController.reverse();
    _globalToolTipController?.hide();
    _globalToolTipController = null;
    if (!mounted) return;
    setState(() {});
  }

  Future<void> _open() async {
    _setButtonWidth(context.size!.width);
    await _animationController.forward();
    _globalToolTipController = _tooltipController;
    _globalToolTipController?.show();
    setState(() {});
  }

  Future<void> _onTapButton() async {
    _setButtonWidth(context.size!.width);
    if (_globalToolTipController == _tooltipController) {
      await _animationController.reverse();
      _globalToolTipController?.hide();
      _globalToolTipController = null;
      setState(() {});
    } else {
      await _open();
    }
  }

  Offset _getTranslateOffset(double width) {
    switch (widget.alignment) {
      case ImpaktfullUiAlignment.bottomRight:
        return Offset(-width, 0);
      case ImpaktfullUiAlignment.bottomCenter:
        return Offset(-(width / 2), 0);
      default:
        return const Offset(0, 0);
    }
  }

  void _setButtonWidth(double width) {
    setState(() => _buttonWidth = width);
  }

  void _updateButtonWidth(double width) {
    WidgetsBinding.instance.addPostFrameCallback((context) {
      if (mounted) return;
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

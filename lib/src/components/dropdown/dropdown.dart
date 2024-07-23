import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/button/button.dart';
import 'package:impaktfull_ui_2/src/components/dropdown/dropdown_menu.dart';
import 'package:impaktfull_ui_2/src/components/dropdown/dropdown_style.dart';
import 'package:impaktfull_ui_2/src/components/list_view/list_view.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';

export 'dropdown_style.dart';
part 'dropdown.describe.dart';

enum ImpaktfullUiAlignment {
  bottomCenter(Alignment.bottomCenter),
  bottomLeft(Alignment.bottomLeft),
  bottomRight(Alignment.bottomRight);

  final Alignment _alignment;

  const ImpaktfullUiAlignment(this._alignment);
}

class ImpaktfullUiDropdown<T> extends StatefulWidget with ComponentDescriptorMixin {
  final double? childWidth;
  final double? height;
  final Widget? child;
  final Widget? button;
  final List<T>? items;
  final Widget Function(BuildContext context, T item, int index)? itemBuilder;
  final String? noDataLabel;
  final ImpaktfullUiAlignment alignment;
  final ImpaktfullUiDropdownTheme? theme;

  const ImpaktfullUiDropdown({
    required Widget this.child,
    this.button,
    this.childWidth,
    this.alignment = ImpaktfullUiAlignment.bottomLeft,
    this.height = 300,
    this.theme,
    super.key,
  })  : items = null,
        itemBuilder = null,
        noDataLabel = null;

  const ImpaktfullUiDropdown.builder({
    required List<T> this.items,
    required Widget Function(BuildContext context, T item, int index) this.itemBuilder,
    required this.noDataLabel,
    this.button,
    this.childWidth,
    this.alignment = ImpaktfullUiAlignment.bottomLeft,
    this.height = 300,
    this.theme,
    super.key,
  }) : child = null;

  @override
  String describe() => _describeInstance(this);

  @override
  State<ImpaktfullUiDropdown> createState() => _ImpaktfullUiDropdownState();
}

class _ImpaktfullUiDropdownState extends State<ImpaktfullUiDropdown> with SingleTickerProviderStateMixin {
  static OverlayPortalController? _globalToolTipController;

  final _link = LayerLink();
  final OverlayPortalController _tooltipController = OverlayPortalController();
  late AnimationController _animationController;
  late Animation<double> _curvedAnimation;
  double? _buttonWidth;
  @override
  void initState() {
    super.initState();
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
    _animationController.dispose();
    _hide();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = widget.childWidth ?? _buttonWidth ?? 0;
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiDropdownTheme>(
      overrideComponentTheme: widget.theme,
      builder: (context, theme, componentTheme) => PopScope(
        onPopInvoked: (didPop) => _tooltipController.hide(),
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
                        child: ImpaktfullUiDropdownMenu(
                          width: width,
                          height: widget.height,
                          theme: componentTheme,
                          child: Builder(
                            builder: (context) {
                              if (widget.child != null) return widget.child!;
                              return ImpaktfullUiListView.builder(
                                items: widget.items!,
                                itemBuilder: widget.itemBuilder!,
                                noDataLabel: widget.noDataLabel!,
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
                if (widget.button != null) return widget.button!;
                return ImpaktfullUiButton(
                  onTap: _onTapButton,
                  type: ImpaktfullUiButtonType.secondaryGrey,
                  trailingIcon: _tooltipController.isShowing ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                  title: 'Button Text',
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

  Future<void> _onTapButton() async {
    _setButtonWidth(context.size!.width);
    if (_globalToolTipController == _tooltipController) {
      await _animationController.reverse();
      _globalToolTipController?.hide();
      _globalToolTipController = null;
    } else {
      _animationController.forward();
      _globalToolTipController = _tooltipController;
      _globalToolTipController?.show();
    }
    setState(() {});
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
}

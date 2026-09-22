import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui/src/components/auto_complete/widget/auto_complete_overlay.dart';

export 'auto_complete_style.dart';
export 'controller/auto_complete_controller.dart';
export 'controller/auto_complete_controller_listener.dart';

class ImpaktfullUiAutoComplete<T> extends StatefulWidget {
  final ImpaktfullUiAutoCompleteController? controller;
  final Widget? Function()? leadingBuilder;
  final List<Widget> Function()? topBuilder;
  final FutureOr<List<T>> Function(String searchQuery) onSearchChanged;
  final Widget Function(
    BuildContext context,
    T item,
    int index,
    ImpaktfullUiAutoCompleteController controller,
  ) itemBuilder;
  final String noDataLabel;
  final String? placeholder;

  /// Called when an item is selected with the keyboard: highlight it with the
  /// arrow keys and press enter. Use the controller to close the overlay or
  /// clear the text, like in the `onTap` of the item of [itemBuilder].
  final void Function(T item, ImpaktfullUiAutoCompleteController controller)?
      onItemSelected;
  @Deprecated(
      'Has no effect: the overlay is always shown below (or above) the input field. Will be removed in 1.0.0.')
  final bool replaceWithOverlay;
  final Duration debounceDuration;
  final ImpaktfullUiAutoCompleteTheme? theme;

  const ImpaktfullUiAutoComplete({
    required this.onSearchChanged,
    required this.itemBuilder,
    required this.noDataLabel,
    this.leadingBuilder,
    this.topBuilder,
    this.placeholder,
    this.controller,
    this.onItemSelected,
    @Deprecated(
        'Has no effect: the overlay is always shown below (or above) the input field. Will be removed in 1.0.0.')
    this.replaceWithOverlay = false,
    this.debounceDuration = const Duration(milliseconds: 300),
    this.theme,
    super.key,
  });

  @override
  State<ImpaktfullUiAutoComplete<T>> createState() =>
      _ImpaktfullUiAutoCompleteState<T>();
}

class _ImpaktfullUiAutoCompleteState<T>
    extends State<ImpaktfullUiAutoComplete<T>>
    with ImpaktfullUiAutoCompleteControllerListener {
  late final ImpaktfullUiAutoCompleteController _controller;
  var _value = '';
  GlobalKey<ImpaktfullUiAutoCompleteOverlayState<T>>? _overlayKey;
  OverlayEntry? _overlayEntry;
  final _layerLink = LayerLink();
  final _inputFieldKey = GlobalKey();
  Size? _size;

  late final FocusNode _foucsNode;
  final _overlayFocusNode = FocusNode(
    debugLabel: 'ImpaktfullUiAutoCompleteOverlay',
    canRequestFocus: false,
    skipTraversal: true,
  );
  final _tapRegionGroupId = Object();

  @override
  void initState() {
    super.initState();
    _foucsNode = FocusNode();
    _foucsNode.addListener(_onFocusChanged);
    _controller = widget.controller ?? ImpaktfullUiAutoCompleteController();
    _controller.addListener(this);
  }

  @override
  void dispose() {
    _removeOverlay();
    _controller.removeListener(this);
    if (widget.controller == null) {
      _controller.dispose();
    }
    _foucsNode.removeListener(_onFocusChanged);
    _foucsNode.dispose();
    _overlayFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      component: widget,
      overrideComponentTheme: widget.theme,
      builder: (context, componentTheme) => CompositedTransformTarget(
        link: _layerLink,
        child: TapRegion(
          groupId: _tapRegionGroupId,
          onTapOutside: (_) => _removeOverlay(),
          child: Focus(
            canRequestFocus: false,
            skipTraversal: true,
            onKeyEvent: _onKeyEvent,
            child: LayoutBuilder(
              builder: (context, constraints) {
                _checkIfRebuildIsNeeded(constraints);
                final leadingChild = widget.leadingBuilder?.call();
                final topChildren = widget.topBuilder?.call() ?? [];
                return ImpaktfullUiInputField(
                  key: _inputFieldKey,
                  placeholder: widget.placeholder,
                  focusNode: _foucsNode,
                  value: _value,
                  leadingBuilder:
                      leadingChild == null ? null : (context) => leadingChild,
                  topBuilder: topChildren.isNotEmpty
                      ? (context) => ImpaktfullUiWrap(
                            spacing: 4,
                            runSpacing: 4,
                            children: topChildren,
                          )
                      : null,
                  onChanged: _onChanged,
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  KeyEventResult _onKeyEvent(FocusNode node, KeyEvent event) {
    if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
      return KeyEventResult.ignored;
    }
    final key = event.logicalKey;
    if (key == LogicalKeyboardKey.escape) {
      if (event is KeyRepeatEvent) return KeyEventResult.ignored;
      _removeOverlay();
      _foucsNode.requestFocus();
      return KeyEventResult.handled;
    }
    final overlayState = _overlayKey?.currentState;
    if (overlayState == null) return KeyEventResult.ignored;
    if (key == LogicalKeyboardKey.arrowDown) {
      overlayState.moveHighlight(forward: true);
      return KeyEventResult.handled;
    } else if (key == LogicalKeyboardKey.arrowUp) {
      overlayState.moveHighlight(forward: false);
      return KeyEventResult.handled;
    } else if (key == LogicalKeyboardKey.enter ||
        key == LogicalKeyboardKey.numpadEnter) {
      if (event is KeyRepeatEvent) return KeyEventResult.ignored;
      final onItemSelected = widget.onItemSelected;
      if (onItemSelected == null) return KeyEventResult.ignored;
      if (!overlayState.hasHighlightedItem) return KeyEventResult.ignored;
      onItemSelected(overlayState.highlightedItem, _controller);
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  /// Closes the overlay when the focus moves outside of the input field and
  /// the overlay, e.g. with tab.
  void _onFocusChanged() {
    // The focus manager applies every focus change before it notifies the
    // listeners, so the focus of the overlay is up to date.
    if (_foucsNode.hasFocus || _overlayFocusNode.hasFocus) return;
    _removeOverlay();
  }

  void _onChanged(String value) {
    setState(() => _value = value);
    _updateOverlay();
  }

  void _updateOverlay() {
    final value = _value;
    if (value.isEmpty) {
      _removeOverlay();
      return;
    }
    final key = _overlayKey;
    if (key == null) {
      _addOverlay();
    } else {
      key.currentState?.updateSearchQuery(value);
    }
  }

  void _addOverlay() {
    _size = _getInputFieldSize();
    _overlayKey = GlobalKey<ImpaktfullUiAutoCompleteOverlayState<T>>();
    _overlayEntry = OverlayEntry(
      builder: (context) {
        final screenSize = MediaQuery.sizeOf(context);
        final inputFieldRenderBox =
            _inputFieldKey.currentContext?.findRenderObject() as RenderBox?;
        final inputFieldPosition =
            inputFieldRenderBox?.localToGlobal(Offset.zero) ?? Offset.zero;
        final inputFieldSize = inputFieldRenderBox?.size ?? Size.zero;
        final availableHeight =
            screenSize.height - inputFieldPosition.dy - inputFieldSize.height;
        final showAbove =
            availableHeight < ImpaktfullUiAutoCompleteOverlay.defaultHeight &&
                inputFieldPosition.dy > availableHeight;

        return Positioned(
          width: _size!.width,
          child: CompositedTransformFollower(
            link: _layerLink,
            showWhenUnlinked: false,
            // rtl-ignore: the overlay has the width of the input field, so
            // anchoring it to the left edge also works in right-to-left.
            targetAnchor: showAbove ? Alignment.topLeft : Alignment.bottomLeft,
            followerAnchor:
                showAbove ? Alignment.bottomLeft : Alignment.topLeft,
            offset: Offset(0, showAbove ? -8 : 8),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight:
                    showAbove ? inputFieldPosition.dy - 8 : availableHeight - 8,
              ),
              child: TapRegion(
                groupId: _tapRegionGroupId,
                // Taps on the overlay do not unfocus the input field.
                child: TextFieldTapRegion(
                  child: Focus(
                    focusNode: _overlayFocusNode,
                    child: ImpaktfullUiAutoCompleteOverlay<T>(
                      key: _overlayKey,
                      isShownAboveInputField: showAbove,
                      onSearchChanged: widget.onSearchChanged,
                      itemBuilder: (context, item, index) => widget.itemBuilder(
                        context,
                        item,
                        index,
                        _controller,
                      ),
                      initialSearchQuery: _value,
                      noDataLabel: widget.noDataLabel,
                      debounceDuration: widget.debounceDuration,
                      theme: widget.theme,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _removeOverlay() {
    _overlayKey = null;
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  Size _getInputFieldSize() {
    final renderBox =
        _inputFieldKey.currentContext?.findRenderObject() as RenderBox?;
    return renderBox?.size ?? Size.zero;
  }

  void _checkIfRebuildIsNeeded(BoxConstraints constraints) {
    final newSize = _getInputFieldSize();
    if (_size != newSize) {
      _size = newSize;
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        if (!mounted) return;
        _overlayEntry?.markNeedsBuild();
      });
    }
  }

  @override
  void close({bool focusOnInput = true}) {
    _removeOverlay();
    if (focusOnInput) {
      _foucsNode.requestFocus();
    }
  }

  @override
  void clear() {
    setState(() => _value = '');
  }
}

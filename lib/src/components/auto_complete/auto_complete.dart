import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_2/src/components/auto_complete/controller/auto_complete_controller_listener.dart';
import 'package:impaktfull_ui_2/src/components/auto_complete/widget/auto_complete_overlay.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';

export 'auto_complete_style.dart';
export 'controller/auto_complete_controller.dart';

part 'auto_complete.describe.dart';

class ImpaktfullUiAutoComplete<T> extends StatefulWidget
    with ComponentDescriptorMixin {
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
    this.replaceWithOverlay = false,
    this.debounceDuration = const Duration(milliseconds: 300),
    this.theme,
    super.key,
  });

  @override
  State<ImpaktfullUiAutoComplete<T>> createState() =>
      _ImpaktfullUiAutoCompleteState<T>();

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}

class _ImpaktfullUiAutoCompleteState<T>
    extends State<ImpaktfullUiAutoComplete<T>>
    with ImpaktfullUiAutoCompleteControllerListener {
  late final ImpaktfullUiAutoCompleteController _controller;
  var _value = '';
  GlobalKey<ImpaktfullUiAutoCompleteOverlayState>? _overlayKey;
  OverlayEntry? _overlayEntry;
  final _layerLink = LayerLink();
  final _inputFieldKey = GlobalKey();
  Size? _size;

  late final FocusNode _foucsNode;

  @override
  void initState() {
    super.initState();
    _foucsNode = FocusNode();
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
    _foucsNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiAutoCompleteTheme>(
      overrideComponentTheme: widget.theme,
      builder: (context, componentTheme) => CompositedTransformTarget(
        link: _layerLink,
        child: CallbackShortcuts(
          bindings: {
            const SingleActivator(LogicalKeyboardKey.escape): () {
              _removeOverlay();
              _foucsNode.requestFocus();
            },
          },
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
    );
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
    _overlayKey = GlobalKey<ImpaktfullUiAutoCompleteOverlayState>();
    _overlayEntry = OverlayEntry(
      builder: (context) {
        final screenSize = MediaQuery.of(context).size;
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
            targetAnchor: showAbove ? Alignment.topLeft : Alignment.bottomLeft,
            followerAnchor:
                showAbove ? Alignment.bottomLeft : Alignment.topLeft,
            offset: Offset(0, showAbove ? -8 : 8),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight:
                    showAbove ? inputFieldPosition.dy - 8 : availableHeight - 8,
              ),
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
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/auto_complete/auto_complete.dart';
import 'package:impaktfull_ui/src/components/card/card.dart';
import 'package:impaktfull_ui/src/components/list_view/list_view.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

class ImpaktfullUiAutoCompleteOverlay<T> extends StatefulWidget {
  static const double defaultHeight = 300;

  final String initialSearchQuery;
  final FutureOr<List<T>> Function(String searchQuery) onSearchChanged;
  final Widget Function(BuildContext context, T item, int index) itemBuilder;
  final String noDataLabel;
  final bool isShownAboveInputField;
  final ImpaktfullUiAutoCompleteTheme? theme;
  final Duration debounceDuration;

  const ImpaktfullUiAutoCompleteOverlay({
    required this.initialSearchQuery,
    required this.onSearchChanged,
    required this.itemBuilder,
    required this.noDataLabel,
    required this.isShownAboveInputField,
    required this.debounceDuration,
    this.theme,
    super.key,
  });

  @override
  State<ImpaktfullUiAutoCompleteOverlay<T>> createState() =>
      ImpaktfullUiAutoCompleteOverlayState<T>();
}

class ImpaktfullUiAutoCompleteOverlayState<T>
    extends State<ImpaktfullUiAutoCompleteOverlay<T>> {
  DateTime? _latestSearch;
  final _items = <T>[];
  var _isLoading = true;
  late String _searchQuery;
  Timer? _debounceTimer;
  int? _highlightedIndex;
  final _highlightedItemKey = GlobalKey();

  /// Whether the items are being loaded.
  bool get isLoading => _isLoading;

  /// The index of the item that is highlighted with the arrow keys.
  int? get highlightedIndex => _highlightedIndex;

  /// Whether an item is highlighted with the arrow keys.
  bool get hasHighlightedItem {
    final index = _highlightedIndex;
    return index != null && !_isLoading && index < _items.length;
  }

  /// The item that is highlighted with the arrow keys. Only call it when
  /// [hasHighlightedItem] is true.
  T get highlightedItem => _items[_highlightedIndex!];

  /// Moves the highlight one item down ([forward] is true) or up. It wraps
  /// around at the start and the end of the list. The list is reversed when
  /// it is shown above the input field, so down is always towards the input
  /// field when it is shown above it.
  void moveHighlight({required bool forward}) {
    if (_isLoading || _items.isEmpty) return;
    final towardsEnd = widget.isShownAboveInputField ? !forward : forward;
    final current = _highlightedIndex;
    final int next;
    if (current == null) {
      next = towardsEnd ? 0 : _items.length - 1;
    } else {
      next = (current + (towardsEnd ? 1 : -1)) % _items.length;
    }
    setState(() => _highlightedIndex = next);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final context = _highlightedItemKey.currentContext;
      if (!mounted || context == null) return;
      Scrollable.ensureVisible(
        context,
        alignmentPolicy: towardsEnd
            ? ScrollPositionAlignmentPolicy.keepVisibleAtEnd
            : ScrollPositionAlignmentPolicy.keepVisibleAtStart,
      );
    });
  }

  @override
  void initState() {
    super.initState();
    _searchQuery = widget.initialSearchQuery;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (!mounted) return;
      _getData();
    });
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      component: widget,
      overrideComponentTheme: widget.theme,
      builder: (context, componentTheme) => ImpaktfullUiCard(
        height: ImpaktfullUiAutoCompleteOverlay.defaultHeight,
        padding: EdgeInsets.zero,
        shadow: componentTheme.shadows.overlay,
        child: ImpaktfullUiListView.builder(
          items: _items,
          reversed: widget.isShownAboveInputField,
          isLoading: _isLoading,
          itemBuilder: (context, item, index) {
            final child = widget.itemBuilder(context, item, index);
            final highlightColor = componentTheme.colors.highlightedItem;
            if (index != _highlightedIndex || highlightColor == null) {
              return child;
            }
            return Container(
              key: _highlightedItemKey,
              foregroundDecoration: BoxDecoration(color: highlightColor),
              child: child,
            );
          },
          placeholderData: ImpaktfullUiListViewPlaceholderData(
            title: widget.noDataLabel,
          ),
        ),
      ),
    );
  }

  void updateSearchQuery(String value) {
    setState(() {
      _searchQuery = value;
      _isLoading = true;
      _highlightedIndex = null;
    });

    _debounceTimer?.cancel();
    _debounceTimer = Timer(widget.debounceDuration, () {
      _debounceTimer = null;
      _getData();
    });
  }

  Future<void> _getData() async {
    try {
      if (_isLoading != true) {
        setState(() => _isLoading = true);
      }
      final searchDateTime = DateTime.now();
      _latestSearch = searchDateTime;
      final items = await widget.onSearchChanged(_searchQuery);
      if (_latestSearch != searchDateTime) return;
      if (!mounted || _debounceTimer != null) return;
      _items.clear();
      _items.addAll(items);
      _highlightedIndex = null;
    } catch (error, trace) {
      debugPrintStack(
        label: 'Error in _getData (ImpaktfullUiAutoCompleteOverlay): $error',
        stackTrace: trace,
      );
    }
    if (!mounted || _debounceTimer != null) return;
    setState(() {
      _isLoading = false;
    });
  }
}

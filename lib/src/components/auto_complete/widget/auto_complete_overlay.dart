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
          itemBuilder: (contesxt, item, index) =>
              widget.itemBuilder(context, item, index),
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

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui_2/src/components/button/button.dart';
import 'package:impaktfull_ui_2/src/components/divider/divider.dart';
import 'package:impaktfull_ui_2/src/components/list_view/list_view_style.dart';
import 'package:impaktfull_ui_2/src/components/loading_indicator/loading_indicator.dart';
import 'package:impaktfull_ui_2/src/components/refresh_indicator/refresh_indicator.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';

export 'list_view_style.dart';

part 'list_view.describe.dart';

class ImpaktfullUiListView<T> extends StatefulWidget
    with ComponentDescriptorMixin {
  final Widget? child;
  final List<Widget>? children;
  final List<T>? items;
  final Widget Function(BuildContext context, T item, int index)? itemBuilder;
  final EdgeInsetsGeometry padding;
  final double spacing;
  final bool separated;
  final String? noDataLabel;
  final String? refreshBtnLabel;
  final bool isLoading;
  final bool shrinkWrap;
  final AsyncCallback? onRefresh;
  final ImpaktfullUiListViewTheme? theme;

  const ImpaktfullUiListView({
    required List<Widget> this.children,
    this.isLoading = false,
    this.spacing = 0,
    this.onRefresh,
    this.padding = EdgeInsets.zero,
    this.shrinkWrap = false,
    this.theme,
    super.key,
  })  : itemBuilder = null,
        child = null,
        items = null,
        separated = false,
        noDataLabel = null,
        refreshBtnLabel = null;

  const ImpaktfullUiListView.builder({
    required List<T> this.items,
    required Widget Function(BuildContext context, T item, int index)
        this.itemBuilder,
    required String this.noDataLabel,
    this.spacing = 0,
    this.isLoading = false,
    this.refreshBtnLabel,
    this.onRefresh,
    this.padding = EdgeInsets.zero,
    this.shrinkWrap = false,
    this.theme,
    super.key,
  })  : separated = false,
        child = null,
        children = null;

  const ImpaktfullUiListView.separated({
    required List<T> this.items,
    required Widget Function(BuildContext context, T item, int index)
        this.itemBuilder,
    required String this.noDataLabel,
    this.isLoading = false,
    this.refreshBtnLabel,
    this.onRefresh,
    this.padding = EdgeInsets.zero,
    this.shrinkWrap = false,
    this.theme,
    super.key,
    required,
  })  : spacing = 0,
        child = null,
        children = null,
        separated = true;

  const ImpaktfullUiListView.child({
    required Widget this.child,
    this.isLoading = false,
    this.refreshBtnLabel,
    this.onRefresh,
    this.padding = EdgeInsets.zero,
    this.shrinkWrap = false,
    this.theme,
    super.key,
    required,
  })  : spacing = 0,
        items = null,
        noDataLabel = null,
        itemBuilder = null,
        children = null,
        separated = true;

  @override
  State<ImpaktfullUiListView<T>> createState() =>
      _ImpaktfullUiListViewState<T>();

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}

class _ImpaktfullUiListViewState<T> extends State<ImpaktfullUiListView<T>> {
  var _isLoading = false;

  @override
  Widget build(BuildContext context) {
    if (widget.isLoading) {
      return const Center(child: ImpaktfullUiLoadingIndicator());
    }
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiListViewTheme>(
      overrideComponentTheme: widget.theme,
      builder: (context, theme, componentTheme) {
        final padding = MediaQuery.of(context).padding.add(widget.padding);
        if (widget.children != null) {
          return ImpaktfullUiRefreshIndicator(
            onRefresh: widget.onRefresh,
            child: ListView(
              padding: padding,
              shrinkWrap: widget.shrinkWrap,
              children: [
                ImpaktfullUiAutoLayout.vertical(
                  spacing: widget.spacing,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: widget.children!,
                ),
              ],
            ),
          );
        }
        if (widget.child != null) {
          return ImpaktfullUiRefreshIndicator(
            onRefresh: widget.onRefresh,
            child: ListView(
              padding: padding,
              shrinkWrap: widget.shrinkWrap,
              children: [
                widget.child!,
              ],
            ),
          );
        }
        if (widget.items!.isEmpty) {
          return ImpaktfullUiRefreshIndicator(
            onRefresh: widget.onRefresh,
            child: LayoutBuilder(
              builder: (context, constraints) => SingleChildScrollView(
                physics: widget.onRefresh == null
                    ? null
                    : const AlwaysScrollableScrollPhysics(),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  height: constraints.maxHeight,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        widget.noDataLabel!,
                        style: componentTheme.textStyles.title,
                        textAlign: TextAlign.center,
                      ),
                      if (widget.refreshBtnLabel != null &&
                          widget.onRefresh != null) ...[
                        const SizedBox(height: 16),
                        if (_isLoading) ...[
                          const ImpaktfullUiLoadingIndicator(),
                        ] else ...[
                          ImpaktfullUiButton(
                            type: ImpaktfullUiButtonType.secondary,
                            title: widget.refreshBtnLabel!,
                            onTap: _onRefreshTapped,
                          ),
                        ],
                      ],
                    ],
                  ),
                ),
              ),
            ),
          );
        }
        if (widget.separated) {
          return ImpaktfullUiRefreshIndicator(
            onRefresh: widget.onRefresh,
            child: ListView.separated(
              padding: padding,
              itemBuilder: (context, index) => widget.itemBuilder!(
                context,
                widget.items![index],
                index,
              ),
              shrinkWrap: widget.shrinkWrap,
              separatorBuilder: (context, index) => const ImpaktfullUiDivider(),
              itemCount: widget.items!.length,
            ),
          );
        }
        return ImpaktfullUiRefreshIndicator(
          onRefresh: widget.onRefresh,
          child: ListView.separated(
            padding: padding,
            itemBuilder: (context, index) => widget.itemBuilder!(
              context,
              widget.items![index],
              index,
            ),
            shrinkWrap: widget.shrinkWrap,
            separatorBuilder: (context, index) =>
                SizedBox(height: widget.spacing),
            itemCount: widget.items!.length,
          ),
        );
      },
    );
  }

  Future<void> _onRefreshTapped() async {
    if (widget.onRefresh == null) return;
    setState(() => _isLoading = true);
    try {
      await widget.onRefresh!();
    } catch (e) {
      debugPrint('Error refreshing list: $e');
    }
    setState(() => _isLoading = false);
  }
}

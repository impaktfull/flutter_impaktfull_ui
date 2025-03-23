import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/button/button.dart';
import 'package:impaktfull_ui/src/components/divider/divider.dart';
import 'package:impaktfull_ui/src/components/list_view/list_view.localizations.dart';
import 'package:impaktfull_ui/src/components/list_view/list_view.style.dart';
import 'package:impaktfull_ui/src/components/list_view/model/list_view_placeholder_state.dart';
import 'package:impaktfull_ui/src/components/loading_indicator/loading_indicator.dart';
import 'package:impaktfull_ui/src/components/localization/localization_provider.dart';
import 'package:impaktfull_ui/src/components/placeholder/placeholder.dart';
import 'package:impaktfull_ui/src/components/refresh_indicator/refresh_indicator.dart';
import 'package:impaktfull_ui/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui/src/util/descriptor/component_descriptor_mixin.dart';

export 'list_view.style.dart';
export 'model/list_view_placeholder_state.dart';
export 'list_view.localizations.dart';

part 'list_view.describe.dart';

class ImpaktfullUiListView<T> extends StatefulWidget
    with ComponentDescriptorMixin {
  final Widget? child;
  final List<Widget>? children;
  final List<T>? items;
  final Widget Function(BuildContext context, T item, int index)? itemBuilder;
  final Widget Function(BuildContext context, T item, int index)?
      separatorBuilder;
  final EdgeInsetsGeometry padding;
  final bool useSafeArea;
  final double spacing;
  final int itemsPerRow;
  final bool separated;
  @Deprecated('Use [placeholderData] instead')
  final String? noDataLabel;
  @Deprecated('Use [placeholderData] instead')
  final String? refreshBtnLabel;
  final ImpaktfullUiListViewPlaceholderData? placeholderData;
  final bool isLoading;
  final bool shrinkWrap;
  final bool reversed;
  final Axis scrollDirection;
  final Widget? Function(BuildContext context)? leadingBuilder;
  final Widget? Function(BuildContext context)? trailingBuilder;
  final AsyncCallback? onRefresh;
  final ScrollPhysics? scrollPhysics;
  final ScrollController? controller;
  final ImpaktfullUiListViewLocalizations? localizations;
  final ImpaktfullUiListViewTheme? theme;

  const ImpaktfullUiListView({
    required List<Widget> this.children,
    this.isLoading = false,
    this.useSafeArea = true,
    this.spacing = 0,
    this.onRefresh,
    this.itemsPerRow = 1,
    this.padding = EdgeInsetsDirectional.zero,
    this.shrinkWrap = false,
    this.reversed = false,
    this.scrollPhysics,
    this.scrollDirection = Axis.vertical,
    this.controller,
    this.leadingBuilder,
    this.trailingBuilder,
    this.placeholderData,
    this.localizations,
    this.theme,
    super.key,
  })  : itemBuilder = null,
        child = null,
        items = null,
        separated = false,
        separatorBuilder = null,
        // ignore: deprecated_member_use_from_same_package
        noDataLabel = null,
        // ignore: deprecated_member_use_from_same_package
        refreshBtnLabel = null;

  const ImpaktfullUiListView.builder({
    required List<T> this.items,
    required Widget Function(BuildContext context, T item, int index)
        this.itemBuilder,
    required this.placeholderData,
    this.spacing = 0,
    this.isLoading = false,
    this.onRefresh,
    this.itemsPerRow = 1,
    this.padding = EdgeInsets.zero,
    this.useSafeArea = true,
    this.shrinkWrap = false,
    this.reversed = false,
    this.scrollPhysics,
    this.scrollDirection = Axis.vertical,
    this.controller,
    this.leadingBuilder,
    this.trailingBuilder,
    @Deprecated('Use [placeholderData] instead') this.noDataLabel,
    @Deprecated('Use [placeholderData] instead') this.refreshBtnLabel,
    this.localizations,
    this.theme,
    super.key,
  })  : separated = false,
        separatorBuilder = null,
        child = null,
        children = null;

  const ImpaktfullUiListView.separated({
    required List<T> this.items,
    required Widget Function(BuildContext context, T item, int index)
        this.itemBuilder,
    required String this.noDataLabel,
    this.separatorBuilder,
    this.isLoading = false,
    this.refreshBtnLabel,
    this.onRefresh,
    this.itemsPerRow = 1,
    this.padding = EdgeInsets.zero,
    this.useSafeArea = true,
    this.shrinkWrap = false,
    this.reversed = false,
    this.scrollPhysics,
    this.scrollDirection = Axis.vertical,
    this.controller,
    this.leadingBuilder,
    this.trailingBuilder,
    this.placeholderData,
    this.localizations,
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
    this.useSafeArea = true,
    this.shrinkWrap = false,
    this.reversed = false,
    this.scrollPhysics,
    this.scrollDirection = Axis.vertical,
    this.controller,
    this.leadingBuilder,
    this.trailingBuilder,
    this.placeholderData,
    this.localizations,
    this.theme,
    super.key,
    required,
  })  : spacing = 0,
        items = null,
        // ignore: deprecated_member_use_from_same_package
        noDataLabel = null,
        itemBuilder = null,
        children = null,
        separated = true,
        separatorBuilder = null,
        itemsPerRow = 1;

  @override
  State<ImpaktfullUiListView<T>> createState() =>
      _ImpaktfullUiListViewState<T>();

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}

class _ImpaktfullUiListViewState<T> extends State<ImpaktfullUiListView<T>> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = widget.controller ?? ScrollController();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _scrollController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isLoading) {
      if (widget.shrinkWrap) {
        return Padding(
          padding: widget.padding,
          child: const SizedBox(
            height: 50,
            width: 50,
            child: ImpaktfullUiLoadingIndicator(),
          ),
        );
      }
      return const Center(
        child: ImpaktfullUiLoadingIndicator(),
      );
    }
    final leading = widget.leadingBuilder?.call(context);
    final trailing = widget.trailingBuilder?.call(context);
    return ImpaktfullUiLocalizationProvider(
      localizations: widget.localizations,
      builder: (context, localizations) =>
          ImpaktfullUiComponentThemeBuilder<ImpaktfullUiListViewTheme>(
        overrideComponentTheme: widget.theme,
        builder: (context, componentTheme) {
          final safeAreaPadding = widget.useSafeArea
              ? MediaQuery.paddingOf(context)
              : EdgeInsets.zero;
          final padding = safeAreaPadding.add(widget.padding);
          if (widget.children != null) {
            return ImpaktfullUiRefreshIndicator(
              onRefresh: widget.onRefresh,
              child: ListView(
                controller: _scrollController,
                padding: padding,
                physics: widget.scrollPhysics,
                shrinkWrap: widget.shrinkWrap,
                reverse: widget.reversed,
                scrollDirection: widget.scrollDirection,
                children: [
                  if (leading != null) ...[
                    leading,
                  ],
                  ImpaktfullUiAutoLayout(
                    orientation: widget.scrollDirection == Axis.horizontal
                        ? ImpaktfullUiAutoLayoutOrientation.horizontal
                        : ImpaktfullUiAutoLayoutOrientation.vertical,
                    spacing: widget.spacing,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: widget.children!,
                  ),
                  if (trailing != null) ...[
                    trailing,
                  ],
                ],
              ),
            );
          }
          if (widget.child != null) {
            return ImpaktfullUiRefreshIndicator(
              onRefresh: widget.onRefresh,
              child: ListView(
                controller: _scrollController,
                padding: padding,
                physics: widget.scrollPhysics,
                shrinkWrap: widget.shrinkWrap,
                reverse: widget.reversed,
                scrollDirection: widget.scrollDirection,
                children: [
                  if (leading != null) ...[
                    leading,
                  ],
                  widget.child!,
                  if (trailing != null) ...[
                    trailing,
                  ],
                ],
              ),
            );
          }
          if (widget.items!.isEmpty) {
            final placeholderData = widget.placeholderData ??
                ImpaktfullUiListViewPlaceholderData(
                  // ignore: deprecated_member_use_from_same_package
                  title: widget.noDataLabel,
                );
            return ImpaktfullUiRefreshIndicator(
              onRefresh: widget.onRefresh,
              child: LayoutBuilder(
                builder: (context, constraints) => ListView(
                  controller: _scrollController,
                  physics: widget.onRefresh == null
                      ? widget.scrollPhysics
                      : const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(16),
                  shrinkWrap: widget.shrinkWrap,
                  children: [
                    if (leading != null) ...[
                      leading,
                    ],
                    Container(
                      height: widget.shrinkWrap ? null : constraints.maxHeight,
                      alignment: Alignment.center,
                      child: ImpaktfullUiPlaceholder(
                        title: placeholderData.title,
                        subtitle: placeholderData.subtitle,
                        actions: [
                          ...placeholderData.actions,
                          if (widget.onRefresh != null &&
                              placeholderData.showRefreshBtn) ...[
                            ImpaktfullUiButton(
                              type: ImpaktfullUiButtonType.secondary,
                              title: localizations.refreshBtnLabel,
                              onAsyncTap: widget.onRefresh!,
                            ),
                          ],
                        ],
                      ),
                    ),
                    if (trailing != null) ...[
                      trailing,
                    ],
                  ],
                ),
              ),
            );
          }
          if (widget.separated) {
            return ImpaktfullUiRefreshIndicator(
              onRefresh: widget.onRefresh,
              child: ListView.separated(
                controller: _scrollController,
                padding: padding,
                physics: widget.scrollPhysics,
                scrollDirection: widget.scrollDirection,
                itemBuilder: (context, index) =>
                    _buildItem(context, index, leading, trailing),
                shrinkWrap: widget.shrinkWrap,
                reverse: widget.reversed,
                separatorBuilder: (context, index) {
                  final item = widget.items![index];
                  return widget.separatorBuilder?.call(context, item, index) ??
                      const ImpaktfullUiDivider();
                },
                itemCount: widget.items!.length,
              ),
            );
          }
          return ImpaktfullUiRefreshIndicator(
            onRefresh: widget.onRefresh,
            child: ListView.separated(
              controller: _scrollController,
              padding: padding,
              physics: widget.scrollPhysics,
              scrollDirection: widget.scrollDirection,
              itemBuilder: (context, index) =>
                  _buildItem(context, index, leading, trailing),
              shrinkWrap: widget.shrinkWrap,
              reverse: widget.reversed,
              separatorBuilder: (context, index) =>
                  SizedBox(height: widget.spacing),
              itemCount: widget.items!.length,
            ),
          );
        },
      ),
    );
  }

  Widget? _buildItem(
    BuildContext context,
    int index,
    Widget? leading,
    Widget? trailing,
  ) {
    final itemsPerRow = widget.itemsPerRow;
    Widget child;
    if (itemsPerRow == 1) {
      child = widget.itemBuilder!(
        context,
        widget.items![index],
        index,
      );
    } else {
      final rowItems = <Widget>[];
      for (int i = 0; i < itemsPerRow; i++) {
        final itemIndex = index * itemsPerRow + i;
        if (itemIndex < widget.items!.length) {
          rowItems.add(
            Expanded(
              child: widget.itemBuilder!(
                context,
                widget.items![itemIndex],
                itemIndex,
              ),
            ),
          );
        }
      }
      child = ImpaktfullUiAutoLayout.horizontal(
        spacing: widget.spacing,
        children: rowItems,
      );
    }
    final isFirst = index == 0;
    final isLast = index == widget.items!.length - 1;
    return ImpaktfullUiAutoLayout.vertical(
      spacing: widget.spacing,
      children: [
        if (isFirst && leading != null) ...[
          leading,
        ],
        SizedBox(
          width:
              widget.scrollDirection == Axis.vertical ? double.infinity : null,
          child: child,
        ),
        if (widget.separatorBuilder != null) ...[
          widget.separatorBuilder!(context, widget.items![index], index),
        ],
        if (isLast && trailing != null) ...[
          trailing,
        ],
      ],
    );
  }
}

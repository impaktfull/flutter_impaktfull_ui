import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/button/button.dart';
import 'package:impaktfull_ui/src/components/grid_view/grid_view.localizations.dart';
import 'package:impaktfull_ui/src/components/grid_view/grid_view_style.dart';
import 'package:impaktfull_ui/src/components/grid_view/model/grid_view_placeholder_state.dart';
import 'package:impaktfull_ui/src/components/loading_indicator/loading_indicator.dart';
import 'package:impaktfull_ui/src/components/localization/localization_provider.dart';
import 'package:impaktfull_ui/src/components/placeholder/placeholder.dart';
import 'package:impaktfull_ui/src/components/refresh_indicator/refresh_indicator.dart';
import 'package:impaktfull_ui/src/util/descriptor/component_descriptor_mixin.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'grid_view_style.dart';
export 'model/grid_view_placeholder_state.dart';

part 'grid_view.describe.dart';

class ImpaktfullUiGridViewConfig {
  final double maxWidth;
  final double maxHeight;

  const ImpaktfullUiGridViewConfig({
    required this.maxHeight,
    required this.maxWidth,
  });
}

class ImpaktfullUiGridView<T> extends StatefulWidget
    with ComponentDescriptorMixin {
  final List<T> items;
  final int Function(BuildContext, ImpaktfullUiGridViewConfig) crossAxisCount;
  final double Function(BuildContext, ImpaktfullUiGridViewConfig)?
      itemAspectRatio;
  final Widget Function(BuildContext, T, int)? itemBuilder;
  final EdgeInsetsGeometry padding;
  final double spacing;
  final ScrollPhysics? scrollPhysics;
  final bool shrinkWrap;
  final bool isLoading;
  @Deprecated('Use [placeholderData] instead')
  final String? noDataLabel;
  final AsyncCallback? onRefresh;
  final ImpaktfullUiGridViewLocalizations? localizations;
  final ImpaktfullUiGridViewPlaceholderData? placeholderData;
  final ImpaktfullUiGridViewTheme? theme;
  final ScrollController? controller;

  const ImpaktfullUiGridView({
    required List<T> children,
    required this.crossAxisCount,
    required this.placeholderData,
    this.itemAspectRatio,
    this.padding = EdgeInsets.zero,
    this.spacing = 0,
    this.scrollPhysics,
    this.onRefresh,
    this.shrinkWrap = false,
    this.isLoading = false,
    @Deprecated('Use [placeholderData] instead') this.noDataLabel,
    this.theme,
    this.localizations,
    this.controller,
    super.key,
  })  : items = children,
        itemBuilder = null;

  const ImpaktfullUiGridView.builder({
    required this.items,
    required Widget Function(BuildContext, T, int) this.itemBuilder,
    required this.crossAxisCount,
    required this.placeholderData,
    this.itemAspectRatio,
    this.padding = EdgeInsets.zero,
    this.spacing = 0,
    this.scrollPhysics,
    this.onRefresh,
    this.shrinkWrap = false,
    this.isLoading = false,
    @Deprecated('Use [placeholderData] instead') this.noDataLabel,
    this.theme,
    this.localizations,
    this.controller,
    super.key,
  });

  @override
  State<ImpaktfullUiGridView<T>> createState() =>
      _ImpaktfullUiGridViewState<T>();

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}

class _ImpaktfullUiGridViewState<T> extends State<ImpaktfullUiGridView<T>> {
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
    return ImpaktfullUiLocalizationProvider(
      localizations: widget.localizations,
      builder: (context, localizations) =>
          ImpaktfullUiOverridableComponentBuilder(
        component: widget,
        overrideComponentTheme: widget.theme,
        builder: (context, componentTheme) => LayoutBuilder(
          builder: (context, constraints) {
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
              return Padding(
                padding: widget.padding,
                child: const Center(
                  child: ImpaktfullUiLoadingIndicator(),
                ),
              );
            }
            if (widget.items.isEmpty) {
              final placeholderData = widget.placeholderData ??
                  ImpaktfullUiGridViewPlaceholderData(
                    // ignore: deprecated_member_use_from_same_package
                    title: widget.noDataLabel,
                  );
              return ImpaktfullUiRefreshIndicator(
                onRefresh: widget.onRefresh,
                child: LayoutBuilder(
                  builder: (context, constraints) => ListView(
                    controller: _scrollController,
                    shrinkWrap: widget.shrinkWrap,
                    padding: widget.padding,
                    physics: widget.scrollPhysics,
                    children: [
                      Container(
                        height:
                            widget.shrinkWrap ? null : constraints.maxHeight,
                        alignment: Alignment.center,
                        child: ImpaktfullUiPlaceholder(
                          asset: placeholderData.asset,
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
                    ],
                  ),
                ),
              );
            }
            final config = ImpaktfullUiGridViewConfig(
              maxWidth: constraints.maxWidth,
              maxHeight: constraints.maxHeight,
            );
            return ImpaktfullUiRefreshIndicator(
              onRefresh: widget.onRefresh,
              child: GridView.builder(
                padding: widget.padding,
                physics: widget.scrollPhysics,
                shrinkWrap: widget.shrinkWrap,
                itemCount: widget.items.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: widget.crossAxisCount(context, config),
                  childAspectRatio: widget.itemAspectRatio == null
                      ? 1.0
                      : widget.itemAspectRatio!(context, config),
                  crossAxisSpacing: widget.spacing,
                  mainAxisSpacing: widget.spacing,
                ),
                itemBuilder: (context, index) {
                  final item = widget.items[index];
                  if (widget.itemBuilder == null && item is Widget) {
                    return item;
                  }
                  return widget.itemBuilder!(context, item, index);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

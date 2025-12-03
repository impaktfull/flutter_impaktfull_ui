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

class ImpaktfullUiGridView<T> extends StatelessWidget
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
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiLocalizationProvider(
      localizations: localizations,
      builder: (context, localizations) =>
          ImpaktfullUiOverridableComponentBuilder(
        component: this,
        overrideComponentTheme: theme,
        builder: (context, componentTheme) => LayoutBuilder(
          builder: (context, constraints) {
            if (isLoading) {
              if (shrinkWrap) {
                return Padding(
                  padding: padding,
                  child: const SizedBox(
                    height: 50,
                    width: 50,
                    child: ImpaktfullUiLoadingIndicator(),
                  ),
                );
              }
              return Padding(
                padding: padding,
                child: const Center(
                  child: ImpaktfullUiLoadingIndicator(),
                ),
              );
            }
            if (items.isEmpty) {
              final placeholderData = this.placeholderData ??
                  ImpaktfullUiGridViewPlaceholderData(
                    // ignore: deprecated_member_use_from_same_package
                    title: noDataLabel,
                  );
              return ImpaktfullUiRefreshIndicator(
                onRefresh: onRefresh,
                child: LayoutBuilder(
                  builder: (context, constraints) => ListView(
                    shrinkWrap: shrinkWrap,
                    children: [
                      Container(
                        height: shrinkWrap ? null : constraints.maxHeight,
                        alignment: Alignment.center,
                        child: ImpaktfullUiPlaceholder(
                          asset: placeholderData.asset,
                          title: placeholderData.title,
                          subtitle: placeholderData.subtitle,
                          actions: [
                            ...placeholderData.actions,
                            if (onRefresh != null &&
                                placeholderData.showRefreshBtn) ...[
                              ImpaktfullUiButton(
                                type: ImpaktfullUiButtonType.secondary,
                                title: localizations.refreshBtnLabel,
                                onAsyncTap: onRefresh!,
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
              onRefresh: onRefresh,
              child: GridView.builder(
                padding: padding,
                physics: scrollPhysics,
                shrinkWrap: shrinkWrap,
                itemCount: items.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount(context, config),
                  childAspectRatio: itemAspectRatio == null
                      ? 1.0
                      : itemAspectRatio!(context, config),
                  crossAxisSpacing: spacing,
                  mainAxisSpacing: spacing,
                ),
                itemBuilder: (context, index) {
                  final item = items[index];
                  if (itemBuilder == null && item is Widget) {
                    return item;
                  }
                  return itemBuilder!(context, item, index);
                },
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}

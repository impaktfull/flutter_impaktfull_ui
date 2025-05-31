import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/grid_view/grid_view_style.dart';
import 'package:impaktfull_ui/src/util/descriptor/component_descriptor_mixin.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component.dart';

export 'grid_view_style.dart';

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
  final String noDataLabel;
  final ImpaktfullUiGridViewTheme? theme;

  const ImpaktfullUiGridView({
    required List<T> children,
    required this.crossAxisCount,
    required this.noDataLabel,
    this.itemAspectRatio,
    this.padding = EdgeInsets.zero,
    this.spacing = 0,
    this.scrollPhysics,
    this.shrinkWrap = false,
    this.theme,
    super.key,
  })  : items = children,
        itemBuilder = null;

  const ImpaktfullUiGridView.builder({
    required this.items,
    required Widget Function(BuildContext, T, int) this.itemBuilder,
    required this.crossAxisCount,
    required this.noDataLabel,
    this.itemAspectRatio,
    this.padding = EdgeInsets.zero,
    this.spacing = 0,
    this.scrollPhysics,
    this.shrinkWrap = false,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      component: this,
      overrideComponentTheme: theme,
      builder: (context, componentTheme) =>
          LayoutBuilder(builder: (context, constraints) {
        if (items.isEmpty) {
          return Center(
            child: Text(
              noDataLabel,
              style: componentTheme.textStyles.title,
              textAlign: TextAlign.center,
            ),
          );
        }
        final config = ImpaktfullUiGridViewConfig(
          maxWidth: constraints.maxWidth,
          maxHeight: constraints.maxHeight,
        );
        return GridView.builder(
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
        );
      }),
    );
  }

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}

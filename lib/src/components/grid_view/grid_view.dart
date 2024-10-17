import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/grid_view/grid_view_style.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';

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
      childAspectRatio;
  final Widget Function(BuildContext, T, int) itemBuilder;
  final EdgeInsetsGeometry padding;
  final double spacing;
  final ScrollPhysics? scrollPhysics;
  final ImpaktfullUiGridViewTheme? theme;

  const ImpaktfullUiGridView.builder({
    required this.items,
    required this.itemBuilder,
    required this.crossAxisCount,
    this.childAspectRatio,
    this.padding = EdgeInsets.zero,
    this.spacing = 0,
    this.scrollPhysics,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiGridViewTheme>(
      overrideComponentTheme: theme,
      builder: (context, componentTheme) =>
          LayoutBuilder(builder: (context, constraints) {
        final config = ImpaktfullUiGridViewConfig(
          maxWidth: constraints.maxWidth,
          maxHeight: constraints.maxHeight,
        );
        return GridView.builder(
          padding: padding,
          physics: scrollPhysics,
          itemCount: items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount(context, config),
            childAspectRatio: childAspectRatio == null
                ? 1.0
                : childAspectRatio!(context, config),
            crossAxisSpacing: spacing,
            mainAxisSpacing: spacing,
          ),
          itemBuilder: (context, index) {
            final item = items[index];
            return itemBuilder(context, item, index);
          },
        );
      }),
    );
  }

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}

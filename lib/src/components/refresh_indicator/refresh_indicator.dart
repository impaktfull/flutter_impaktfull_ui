import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/refresh_indicator/refresh_indicator_style.dart';
import 'package:impaktfull_ui/src/util/descriptor/component_descriptor_mixin.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component.dart';

export 'refresh_indicator_style.dart';
part 'refresh_indicator.describe.dart';

class ImpaktfullUiRefreshIndicator extends StatelessWidget
    with ComponentDescriptorMixin {
  final AsyncCallback? onRefresh;
  final ImpaktfullUiRefreshIndicatorTheme? theme;
  final Widget child;

  const ImpaktfullUiRefreshIndicator({
    required this.onRefresh,
    required this.child,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (onRefresh == null) return child;
    return ImpaktfullUiOverridableComponentBuilder(
      component: this,
      overrideComponentTheme: theme,
      builder: (context, componentStyle) => RefreshIndicator(
        color: componentStyle.colors.loadingIndicator,
        strokeWidth: 1,
        onRefresh: onRefresh!,
        child: child,
      ),
    );
  }

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/refresh_indicator/refresh_indicator_style.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'refresh_indicator_style.dart';

class ImpaktfullUiRefreshIndicator extends StatelessWidget {
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
      builder: (context, componentTheme) => RefreshIndicator(
        backgroundColor: componentTheme.colors.backgroundColor,
        color: componentTheme.colors.loadingIndicator,
        strokeWidth: 1,
        onRefresh: onRefresh!,
        child: child,
      ),
    );
  }
}

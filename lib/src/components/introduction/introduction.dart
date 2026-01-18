import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/introduction/introduction_style.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'introduction_style.dart';

class ImpaktfullUiIntroduction extends StatelessWidget {
  final ImpaktfullUiIntroductionTheme? theme;

  const ImpaktfullUiIntroduction({
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      component: this,
      overrideComponentTheme: theme,
      builder: (context, componentTheme) => Container(),
    );
  }
}

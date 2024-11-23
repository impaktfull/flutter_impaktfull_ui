import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/introduction/introduction_style.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';

export 'introduction_style.dart';

part 'introduction.describe.dart';

class ImpaktfullUiIntroduction extends StatelessWidget
    with ComponentDescriptorMixin {
  final ImpaktfullUiIntroductionTheme? theme;

  const ImpaktfullUiIntroduction({
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuilder<ImpaktfullUiIntroductionTheme>(
      overrideComponentTheme: theme,
      builder: (context, componentTheme) => Container(),
    );
  }

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}

import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/wysiwyg/wysiwyg_style.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';

export 'wysiwyg_style.dart';

part 'wysiwyg.describe.dart';

class ImpaktfullUiWysiwyg extends StatelessWidget with ComponentDescriptorMixin {
  final ImpaktfullUiWysiwygTheme? theme;

  const ImpaktfullUiWysiwyg({
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiWysiwygTheme>(
      overrideComponentTheme: theme,
      builder: (context, componentTheme) => Container(),
    );
  }

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}

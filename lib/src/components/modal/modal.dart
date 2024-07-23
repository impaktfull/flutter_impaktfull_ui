import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/modal/modal_style.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';

export 'modal_style.dart';

part 'modal.describe.dart';

class ImpaktfullUiModal extends StatelessWidget with ComponentDescriptorMixin {
  final ImpaktfullUiModalTheme? theme;

  const ImpaktfullUiModal({
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiModalTheme>(
      overrideComponentTheme: theme,
      builder: (context, theme, componentTheme) => Container(),
    );
  }

  @override
  String describe() => _describeInstance(this);
}

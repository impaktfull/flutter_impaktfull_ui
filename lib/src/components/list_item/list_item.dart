import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/list_item/list_item_style.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';

export 'list_item_style.dart';

part 'list_item.describe.dart';

class ImpaktfullUiListItem extends StatelessWidget
    with ComponentDescriptorMixin {
  final ImpaktfullUiListItemTheme? theme;

  const ImpaktfullUiListItem({
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiListItemTheme>(
      overrideComponentTheme: theme,
      builder: (context, theme, componentTheme) => Container(),
    );
  }

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}

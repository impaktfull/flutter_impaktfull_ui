import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/components/divider/divider.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';

export 'divider_style.dart';
part 'divider.describe.dart';

class ImpaktfullUiDivider extends StatelessWidget
    with ComponentDescriptorMixin {
  final EdgeInsetsGeometry? margin;
  final ImpaktfullUiDividerTheme? theme;

  const ImpaktfullUiDivider({
    this.margin,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiDividerTheme>(
      overrideComponentTheme: theme,
      builder: (context, componentTheme) => Container(
        color: componentTheme.colors.color,
        width: double.infinity,
        margin: margin ?? componentTheme.dimens.margin,
        height: 1,
      ),
    );
  }

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}

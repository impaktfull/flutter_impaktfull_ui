import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/components/divider/divider.dart';
import 'package:impaktfull_ui/src/util/descriptor/component_descriptor_mixin.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'divider_style.dart';
part 'divider.describe.dart';

class ImpaktfullUiDivider extends StatelessWidget
    with ComponentDescriptorMixin {
  final EdgeInsetsGeometry? margin;
  final ImpaktfullUiDividerTheme? theme;
  final bool vertical;

  const ImpaktfullUiDivider({
    this.margin,
    this.theme,
    this.vertical = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      component: this,
      overrideComponentTheme: theme,
      builder: (context, componentTheme) => Container(
        color: componentTheme.colors.color,
        width: vertical ? componentTheme.dimens.thickness : double.infinity,
        height: vertical ? double.infinity : componentTheme.dimens.thickness,
        margin: margin ?? componentTheme.dimens.margin,
      ),
    );
  }

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}

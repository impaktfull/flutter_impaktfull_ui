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
  final bool vertical;

  const ImpaktfullUiDivider({
    this.margin,
    this.theme,
    this.vertical = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuilder<ImpaktfullUiDividerTheme>(
      overrideComponentTheme: theme,
      builder: (context, componentTheme) => Container(
        color: componentTheme.colors.color,
        width: vertical ? 1 : double.infinity,
        height: vertical ? double.infinity : 1,
        margin: margin ?? componentTheme.dimens.margin,
      ),
    );
  }

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}

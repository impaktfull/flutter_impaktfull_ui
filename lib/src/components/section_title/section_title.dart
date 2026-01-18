import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/asset/asset_widget.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/button/button.dart';
import 'package:impaktfull_ui/src/components/icon_button/icon_button.dart';
import 'package:impaktfull_ui/src/components/section_title/section_title_style.dart';
import 'package:impaktfull_ui/src/util/extension/widget_list_extensions.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'section_title_style.dart';

class ImpaktfullUiSectionTitle extends StatelessWidget {
  final String title;
  final List<Widget> actions;
  final EdgeInsetsGeometry? margin;
  final TextAlign textAlign;
  final ImpaktfullUiSectionTitleTheme? theme;

  const ImpaktfullUiSectionTitle({
    required this.title,
    this.actions = const [],
    this.margin,
    this.textAlign = TextAlign.start,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      component: this,
      overrideComponentTheme: theme,
      builder: (context, componentTheme) {
        final areAllIconButtons = _areAllValidActions(actions);
        return Padding(
          padding: margin ??
              (areAllIconButtons
                  ? componentTheme.dimens.marginWithIconButtonActions
                  : componentTheme.dimens.margin),
          child: ImpaktfullUiAutoLayout.horizontal(
            crossAxisAlignment: CrossAxisAlignment.end,
            spacing: 8,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: componentTheme.textStyles.title,
                  textAlign: textAlign,
                ),
              ),
              ...actions.overrideColorOnWidgets(componentTheme.colors.icons),
            ],
          ),
        );
      },
    );
  }

  bool _areAllValidActions(List<Widget> actions) {
    if (actions.isEmpty) return false;
    final validActions = <Widget>[];
    for (final action in actions) {
      if (action is ImpaktfullUiIconButton) {
        validActions.add(action);
      } else if (action is ImpaktfullUiAssetWidget) {
        validActions.add(action);
      } else if (action is ImpaktfullUiButton) {
        if (action.size == ImpaktfullUiButtonSize.extraSmall ||
            action.size == ImpaktfullUiButtonSize.small ||
            action.size == ImpaktfullUiButtonSize.medium) {
          validActions.add(action);
        }
      }
    }
    return validActions.length == actions.length;
  }
}

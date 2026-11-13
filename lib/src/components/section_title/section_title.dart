import 'package:material_ui/material_ui.dart';
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

  /// A line of secondary text under the title.
  ///
  /// `null` (the default) shows no subtitle.
  final String? subtitle;

  /// A small line above the title, often in capitals or in the accent colour
  /// (also called an eyebrow), e.g. "STEP 2 OF 3".
  ///
  /// `null` (the default) shows no overline.
  final String? overline;

  /// The widgets at the end of the section title. They are centred
  /// vertically on the text: on the title, or on the [overline], the title
  /// and the [subtitle] together when there is an overline or a subtitle.
  final List<Widget> actions;
  final EdgeInsetsGeometry? margin;

  /// The alignment of the [overline], the [title] and the [subtitle].
  final TextAlign textAlign;
  final ImpaktfullUiSectionTitleTheme? theme;

  const ImpaktfullUiSectionTitle({
    required this.title,
    this.subtitle,
    this.overline,
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
        final textStyles = componentTheme.textStyles;
        final titleText = Text(
          title,
          style: textStyles.title,
          textAlign: textAlign,
        );
        return Padding(
          padding: margin ??
              (areAllIconButtons
                  ? componentTheme.dimens.marginWithIconButtonActions
                  : componentTheme.dimens.margin),
          child: ImpaktfullUiAutoLayout.horizontal(
            // The actions line up with each other and with the title, instead
            // of hanging from the bottom of the tallest one (an icon button
            // next to a button). With an overline or a subtitle they are
            // centred on the whole text block: centring them on the title
            // line would make that line as tall as the actions and push the
            // overline and the subtitle away from the title.
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: componentTheme.dimens.spacing,
            children: [
              Expanded(
                child: overline == null && subtitle == null
                    ? titleText
                    : Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          if (overline != null) ...[
                            Text(
                              overline!,
                              style: textStyles.overline ?? textStyles.title,
                              textAlign: textAlign,
                            ),
                            SizedBox(
                              height: componentTheme.dimens.overlineSpacing,
                            ),
                          ],
                          titleText,
                          if (subtitle != null) ...[
                            SizedBox(
                              height: componentTheme.dimens.subtitleSpacing,
                            ),
                            Text(
                              subtitle!,
                              style: textStyles.subtitle ?? textStyles.title,
                              textAlign: textAlign,
                            ),
                          ],
                        ],
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

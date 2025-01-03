import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/asset/asset_widget.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/placeholder_state/placeholder_state_style.dart';
import 'package:impaktfull_ui/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/util/descriptor/component_descriptor_mixin.dart';

export 'placeholder_state_style.dart';

part 'placeholder_state.describe.dart';

class ImpaktfullUiPlaceholderState extends StatelessWidget
    with ComponentDescriptorMixin {
  final ImpaktfullUiAsset? asset;
  final WidgetBuilder? assetBuilder;
  final String? title;
  final String? subtitle;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final List<Widget> actions;
  final EdgeInsets? margin;
  final ImpaktfullUiPlaceholderStateTheme? theme;

  const ImpaktfullUiPlaceholderState({
    this.theme,
    this.asset,
    this.assetBuilder,
    this.title,
    this.subtitle,
    this.titleStyle,
    this.subtitleStyle,
    this.margin,
    this.actions = const [],
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuilder<ImpaktfullUiPlaceholderStateTheme>(
      overrideComponentTheme: theme,
      builder: (context, componentTheme) => Padding(
        padding: margin ?? componentTheme.dimens.margin,
        child: ImpaktfullUiAutoLayout.vertical(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          spacing: 16,
          children: [
            if (asset != null) ...[
              ImpaktfullUiAssetWidget(
                asset: asset!,
              ),
            ] else if (assetBuilder != null) ...[
              assetBuilder!(context),
            ] else if (actions.isNotEmpty) ...[
              const SizedBox(height: 40),
            ],
            ImpaktfullUiAutoLayout.vertical(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              spacing: 4,
              children: [
                if (title != null) ...[
                  Text(
                    title.toString(),
                    style: titleStyle ?? componentTheme.textStyles.title,
                    textAlign: TextAlign.center,
                  ),
                ],
                if (subtitle != null) ...[
                  Text(
                    subtitle.toString(),
                    style: subtitleStyle ?? componentTheme.textStyles.subtitle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ],
            ),
            ImpaktfullUiAutoLayout.horizontal(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 8,
              children: actions,
            ),
          ],
        ),
      ),
    );
  }

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}

import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/asset/asset_widget.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/card/card.dart';
import 'package:impaktfull_ui/src/components/input_field/input_field.dart';
import 'package:impaktfull_ui/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/util/extension/border_radius_geometry_extension.dart';

class ImpaktfullUiInputFieldAction extends StatelessWidget {
  final String? label;
  final ImpaktfullUiInputFieldTheme? theme;
  final ImpaktfullUiAsset? asset;
  final VoidCallback onTap;

  const ImpaktfullUiInputFieldAction({
    required this.onTap,
    this.label,
    this.asset,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiInputFieldTheme>(
      overrideComponentTheme: theme,
      builder: (context, componentTheme) => ImpaktfullUiCard(
        onTap: onTap,
        borderRadius: BorderRadiusDirectional.only(
          topEnd: componentTheme.dimens.borderRadius.topEnd,
          bottomEnd: componentTheme.dimens.borderRadius.bottomStart,
        ),
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Align(
          alignment: Alignment.center,
          child: ImpaktfullUiAutoLayout.horizontal(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 4,
            children: [
              if (asset != null) ...[
                ImpaktfullUiAssetWidget(
                  asset: asset!,
                  color: componentTheme.textStyles.action.color,
                ),
              ],
              if (label != null) ...[
                Text(
                  label!,
                  style: componentTheme.textStyles.action,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

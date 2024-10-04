import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/asset/asset_widget.dart';
import 'package:impaktfull_ui_2/src/components/card/card.dart';
import 'package:impaktfull_ui_2/src/models/asset.dart';
import 'package:impaktfull_ui_2/src/theme/theme.dart';
import 'package:impaktfull_ui_2/src/util/extension/border_radius_geometry_extension.dart';

class ImpaktfullUiInputFieldAction extends StatelessWidget {
  final String? label;
  final ImpaktfullUiAsset? asset;
  final VoidCallback onTap;

  const ImpaktfullUiInputFieldAction({
    required this.onTap,
    this.label,
    this.asset,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiCard(
      onTap: onTap,
      borderRadius: BorderRadiusDirectional.only(
        topEnd: theme.dimens.borderRadius.topEnd,
        bottomEnd: theme.dimens.borderRadius.bottomStart,
      ),
      height: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Align(
        alignment: Alignment.center,
        child: Builder(
          builder: (context) {
            if (label != null) {
              return Text(
                label!,
                style: theme.textStyles.onCard.text.small,
              );
            }
            return ImpaktfullUiAssetWidget(
              asset: asset!,
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/button/button.dart';
import 'package:impaktfull_ui_2/src/components/wysiwyg/wysiwyg.dart';
import 'package:impaktfull_ui_2/src/models/asset.dart';

class WysiwygActionItem extends StatelessWidget {
  final ImpaktfullUiWysiwygAction action;
  final List<ImpaktfullUiWysiwygAction> actions;
  final ImpaktfullUiAsset asset;
  final VoidCallback onTap;

  const WysiwygActionItem({
    required this.action,
    required this.actions,
    required this.asset,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (!actions.contains(action)) return const SizedBox();
    return ImpaktfullUiButton(
      type: ImpaktfullUiButtonType.secondaryGrey,
      leadingAsset: asset,
      onTap: onTap,
    );
  }
}

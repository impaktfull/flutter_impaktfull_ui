import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

class ImpaktfullUiPinCodeButton extends StatelessWidget {
  final String? value;
  final ImpaktfullUiAsset? asset;
  final VoidCallback? onTap;

  const ImpaktfullUiPinCodeButton({
    required this.onTap,
    this.value,
    this.asset,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiButton(
      type: ImpaktfullUiButtonType.secondary,
      onTap: onTap,
      title: value,
      leadingAsset: asset,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';

class ActionCard extends StatelessWidget {
  final String label;
  final ImpaktfullUiAsset asset;
  final VoidCallback onTap;

  const ActionCard({
    required this.label,
    required this.asset,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiCard(
      onTap: onTap,
      padding: EdgeInsets.zero,
      child: ImpaktfullUiAutoLayout.vertical(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ImpaktfullUiAssetWidget(
              asset: asset,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const ImpaktfullUiDivider(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              label,
              style: theme.textStyles.onCard.text.small,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/asset/asset_widget.dart';
import 'package:impaktfull_ui_2/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui_2/src/models/asset.dart';

class ImpaktfullUiLoadingErrorDataInfo extends StatelessWidget {
  final String? title;
  final String? errorMessage;
  final ImpaktfullUiAsset? asset;
  final WidgetBuilder? assetBuilder;
  final TextStyle? titleStyle;
  final TextStyle? messageStyle;
  final List<Widget> actions;

  const ImpaktfullUiLoadingErrorDataInfo({
    required this.title,
    required this.errorMessage,
    required this.asset,
    required this.assetBuilder,
    required this.titleStyle,
    required this.messageStyle,
    required this.actions,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiAutoLayout.vertical(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
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
          spacing: 4,
          children: [
            if (title != null) ...[
              Text(
                title.toString(),
                style: titleStyle,
                textAlign: TextAlign.center,
              ),
            ],
            if (errorMessage != null) ...[
              Text(
                errorMessage.toString(),
                style: messageStyle,
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
    );
  }
}

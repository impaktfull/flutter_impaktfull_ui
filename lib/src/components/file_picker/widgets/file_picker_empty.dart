import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/asset/asset_widget.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/file_picker/file_picker.dart';

class ImpaktfullUiFilePickerEmpty extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final ImpaktfullUiFilePickerTheme componentTheme;
  const ImpaktfullUiFilePickerEmpty({
    required this.title,
    required this.subtitle,
    required this.componentTheme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 150),
      padding: const EdgeInsets.all(16),
      child: ImpaktfullUiAutoLayout.vertical(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 12,
        children: [
          ImpaktfullUiAssetWidget(
            asset: componentTheme.assets.upload,
          ),
          ImpaktfullUiAutoLayout.vertical(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (title != null) ...[
                Text(
                  title!,
                  style: componentTheme.textStyles.title,
                  textAlign: TextAlign.center,
                ),
              ],
              if (subtitle != null) ...[
                Text(
                  subtitle!,
                  style: componentTheme.textStyles.subtitle,
                  textAlign: TextAlign.center,
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

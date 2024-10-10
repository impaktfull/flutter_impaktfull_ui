import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/asset/asset_widget.dart';
import 'package:impaktfull_ui_2/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui_2/src/components/button/button.dart';
import 'package:impaktfull_ui_2/src/components/file_picker/file_picker.dart';
import 'package:impaktfull_ui_2/src/components/file_picker/model/file_picker_progress_type.dart';
import 'package:impaktfull_ui_2/src/components/file_picker/util/size_calculation_util.dart';
import 'package:impaktfull_ui_2/src/components/icon_button/icon_button.dart';

class ImpaktfullUiFilePickerContent extends StatelessWidget {
  final ImpaktfullUiFilePickerData data;
  final ImpaktfullUiFilePickerProgressType progressType;
  final ImpaktfullUiFilePickerTheme componentTheme;
  final WidgetBuilder? leadingBuilder;
  final VoidCallback? onDeleteTapped;
  final VoidCallback? onRetryTapped;

  const ImpaktfullUiFilePickerContent({
    required this.data,
    required this.progressType,
    required this.componentTheme,
    this.leadingBuilder,
    this.onDeleteTapped,
    this.onRetryTapped,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: ImpaktfullUiAutoLayout.horizontal(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 12,
            children: [
              if (leadingBuilder != null) ...[
                leadingBuilder!(context),
              ] else ...[
                ImpaktfullUiAssetWidget(
                  asset: componentTheme.assets.file,
                  color: componentTheme.colors.icons,
                ),
              ],
              Expanded(
                child: ImpaktfullUiAutoLayout.vertical(
                  children: [
                    Text(
                      data.title,
                      style: componentTheme.textStyles.title,
                    ),
                    Text.rich(
                      style: componentTheme.textStyles.subtitle,
                      TextSpan(
                        children: [
                          if (data.size != null) ...[
                            TextSpan(
                                text: FileSizeCalculationUtil.calculateFileSize(
                                    data.size)),
                          ],
                          if (data.size != null && progressType.showText) ...[
                            const TextSpan(text: ' - '),
                          ],
                          if (progressType.showText) ...[
                            TextSpan(text: '${data.progress * 100}%'),
                          ]
                        ],
                      ),
                    ),
                    if (onRetryTapped != null) ...[
                      ImpaktfullUiButton(
                        type: ImpaktfullUiButtonType.linkGrey,
                        title: 'Retry',
                        onTap: onRetryTapped,
                      ),
                    ],
                  ],
                ),
              ),
              if (onDeleteTapped != null) ...[
                const SizedBox(width: 12),
              ],
            ],
          ),
        ),
        if (onDeleteTapped != null) ...[
          Align(
            alignment: AlignmentDirectional.topEnd,
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: ImpaktfullUiIconButton(
                onTap: onDeleteTapped!,
                asset: componentTheme.assets.delete,
              ),
            ),
          ),
        ],
      ],
    );
  }
}

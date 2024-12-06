import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/asset/asset_widget.dart';
import 'package:impaktfull_ui_2/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui_2/src/components/button/button.dart';
import 'package:impaktfull_ui_2/src/components/file_picker/file_picker.dart';
import 'package:impaktfull_ui_2/src/components/file_picker/model/file_picker_progress_type.dart';
import 'package:impaktfull_ui_2/src/components/icon_button/icon_button.dart';
import 'package:impaktfull_ui_2/src/components/progress_indicator/progress_indicator.dart';
import 'package:impaktfull_ui_2/src/util/file_size/file_size_calculation_util.dart';

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
    final showTextProgress =
        data.progress != null && progressType.textProgressOnly;
    final showLineProgress = data.progress != null && progressType.showLine;
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
                  spacing: 8,
                  children: [
                    ImpaktfullUiAutoLayout.horizontal(
                      children: [
                        Expanded(
                          child: ImpaktfullUiAutoLayout.vertical(
                            children: [
                              Text(
                                data.title,
                                style: componentTheme.textStyles.title,
                              ),
                              if (onRetryTapped == null) ...[
                                Text.rich(
                                  style: componentTheme.textStyles.subtitle,
                                  TextSpan(
                                    children: [
                                      if (data.subtitle != null) ...[
                                        TextSpan(text: data.subtitle!),
                                      ],
                                      if (data.subtitle != null &&
                                          data.size != null) ...[
                                        const TextSpan(text: ' - '),
                                      ],
                                      if (data.size != null) ...[
                                        TextSpan(
                                            text: FileSizeCalculationUtil
                                                .calculateFileSize(data.size!)),
                                      ],
                                      if (data.size != null &&
                                          showTextProgress) ...[
                                        const TextSpan(text: ' - '),
                                      ],
                                      if (showTextProgress) ...[
                                        TextSpan(
                                            text: '${data.progress! * 100}%'),
                                      ]
                                    ],
                                  ),
                                ),
                              ] else ...[
                                Text(
                                  'Failed to upload, please try again later',
                                  style: componentTheme.textStyles.subtitle,
                                ),
                                ImpaktfullUiButton(
                                  type: ImpaktfullUiButtonType.linkGrey,
                                  title: 'Retry',
                                  onTap: onRetryTapped,
                                ),
                              ]
                            ],
                          ),
                        ),
                        if (onDeleteTapped != null) ...[
                          const SizedBox(width: 12),
                        ],
                      ],
                    ),
                    if (onRetryTapped == null && showLineProgress) ...[
                      ImpaktfullUiProgressIndicator(
                        value: data.progress!,
                        showText: progressType.showText,
                        type: ImpaktfullUiProgressIndicatorType.line,
                      ),
                    ]
                  ],
                ),
              ),
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

import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/asset/asset_widget.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/button/button.dart';
import 'package:impaktfull_ui/src/components/file_picker/file_picker.dart';
import 'package:impaktfull_ui/src/components/icon_button/icon_button.dart';
import 'package:impaktfull_ui/src/components/progress_indicator/progress_indicator.dart';
import 'package:impaktfull_ui/src/util/file_size/file_size_calculation_util.dart';
import 'package:impaktfull_ui/src/util/locale/locale_util.dart';
import 'package:impaktfull_ui/src/util/localizations/localizations.dart';

class ImpaktfullUiFilePickerContent extends StatelessWidget {
  final ImpaktfullUiFilePickerData data;
  final ImpaktfullUiFilePickerProgressType progressType;
  final ImpaktfullUiFilePickerTheme componentTheme;
  final WidgetBuilder? leadingBuilder;
  final VoidCallback? onDeleteTapped;
  final VoidCallback? onRetryTapped;
  final ImpaktfullUiFilePickerLocalizations? localizations;

  const ImpaktfullUiFilePickerContent({
    required this.data,
    required this.progressType,
    required this.componentTheme,
    this.leadingBuilder,
    this.onDeleteTapped,
    this.onRetryTapped,
    this.localizations,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = this.localizations ??
        ImpaktfullUiLocalizations.of<ImpaktfullUiFilePickerLocalizations>(
            context);
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
                                                .calculateFileSize(data.size!,
                                                    context: context)),
                                      ],
                                      if (data.size != null &&
                                          showTextProgress) ...[
                                        const TextSpan(text: ' - '),
                                      ],
                                      if (showTextProgress) ...[
                                        TextSpan(
                                            text: ImpaktfullUiLocaleUtil
                                                .formatPercentage(
                                                    context, data.progress!)),
                                      ]
                                    ],
                                  ),
                                ),
                              ] else ...[
                                Text(
                                  localizations.uploadFailed,
                                  style: componentTheme.textStyles.subtitle,
                                ),
                                ImpaktfullUiButton(
                                  type: ImpaktfullUiButtonType.linkGrey,
                                  title: localizations.retryBtn,
                                  onTap: onRetryTapped,
                                ),
                              ]
                            ],
                          ),
                        ),
                        if (onDeleteTapped != null) ...[
                          // Keep the text out of the delete button that is
                          // positioned in the top end corner.
                          const SizedBox(width: 32),
                        ],
                      ],
                    ),
                    if (onRetryTapped == null && showLineProgress) ...[
                      ImpaktfullUiProgressIndicator(
                        value: data.progress!,
                        color: componentTheme.colors.progressIndicator,
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

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/asset/asset_widget.dart';
import 'package:impaktfull_ui_2/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui_2/src/components/button/button.dart';
import 'package:impaktfull_ui_2/src/components/card/card.dart';
import 'package:impaktfull_ui_2/src/components/divider/divider.dart';
import 'package:impaktfull_ui_2/src/components/icon_button/icon_button.dart';
import 'package:impaktfull_ui_2/src/components/metric/metric_style.dart';
import 'package:impaktfull_ui_2/src/components/metric/model/metric_impact_type.dart';
import 'package:impaktfull_ui_2/src/components/metric/model/metric_type.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/models/asset.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';
import 'package:impaktfull_ui_2/src/util/extension/list_extension.dart';
import 'package:impaktfull_ui_2/src/util/text_size/text_size_util.dart';

export 'model/metric_impact_type.dart';
export 'model/metric_type.dart';
export 'metric_style.dart';

part 'metric.describe.dart';

class ImpaktfullUiMetric extends StatelessWidget with ComponentDescriptorMixin {
  final ImpaktfullUiAsset? leadingAsset;
  final WidgetBuilder? leadingBuilder;
  final String title;
  final String? subtitle;
  final String value;
  final String? extraTextValue;
  final ImpaktfullUiAsset? leadingExtraTextValue;
  final WidgetBuilder? leftValueBuilder;
  final WidgetBuilder? bottomValueBuilder;
  final VoidCallback? onTap;
  final VoidCallback? onMoreTapped;
  final ImpaktfullUiMetricType type;
  final ImpaktfullUiMetricImpactType impactType;
  final List<Widget> actions;
  final ImpaktfullUiMetricTheme? theme;

  const ImpaktfullUiMetric({
    required this.title,
    required this.value,
    this.subtitle,
    this.leadingAsset,
    this.leadingBuilder,
    this.extraTextValue,
    this.leadingExtraTextValue,
    this.leftValueBuilder,
    this.bottomValueBuilder,
    this.onTap,
    this.onMoreTapped,
    this.impactType = ImpaktfullUiMetricImpactType.custom,
    this.type = ImpaktfullUiMetricType.simple,
    this.actions = const [],
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiMetricTheme>(
      overrideComponentTheme: theme,
      builder: (context, componentTheme) => ImpaktfullUiCard(
        padding: EdgeInsets.zero,
        onTap: onTap,
        child: Stack(
          children: [
            ImpaktfullUiAutoLayout.vertical(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: ImpaktfullUiAutoLayout.horizontal(
                    spacing: 8,
                    children: [
                      if (leadingBuilder != null) ...[
                        leadingBuilder!(context),
                      ] else if (leadingAsset != null) ...[
                        ImpaktfullUiAssetWidget(
                          asset: leadingAsset!,
                        ),
                      ],
                      Expanded(
                        child: ImpaktfullUiAutoLayout.vertical(
                          spacing: 16,
                          children: [
                            Text(
                              title,
                              style: componentTheme.textStyles.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            ImpaktfullUiAutoLayout.horizontal(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              spacing: 16,
                              children: [
                                ConstrainedBox(
                                  constraints: BoxConstraints(
                                    minWidth: max(
                                      TextSizeUtil.getTextWidth(
                                            context: context,
                                            text: value,
                                            style:
                                                componentTheme.textStyles.value,
                                          ) +
                                          32,
                                      100,
                                    ),
                                  ),
                                  child: ImpaktfullUiAutoLayout.horizontal(
                                    spacing: 8,
                                    children: [
                                      Text(
                                        value,
                                        style: componentTheme.textStyles.value,
                                      ),
                                      if (extraTextValue != null) ...[
                                        ImpaktfullUiAutoLayout.horizontal(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          spacing: 2,
                                          children: [
                                            if (leadingExtraTextValue !=
                                                null) ...[
                                              ImpaktfullUiAssetWidget(
                                                asset: leadingExtraTextValue!,
                                                color: _getValue2Style(
                                                        componentTheme)
                                                    .color,
                                                size: 12,
                                              ),
                                            ],
                                            Text(
                                              extraTextValue!,
                                              style: _getValue2Style(
                                                  componentTheme),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ],
                                  ),
                                ),
                                if (leftValueBuilder != null) ...[
                                  Expanded(
                                    child: Align(
                                      alignment: AlignmentDirectional.centerEnd,
                                      child: leftValueBuilder!(context),
                                    ),
                                  ),
                                ]
                              ],
                            ),
                            if (bottomValueBuilder != null) ...[
                              bottomValueBuilder!(context),
                            ],
                          ],
                        ),
                      ),
                      if (onMoreTapped != null) ...[
                        const SizedBox(width: 32),
                      ]
                    ],
                  ),
                ),
                if (actions.isNotEmpty) ...[
                  const ImpaktfullUiDivider(),
                  Builder(builder: (context) {
                    final isFirstIconButton =
                        actions.first is ImpaktfullUiIconButton;
                    final isLastIconButton =
                        actions.last is ImpaktfullUiIconButton;
                    final containsButton =
                        actions.any((action) => action is ImpaktfullUiButton);
                    final allIconButtons = actions
                        .all((action) => action is ImpaktfullUiIconButton);

                    return Padding(
                      padding: EdgeInsetsDirectional.only(
                        start: isFirstIconButton ? 4 : 16,
                        top: containsButton
                            ? 8
                            : allIconButtons
                                ? 4
                                : 12,
                        bottom: containsButton
                            ? 8
                            : allIconButtons
                                ? 4
                                : 12,
                        end: isLastIconButton ? 4 : 16,
                      ),
                      child: ImpaktfullUiAutoLayout.horizontal(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 8,
                        children: actions,
                      ),
                    );
                  }),
                ],
              ],
            ),
            if (onMoreTapped != null) ...[
              Positioned(
                top: 4,
                right: 4,
                child: ImpaktfullUiIconButton(
                  asset: componentTheme.assets.more,
                  onTap: onMoreTapped!,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  @override
  String describe(BuildContext context) => _describeInstance(context, this);

  TextStyle _getValue2Style(ImpaktfullUiMetricTheme componentTheme) {
    switch (impactType) {
      case ImpaktfullUiMetricImpactType.positive:
        return componentTheme.textStyles.value2Growth;
      case ImpaktfullUiMetricImpactType.neutral:
        return componentTheme.textStyles.value2Neutral;
      case ImpaktfullUiMetricImpactType.negative:
        return componentTheme.textStyles.value2Decline;
      case ImpaktfullUiMetricImpactType.branded:
        return componentTheme.textStyles.value2Branded;
      case ImpaktfullUiMetricImpactType.custom:
        return componentTheme.textStyles.value2Custom;
    }
  }
}

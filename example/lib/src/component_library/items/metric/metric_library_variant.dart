import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/items/metric/metric_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class MetricLibraryVariant
    extends ComponentLibraryVariant<MetricLibraryPrimaryInputs> {
  final ImpaktfullUiMetricType type;
  const MetricLibraryVariant({
    required this.type,
  });

  @override
  String get title => type.name;

  @override
  List<Widget> build(BuildContext context, MetricLibraryPrimaryInputs inputs) {
    return [
      ImpaktfullUiMetric(
        title: 'Last 24 hour sales',
        value: '13 000',
        type: type,
        impactType: inputs.impactType.value!,
        onMoreTapped: () => ImpaktfullUiNotification.show(title: 'More tapped'),
        actions: [
          ImpaktfullUiIconButton(
            onTap: () => ImpaktfullUiNotification.show(title: 'More tapped'),
            asset: theme.assets.icons.share,
          ),
        ],
      ),
      ImpaktfullUiMetric(
        title: 'Last 24 hour sales',
        value: '13 000',
        extraTextValue: '100%',
        leadingExtraTextValue: theme.assets.icons.arrowUp,
        type: type,
        impactType: inputs.impactType.value!,
        onTap: () => ImpaktfullUiNotification.show(title: 'Tap'),
      ),
      ImpaktfullUiMetric(
        title: 'Last 24 hour sales',
        value: '13 000',
        leftValueBuilder: (context) => ImpaktfullUiBadge(
          type: ImpaktfullUiBadgeType.success,
          leadingAsset: theme.assets.icons.arrowUp,
          label: '100%',
        ),
        type: type,
        impactType: inputs.impactType.value!,
        leadingExtraTextValue: theme.assets.icons.arrowUp,
        onTap: () => ImpaktfullUiNotification.show(title: 'Tap'),
      ),
      ImpaktfullUiMetric(
        title: 'Last 24 hour sales',
        value: '13 000',
        leftValueBuilder: (context) => const Placeholder(
          fallbackHeight: 100,
        ),
        type: type,
        impactType: inputs.impactType.value!,
        leadingExtraTextValue: theme.assets.icons.arrowUp,
        onTap: () => ImpaktfullUiNotification.show(title: 'Tap'),
      ),
      ImpaktfullUiMetric(
        title: 'Last 24 hour sales',
        value: '13 000',
        bottomValueBuilder: (context) => const Placeholder(
          fallbackHeight: 100,
        ),
        type: type,
        impactType: inputs.impactType.value!,
        leadingExtraTextValue: theme.assets.icons.arrowUp,
        onTap: () => ImpaktfullUiNotification.show(title: 'Tap'),
      ),
    ];
  }

  @override
  MetricLibraryPrimaryInputs inputs() => MetricLibraryPrimaryInputs();
}

class MetricLibraryPrimaryInputs extends MetricLibraryInputs {}

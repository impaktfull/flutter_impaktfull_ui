import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/loading_error_data/loading_error_data_style.dart';
import 'package:impaktfull_ui_2/src/components/loading_error_data/widget/loading_error_data_info.dart';
import 'package:impaktfull_ui_2/src/components/loading_indicator/loading_indicator.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/models/asset.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';

export 'loading_error_data_style.dart';

part 'loading_error_data.describe.dart';

class ImpaktfullUiLoadingErrorData extends StatelessWidget
    with ComponentDescriptorMixin {
  final bool isLoading;
  final ImpaktfullUiAsset? noDataAsset;
  final WidgetBuilder? noDataAssetBuilder;
  final String? noDataTitle;
  final String? noDataMessage;
  final List<Widget> noDataActions;
  final ImpaktfullUiAsset? errorAsset;
  final WidgetBuilder? errorAssetBuilder;
  final String? errorTitle;
  final String? errorMessage;
  final List<Widget> errorActions;
  final List? items;
  final WidgetBuilder builder;
  final ImpaktfullUiLoadingErrorDataTheme? theme;

  const ImpaktfullUiLoadingErrorData({
    required this.isLoading,
    required this.builder,
    this.noDataAsset,
    this.noDataAssetBuilder,
    this.noDataTitle,
    this.noDataMessage,
    this.noDataActions = const [],
    this.errorAsset,
    this.errorAssetBuilder,
    this.errorTitle,
    this.errorMessage,
    this.errorActions = const [],
    this.items,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiLoadingErrorDataTheme>(
      overrideComponentTheme: theme,
      builder: (context, componentTheme) {
        if (isLoading) {
          return const ImpaktfullUiLoadingIndicator();
        }
        if (errorAsset != null || errorTitle != null || errorMessage != null) {
          return ImpaktfullUiLoadingErrorDataInfo(
            asset: errorAsset,
            assetBuilder: errorAssetBuilder,
            title: errorTitle,
            errorMessage: errorMessage,
            titleStyle: componentTheme.textStyles.errorTitle,
            messageStyle: componentTheme.textStyles.errorMessage,
            actions: errorActions,
          );
        }
        if ((items != null && items!.isEmpty) &&
            (noDataAsset != null ||
                noDataTitle != null ||
                noDataMessage != null)) {
          return ImpaktfullUiLoadingErrorDataInfo(
            asset: noDataAsset,
            assetBuilder: noDataAssetBuilder,
            title: noDataTitle,
            errorMessage: noDataMessage,
            titleStyle: componentTheme.textStyles.noDataTitle,
            messageStyle: componentTheme.textStyles.noDataMessage,
            actions: noDataActions,
          );
        }
        return builder(context);
      },
    );
  }

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}

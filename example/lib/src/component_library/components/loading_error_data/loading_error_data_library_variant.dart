import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/components/loading_error_data/loading_error_data_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/widget/components/components_library_variant_descriptor.dart';

class LoadingErrorDataLibraryVariant
    extends ComponentLibraryVariant<LoadingErrorDataLibraryPrimaryInputs> {
  const LoadingErrorDataLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(
      BuildContext context, LoadingErrorDataLibraryPrimaryInputs inputs) {
    return [
      ComponentsLibraryVariantDescriptor(
        width: 500,
        height: 300,
        wrapWithCard: true,
        alignment: Alignment.center,
        child: ImpaktfullUiLoadingErrorData(
          isLoading: inputs.isLoading.value ?? false,
          noDataTitle: 'No Users found',
          noDataMessage:
              'The search criteria you have entered did not match any users',
          errorTitle: inputs.errorTitle.value,
          errorMessage: inputs.errorMessage.value,
          items: List.generate(
              inputs.itemSize.value ?? 0, (index) => 'User $index'),
          builder: (context) => ImpaktfullUiAssetWidget(
            asset: theme.assets.icons.check,
          ),
        ),
      ),
      ComponentsLibraryVariantDescriptor(
        width: 500,
        height: 300,
        wrapWithCard: true,
        alignment: Alignment.center,
        child: ImpaktfullUiLoadingErrorData(
          isLoading: inputs.isLoading.value ?? false,
          noDataAsset: theme.assets.icons.user,
          noDataTitle: 'No Users found',
          noDataMessage:
              'The search criteria you have entered did not match any users',
          errorTitle: inputs.errorTitle.value,
          errorMessage: inputs.errorMessage.value,
          items: List.generate(
              inputs.itemSize.value ?? 0, (index) => 'User $index'),
          builder: (context) => ImpaktfullUiAssetWidget(
            asset: theme.assets.icons.check,
          ),
        ),
      ),
      ComponentsLibraryVariantDescriptor(
        width: 500,
        height: 300,
        wrapWithCard: true,
        alignment: Alignment.center,
        child: ImpaktfullUiLoadingErrorData(
          isLoading: inputs.isLoading.value ?? false,
          noDataAssetBuilder: (context) => Container(
            decoration: BoxDecoration(
              color: theme.colors.accent,
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(16),
            child: ImpaktfullUiAssetWidget(
              asset: theme.assets.icons.user,
              color: theme.colors.textOnAccent,
            ),
          ),
          noDataTitle: 'No Users found',
          noDataMessage:
              'The search criteria you have entered did not match any users',
          errorTitle: inputs.errorTitle.value,
          errorMessage: inputs.errorMessage.value,
          items: List.generate(
              inputs.itemSize.value ?? 0, (index) => 'User $index'),
          builder: (context) => ImpaktfullUiAssetWidget(
            asset: theme.assets.icons.check,
          ),
        ),
      ),
      ComponentsLibraryVariantDescriptor(
        width: 500,
        height: 300,
        wrapWithCard: true,
        alignment: Alignment.center,
        child: ImpaktfullUiLoadingErrorData(
          isLoading: inputs.isLoading.value ?? false,
          noDataTitle: 'No Users found',
          noDataMessage:
              'The search criteria you have entered did not match any users',
          noDataActions: [
            ImpaktfullUiButton(
              type: ImpaktfullUiButtonType.secondaryGrey,
              title: 'Clear search',
              onTap: () {},
            ),
            ImpaktfullUiButton(
              type: ImpaktfullUiButtonType.primary,
              title: 'Retry',
              onTap: () {},
            ),
          ],
          errorTitle: inputs.errorTitle.value,
          errorMessage: inputs.errorMessage.value,
          errorActions: [
            ImpaktfullUiButton(
              type: ImpaktfullUiButtonType.primary,
              title: 'Retry',
              onTap: () {},
            ),
          ],
          items: List.generate(
              inputs.itemSize.value ?? 0, (index) => 'User $index'),
          builder: (context) => ImpaktfullUiAssetWidget(
            asset: theme.assets.icons.check,
          ),
        ),
      ),
    ];
  }

  @override
  LoadingErrorDataLibraryPrimaryInputs inputs() =>
      LoadingErrorDataLibraryPrimaryInputs();
}

class LoadingErrorDataLibraryPrimaryInputs
    extends LoadingErrorDataLibraryInputs {}

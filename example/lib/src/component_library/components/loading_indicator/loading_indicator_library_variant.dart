import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/components/loading_indicator/loading_indicator_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class LoadingIndicatorVariant
    extends ComponentLibraryVariant<LoadingIndicatorLibraryVariantInputs> {
  LoadingIndicatorVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(
      BuildContext context, LoadingIndicatorLibraryVariantInputs inputs) {
    return [
      const ImpaktfullUiLoadingIndicator(),
      ImpaktfullUiLoadingIndicator(
        color: ImpaktfullUiTheme.of(context).colors.accent,
      ),
      const ImpaktfullUiLoadingIndicator(
        theme: ImpaktfullUiLoadingIndicatorTheme(
          colors: ImpaktfullUiLoadingIndicatorColorTheme(color: Colors.black),
          assets: ImpaktfullUiLoadingIndicatorAssetTheme(lottie: null),
        ),
      ),
      ImpaktfullUiLoadingIndicator(
        color: ImpaktfullUiTheme.of(context).colors.accent,
        theme: const ImpaktfullUiLoadingIndicatorTheme(
          colors: ImpaktfullUiLoadingIndicatorColorTheme(color: Colors.black),
          assets: ImpaktfullUiLoadingIndicatorAssetTheme(lottie: null),
        ),
      ),
    ];
  }

  @override
  LoadingIndicatorLibraryVariantInputs inputs() =>
      LoadingIndicatorLibraryVariantInputs();
}

class LoadingIndicatorLibraryVariantInputs
    extends LoadingIndicatorLibraryInputs {}

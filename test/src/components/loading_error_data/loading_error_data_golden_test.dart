import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';
import '../_data_display_test_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  Widget data(BuildContext context) => const Center(child: Text('Data'));

  runComponentTest(
    fileName: 'impaktfull_ui_loading_error_data',
    columns: 3,
    goldenTests: () => [
      GoldenTest(
        description: 'loading',
        child: frozen(
          goldenBox(
            width: 240,
            height: 240,
            child: ImpaktfullUiLoadingErrorData<int>(
              isLoading: true,
              builder: data,
            ),
          ),
        ),
      ),
      GoldenTest(
        description: 'error',
        child: goldenBox(
          width: 240,
          height: 240,
          child: ImpaktfullUiLoadingErrorData<int>(
            isLoading: false,
            errorTitle: 'Something went wrong',
            errorMessage: 'Please try again later',
            errorActions: [
              ImpaktfullUiButton(
                type: ImpaktfullUiButtonType.secondary,
                title: 'Retry',
                onTap: () {},
              ),
            ],
            builder: data,
          ),
        ),
      ),
      GoldenTest(
        description: 'error with asset',
        child: goldenBox(
          width: 240,
          height: 240,
          child: ImpaktfullUiLoadingErrorData<int>(
            isLoading: false,
            errorAsset: testIcon2,
            errorTitle: 'Error',
            builder: data,
          ),
        ),
      ),
      GoldenTest(
        description: 'no data',
        child: goldenBox(
          width: 240,
          height: 240,
          child: ImpaktfullUiLoadingErrorData<int>(
            isLoading: false,
            items: const [],
            noDataTitle: 'No data',
            noDataMessage: 'Nothing to show yet',
            builder: data,
          ),
        ),
      ),
      GoldenTest(
        description: 'no data with asset builder',
        child: goldenBox(
          width: 240,
          height: 240,
          child: ImpaktfullUiLoadingErrorData<int>(
            isLoading: false,
            items: const [],
            noDataTitle: 'No data',
            noDataAssetBuilder: (context) => Container(
              width: 48,
              height: 48,
              color: Colors.orange,
            ),
            builder: data,
          ),
        ),
      ),
      GoldenTest(
        description: 'data',
        child: goldenBox(
          width: 240,
          height: 240,
          child: ImpaktfullUiLoadingErrorData<int>(
            isLoading: false,
            items: const [1, 2, 3],
            noDataTitle: 'No data',
            builder: data,
          ),
        ),
      ),
      GoldenTest(
        description: 'long error text',
        child: goldenBox(
          width: 240,
          height: 360,
          child: ImpaktfullUiLoadingErrorData<int>(
            isLoading: false,
            errorTitle: longText,
            errorMessage: longText,
            builder: data,
          ),
        ),
      ),
    ],
  );
}

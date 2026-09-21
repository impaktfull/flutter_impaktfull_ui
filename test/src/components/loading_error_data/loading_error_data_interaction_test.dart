import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';
import '../_data_display_test_helpers.dart';

void main() {
  final theme = ImpaktfullUiTheme.getDefault().components.loadingErrorData;

  Widget data(BuildContext context) => const Text('Data');

  testWidgets('loading wins over error and data', (tester) async {
    await pumpComponent(
      tester,
      ImpaktfullUiLoadingErrorData<int>(
        isLoading: true,
        errorTitle: 'Error',
        items: const [],
        noDataTitle: 'No data',
        builder: data,
      ),
    );
    expect(find.byType(ImpaktfullUiLoadingIndicator), findsOneWidget);
    expect(find.text('Error'), findsNothing);
    expect(find.text('Data'), findsNothing);
  });

  testWidgets('error wins over no data and uses the error styles',
      (tester) async {
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiLoadingErrorData<int>(
        isLoading: false,
        errorTitle: 'Error',
        errorMessage: 'Message',
        items: const [],
        noDataTitle: 'No data',
        builder: data,
      ),
    );
    final placeholder = tester.widget<ImpaktfullUiPlaceholder>(
      find.byType(ImpaktfullUiPlaceholder),
    );
    expect(placeholder.title, 'Error');
    expect(placeholder.subtitle, 'Message');
    expect(placeholder.titleStyle, theme.textStyles.errorTitle);
    expect(placeholder.subtitleStyle, theme.textStyles.errorMessage);
    expect(find.text('No data'), findsNothing);
    expect(find.text('Data'), findsNothing);
  });

  for (final (name, widget) in [
    (
      'errorAsset',
      ImpaktfullUiLoadingErrorData<int>(
        isLoading: false,
        errorAsset: testIcon,
        builder: (context) => const Text('Data'),
      ),
    ),
    (
      'errorMessage',
      ImpaktfullUiLoadingErrorData<int>(
        isLoading: false,
        errorMessage: 'Message',
        builder: (context) => const Text('Data'),
      ),
    ),
  ]) {
    testWidgets('$name alone shows the error', (tester) async {
      await pumpAndSettleComponent(tester, widget);
      expect(find.byType(ImpaktfullUiPlaceholder), findsOneWidget);
      expect(find.text('Data'), findsNothing);
    });
  }

  testWidgets(
    'errorAssetBuilder alone shows the error',
    (tester) async {
      await pumpAndSettleComponent(
        tester,
        ImpaktfullUiLoadingErrorData<int>(
          isLoading: false,
          errorAssetBuilder: (context) => const Text('Error asset'),
          builder: data,
        ),
      );
      expect(find.text('Error asset'), findsOneWidget);
      expect(find.text('Data'), findsNothing);
    },
  );

  testWidgets('error actions can be tapped', (tester) async {
    var retries = 0;
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiLoadingErrorData<int>(
        isLoading: false,
        errorTitle: 'Error',
        errorActions: [
          ImpaktfullUiButton(
            type: ImpaktfullUiButtonType.primary,
            title: 'Retry',
            onTap: () => retries++,
          ),
        ],
        builder: data,
      ),
    );
    await tester.tap(find.text('Retry'));
    expect(retries, 1);
  });

  testWidgets('empty items show the no data placeholder', (tester) async {
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiLoadingErrorData<int>(
        isLoading: false,
        items: const [],
        noDataTitle: 'No data',
        noDataMessage: 'Message',
        builder: data,
      ),
    );
    final placeholder = tester.widget<ImpaktfullUiPlaceholder>(
      find.byType(ImpaktfullUiPlaceholder),
    );
    expect(placeholder.title, 'No data');
    expect(placeholder.titleStyle, theme.textStyles.noDataTitle);
    expect(placeholder.subtitleStyle, theme.textStyles.noDataMessage);
    expect(find.text('Data'), findsNothing);
  });

  testWidgets('empty items without no data info show the data', (tester) async {
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiLoadingErrorData<int>(
        isLoading: false,
        items: const [],
        builder: data,
      ),
    );
    expect(find.text('Data'), findsOneWidget);
  });

  testWidgets('items with data show the data', (tester) async {
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiLoadingErrorData<int>(
        isLoading: false,
        items: const [1],
        noDataTitle: 'No data',
        builder: data,
      ),
    );
    expect(find.text('Data'), findsOneWidget);
    expect(find.text('No data'), findsNothing);
  });

  testWidgets('without items (null) the data is shown', (tester) async {
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiLoadingErrorData<int>(
        isLoading: false,
        noDataTitle: 'No data',
        builder: data,
      ),
    );
    expect(find.text('Data'), findsOneWidget);
  });

  testWidgets('goes from loading to data when the parent updates',
      (tester) async {
    var isLoading = true;
    late StateSetter setState;
    await pumpComponent(
      tester,
      StatefulBuilder(
        builder: (context, setter) {
          setState = setter;
          return ImpaktfullUiLoadingErrorData<int>(
            isLoading: isLoading,
            items: const [1],
            builder: data,
          );
        },
      ),
    );
    expect(find.byType(ImpaktfullUiLoadingIndicator), findsOneWidget);
    setState(() => isLoading = false);
    await tester.pumpAndSettle();
    expect(find.byType(ImpaktfullUiLoadingIndicator), findsNothing);
    expect(find.text('Data'), findsOneWidget);
  });
}

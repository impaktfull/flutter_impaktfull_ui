import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';
import '../_inputs_test_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  final icons = ImpaktfullUiTheme.getDefault().assets.icons;
  const items = ['Day', 'Week', 'Month'];

  runComponentTest(
    fileName: 'impaktfull_ui_segmented_control',
    columns: 2,
    goldenTests: () => [
      for (final value in items) ...[
        GoldenTest(
          child: goldenSized(ImpaktfullUiSegmentedControl<String>(
            value: value,
            items: items,
            onChanged: (_) {},
          )),
        ),
      ],
      GoldenTest(
        child: goldenSized(ImpaktfullUiSegmentedControl<String>(
          value: 'Not an item',
          items: items,
          onChanged: (_) {},
        )),
      ),
      GoldenTest(
        child: goldenSized(ImpaktfullUiSegmentedControl<String>(
          value: 'Only',
          items: const ['Only'],
          onChanged: (_) {},
        )),
      ),
      GoldenTest(
        child: goldenSized(ImpaktfullUiSegmentedControl<int>(
          value: 2,
          items: const [1, 2],
          labelBuilder: (context, item) => 'Item $item',
          leadingBuilder: (context, item) =>
              ImpaktfullUiAssetWidget(asset: icons.home, size: 16),
          trailingBuilder: (context, item) =>
              ImpaktfullUiAssetWidget(asset: icons.info, size: 16),
          onChanged: (_) {},
        )),
      ),
    ],
  );
}

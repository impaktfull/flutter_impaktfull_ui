import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';
import '../_data_display_golden_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  runComponentTest(
    fileName: 'impaktfull_ui_badge',
    columns: 3,
    goldenTests: () => [
      for (final type in ImpaktfullUiBadgeType.values) ...[
        for (final size in ImpaktfullUiBadgeSize.values) ...[
          GoldenTest(
            description: '${type.name} ${size.name}',
            child: ImpaktfullUiBadge(
              type: type,
              size: size,
              label: 'Badge',
            ),
          ),
        ],
      ],
    ],
  );

  runComponentTest(
    fileName: 'impaktfull_ui_badge_leading_trailing',
    columns: 3,
    goldenTests: () => [
      for (final size in ImpaktfullUiBadgeSize.values) ...[
        GoldenTest(
          description: 'leading ${size.name}',
          child: ImpaktfullUiBadge(
            type: ImpaktfullUiBadgeType.primary,
            size: size,
            label: 'Leading',
            leadingAsset: testIcon,
          ),
        ),
        GoldenTest(
          description: 'trailing ${size.name}',
          child: ImpaktfullUiBadge(
            type: ImpaktfullUiBadgeType.success,
            size: size,
            label: 'Trailing',
            trailingAsset: testIcon,
          ),
        ),
        GoldenTest(
          description: 'close ${size.name}',
          child: ImpaktfullUiBadge(
            type: ImpaktfullUiBadgeType.error,
            size: size,
            label: 'Close',
            onCloseTap: () {},
          ),
        ),
      ],
    ],
  );

  runComponentTest(
    fileName: 'impaktfull_ui_badge_icon_only',
    goldenTests: () => [
      GoldenTest(
        description: 'no label, only a leading icon',
        child: ImpaktfullUiBadge(
          type: ImpaktfullUiBadgeType.warning,
          label: null,
          leadingAsset: testIcon,
        ),
      ),
    ],
  );
}

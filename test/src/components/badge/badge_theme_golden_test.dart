import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../_layout_test_helpers.dart';

/// Freezes what the per size tokens of the badge make possible: Ant Design's
/// tag (4 px padding, a 4 px radius, 12 px text) next to the default badge.
/// Before them the padding lived on the `ImpaktfullUiBadgeSize` enum.

ImpaktfullUiBadgeTheme get _base =>
    ImpaktfullUiTheme.getDefault().components.badge;

ImpaktfullUiBadgeTheme _antTagTheme() {
  final base = _base;
  return base.copyWith(
    dimens: base.dimens.copyWith(
      borderRadius: BorderRadius.circular(4),
      closeIconSize: 12,
      sizes: base.dimens.sizes.copyWith(
        small: base.dimens.sizes.small.copyWith(
          horizontalPadding: 8,
          verticalPadding: 0,
          spacing: 4,
          widgetSize: 12,
        ),
      ),
    ),
  );
}

Widget _badgeRow(ImpaktfullUiBadgeTheme theme) =>
    ImpaktfullUiAutoLayout.horizontal(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 8,
      children: [
        for (final type in [
          ImpaktfullUiBadgeType.primary,
          ImpaktfullUiBadgeType.success,
          ImpaktfullUiBadgeType.error,
        ])
          ImpaktfullUiBadge(
            type: type,
            title: 'Tag',
            theme: theme,
          ),
        ImpaktfullUiBadge(
          type: ImpaktfullUiBadgeType.neutral,
          title: 'Close',
          theme: theme,
          onCloseTapped: () {},
        ),
        ImpaktfullUiBadge(
          type: ImpaktfullUiBadgeType.warning,
          title: 'Leading',
          leadingAsset: const ImpaktfullUiAsset.icon(Icons.home),
          theme: theme,
        ),
      ],
    );

void main() {
  setUp(() => setupComponentTest());

  runComponentTest(
    fileName: 'impaktfull_ui_badge_size_tokens',
    goldenTests: () => [
      layoutGoldenCase('Ant tag', _badgeRow(_antTagTheme())),
      layoutGoldenCase('Default', _badgeRow(_base)),
    ],
  );
}

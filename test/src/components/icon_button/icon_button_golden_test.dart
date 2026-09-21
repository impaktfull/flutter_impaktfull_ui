import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';

void main() {
  setUp(() => setupComponentTest());

  final icons = ImpaktfullUiTheme.getDefault().assets.icons;

  runComponentTest(
    fileName: 'impaktfull_ui_icon_button',
    columns: 4,
    goldenTests: () => [
      for (final size in [16.0, 24.0, 32.0]) ...[
        GoldenTest(
          child: ImpaktfullUiIconButton(
            asset: icons.add,
            size: size,
            onTap: () {},
          ),
        ),
        GoldenTest(
          child: ImpaktfullUiIconButton(
            asset: icons.delete,
            size: size,
            color: Colors.red,
            onTap: () {},
          ),
        ),
        GoldenTest(
          child: ImpaktfullUiIconButton(
            asset: icons.edit,
            size: size,
            color: Colors.white,
            backgroundColor: Colors.deepPurple,
            onTap: () {},
          ),
        ),
        GoldenTest(
          child: ImpaktfullUiIconButton(
            asset: icons.search,
            size: size,
            showNotificationBadge: true,
            onTap: () {},
          ),
        ),
      ],
      GoldenTest(
        child: ImpaktfullUiIconButton(
          asset: icons.home,
          size: 24,
          notificationBadgeText: '3',
          onTap: () {},
        ),
      ),
      GoldenTest(
        child: ImpaktfullUiIconButton(
          asset: icons.home,
          size: 24,
          notificationBadgeText: '99+',
          notificationBadgeColor: Colors.green,
          onTap: () {},
        ),
      ),
    ],
  );
}

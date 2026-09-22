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

  runComponentTest(
    fileName: 'impaktfull_ui_icon_button_disabled_and_themed',
    columns: 4,
    goldenTests: () => [
      GoldenTest(
        description: 'enabled',
        child: ImpaktfullUiIconButton(asset: icons.add, onTap: () {}),
      ),
      GoldenTest(
        description: 'disabled',
        child: ImpaktfullUiIconButton(asset: icons.add, onTap: null),
      ),
      GoldenTest(
        description: 'disabled with background',
        child: ImpaktfullUiIconButton(
          asset: icons.edit,
          color: Colors.white,
          backgroundColor: Colors.deepPurple,
          onTap: null,
        ),
      ),
      GoldenTest(
        description: 'themed',
        child: ImpaktfullUiIconButton(
          asset: icons.edit,
          onTap: () {},
          theme: ImpaktfullUiIconButtonTheme.fallback.copyWith(
            colors: const ImpaktfullUiIconButtonColorTheme(
              icon: Colors.white,
              background: Colors.teal,
            ),
            dimens: const ImpaktfullUiIconButtonDimensTheme(
              padding: EdgeInsets.all(8),
              iconSize: 24,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ),
        ),
      ),
    ],
  );
}

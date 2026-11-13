import 'package:material_ui/material_ui.dart';
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

  // An outlined icon button with the border colour of each shipped theme.
  ImpaktfullUiIconButtonTheme outlined(
    BuildContext context, {
    double borderWidth = 1,
    BorderRadiusGeometry? borderRadius,
  }) {
    final theme = ImpaktfullUiTheme.of(context);
    final iconButton = theme.components.iconButton;
    return iconButton.copyWith(
      colors: iconButton.colors.copyWith(border: theme.colors.border),
      dimens: iconButton.dimens.copyWith(
        borderRadius: borderRadius,
        borderWidth: borderWidth,
      ),
    );
  }

  runComponentTest(
    fileName: 'impaktfull_ui_icon_button_outlined',
    columns: 4,
    goldenTests: () => [
      GoldenTest(
        description: 'border in the theme',
        child: Builder(
          builder: (context) => ImpaktfullUiIconButton(
            asset: icons.add,
            onTap: () {},
            theme: outlined(context),
          ),
        ),
      ),
      GoldenTest(
        description: 'borderColor, size 24',
        child: ImpaktfullUiIconButton(
          asset: icons.close,
          size: 24,
          borderColor: Colors.deepPurple,
          color: Colors.deepPurple,
          onTap: () {},
        ),
      ),
      GoldenTest(
        description: 'width 2, radius 8, background',
        child: Builder(
          builder: (context) => ImpaktfullUiIconButton(
            asset: icons.edit,
            backgroundColor: Colors.teal.shade50,
            color: Colors.teal,
            onTap: () {},
            theme: outlined(
              context,
              borderWidth: 2,
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
          ),
        ),
      ),
      GoldenTest(
        description: 'disabled',
        child: Builder(
          builder: (context) => ImpaktfullUiIconButton(
            asset: icons.add,
            onTap: null,
            theme: outlined(context),
          ),
        ),
      ),
      GoldenTest(
        description: 'with notification badge',
        child: Builder(
          builder: (context) => ImpaktfullUiIconButton(
            asset: icons.search,
            showNotificationBadge: true,
            onTap: () {},
            theme: outlined(context),
          ),
        ),
      ),
    ],
  );
}

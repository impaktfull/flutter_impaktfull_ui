import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

/// The components whose geometry and state colors a theme is recognized by,
/// in one widget, so the golden of a theme shows at a glance what it does to
/// them, and two themes can be compared side by side.
///
/// Every theme this package ships has a golden of it:
/// `theme_showcase_golden_test.dart` for the impaktfull themes and
/// `presets/*_golden_test.dart` for the design system themes.
///
/// Not a golden helper: it imports no alchemist, so a plain widget test can
/// pump it too.
class ThemeShowcase extends StatelessWidget {
  const ThemeShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ImpaktfullUiTheme.of(context);
    // An explicit width: the golden lays its cases out in a `Table`, which
    // asks for the intrinsic width of its children, and a `LayoutBuilder`
    // (the slider uses one) cannot answer that.
    return SizedBox(
      width: 560,
      child: _build(context, theme),
    );
  }

  Widget _build(BuildContext context, ImpaktfullUiTheme theme) {
    return ImpaktfullUiContainer(
      color: theme.colors.canvas,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: ImpaktfullUiAutoLayout.vertical(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Wrap(
              spacing: 8,
              runSpacing: 8,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                for (final size in [
                  ImpaktfullUiButtonSize.extraSmall,
                  ImpaktfullUiButtonSize.medium,
                  ImpaktfullUiButtonSize.large,
                ])
                  ImpaktfullUiButton(
                    type: ImpaktfullUiButtonType.primary,
                    title: size.name,
                    size: size,
                    onTap: () {},
                  ),
              ],
            ),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                ImpaktfullUiButton(
                  type: ImpaktfullUiButtonType.secondary,
                  title: 'Secondary',
                  onTap: () {},
                ),
                ImpaktfullUiButton(
                  type: ImpaktfullUiButtonType.tertiary,
                  title: 'Tertiary',
                  onTap: () {},
                ),
                ImpaktfullUiButton(
                  type: ImpaktfullUiButtonType.destructivePrimary,
                  title: 'Delete',
                  onTap: () {},
                ),
                const ImpaktfullUiButton(
                  type: ImpaktfullUiButtonType.primary,
                  title: 'Disabled',
                  onTap: null,
                ),
              ],
            ),
            SizedBox(
              width: 320,
              child: ImpaktfullUiInputField(
                label: 'Email',
                hint: 'name@example.com',
                value: '',
                onChanged: (_) {},
              ),
            ),
            Wrap(
              spacing: 16,
              runSpacing: 8,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                // A checkbox centers its box in the space it is given, so it
                // gets exactly the space of its box here.
                SizedBox(
                  width: 24,
                  child: ImpaktfullUiCheckbox(value: true, onChanged: (_) {}),
                ),
                SizedBox(
                  width: 24,
                  child: ImpaktfullUiCheckbox(value: false, onChanged: (_) {}),
                ),
                ImpaktfullUiSwitch(value: true, onChanged: (_) {}),
                ImpaktfullUiSwitch(value: false, onChanged: (_) {}),
                const ImpaktfullUiBadge(
                  title: 'Badge',
                  type: ImpaktfullUiBadgeType.primary,
                ),
                const ImpaktfullUiBadge(
                  title: 'Error',
                  type: ImpaktfullUiBadgeType.error,
                ),
              ],
            ),
            Wrap(
              spacing: 16,
              runSpacing: 8,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                ImpaktfullUiRadioButton<int>(
                  value: 0,
                  groupValue: 0,
                  onChanged: (_) {},
                ),
                ImpaktfullUiRadioButton<int>(
                  value: 1,
                  groupValue: 0,
                  onChanged: (_) {},
                ),
                const ImpaktfullUiBadge(
                  title: 'Success',
                  type: ImpaktfullUiBadgeType.success,
                ),
              ],
            ),
            SizedBox(
              width: 320,
              child: ImpaktfullUiSlider(
                value: 0.4,
                min: 0,
                max: 1,
                onChanged: (_) {},
              ),
            ),
            SizedBox(
              width: 320,
              child: DefaultTabController(
                length: 2,
                child: Builder(
                  builder: (context) {
                    final controller = DefaultTabController.of(context);
                    return ImpaktfullUiTabBar(
                      controller: controller,
                      items: [
                        ImpaktfullUiTabBarItem(
                          title: 'Tab one',
                          index: 0,
                          controller: controller,
                        ),
                        ImpaktfullUiTabBarItem(
                          title: 'Tab two',
                          index: 1,
                          controller: controller,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              width: 320,
              child: ImpaktfullUiSegmentedControl<String>(
                value: 'Segment',
                items: const ['Segment', 'Control'],
                onChanged: (_) {},
              ),
            ),
            const SizedBox(
              width: 320,
              child: ImpaktfullUiNotification(
                title: 'Payment successful',
                subtitle: 'Your payment has been processed.',
                type: ImpaktfullUiNotificationType.success,
              ),
            ),
            const SizedBox(
              width: 320,
              child: ImpaktfullUiNotification(
                title: 'New feature available',
                subtitle: 'We have added dark mode support.',
                type: ImpaktfullUiNotificationType.info,
              ),
            ),
            SizedBox(
              width: 320,
              child: ImpaktfullUiCard(
                child: ImpaktfullUiAutoLayout.vertical(
                  spacing: 4,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Card',
                      style: theme.textStyles.onCard.text.large,
                    ),
                    Text(
                      'A card with the radius, the border and the shadow of '
                      'the design system.',
                      style: theme.textStyles.onCardSecondary.text.small,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

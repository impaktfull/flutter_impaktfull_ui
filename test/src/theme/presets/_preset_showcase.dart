import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

/// The components whose geometry and state colors a design system is
/// recognized by, in one widget, so the golden of a preset shows what the
/// theme does to them.
///
/// Not a golden helper: it imports no alchemist, so a plain widget test can
/// pump it too.
class PresetShowcase extends StatelessWidget {
  const PresetShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ImpaktfullUiTheme.of(context);
    return ImpaktfullUiContainer(
      color: theme.colors.canvas,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: ImpaktfullUiAutoLayout.vertical(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ImpaktfullUiAutoLayout.horizontal(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
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
            ImpaktfullUiAutoLayout.horizontal(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
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
            ImpaktfullUiAutoLayout.horizontal(
              spacing: 16,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                ImpaktfullUiCheckbox(value: true, onChanged: (_) {}),
                ImpaktfullUiCheckbox(value: false, onChanged: (_) {}),
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

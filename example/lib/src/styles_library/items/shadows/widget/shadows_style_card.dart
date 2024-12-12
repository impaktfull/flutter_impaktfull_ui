import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

class ShadowsStyleCard extends StatelessWidget {
  final List<BoxShadow> shadow;
  final String label;

  const ShadowsStyleCard({
    required this.shadow,
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiCard(
      padding: EdgeInsets.zero,
      child: ImpaktfullUiAutoLayout.vertical(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                boxShadow: shadow,
                borderRadius: theme.dimens.borderRadius,
                color: theme.colors.card,
              ),
            ),
          ),
          const ImpaktfullUiDivider(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              label,
              style: theme.textStyles.onCanvas.text.medium,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';

class ExampleCard extends StatelessWidget {
  final String label;
  final WidgetBuilder builder;
  final VoidCallback onTap;

  const ExampleCard({
    required this.label,
    required this.builder,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiCard(
      onTap: onTap,
      padding: EdgeInsets.zero,
      child: ImpaktfullUiAutoLayout.vertical(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: LayoutBuilder(builder: (context, constraints) {
              return IgnorePointer(
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: constraints.maxWidth * 5,
                    height: constraints.maxHeight * 5,
                    child: builder(context),
                  ),
                ),
              );
            }),
          ),
          const ImpaktfullUiDivider(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              label,
              style: theme.textStyles.onCard.text.small,
            ),
          ),
        ],
      ),
    );
  }
}

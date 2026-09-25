import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/widget/component/components_library_variant_descriptor.dart';

class ComponentCard extends StatelessWidget {
  final Widget child;
  final String label;
  final VoidCallback onTap;

  const ComponentCard({
    required this.child,
    required this.label,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ImpaktfullUiTheme.of(context);
    var isScrollable = false;
    var correctChild = child;
    if (correctChild is ComponentsLibraryVariantDescriptor) {
      // ignore: unnecessary_cast
      final descriptor = correctChild as ComponentsLibraryVariantDescriptor;
      correctChild = descriptor.child;
      isScrollable = descriptor.isScrollable;
    }
    return ImpaktfullUiCard(
      onTap: onTap,
      padding: EdgeInsets.zero,
      child: ImpaktfullUiAutoLayout.vertical(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) => FittedBox(
                fit: BoxFit.cover,
                child: Container(
                  width: constraints.maxWidth * 1.5,
                  height: constraints.maxHeight * 1.5,
                  color: theme.colors.canvas,
                  alignment: Alignment.center,
                  child: IgnorePointer(
                    child: Focus(
                      descendantsAreFocusable: false,
                      child: ClipRect(
                        child: Center(
                          child: Builder(builder: (context) {
                            if (isScrollable) {
                              return SingleChildScrollView(
                                padding: const EdgeInsets.all(16),
                                child: correctChild,
                              );
                            }
                            // A preview is clipped on purpose, so a component
                            // that is taller than the card (the date picker)
                            // gets the height it asks for and is cut off,
                            // instead of overflowing inside the card.
                            return OverflowBox(
                              minHeight: 0,
                              maxHeight: double.infinity,
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: correctChild,
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
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

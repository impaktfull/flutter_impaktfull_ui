import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/widget/components/components_library_variant_descriptor.dart';

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
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: theme.colors.canvas,
              alignment: Alignment.center,
              child: IgnorePointer(
                child: Focus(
                  descendantsAreFocusable: false,
                  child: ClipRect(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Center(
                        child: Builder(builder: (context) {
                          if (isScrollable) {
                            return SingleChildScrollView(
                              child: correctChild,
                            );
                          }
                          return correctChild;
                        }),
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

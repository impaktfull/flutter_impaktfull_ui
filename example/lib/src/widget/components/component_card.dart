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
    var correctChild = child;
    if (correctChild is ComponentsLibraryVariantDescriptor) {
      correctChild = (child as ComponentsLibraryVariantDescriptor).child;
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
              padding: const EdgeInsets.all(16),
              alignment: Alignment.center,
              child: IgnorePointer(
                child: Focus(
                  descendantsAreFocusable: false,
                  child: correctChild,
                ),
              ),
            ),
          ),
          const ImpaktfullUiDivider(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              label.replaceAll('ImpaktfullUi', ''),
              style: theme.textStyles.onCard.text.small,
            ),
          ),
        ],
      ),
    );
  }
}

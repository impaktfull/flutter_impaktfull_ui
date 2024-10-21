import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_inputs_widget.dart';
import 'package:impaktfull_ui_example/src/widget/component/components_library_variant_descriptor.dart';

class ComponentsLibraryVariantScreen<T extends ComponentLibraryInputs?> extends StatefulWidget {
  final ComponentLibraryVariant<T> variant;
  final bool showInputs;
  const ComponentsLibraryVariantScreen({
    required this.variant,
    required this.showInputs,
    super.key,
  });

  @override
  State<ComponentsLibraryVariantScreen> createState() => _ComponentsLibraryVariantScreenState<T>();
}

class _ComponentsLibraryVariantScreenState<T extends ComponentLibraryInputs?>
    extends State<ComponentsLibraryVariantScreen> {
  late final T inputs;

  @override
  void initState() {
    super.initState();
    inputs = widget.variant.inputs() as T;
    inputs?.setup(_onUpdate);
  }

  @override
  void dispose() {
    inputs?.dispose(_onUpdate);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final widgets = widget.variant.build(context, inputs);
    return ImpaktfullUiThemeBuidler(
      builder: (context, theme) => ImpaktfullUiAutoLayout.vertical(
        children: [
          Expanded(
            child: ImpaktfullUiListView.builder(
              padding: const EdgeInsets.all(32),
              spacing: 8,
              items: widgets,
              itemBuilder: (context, item, index) => ComponentsLibraryVariantDescriptor(
                child: item,
              ),
              noDataLabel: 'No widgets for ${widget.variant.runtimeType}',
            ),
          ),
          if (widget.showInputs) ...[
            ComponentsLibraryInputsWidget(
              inputs: inputs!,
            ),
          ],
        ],
      ),
    );
  }

  void _onUpdate() => setState(() {});
}

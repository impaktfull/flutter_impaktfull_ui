import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/component_library.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_inputs_widget.dart';

class ComponentsLibraryVariantScreen<T extends ComponentLibraryInputs?> extends StatefulWidget {
  final ComponentLibraryVariant<T> variant;
  const ComponentsLibraryVariantScreen({
    required this.variant,
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
      builder: (context, theme) => Scaffold(
        body: Column(
          children: [
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: widgets.length,
                itemBuilder: (BuildContext context, int index) => Align(
                  alignment: Alignment.centerLeft,
                  child: widgets[index],
                ),
                separatorBuilder: (context, index) => const SizedBox(height: 8),
              ),
            ),
            ComponentsLibraryInputsWidget(
              inputs: inputs!,
            ),
          ],
        ),
      ),
    );
  }

  void _onUpdate() => setState(() {});
}

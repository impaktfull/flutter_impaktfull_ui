import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';

class ComponentsLibraryInputsWidget extends StatefulWidget {
  final ComponentLibraryInputs inputs;

  const ComponentsLibraryInputsWidget({
    required this.inputs,
    super.key,
  });

  @override
  State<ComponentsLibraryInputsWidget> createState() => _ComponentsLibraryInputsWidgetState();
}

class _ComponentsLibraryInputsWidgetState extends State<ComponentsLibraryInputsWidget> {
  late final List<ComponentLibraryInputItem> inputs;

  @override
  void initState() {
    super.initState();
    inputs = widget.inputs.buildInputItems();
  }

  @override
  Widget build(BuildContext context) {
    if (inputs.isEmpty) return const SizedBox();
    return Expanded(
      child: ImpaktfullUiThemeBuidler(
        builder: (context, theme) => Container(
          decoration: BoxDecoration(
            color: theme.colors.card,
            border: Border(
              top: BorderSide(
                color: theme.colors.border,
                width: 2,
              ),
            ),
          ),
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: inputs.length,
            itemBuilder: (context, index) {
              final input = inputs[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  Text(
                    input.label,
                    style: theme.textStyles.onCard.text.medium,
                  ),
                  input.build(context),
                  const SizedBox(height: 16),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
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
        builder: (context, theme) => ImpaktfullUiCard(
          padding: EdgeInsets.zero,
          child: ListView.builder(
            padding: const EdgeInsets.all(32),
            itemCount: inputs.length,
            itemBuilder: (context, index) {
              final input = inputs[index];
              return ImpaktfullUiAutoLayout.vertical(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  Text(
                    input.label,
                    style: theme.textStyles.onCard.text.medium,
                  ),
                  if (input.extraInfo != null) ...[
                    Text(
                      input.extraInfo!,
                      style: theme.textStyles.onCardTertiary.text.extraSmall.light,
                    ),
                  ],
                  const SizedBox(height: 4),
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

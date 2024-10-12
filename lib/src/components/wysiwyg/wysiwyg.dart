import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui_2/src/components/button/button.dart';
import 'package:impaktfull_ui_2/src/components/input_field/input_field.dart';
import 'package:impaktfull_ui_2/src/components/wysiwyg/widget/actions/wysiwig_actions.dart';
import 'package:impaktfull_ui_2/src/components/wysiwyg/widget/wysiwig_preview.dart';
import 'package:impaktfull_ui_2/src/components/wysiwyg/wysiwyg.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';

export 'wysiwyg_style.dart';
export 'model/wysiwyg_type.dart';
export 'model/wysiwyg_action.dart';

part 'wysiwyg.describe.dart';

class ImpaktfullUiWysiwyg extends StatefulWidget with ComponentDescriptorMixin {
  final ImpaktfullUiWysiwygType type;
  final List<ImpaktfullUiWysiwygAction> actions;
  final ImpaktfullUiWysiwygTheme? theme;

  const ImpaktfullUiWysiwyg({
    this.type = ImpaktfullUiWysiwygType.html,
    this.actions = ImpaktfullUiWysiwygAction.basicValues,
    this.theme,
    super.key,
  });

  @override
  State<ImpaktfullUiWysiwyg> createState() => _ImpaktfullUiWysiwygState();

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}

class _ImpaktfullUiWysiwygState extends State<ImpaktfullUiWysiwyg> {
  final _controller = TextEditingController();
  var _showPreview = false;
  var _text = '';
  var _selection = const TextSelection.collapsed(offset: 0);

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onSelectionChanged);
  }

  @override
  void dispose() {
    _controller.removeListener(_onSelectionChanged);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiWysiwygTheme>(
      overrideComponentTheme: widget.theme,
      builder: (context, componentTheme) => ImpaktfullUiAutoLayout.vertical(
        spacing: 4,
        children: [
          ImpaktfullUiAutoLayout.horizontal(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (_showPreview) ...[
                ImpaktfullUiButton(
                  type: ImpaktfullUiButtonType.secondaryGrey,
                  title: 'Editor',
                  onTap: _onEditorTapped,
                ),
              ] else ...[
                ImpaktfullUiButton(
                  type: ImpaktfullUiButtonType.secondaryGrey,
                  title: 'Preview',
                  onTap: _onPreviewTapped,
                ),
                Expanded(
                  child: WysiwygActions(
                    text: _text,
                    type: widget.type,
                    actions: widget.actions,
                    onChangedText: _onTextChanged,
                    componentTheme: componentTheme,
                    selectedText: _selection.textInside(_text),
                  ),
                ),
              ],
            ],
          ),
          if (_showPreview) ...[
            WysiwygPreview(
              text: _text,
              type: widget.type,
              componentTheme: componentTheme,
            ),
          ] else ...[
            ImpaktfullUiInputField(
              controller: _controller,
              value: _text,
              onChanged: _onTextChanged,
            ),
          ],
        ],
      ),
    );
  }

  void _onEditorTapped() {
    setState(() {
      _showPreview = false;
    });
  }

  void _onPreviewTapped() {
    setState(() {
      _showPreview = true;
    });
  }

  void _onTextChanged(String value) {
    setState(() => _text = value);
  }

  void _onSelectionChanged() {
    setState(() {
      _selection = _controller.selection;
    });
  }
}

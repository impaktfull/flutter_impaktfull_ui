import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/button/button.dart';
import 'package:impaktfull_ui/src/components/wysiwyg/widget/wysiwyg_input.dart';
import 'package:impaktfull_ui/src/components/wysiwyg/widget/wysiwyg_preview.dart';
import 'package:impaktfull_ui/src/components/wysiwyg/wysiwyg.dart';
import 'package:impaktfull_ui/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui/src/util/descriptor/component_descriptor_mixin.dart';

export 'wysiwyg_style.dart';
export 'model/wysiwyg_type.dart';
export 'model/wysiwyg_action.dart';

part 'wysiwyg.describe.dart';

class ImpaktfullUiWysiwyg extends StatefulWidget with ComponentDescriptorMixin {
  final String text;
  final bool showPreview;
  final ImpaktfullUiWysiwygType type;
  final ValueChanged<String> onChanged;
  final List<ImpaktfullUiWysiwygAction> actions;
  final ImpaktfullUiWysiwygTheme? theme;

  const ImpaktfullUiWysiwyg({
    required this.text,
    required this.onChanged,
    this.showPreview = true,
    this.type = ImpaktfullUiWysiwygType.markdown,
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
  var _showPreview = false;

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiWysiwygTheme>(
      overrideComponentTheme: widget.theme,
      builder: (context, componentTheme) => ImpaktfullUiAutoLayout.vertical(
        mainAxisSize: MainAxisSize.min,
        spacing: 4,
        children: [
          if (widget.showPreview) ...[
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
                ],
              ],
            ),
          ],
          if (_showPreview) ...[
            WysiwygPreview(
              text: widget.text,
              type: widget.type,
            ),
          ] else ...[
            ImpaktfullUiWysiwygInputField(
              type: widget.type,
              actions: widget.actions,
              value: widget.text,
              onChanged: widget.onChanged,
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
}

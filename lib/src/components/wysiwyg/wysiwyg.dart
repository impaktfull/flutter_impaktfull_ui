import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui_2/src/components/button/button.dart';
import 'package:impaktfull_ui_2/src/components/input_field/input_field.dart';
import 'package:impaktfull_ui_2/src/components/wysiwyg/widget/wysiwyg_action_item.dart';
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
                  child: Wrap(
                      alignment: WrapAlignment.end,
                      children: <WysiwygActionItem>[
                        WysiwygActionItem(
                          action: ImpaktfullUiWysiwygAction.bold,
                          actions: widget.actions,
                          asset: componentTheme.assets.bold,
                          onTap: _onBoldTapped,
                        ),
                        WysiwygActionItem(
                          action: ImpaktfullUiWysiwygAction.italic,
                          actions: widget.actions,
                          asset: componentTheme.assets.italic,
                          onTap: _onItalicTapped,
                        ),
                        WysiwygActionItem(
                          action: ImpaktfullUiWysiwygAction.orderedList,
                          actions: widget.actions,
                          asset: componentTheme.assets.orderedList,
                          onTap: _onOrderedListTapped,
                        ),
                        WysiwygActionItem(
                          action: ImpaktfullUiWysiwygAction.unorderedList,
                          actions: widget.actions,
                          asset: componentTheme.assets.unorderedList,
                          onTap: _onUnorderedListTapped,
                        ),
                        WysiwygActionItem(
                          action: ImpaktfullUiWysiwygAction.link,
                          actions: widget.actions,
                          asset: componentTheme.assets.link,
                          onTap: _onLinkTapped,
                        ),
                        WysiwygActionItem(
                          action: ImpaktfullUiWysiwygAction.photo,
                          actions: widget.actions,
                          asset: componentTheme.assets.photo,
                          onTap: _onPhotoTapped,
                        ),
                      ]..removeWhere((item) => !item.actions.contains(item.action))),
                ),
              ],
            ],
          ),
          if (_showPreview) ...[
            Text(
              _text,
              style: componentTheme.textStyles.previewText,
            ),
          ] else ...[
            ImpaktfullUiInputField(
              controller: _controller,
              value: _text,
              onChanged: _onChanged,
            ),
          ],
        ],
      ),
    );
  }

  void _onChanged(String value) {
    setState(() => _text = value);
  }

  void _onBoldTapped() {}

  void _onItalicTapped() {}

  void _onOrderedListTapped() {}

  void _onUnorderedListTapped() {}

  void _onLinkTapped() {}

  void _onPhotoTapped() {}

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

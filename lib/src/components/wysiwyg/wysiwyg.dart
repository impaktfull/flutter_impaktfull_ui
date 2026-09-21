import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/button/button.dart';
import 'package:impaktfull_ui/src/components/wysiwyg/widget/wysiwyg_input.dart';
import 'package:impaktfull_ui/src/components/wysiwyg/widget/wysiwyg_preview.dart';
import 'package:impaktfull_ui/src/components/wysiwyg/wysiwyg.dart';
import 'package:impaktfull_ui/src/util/localizations/localizations.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'wysiwyg.localizations.dart';
export 'wysiwyg_style.dart';
export 'model/wysiwyg_type.dart';
export 'model/wysiwyg_action.dart';

class ImpaktfullUiWysiwyg extends StatefulWidget {
  final String text;
  final bool showPreview;
  final ImpaktfullUiWysiwygType type;
  final ValueChanged<String> onChanged;
  final List<ImpaktfullUiWysiwygAction> actions;
  final ImpaktfullUiWysiwygTheme? theme;

  /// The texts of the editor. Defaults to the localizations of the app.
  final ImpaktfullUiWysiwygLocalizations? localizations;

  const ImpaktfullUiWysiwyg({
    required this.text,
    required this.onChanged,
    this.showPreview = true,
    this.type = ImpaktfullUiWysiwygType.markdown,
    this.actions = ImpaktfullUiWysiwygAction.basicValues,
    this.theme,
    this.localizations,
    super.key,
  });

  @override
  State<ImpaktfullUiWysiwyg> createState() => _ImpaktfullUiWysiwygState();
}

class _ImpaktfullUiWysiwygState extends State<ImpaktfullUiWysiwyg> {
  var _showPreview = false;

  @override
  Widget build(BuildContext context) {
    final localizations = widget.localizations ??
        ImpaktfullUiLocalizations.of<ImpaktfullUiWysiwygLocalizations>(context);
    return ImpaktfullUiOverridableComponentBuilder(
      component: widget,
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
                    title: localizations.editorBtn,
                    onTap: _onEditorTapped,
                  ),
                ] else ...[
                  ImpaktfullUiButton(
                    type: ImpaktfullUiButtonType.secondaryGrey,
                    title: localizations.previewBtn,
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
              localizations: localizations,
              theme: widget.theme,
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

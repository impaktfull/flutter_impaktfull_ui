import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/wysiwyg/widget/actions/wysiwyg_action_item.dart';
import 'package:impaktfull_ui_2/src/components/wysiwyg/wysiwyg.dart';

class WysiwygActions extends StatefulWidget {
  final List<ImpaktfullUiWysiwygAction> actions;
  final String text;
  final ImpaktfullUiWysiwygType type;
  final ValueChanged<String> onChangedText;
  final ImpaktfullUiWysiwygTheme componentTheme;
  final String selectedText;

  const WysiwygActions({
    required this.text,
    required this.type,
    required this.actions,
    required this.onChangedText,
    required this.componentTheme,
    required this.selectedText,
    super.key,
  });

  @override
  State<WysiwygActions> createState() => _WysiwygActionsState();
}

class _WysiwygActionsState extends State<WysiwygActions> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
        alignment: WrapAlignment.end,
        children: <WysiwygActionItem>[
          WysiwygActionItem(
            action: ImpaktfullUiWysiwygAction.bold,
            actions: widget.actions,
            asset: widget.componentTheme.assets.bold,
            onTap: _onBoldTapped,
          ),
          WysiwygActionItem(
            action: ImpaktfullUiWysiwygAction.italic,
            actions: widget.actions,
            asset: widget.componentTheme.assets.italic,
            onTap: _onItalicTapped,
          ),
          WysiwygActionItem(
            action: ImpaktfullUiWysiwygAction.unorderedList,
            actions: widget.actions,
            asset: widget.componentTheme.assets.unorderedList,
            onTap: _onUnorderedListTapped,
          ),
          WysiwygActionItem(
            action: ImpaktfullUiWysiwygAction.link,
            actions: widget.actions,
            asset: widget.componentTheme.assets.link,
            onTap: _onLinkTapped,
          ),
          WysiwygActionItem(
            action: ImpaktfullUiWysiwygAction.photo,
            actions: widget.actions,
            asset: widget.componentTheme.assets.photo,
            onTap: _onPhotoTapped,
          ),
        ]..removeWhere((item) => !item.actions.contains(item.action)));
  }

  void _onBoldTapped() {
    _wrapSelectedText('**', '**');
  }

  void _onItalicTapped() {
    _wrapSelectedText('*', '*');
  }

  void _onUnorderedListTapped() {
    _wrapSelectedText('\n- ', '\n');
  }

  void _onLinkTapped() {
    _wrapSelectedText('[', '](url)');
  }

  void _onPhotoTapped() {
    _wrapSelectedText('![', '](url)');
  }

  void _wrapSelectedText(String prefix, [String suffix = '']) {
    if (widget.selectedText.isEmpty) return;
    final newText = widget.text.replaceRange(
      widget.text.indexOf(widget.selectedText),
      widget.text.indexOf(widget.selectedText) + widget.selectedText.length,
      '$prefix${widget.selectedText}$suffix',
    );
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (!mounted) return;
      widget.onChangedText(newText);
    });
  }
}

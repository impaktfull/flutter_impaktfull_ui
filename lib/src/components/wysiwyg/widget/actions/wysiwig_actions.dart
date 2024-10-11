import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/wysiwyg/widget/actions/wysiwyg_action_item.dart';
import 'package:impaktfull_ui_2/src/components/wysiwyg/wysiwyg.dart';

class WysiwygActions extends StatelessWidget {
  final List<ImpaktfullUiWysiwygAction> actions;
  final String text;
  final ImpaktfullUiWysiwygType type;
  final ValueChanged<String> onChangedText;
  final ImpaktfullUiWysiwygTheme componentTheme;
  const WysiwygActions({
    required this.text,
    required this.type,
    required this.actions,
    required this.onChangedText,
    required this.componentTheme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
        alignment: WrapAlignment.end,
        children: <WysiwygActionItem>[
          WysiwygActionItem(
            action: ImpaktfullUiWysiwygAction.bold,
            actions: actions,
            asset: componentTheme.assets.bold,
            onTap: _onBoldTapped,
          ),
          WysiwygActionItem(
            action: ImpaktfullUiWysiwygAction.italic,
            actions: actions,
            asset: componentTheme.assets.italic,
            onTap: _onItalicTapped,
          ),
          WysiwygActionItem(
            action: ImpaktfullUiWysiwygAction.orderedList,
            actions: actions,
            asset: componentTheme.assets.orderedList,
            onTap: _onOrderedListTapped,
          ),
          WysiwygActionItem(
            action: ImpaktfullUiWysiwygAction.unorderedList,
            actions: actions,
            asset: componentTheme.assets.unorderedList,
            onTap: _onUnorderedListTapped,
          ),
          WysiwygActionItem(
            action: ImpaktfullUiWysiwygAction.link,
            actions: actions,
            asset: componentTheme.assets.link,
            onTap: _onLinkTapped,
          ),
          WysiwygActionItem(
            action: ImpaktfullUiWysiwygAction.photo,
            actions: actions,
            asset: componentTheme.assets.photo,
            onTap: _onPhotoTapped,
          ),
        ]..removeWhere((item) => !item.actions.contains(item.action)));
  }

  void _onBoldTapped() {}

  void _onItalicTapped() {}

  void _onOrderedListTapped() {}

  void _onUnorderedListTapped() {}

  void _onLinkTapped() {}

  void _onPhotoTapped() {}
}

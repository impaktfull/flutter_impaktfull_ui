import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui_2/src/components/notification/notification.dart';
import 'package:impaktfull_ui_2/src/components/wysiwyg/formatter/wysiwyg_bold_formatter.dart';
import 'package:impaktfull_ui_2/src/components/wysiwyg/formatter/wysiwyg_formatter.dart';
import 'package:impaktfull_ui_2/src/components/wysiwyg/formatter/wysiwyg_italic_formatter.dart';
import 'package:impaktfull_ui_2/src/components/wysiwyg/widget/actions/wysiwyg_action_item.dart';
import 'package:impaktfull_ui_2/src/components/wysiwyg/wysiwyg.dart';

class WysiwygActions extends StatefulWidget {
  final List<ImpaktfullUiWysiwygAction> actions;
  final String text;
  final ImpaktfullUiWysiwygType type;
  final Function(String, TextSelection?) onChangedText;
  final ImpaktfullUiWysiwygTheme componentTheme;
  final TextSelection? textSelected;

  const WysiwygActions({
    required this.text,
    required this.type,
    required this.actions,
    required this.onChangedText,
    required this.componentTheme,
    required this.textSelected,
    super.key,
  });

  @override
  State<WysiwygActions> createState() => _WysiwygActionsState();
}

class _WysiwygActionsState extends State<WysiwygActions> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: ImpaktfullUiAutoLayout.horizontal(
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
            action: ImpaktfullUiWysiwygAction.orderdList,
            actions: widget.actions,
            asset: widget.componentTheme.assets.orderedList,
            onTap: _onOrderedListTapped,
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
        ]..removeWhere((item) => !item.actions.contains(item.action)),
      ),
    );
  }

  void _onBoldTapped() => _format(const ImpaktfullUiWysiwygBoldFormatter());

  void _onItalicTapped() => _format(const ImpaktfullUiWysiwygItalicFormatter());

  void _onUnorderedListTapped() {
    ImpaktfullUiNotification.show(
      title: 'Not yet supported',
      subtitle: 'Unordered list is not yet supported',
      type: ImpaktfullUiNotificationType.warning,
    );
  }

  void _onOrderedListTapped() {
    ImpaktfullUiNotification.show(
      title: 'Not yet supported',
      subtitle: 'Ordered list is not yet supported',
      type: ImpaktfullUiNotificationType.warning,
    );
  }

  Future<void> _onLinkTapped() async {
    ImpaktfullUiNotification.show(
      title: 'Not yet supported',
      subtitle: 'Link is not yet supported',
      type: ImpaktfullUiNotificationType.warning,
    );
  }

  Future<void> _onPhotoTapped() async {
    ImpaktfullUiNotification.show(
      title: 'Not yet supported',
      subtitle: 'Photo is not yet supported',
      type: ImpaktfullUiNotificationType.warning,
    );
  }

  void _format(ImpaktfullUiWysiwygFormatter formatter) {
    final result = formatter.format(widget.text, widget.textSelected);
    widget.onChangedText(result.text, result.textSelection);
  }
}

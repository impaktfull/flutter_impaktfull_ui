import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/list_view/list_view.dart';
import 'package:impaktfull_ui_2/src/components/notification/notification.dart';
import 'package:impaktfull_ui_2/src/components/wysiwyg/formatter/wysiwyg_bold_formatter.dart';
import 'package:impaktfull_ui_2/src/components/wysiwyg/formatter/wysiwyg_code_block_formatter.dart';
import 'package:impaktfull_ui_2/src/components/wysiwyg/formatter/wysiwyg_code_formatter.dart';
import 'package:impaktfull_ui_2/src/components/wysiwyg/formatter/wysiwyg_formatter.dart';
import 'package:impaktfull_ui_2/src/components/wysiwyg/formatter/wysiwyg_header_formatter.dart';
import 'package:impaktfull_ui_2/src/components/wysiwyg/formatter/wysiwyg_italic_formatter.dart';
import 'package:impaktfull_ui_2/src/components/wysiwyg/formatter/wysiwyg_link_formatter.dart';
import 'package:impaktfull_ui_2/src/components/wysiwyg/formatter/wysiwyg_photo_formatter.dart';
import 'package:impaktfull_ui_2/src/components/wysiwyg/formatter/wysiwyg_unorderedlist_formatter.dart';
import 'package:impaktfull_ui_2/src/components/wysiwyg/widget/actions/wysiwyg_action_item.dart';
import 'package:impaktfull_ui_2/src/components/wysiwyg/wysiwyg.dart';

class WysiwygActions extends StatefulWidget {
  final List<ImpaktfullUiWysiwygAction> actions;
  final String text;
  final ImpaktfullUiWysiwygType type;
  final Function(String, TextSelection) onChangedText;
  final ImpaktfullUiWysiwygTheme componentTheme;
  final TextSelection textSelected;

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
    return Container(
      height: 48,
      padding: const EdgeInsets.all(4),
      child: ImpaktfullUiListView(
        scrollDirection: Axis.horizontal,
        children: <WysiwygActionItem>[
          WysiwygActionItem(
            action: ImpaktfullUiWysiwygAction.header,
            actions: widget.actions,
            asset: widget.componentTheme.assets.header,
            onTap: _onHeaderTapped,
          ),
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
            action: ImpaktfullUiWysiwygAction.code,
            actions: widget.actions,
            asset: widget.componentTheme.assets.code,
            onTap: _onCodeTapped,
          ),
          WysiwygActionItem(
            action: ImpaktfullUiWysiwygAction.codeBlock,
            actions: widget.actions,
            asset: widget.componentTheme.assets.codeBlock,
            onTap: _onCodeBlockTapped,
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

  void _onHeaderTapped() => _format(const ImpaktfullUiWysiwygHeaderFormatter());

  void _onBoldTapped() => _format(const ImpaktfullUiWysiwygBoldFormatter());

  void _onItalicTapped() => _format(const ImpaktfullUiWysiwygItalicFormatter());

  void _onUnorderedListTapped() => _format(const ImpaktfullUiWysiwygUnorderedListFormatter());

  void _onOrderedListTapped() {
    ImpaktfullUiNotification.show(
      title: 'Not yet supported',
      subtitle: 'Ordered list is not yet supported',
      type: ImpaktfullUiNotificationType.warning,
    );
  }

  void _onCodeTapped() => _format(const ImpaktfullUiWysiwygCodeFormatter());

  void _onCodeBlockTapped() => _format(const ImpaktfullUiWysiwygCodeBlockFormatter());

  void _onLinkTapped() => _format(const ImpaktfullUiWysiwygLinkFormatter());

  void _onPhotoTapped() => _format(const ImpaktfullUiWysiwygPhotoFormatter());

  void _format(ImpaktfullUiWysiwygFormatter formatter) {
    final result = formatter.format(widget.text, widget.textSelected);
    widget.onChangedText(result.text, result.textSelection);
  }
}

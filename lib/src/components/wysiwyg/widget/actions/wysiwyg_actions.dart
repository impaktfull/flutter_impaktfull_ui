import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/list_view/list_view.dart';
import 'package:impaktfull_ui/src/components/notification/notification.dart';
import 'package:impaktfull_ui/src/components/wysiwyg/formatter/wysiwyg_bold_formatter.dart';
import 'package:impaktfull_ui/src/components/wysiwyg/formatter/wysiwyg_code_block_formatter.dart';
import 'package:impaktfull_ui/src/components/wysiwyg/formatter/wysiwyg_code_formatter.dart';
import 'package:impaktfull_ui/src/components/wysiwyg/formatter/wysiwyg_formatter.dart';
import 'package:impaktfull_ui/src/components/wysiwyg/formatter/wysiwyg_header_formatter.dart';
import 'package:impaktfull_ui/src/components/wysiwyg/formatter/wysiwyg_italic_formatter.dart';
import 'package:impaktfull_ui/src/components/wysiwyg/formatter/wysiwyg_link_formatter.dart';
import 'package:impaktfull_ui/src/components/wysiwyg/formatter/wysiwyg_photo_formatter.dart';
import 'package:impaktfull_ui/src/components/wysiwyg/formatter/wysiwyg_unorderedlist_formatter.dart';
import 'package:impaktfull_ui/src/components/wysiwyg/widget/actions/wysiwyg_action_item.dart';
import 'package:impaktfull_ui/src/components/wysiwyg/wysiwyg.dart';
import 'package:impaktfull_ui/src/util/localizations/localizations.dart';

class WysiwygActions extends StatefulWidget {
  final List<ImpaktfullUiWysiwygAction> actions;
  final String text;
  final ImpaktfullUiWysiwygType type;
  final Function(String, TextSelection) onChangedText;
  final ImpaktfullUiWysiwygTheme componentTheme;
  final TextSelection textSelected;
  final ImpaktfullUiWysiwygLocalizations? localizations;

  const WysiwygActions({
    required this.text,
    required this.type,
    required this.actions,
    required this.onChangedText,
    required this.componentTheme,
    required this.textSelected,
    this.localizations,
    super.key,
  });

  @override
  State<WysiwygActions> createState() => _WysiwygActionsState();
}

class _WysiwygActionsState extends State<WysiwygActions> {
  @override
  Widget build(BuildContext context) {
    final localizations = _getLocalizations(context);
    return Container(
      height: widget.componentTheme.dimens.actionsHeight,
      padding: widget.componentTheme.dimens.actionsPadding,
      child: ImpaktfullUiListView(
        scrollDirection: Axis.horizontal,
        children: <WysiwygActionItem>[
          WysiwygActionItem(
            action: ImpaktfullUiWysiwygAction.header,
            actions: widget.actions,
            localizations: localizations,
            asset: widget.componentTheme.assets.header,
            onTap: _onHeaderTapped,
          ),
          WysiwygActionItem(
            action: ImpaktfullUiWysiwygAction.bold,
            actions: widget.actions,
            localizations: localizations,
            asset: widget.componentTheme.assets.bold,
            onTap: _onBoldTapped,
          ),
          WysiwygActionItem(
            action: ImpaktfullUiWysiwygAction.italic,
            actions: widget.actions,
            localizations: localizations,
            asset: widget.componentTheme.assets.italic,
            onTap: _onItalicTapped,
          ),
          WysiwygActionItem(
            action: ImpaktfullUiWysiwygAction.unorderedList,
            actions: widget.actions,
            localizations: localizations,
            asset: widget.componentTheme.assets.unorderedList,
            onTap: _onUnorderedListTapped,
          ),
          WysiwygActionItem(
            action: ImpaktfullUiWysiwygAction.orderedList,
            actions: widget.actions,
            localizations: localizations,
            asset: widget.componentTheme.assets.orderedList,
            onTap: _onOrderedListTapped,
          ),
          WysiwygActionItem(
            action: ImpaktfullUiWysiwygAction.code,
            actions: widget.actions,
            localizations: localizations,
            asset: widget.componentTheme.assets.code,
            onTap: _onCodeTapped,
          ),
          WysiwygActionItem(
            action: ImpaktfullUiWysiwygAction.codeBlock,
            actions: widget.actions,
            localizations: localizations,
            asset: widget.componentTheme.assets.codeBlock,
            onTap: _onCodeBlockTapped,
          ),
          WysiwygActionItem(
            action: ImpaktfullUiWysiwygAction.link,
            actions: widget.actions,
            localizations: localizations,
            asset: widget.componentTheme.assets.link,
            onTap: _onLinkTapped,
          ),
          WysiwygActionItem(
            action: ImpaktfullUiWysiwygAction.photo,
            actions: widget.actions,
            localizations: localizations,
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

  void _onUnorderedListTapped() =>
      _format(const ImpaktfullUiWysiwygUnorderedListFormatter());

  ImpaktfullUiWysiwygLocalizations _getLocalizations(BuildContext context) =>
      widget.localizations ??
      ImpaktfullUiLocalizations.of<ImpaktfullUiWysiwygLocalizations>(context);

  void _onOrderedListTapped() {
    final localizations = _getLocalizations(context);
    ImpaktfullUiNotification.show(
      title: localizations.notYetSupportedTitle,
      subtitle: localizations.orderedListNotYetSupported,
      type: ImpaktfullUiNotificationType.warning,
    );
  }

  void _onCodeTapped() => _format(const ImpaktfullUiWysiwygCodeFormatter());

  void _onCodeBlockTapped() =>
      _format(const ImpaktfullUiWysiwygCodeBlockFormatter());

  void _onLinkTapped() => _format(const ImpaktfullUiWysiwygLinkFormatter());

  void _onPhotoTapped() => _format(const ImpaktfullUiWysiwygPhotoFormatter());

  void _format(ImpaktfullUiWysiwygFormatter formatter) {
    final text = widget.text;
    final result = formatter.format(
      text,
      _getValidSelection(text, widget.textSelected),
    );
    widget.onChangedText(result.text, result.textSelection);
  }

  /// The selection is invalid (-1) when the text was set without a selection
  /// (e.g. the text changed from outside). Fall back to the end of the text.
  TextSelection _getValidSelection(String text, TextSelection selection) {
    if (!selection.isValid) {
      return TextSelection.collapsed(offset: text.length);
    }
    final start = selection.start.clamp(0, text.length);
    final end = selection.end.clamp(start, text.length);
    return TextSelection(baseOffset: start, extentOffset: end);
  }
}

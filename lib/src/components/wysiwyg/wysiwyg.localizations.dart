import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/components/wysiwyg/model/wysiwyg_action.dart';
import 'package:impaktfull_ui/src/util/localizations/localizations.dart';

class ImpaktfullUiWysiwygLocalizations
    extends ImpaktfullUiComponentLocalizations {
  /// The button that switches back from the preview to the editor.
  final String editorBtn;

  /// The button that switches from the editor to the preview.
  final String previewBtn;

  /// The title of the notification for an action that is not supported yet.
  final String notYetSupportedTitle;

  /// The subtitle of the notification when the ordered list is tapped.
  final String orderedListNotYetSupported;

  /// The tooltip of [ImpaktfullUiWysiwygAction.header].
  final String headerTooltip;

  /// The tooltip of [ImpaktfullUiWysiwygAction.bold].
  final String boldTooltip;

  /// The tooltip of [ImpaktfullUiWysiwygAction.italic].
  final String italicTooltip;

  /// The tooltip of [ImpaktfullUiWysiwygAction.unorderedList].
  final String unorderedListTooltip;

  /// The tooltip of [ImpaktfullUiWysiwygAction.orderedList].
  final String orderedListTooltip;

  /// The tooltip of [ImpaktfullUiWysiwygAction.link].
  final String linkTooltip;

  /// The tooltip of [ImpaktfullUiWysiwygAction.code].
  final String codeTooltip;

  /// The tooltip of [ImpaktfullUiWysiwygAction.codeBlock].
  final String codeBlockTooltip;

  /// The tooltip of [ImpaktfullUiWysiwygAction.photo].
  final String photoTooltip;

  const ImpaktfullUiWysiwygLocalizations({
    this.editorBtn = 'Editor',
    this.previewBtn = 'Preview',
    this.notYetSupportedTitle = 'Not yet supported',
    this.orderedListNotYetSupported = 'Ordered list is not yet supported',
    this.headerTooltip = 'Header',
    this.boldTooltip = 'Bold',
    this.italicTooltip = 'Italic',
    this.unorderedListTooltip = 'Unordered List',
    this.orderedListTooltip = 'Ordered List',
    this.linkTooltip = 'Link',
    this.codeTooltip = 'Code',
    this.codeBlockTooltip = 'Code Block',
    this.photoTooltip = 'Photo',
  });

  static ImpaktfullUiWysiwygLocalizations of(BuildContext context) =>
      ImpaktfullUiLocalizations.of<ImpaktfullUiWysiwygLocalizations>(context);

  /// The tooltip that is shown for [action].
  String tooltipFor(ImpaktfullUiWysiwygAction action) {
    switch (action) {
      case ImpaktfullUiWysiwygAction.header:
        return headerTooltip;
      case ImpaktfullUiWysiwygAction.bold:
        return boldTooltip;
      case ImpaktfullUiWysiwygAction.italic:
        return italicTooltip;
      case ImpaktfullUiWysiwygAction.unorderedList:
        return unorderedListTooltip;
      case ImpaktfullUiWysiwygAction.orderedList:
        return orderedListTooltip;
      case ImpaktfullUiWysiwygAction.link:
        return linkTooltip;
      case ImpaktfullUiWysiwygAction.code:
        return codeTooltip;
      case ImpaktfullUiWysiwygAction.codeBlock:
        return codeBlockTooltip;
      case ImpaktfullUiWysiwygAction.photo:
        return photoTooltip;
    }
  }

  ImpaktfullUiWysiwygLocalizations copyWith({
    String? editorBtn,
    String? previewBtn,
    String? notYetSupportedTitle,
    String? orderedListNotYetSupported,
    String? headerTooltip,
    String? boldTooltip,
    String? italicTooltip,
    String? unorderedListTooltip,
    String? orderedListTooltip,
    String? linkTooltip,
    String? codeTooltip,
    String? codeBlockTooltip,
    String? photoTooltip,
  }) =>
      ImpaktfullUiWysiwygLocalizations(
        editorBtn: editorBtn ?? this.editorBtn,
        previewBtn: previewBtn ?? this.previewBtn,
        notYetSupportedTitle: notYetSupportedTitle ?? this.notYetSupportedTitle,
        orderedListNotYetSupported:
            orderedListNotYetSupported ?? this.orderedListNotYetSupported,
        headerTooltip: headerTooltip ?? this.headerTooltip,
        boldTooltip: boldTooltip ?? this.boldTooltip,
        italicTooltip: italicTooltip ?? this.italicTooltip,
        unorderedListTooltip: unorderedListTooltip ?? this.unorderedListTooltip,
        orderedListTooltip: orderedListTooltip ?? this.orderedListTooltip,
        linkTooltip: linkTooltip ?? this.linkTooltip,
        codeTooltip: codeTooltip ?? this.codeTooltip,
        codeBlockTooltip: codeBlockTooltip ?? this.codeBlockTooltip,
        photoTooltip: photoTooltip ?? this.photoTooltip,
      );
}

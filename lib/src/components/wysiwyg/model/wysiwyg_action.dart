enum ImpaktfullUiWysiwygAction {
  header(tooltip: 'Header'),
  bold(tooltip: 'Bold'),
  italic(tooltip: 'Italic'),
  unorderedList(tooltip: 'Unordered List'),
  orderedList(tooltip: 'Ordered List'),
  link(tooltip: 'Link'),
  code(tooltip: 'Code'),
  codeBlock(tooltip: 'Code Block'),
  photo(tooltip: 'Photo');

  @Deprecated('Use orderedList instead. Will be removed in 1.0.0.')
  static const orderdList = orderedList;

  /// The English tooltip of the action.
  ///
  /// The editor shows the tooltip of [ImpaktfullUiWysiwygLocalizations]
  /// (`ImpaktfullUiWysiwygLocalizations.tooltipFor`), which defaults to this
  /// text.
  final String tooltip;

  const ImpaktfullUiWysiwygAction({
    required this.tooltip,
  });

  static const List<ImpaktfullUiWysiwygAction> basicValues = [
    ImpaktfullUiWysiwygAction.header,
    ImpaktfullUiWysiwygAction.bold,
    ImpaktfullUiWysiwygAction.italic,
    ImpaktfullUiWysiwygAction.unorderedList,
    ImpaktfullUiWysiwygAction.code,
    ImpaktfullUiWysiwygAction.codeBlock,
    ImpaktfullUiWysiwygAction.link,
    ImpaktfullUiWysiwygAction.photo,
  ];
}

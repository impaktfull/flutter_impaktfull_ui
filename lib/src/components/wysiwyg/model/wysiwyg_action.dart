enum ImpaktfullUiWysiwygAction {
  header(tooltip: 'Header'),
  bold(tooltip: 'Bold'),
  italic(tooltip: 'Italic'),
  unorderedList(tooltip: 'Unordered List'),
  orderdList(tooltip: 'Ordered List'),
  link(tooltip: 'Link'),
  code(tooltip: 'Code'),
  codeBlock(tooltip: 'Code Block'),
  photo(tooltip: 'Photo');

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

enum ImpaktfullUiFilePickerProgressType {
  text(
    textProgressOnly: true,
    showText: true,
    showLine: false,
  ),
  progressLine(
    textProgressOnly: false,
    showText: false,
    showLine: true,
  ),
  progressLineWithText(
    textProgressOnly: false,
    showText: true,
    showLine: true,
  );

  final bool showText;
  final bool textProgressOnly;
  final bool showLine;

  const ImpaktfullUiFilePickerProgressType({
    required this.textProgressOnly,
    required this.showText,
    required this.showLine,
  });
}

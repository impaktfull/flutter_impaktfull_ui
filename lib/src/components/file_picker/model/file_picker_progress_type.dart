enum ImpaktfullUiFilePickerProgressType {
  text(showText: true),
  progressBar(showText: false),
  progressBarWithText(showText: true),
  circularProgress(showText: false),
  circularProgressWithText(showText: true);

  final bool showText;

  const ImpaktfullUiFilePickerProgressType({
    required this.showText,
  });
}

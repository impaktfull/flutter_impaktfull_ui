class ImpaktfullUiFilePickerData {
  /// The title of the file
  /// Including the extension will show a file icon with the extension
  final String title;

  /// Should be a value between 0 and 1
  final double progress;

  /// Should be the size of the file in bytes
  final int? size;

  const ImpaktfullUiFilePickerData({
    required this.title,
    required this.progress,
    this.size,
  });
}

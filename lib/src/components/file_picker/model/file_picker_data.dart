class ImpaktfullUiFilePickerData {
  /// The title of the file
  /// Including the extension will show a file icon with the extension
  final String title;

  /// The subtitle of the file
  /// A line where you can add more information about the file
  final String? subtitle;

  /// Should be a value between 0 and 1 or null if you don't want to show a progress bar
  final double? progress;

  /// Should be the size of the file in bytes
  final int? size;

  const ImpaktfullUiFilePickerData({
    required this.title,
    this.subtitle,
    this.progress,
    this.size,
  });
}

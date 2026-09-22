import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/util/localizations/localizations.dart';

class ImpaktfullUiFilePickerLocalizations
    extends ImpaktfullUiComponentLocalizations {
  /// Shown when the upload failed.
  final String uploadFailed;

  /// The button to retry a failed upload.
  final String retryBtn;

  /// The tooltip of the button that deletes the file.
  final String deleteFile;

  const ImpaktfullUiFilePickerLocalizations({
    this.uploadFailed = 'Failed to upload, please try again later',
    this.retryBtn = 'Retry',
    this.deleteFile = 'Delete file',
  });

  static ImpaktfullUiFilePickerLocalizations of(BuildContext context) =>
      ImpaktfullUiLocalizations.of<ImpaktfullUiFilePickerLocalizations>(
          context);

  ImpaktfullUiFilePickerLocalizations copyWith({
    String? uploadFailed,
    String? retryBtn,
    String? deleteFile,
  }) =>
      ImpaktfullUiFilePickerLocalizations(
        uploadFailed: uploadFailed ?? this.uploadFailed,
        retryBtn: retryBtn ?? this.retryBtn,
        deleteFile: deleteFile ?? this.deleteFile,
      );
}

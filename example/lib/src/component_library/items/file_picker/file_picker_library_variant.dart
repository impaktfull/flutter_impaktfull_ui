import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/items/file_picker/file_picker_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class FilePickerLibraryVariant
    extends ComponentLibraryVariant<FilePickerLibraryPrimaryInputs> {
  const FilePickerLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(
      BuildContext context, FilePickerLibraryPrimaryInputs inputs) {
    return [
      ImpaktfullUiFilePicker(
        title: 'Click to upload',
        subtitle: 'SVG, PNG, JPG or webp (max. 2mb)',
        onDeleteTapped: () {},
        onRetryTapped: () {},
        onTap: () {},
      ),
      ImpaktfullUiFilePicker(
        title: 'Click to upload',
        subtitle: 'SVG, PNG, JPG or webp (max. 2mb)',
        data: ImpaktfullUiFilePickerData(
          title: title,
          subtitle: 'Extra data',
          progress: 1,
          size: 2000,
        ),
        onDeleteTapped: () {},
        onTap: () {},
      ),
      ImpaktfullUiFilePicker(
        title: 'Click to upload',
        subtitle: 'SVG, PNG, JPG or webp (max. 2mb)',
        data: ImpaktfullUiFilePickerData(
          title: title,
          progress: 1,
          size: 2000,
        ),
        onDeleteTapped: () {},
        onRetryTapped: () {},
      ),
    ];
  }

  @override
  FilePickerLibraryPrimaryInputs inputs() => FilePickerLibraryPrimaryInputs();
}

class FilePickerLibraryPrimaryInputs extends FilePickerLibraryInputs {}

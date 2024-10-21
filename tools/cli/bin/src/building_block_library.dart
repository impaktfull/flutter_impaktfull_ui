// ignore_for_file: avoid_print
import 'dart:io';

import 'package:path/path.dart';
import 'utils.dart';

Future<void> createBuildingBlockLibrary(String componentName) async {
  final componentClassName = "ImpaktfullUiBB$componentName";
  await _createBuildingBlock(
    componentName: componentName,
    className: componentClassName,
  );
  await _createBuildingBlockLibrary(
    componentName: componentName,
    componentClassName: componentClassName,
  );
}

Future<void> _createBuildingBlock({
  required String componentName,
  required String className,
}) async {
  final snakeCaseComponentName = componentName.pascalToSnakeCase();
  // Create dir
  final path = join('lib', 'src', 'building_block', snakeCaseComponentName);
  final dir = Directory(path);
  if (dir.existsSync()) {
    throw Exception('Component already exists');
  }
  dir.createSync(recursive: true);

  // Component file
  final componentFile = File(join(dir.path, '$snakeCaseComponentName.dart'));

  final componentFileContent = """import 'package:flutter/material.dart';

class $className extends StatelessWidget {
  final ${className}Theme? theme;

  const $className({
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}""";
  componentFile.writeAsStringSync(componentFileContent);
}

Future<void> _createBuildingBlockLibrary({
  required String componentName,
  required String componentClassName,
}) async {
  final snakeCaseComponentName = componentName.pascalToSnakeCase();
  // Create dir
  final path = join('example', 'lib', 'src', 'building_block_library',
      'building_blocks', snakeCaseComponentName);
  final dir = Directory(path);
  if (dir.existsSync()) {
    throw Exception('Component already exists');
  }
  dir.createSync(recursive: true);

  // Create files
  final libraryItemFile =
      File(join(dir.path, '${snakeCaseComponentName}_library_item.dart'));

  final libaryItemFileContent =
      """import 'package:impaktfull_ui_example/src/building_block_library/config/building_block_library_item.dart';
import 'package:impaktfull_ui_example/src/building_block_library/building_blocks/$snakeCaseComponentName/${snakeCaseComponentName}_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';

class ${componentName}LibraryItem extends BuildingBlockLibraryItem {
  const ${componentName}LibraryItem();

  @override
  String get title => '$componentClassName';

  @override
  List<BuildingBlockLibraryItem> getBuildingBlockVariants() {
    return [
      const ${componentName}LibraryVariant(),
    ];
  }
}

class ${componentName}LibraryInputs extends ComponentLibraryInputs {
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [];
}

""";

  libraryItemFile.writeAsStringSync(libaryItemFileContent);

  // Component file
  final libraryVariantFile =
      File(join(dir.path, '${snakeCaseComponentName}_library_variant.dart'));

  final componentFileContent = """import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/building_block_library/building_block/$snakeCaseComponentName/${snakeCaseComponentName}_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class ${componentName}LibraryVariant extends BuildingBlockLibraryVariant<${componentName}LibraryPrimaryInputs> {
  const ${componentName}LibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(BuildContext context, ${componentName}LibraryPrimaryInputs inputs) {
    return [
      const $componentClassName(),
    ];
  }

  @override
  ${componentName}LibraryPrimaryInputs inputs() => ${componentName}LibraryPrimaryInputs();
}

class ${componentName}LibraryPrimaryInputs extends ${componentName}LibraryInputs {}
""";
  libraryVariantFile.writeAsStringSync(componentFileContent);
}

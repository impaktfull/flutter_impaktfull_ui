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

  const $className({
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
    throw Exception('Building Block already exists');
  }
  dir.createSync(recursive: true);

  // Create files
  final libraryItemFile =
      File(join(dir.path, '${snakeCaseComponentName}_building_block.dart'));

  final libaryItemFileContent = """import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/building_block_library/config/building_block_library_item.dart';

class ${componentName}BuildingBlock extends BuildingBlockLibraryItem {
  const ${componentName}BuildingBlock();

  @override
  String get title => '$componentClassName';

  @override
  Widget build(BuildContext context) {
    return const $componentClassName();
  }
}
""";

  libraryItemFile.writeAsStringSync(libaryItemFileContent);
}

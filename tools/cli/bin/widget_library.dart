// ignore_for_file: avoid_print
import 'dart:io';

import 'package:path/path.dart';

Future<void> main(List<String> args) async {
  try {
    var componentName = args.elementAtOrNull(0);

    if (componentName == null) {
      throw Exception('Please provide a component name');
    }
    componentName = componentName.trim();

    if (componentName[0].toUpperCase() != componentName[0]) {
      throw Exception('First letter should be uppercase');
    }
    await createComponentLibrary(componentName);
  } catch (e) {
    print(e);
  }
}

Future<void> createComponentLibrary(String componentName) async {
  final componentClassName = "ImpaktfullUi$componentName";
  await createComponent(
    componentName: componentName,
    className: componentClassName,
  );
  await createWidgetLibrary(
    componentName: componentName,
    componentClassName: componentClassName,
  );
}

Future<void> createComponent({
  required String componentName,
  required String className,
}) async {
  // Create dir
  final path = join('lib', 'src', 'components', componentName.toLowerCase());
  final dir = Directory(path);
  if (dir.existsSync()) {
    throw Exception('Component already exists');
  }
  dir.createSync(recursive: true);

  //Create files
  final lowercaseComponentName = componentName.toLowerCase();
  final styleFile =
      File(join(dir.path, '${lowercaseComponentName}_style.dart'));

  final styleFileContent = """import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/theme/theme.dart';

class ${className}Theme extends ImpaktfullUiComponentTheme {
  final ${className}ColorTheme colors;
  final ${className}TextStyleTheme textStyles;
  final ${className}DimensTheme dimens;
  final ${className}AssetsTheme assets;

  const ${className}Theme({
    required this.colors,
    required this.textStyles,
    required this.dimens,
    required this.assets,
  });

  static ${className}Theme of(BuildContext context) => ImpaktfullUiTheme.of(context).components.$lowercaseComponentName;
}

class ${className}ColorTheme {
  const ${className}ColorTheme();
}

class ${className}TextStyleTheme {
  const ${className}TextStyleTheme();
}

class ${className}DimensTheme {
  const ${className}DimensTheme();
}

class ${className}AssetsTheme {
  const ${className}AssetsTheme();
}
""";

  styleFile.writeAsStringSync(styleFileContent);
  //Create describe file
  final describeFile =
      File(join(dir.path, '$lowercaseComponentName.describe.dart'));

  final describeFileContent = """part of '$lowercaseComponentName.dart';

String _describeInstance(BuildContext context, $className instance) {
  final sb = StringBuffer();
  return sb.toString();
}""";

  describeFile.writeAsStringSync(describeFileContent);

  // Component file
  final componentFile = File(join(dir.path, '$lowercaseComponentName.dart'));

  final componentFileContent = """import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/$lowercaseComponentName/${lowercaseComponentName}_style.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';

export '${lowercaseComponentName}_style.dart';

part '$lowercaseComponentName.describe.dart';

class $className extends StatelessWidget with ComponentDescriptorMixin {
  final ${className}Theme? theme;

  const $className({
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<${className}Theme>(
      overrideComponentTheme: theme,
      builder: (context, theme, componentTheme) => Container(),
    );
  }

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}""";
  componentFile.writeAsStringSync(componentFileContent);
}

Future<void> createWidgetLibrary({
  required String componentName,
  required String componentClassName,
}) async {
  // Create dir
  final path = join('example', 'lib', 'src', 'component_library', 'components',
      componentName.toLowerCase());
  final dir = Directory(path);
  if (dir.existsSync()) {
    throw Exception('Component already exists');
  }
  dir.createSync(recursive: true);

  // Create files
  final lowerCaseComponentName = componentName.toLowerCase();
  final libraryItemFile =
      File(join(dir.path, '${lowerCaseComponentName}_library_item.dart'));

  final libaryItemFileContent =
      """import 'package:impaktfull_ui_example/src/component_library/components/$lowerCaseComponentName/${lowerCaseComponentName}_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class ${componentName}LibraryItem extends ComponentLibraryItem {
  const ${componentName}LibraryItem();

  @override
  String get title => '$componentClassName';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
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
      File(join(dir.path, '${lowerCaseComponentName}_library_variant.dart'));

  final componentFileContent = """import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/components/$lowerCaseComponentName/${lowerCaseComponentName}_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class ${componentName}LibraryVariant extends ComponentLibraryVariant<${componentName}LibraryPrimaryInputs> {
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

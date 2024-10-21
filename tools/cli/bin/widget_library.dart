import 'src/component_library.dart';
import 'src/building_block_library.dart';

Future<void> main(List<String> args) async {
  try {
    var componentName = args.elementAtOrNull(0);
    var type = args.elementAtOrNull(1);

    if (componentName == null) {
      throw Exception('Please provide a component name');
    }
    componentName = componentName.trim();

    if (componentName[0].toUpperCase() != componentName[0]) {
      throw Exception('First letter should be uppercase');
    }

    if (type == null || type == 'c') {
      await createComponentLibrary(componentName);
    } else if (type == 'bb') {
      await createBuildingBlockLibrary(componentName);
    } else {
      throw Exception('Invalid type');
    }
  } catch (e) {
    // ignore: avoid_print
    print(e);
  }
}

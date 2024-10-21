import 'package:flutter/widgets.dart';

abstract class BuildingBlockLibraryItem {
  String get title;

  const BuildingBlockLibraryItem();

  String get name => title.replaceAll('ImpaktfullUi', '');

  String get slug => name
      .replaceAllMapped(RegExp(r'(?<=[a-z])[A-Z]'),
          (Match m) => '-${m.group(0)!.toLowerCase()}')
      .toLowerCase();

  Widget build(BuildContext context);
}

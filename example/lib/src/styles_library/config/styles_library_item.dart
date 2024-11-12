import 'package:flutter/widgets.dart';

abstract class StylesLibraryItem {
  String get title;

  const StylesLibraryItem();

  String get name => title.replaceAll('ImpaktfullUiStyle', '');

  String get slug => name
      .replaceAllMapped(RegExp(r'(?<=[a-z])[A-Z]'),
          (Match m) => '-${m.group(0)!.toLowerCase()}')
      .toLowerCase();

  Widget build(BuildContext context);
}

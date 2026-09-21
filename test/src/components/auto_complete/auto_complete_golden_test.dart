import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';
import '../_inputs_test_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  final icons = ImpaktfullUiTheme.getDefault().assets.icons;

  Widget autoComplete({
    String? placeholder,
    Widget? Function()? leadingBuilder,
    List<Widget> Function()? topBuilder,
  }) =>
      goldenSized(ImpaktfullUiAutoComplete<String>(
        placeholder: placeholder,
        noDataLabel: 'No results',
        leadingBuilder: leadingBuilder,
        topBuilder: topBuilder,
        onSearchChanged: (query) => [],
        itemBuilder: (context, item, index, controller) => Text(item),
      ));

  runComponentTest(
    fileName: 'impaktfull_ui_auto_complete',
    columns: 2,
    goldenTests: () => [
      GoldenTest(child: autoComplete()),
      GoldenTest(child: autoComplete(placeholder: 'Search a country')),
      GoldenTest(
        child: autoComplete(
          placeholder: 'Search',
          leadingBuilder: () => ImpaktfullUiAssetWidget(
            asset: icons.search,
            size: 20,
          ),
        ),
      ),
      GoldenTest(
        child: autoComplete(
          placeholder: 'Add a tag',
          topBuilder: () => [
            for (final label in [
              'Belgium',
              'The Netherlands',
              'Luxembourg',
              'A very long tag name',
            ])
              ImpaktfullUiBadge(
                type: ImpaktfullUiBadgeType.neutral,
                label: label,
              ),
          ],
        ),
      ),
    ],
  );
}

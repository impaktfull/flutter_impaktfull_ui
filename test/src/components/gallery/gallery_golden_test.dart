import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';

ImpaktfullUiGalleryItem _item(String title, Color color) =>
    ImpaktfullUiGalleryItem(
      id: title,
      title: title,
      description: 'Description of $title',
      child: ColoredBox(
        color: color,
        child: const SizedBox(width: 120, height: 80),
      ),
    );

final _items = [
  _item('Red', Colors.red),
  _item('Green', Colors.green),
  _item('Blue', Colors.blue),
  _item('Orange', Colors.orange),
  _item('Purple', Colors.purple),
];

void main() {
  setUp(() => setupComponentTest());

  runComponentTest(
    fileName: 'impaktfull_ui_gallery',
    columns: 2,
    goldenTests: () => [
      GoldenTest(
        description: '3 columns',
        child: SizedBox(
          width: 500,
          height: 320,
          child: ImpaktfullUiGallery(
            items: _items,
            noDataLabel: 'No images',
            crossAxisCount: (context, config) => 3,
          ),
        ),
      ),
      GoldenTest(
        description: 'Square items with rounded corners and a small spacing',
        child: SizedBox(
          width: 500,
          height: 320,
          child: ImpaktfullUiGallery(
            items: _items,
            noDataLabel: 'No images',
            spacing: 4,
            itemBorderRadius: BorderRadius.circular(24),
            itemAspectRatio: (context, config) => 1,
            crossAxisCount: (context, config) => 4,
          ),
        ),
      ),
      GoldenTest(
        description: 'No items',
        child: const SizedBox(
          width: 500,
          height: 320,
          child: ImpaktfullUiGallery(items: [], noDataLabel: 'No images'),
        ),
      ),
    ],
  );

  runComponentTest(
    fileName: 'impaktfull_ui_gallery_full_screen',
    columns: 3,
    goldenTests: () => [
      for (final initialItem in [_items.first, _items[2], _items.last])
        GoldenTest(
          description: 'Full screen on ${initialItem.title}',
          child: SizedBox(
            width: 400,
            height: 300,
            child: Builder(
              builder: (context) => ImpaktfullUiGalleryFullScreen(
                items: _items,
                initialItem: initialItem,
                theme: ImpaktfullUiGalleryTheme.of(context),
              ),
            ),
          ),
        ),
    ],
  );
}

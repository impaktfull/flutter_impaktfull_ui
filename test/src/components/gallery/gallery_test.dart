import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';

const _items = [
  ImpaktfullUiGalleryItem(
    title: 'Red',
    child:
        ColoredBox(color: Colors.red, child: SizedBox(width: 50, height: 50)),
  ),
  ImpaktfullUiGalleryItem(
    title: 'Blue',
    child:
        ColoredBox(color: Colors.blue, child: SizedBox(width: 50, height: 50)),
  ),
  ImpaktfullUiGalleryItem(
    title: 'Green',
    child:
        ColoredBox(color: Colors.green, child: SizedBox(width: 50, height: 50)),
  ),
];

void main() {
  testWidgets('shows noDataLabel without items', (tester) async {
    await pumpAndSettleComponent(
      tester,
      const ImpaktfullUiGallery(items: [], noDataLabel: 'Nothing to see'),
    );
    expect(find.text('Nothing to see'), findsOneWidget);
  });

  test('items without id or imageUrl get a unique hero tag', () {
    final tags = _items.map((item) => item.heroTag).toSet();
    expect(tags, hasLength(_items.length));
    expect(tags, isNot(contains('')));
  });

  testWidgets('opening the full screen with child items does not throw',
      (tester) async {
    await pumpAndSettleComponent(
      tester,
      const ImpaktfullUiGallery(items: _items, noDataLabel: 'No items'),
    );
    await tester.tap(find.byWidget(_items[1].child()));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
    expect(find.byType(ImpaktfullUiGalleryFullScreen), findsOneWidget);
  });

  testWidgets('a new initialItem shows that page', (tester) async {
    late BuildContext context;
    var initialItem = _items.first;
    late StateSetter setState;
    await pumpAndSettleComponent(
      tester,
      Builder(
        builder: (builderContext) {
          context = builderContext;
          return const SizedBox();
        },
      ),
    );
    final theme = ImpaktfullUiGalleryTheme.of(context);
    await pumpAndSettleComponent(
      tester,
      StatefulBuilder(
        builder: (context, setter) {
          setState = setter;
          return ImpaktfullUiGalleryFullScreen(
            items: _items,
            initialItem: initialItem,
            theme: theme,
          );
        },
      ),
    );

    setState(() => initialItem = _items.last);
    await tester.pumpAndSettle();
    final pageView = tester.widget<PageView>(find.byType(PageView));
    expect(pageView.controller!.page, 2);
  });

  testWidgets('double tap to zoom does not leak animations', (tester) async {
    await pumpAndSettleComponent(
      tester,
      const ImpaktfullUiGallery(items: _items, noDataLabel: 'No items'),
    );
    await tester.tap(find.byWidget(_items[0].child()));
    await tester.pumpAndSettle();

    final notDisposed = <Object>{};
    void onEvent(ObjectEvent event) {
      if (event.object is! CurvedAnimation) return;
      if (event is ObjectCreated) notDisposed.add(event.object);
      if (event is ObjectDisposed) notDisposed.remove(event.object);
    }

    FlutterMemoryAllocations.instance.addListener(onEvent);
    addTearDown(
      () => FlutterMemoryAllocations.instance.removeListener(onEvent),
    );

    final image = find.descendant(
      of: find.byType(ImpaktfullUiGalleryFullScreen),
      matching: find.byWidget(_items[0].child()),
    );
    final viewer = find.byType(InteractiveViewer).first;
    Matrix4 transform() => tester
        .widget<InteractiveViewer>(viewer)
        .transformationController!
        .value;

    Future<void> doubleTap() async {
      await tester.tap(image.first);
      await tester.pump(const Duration(milliseconds: 50));
      await tester.tap(image.first);
      await tester.pumpAndSettle();
    }

    await doubleTap();
    expect(transform(), isNot(Matrix4.identity()));
    await doubleTap();
    expect(transform(), Matrix4.identity());
    await doubleTap();
    expect(transform(), isNot(Matrix4.identity()));

    await tester.tap(find.byTooltip('Close fullscreen'));
    await tester.pumpAndSettle();
    expect(find.byType(ImpaktfullUiGalleryFullScreen), findsNothing);
    expect(notDisposed, isEmpty);
  });
}

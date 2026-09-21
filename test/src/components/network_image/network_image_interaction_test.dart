import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui/src/components/network_image/widget/network_image_error.dart';

import '../../../util/test_util.dart';

void main() {
  // The test binding answers every http request with a 400: these tests
  // never use the network.

  testWidgets('loads the url with the size and fit', (tester) async {
    await pumpAndSettleComponent(
      tester,
      const Center(
        child: ImpaktfullUiNetworkImage(
          url: 'https://example.com/image.png',
          width: 100,
          height: 50,
          fit: BoxFit.cover,
        ),
      ),
    );
    final image = tester.widget<Image>(find.byType(Image));
    expect((image.image as NetworkImage).url, 'https://example.com/image.png');
    expect(image.width, 100);
    expect(image.height, 50);
    expect(image.fit, BoxFit.cover);
  });

  testWidgets('random uses picsum with the size', (tester) async {
    await pumpAndSettleComponent(
      tester,
      const Center(
        child: ImpaktfullUiNetworkImage.random(width: 120, height: 80),
      ),
    );
    final image = tester.widget<Image>(find.byType(Image));
    expect(
      (image.image as NetworkImage).url,
      'https://picsum.photos/120/80',
    );
  });

  testWidgets('random without a size uses 300x300', (tester) async {
    await pumpAndSettleComponent(
      tester,
      const Center(child: ImpaktfullUiNetworkImage.random()),
    );
    final image = tester.widget<Image>(find.byType(Image));
    expect(
      (image.image as NetworkImage).url,
      'https://picsum.photos/300/300',
    );
  });

  testWidgets('the error widget gets the size of the image', (tester) async {
    await pumpAndSettleComponent(
      tester,
      const Center(
        child: ImpaktfullUiNetworkImage(
          url: 'https://example.com/broken.png',
          width: 60,
          height: 40,
        ),
      ),
    );
    final error = tester.widget<ImpaktfullUiNetworkImageError>(
      find.byType(ImpaktfullUiNetworkImageError),
    );
    expect(error.width, 60);
    expect(error.height, 40);
  });

  testWidgets('a new url of the parent is loaded', (tester) async {
    var url = 'https://example.com/a.png';
    late StateSetter setState;
    await pumpAndSettleComponent(
      tester,
      StatefulBuilder(
        builder: (context, setter) {
          setState = setter;
          return Center(child: ImpaktfullUiNetworkImage(url: url));
        },
      ),
    );
    setState(() => url = 'https://example.com/b.png');
    await tester.pumpAndSettle();
    final image = tester.widget<Image>(find.byType(Image));
    expect((image.image as NetworkImage).url, 'https://example.com/b.png');
  });
}

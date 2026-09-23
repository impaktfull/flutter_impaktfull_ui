import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui/src/components/network_image/widget/network_image_error.dart';

import '../../../util/network_image_util.dart';
import '../../../util/test_util.dart';

void main() {
  test('overrideColor keeps the size, width, height, fit and key', () {
    const key = ValueKey('asset');
    const asset = ImpaktfullUiAsset.icon(IconData(0xe000));
    const widget = ImpaktfullUiAssetWidget(
      asset: asset,
      width: 10,
      height: 20,
      size: 30,
      fit: BoxFit.cover,
      key: key,
    );
    final result = widget.overrideColor(const Color(0xFFFF0000));
    expect(result.asset, asset);
    expect(result.color, const Color(0xFFFF0000));
    expect(result.width, 10);
    expect(result.height, 20);
    expect(result.size, 30);
    expect(result.fit, BoxFit.cover);
    expect(result.key, key);
  });

  group('a network asset', () {
    testWidgets('is rendered with ImpaktfullUiNetworkImage', (tester) async {
      await pumpAndSettleComponent(
        tester,
        const Center(
          child: ImpaktfullUiAssetWidget(
            asset: ImpaktfullUiAsset.network(brokenImageUrl),
            height: 40,
            semanticLabel: 'A photo of a mountain',
          ),
        ),
      );
      final image = tester.widget<ImpaktfullUiNetworkImage>(
        find.byType(ImpaktfullUiNetworkImage),
      );
      expect(image.url, brokenImageUrl);
      expect(image.height, 40);
      // Contain keeps the aspect ratio of the image.
      expect(image.fit, BoxFit.contain);
      expect(find.bySemanticsLabel('A photo of a mountain'), findsOneWidget);
      await waitForBrokenNetworkImage(tester, brokenImageUrl);
    });

    testWidgets('shows the fallback when it can not be loaded', (tester) async {
      await pumpAndSettleComponent(
        tester,
        const Center(
          child: ImpaktfullUiAssetWidget(
            asset: ImpaktfullUiAsset.network(brokenImageUrl),
            size: 40,
          ),
        ),
      );
      await waitForBrokenNetworkImage(tester, brokenImageUrl);
      expect(tester.takeException(), isNull);
      expect(find.byType(ImpaktfullUiNetworkImageError), findsOneWidget);
    });
  });
}

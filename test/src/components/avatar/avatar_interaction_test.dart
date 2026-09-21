import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui/src/components/network_image/widget/network_image_error.dart';

import '../../../util/network_image_util.dart';
import '../../../util/test_util.dart';
import '../_data_display_test_helpers.dart';

void main() {
  final avatarTheme = ImpaktfullUiTheme.getDefault().components.avatar;

  testWidgets('onTap is called on tap', (tester) async {
    var taps = 0;
    await pumpAndSettleComponent(
      tester,
      Center(child: ImpaktfullUiAvatar(url: null, onTap: () => taps++)),
    );
    await tester.tap(find.byType(ImpaktfullUiAvatar));
    expect(taps, 1);
  });

  testWidgets('without onTap there is no touch feedback', (tester) async {
    await pumpAndSettleComponent(
      tester,
      const Center(child: ImpaktfullUiAvatar(url: null)),
    );
    expect(find.byType(ImpaktfullUiTouchFeedback), findsNothing);
  });

  testWidgets('has the size that is passed', (tester) async {
    await pumpAndSettleComponent(
      tester,
      const Center(
        child: ImpaktfullUiAvatar(url: null, width: 64, height: 48),
      ),
    );
    expect(tester.getSize(find.byType(ImpaktfullUiAvatar)), const Size(64, 48));
  });

  testWidgets('without a url the placeholder of the theme is shown',
      (tester) async {
    await pumpAndSettleComponent(
      tester,
      const Center(child: ImpaktfullUiAvatar(url: null, width: 40)),
    );
    final placeholder = findAsset(avatarTheme.assets.placeholder);
    expect(placeholder, findsOneWidget);
    final widget = tester.widget<ImpaktfullUiAssetWidget>(placeholder);
    expect(widget.size, 20);
    expect(widget.color, avatarTheme.colors.placeholder);
    expect(find.byType(ImpaktfullUiNetworkImage), findsNothing);
  });

  testWidgets('a custom placeholder asset replaces the one of the theme',
      (tester) async {
    await pumpAndSettleComponent(
      tester,
      Center(
        child: ImpaktfullUiAvatar(url: null, placeholderAsset: testIcon),
      ),
    );
    expect(findAsset(testIcon), findsOneWidget);
    expect(findAsset(avatarTheme.assets.placeholder), findsNothing);
  });

  testWidgets('a url is loaded on top of the placeholder with the fit',
      (tester) async {
    // The url fails to load: the error fallback is shown.
    await pumpAndSettleComponent(
      tester,
      const Center(
        child: ImpaktfullUiAvatar(
          url: brokenImageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
    await waitForBrokenNetworkImage(tester, brokenImageUrl);
    final image = tester.widget<ImpaktfullUiNetworkImage>(
      find.byType(ImpaktfullUiNetworkImage),
    );
    expect(image.url, brokenImageUrl);
    expect(image.fit, BoxFit.cover);
    expect(findAsset(avatarTheme.assets.placeholder), findsOneWidget);
    expect(find.byType(ImpaktfullUiNetworkImageError), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}

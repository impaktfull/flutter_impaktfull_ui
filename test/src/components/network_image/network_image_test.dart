import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui/src/components/network_image/widget/network_image_error.dart';

import '../../../util/test_util.dart';

void main() {
  testWidgets('a broken url shows the error widget instead of throwing',
      (tester) async {
    await pumpAndSettleComponent(
      tester,
      const Center(
        child: ImpaktfullUiNetworkImage(
          url: 'https://example.com/broken.png',
          width: 40,
          height: 40,
        ),
      ),
    );
    expect(tester.takeException(), isNull);
    expect(find.byType(ImpaktfullUiNetworkImageError), findsOneWidget);
  });

  testWidgets(
      'in release mode the error widget keeps the size and shows nothing',
      (tester) async {
    await pumpAndSettleComponent(
      tester,
      const Center(
        child: ImpaktfullUiNetworkImageError(
          error: 'broken',
          width: 40,
          height: 30,
          showDebugInfo: false,
        ),
      ),
    );
    expect(tester.takeException(), isNull);
    expect(find.byType(Placeholder), findsNothing);
    expect(find.textContaining('broken'), findsNothing);
    expect(
      tester.getSize(find.byType(ImpaktfullUiNetworkImageError)),
      const Size(40, 30),
    );
  });

  testWidgets('in debug mode the error widget shows the error', (tester) async {
    await pumpAndSettleComponent(
      tester,
      const Center(
        child: ImpaktfullUiNetworkImageError(
          error: 'broken',
          width: 300,
          height: 300,
          showDebugInfo: true,
        ),
      ),
    );
    expect(find.byType(Placeholder), findsOneWidget);
    expect(find.text('Error: broken'), findsOneWidget);
  });
}

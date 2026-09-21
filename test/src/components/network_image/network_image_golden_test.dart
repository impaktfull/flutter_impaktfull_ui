import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui/src/components/network_image/widget/network_image_error.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';

void main() {
  setUp(() => setupComponentTest());

  // Tests never hit the network: the test binding answers every http request
  // with a 400, so these goldens show the error fallback.
  runComponentTest(
    fileName: 'impaktfull_ui_network_image_error',
    columns: 2,
    goldenTests: () => [
      GoldenTest(
        description: 'broken url (debug fallback)',
        child: const Padding(
          padding: EdgeInsets.all(8),
          child: ImpaktfullUiNetworkImage(
            url: 'https://example.com/image.png',
            width: 200,
            height: 150,
          ),
        ),
      ),
      GoldenTest(
        description: 'error in release mode keeps the size',
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            color: Colors.grey.shade200,
            child: const ImpaktfullUiNetworkImageError(
              error: 'broken',
              width: 200,
              height: 150,
              showDebugInfo: false,
            ),
          ),
        ),
      ),
      GoldenTest(
        description: 'error in debug mode',
        child: const Padding(
          padding: EdgeInsets.all(8),
          child: ImpaktfullUiNetworkImageError(
            error: 'broken',
            width: 200,
            height: 150,
            showDebugInfo: true,
          ),
        ),
      ),
    ],
  );
}

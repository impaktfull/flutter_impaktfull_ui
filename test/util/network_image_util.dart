import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

/// An image url that fails to load on every platform, without a network.
///
/// On the Dart VM the HTTP client of flutter_test fails every request. In
/// Chrome (tool/test_web.sh) the browser really fetches the url: nothing
/// listens on this port, so the request is refused at once.
const brokenImageUrl = 'http://127.0.0.1:9/broken.png';

/// Waits until loading [url] failed and rebuilds.
///
/// On the VM the request fails during the next frame. In Chrome the request
/// fails in real time, but the image of a widget is loaded in the fake time of
/// the widget test: it only reports the failure after a pump. So this waits a
/// bit of real time and pumps, until the failure arrives.
Future<void> waitForBrokenNetworkImage(WidgetTester tester, String url) async {
  var failed = false;
  final stream = NetworkImage(url).resolve(ImageConfiguration.empty);
  final listener = ImageStreamListener(
    (image, synchronousCall) {},
    onError: (error, stackTrace) => failed = true,
  );
  stream.addListener(listener);
  for (var i = 0; i < 250 && !failed; i++) {
    await tester.runAsync(
      () => Future<void>.delayed(const Duration(milliseconds: 20)),
    );
    await tester.pump();
  }
  stream.removeListener(listener);
  expect(failed, isTrue, reason: 'Loading $url did not fail');
  await tester.pumpAndSettle();
}

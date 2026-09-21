import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

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
}

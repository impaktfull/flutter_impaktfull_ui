import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';
import '../_data_display_golden_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  final bundle = TestAssetBundle({
    'assets/test.svg': utf8.encode(testSvg),
    'assets/test.png': testPngBytes,
  });

  Widget asset(
    ImpaktfullUiAsset asset, {
    Color? color,
    double? size = 48,
    double? width,
    double? height,
    BoxFit? fit,
  }) =>
      DefaultAssetBundle(
        bundle: bundle,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ImpaktfullUiAssetWidget(
            asset: asset,
            color: color,
            size: size,
            width: width,
            height: height,
            fit: fit,
          ),
        ),
      );

  const svg = ImpaktfullUiAsset.svg('test.svg', directory: 'assets');
  const pixel = ImpaktfullUiAsset.pixel('test.png', directory: 'assets');

  runComponentTestWithPump(
    fileName: 'impaktfull_ui_asset',
    columns: 4,
    pumpBeforeTest: pumpAssets,
    goldenTests: () => [
      GoldenTest(description: 'icon', child: asset(testIcon)),
      GoldenTest(
        description: 'icon with color',
        child: asset(testIcon, color: Colors.red),
      ),
      GoldenTest(
        description: 'icon with width and height (max is used)',
        child: asset(testIcon, size: null, width: 24, height: 48),
      ),
      GoldenTest(
        description: 'no asset',
        child: Container(
          color: Colors.grey.shade200,
          child: const ImpaktfullUiAssetWidget(asset: null),
        ),
      ),
      GoldenTest(description: 'svg', child: asset(svg)),
      GoldenTest(
        description: 'svg with color',
        child: asset(svg, color: Colors.green),
      ),
      GoldenTest(
        description: 'svg fill',
        child: asset(svg, size: null, width: 96, height: 48, fit: BoxFit.fill),
      ),
      GoldenTest(
        description: 'svg contain (default)',
        child: asset(svg, size: null, width: 96, height: 48),
      ),
      GoldenTest(description: 'pixel', child: asset(pixel)),
      GoldenTest(
        description: 'pixel with color',
        child: asset(pixel, color: Colors.green),
      ),
      GoldenTest(
        description: 'pixel fill',
        child: asset(
          pixel,
          size: null,
          width: 96,
          height: 48,
          fit: BoxFit.fill,
        ),
      ),
      GoldenTest(
        description: 'lottie (frozen)',
        child: frozen(
          asset(
            const ImpaktfullUiAsset.lottie(
              'loading.json',
              directory: 'assets/lottie',
            ),
          ),
        ),
      ),
    ],
  );
}

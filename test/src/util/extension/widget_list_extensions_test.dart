import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui/src/util/extension/widget_list_extensions.dart';

void main() {
  const red = Color(0xFFFF0000);
  const blue = Color(0xFF0000FF);
  const asset = ImpaktfullUiAsset.icon(Icons.add);

  test('sets the color on assets and icon buttons without a color', () {
    final widgets = <Widget>[
      const ImpaktfullUiAssetWidget(asset: asset, size: 12),
      ImpaktfullUiIconButton(onTap: () {}, asset: asset, size: 20),
    ].overrideColorOnWidgets(red);

    final assetWidget = widgets[0] as ImpaktfullUiAssetWidget;
    expect(assetWidget.color, red);
    expect(assetWidget.size, 12);
    expect(assetWidget.asset, asset);

    final iconButton = widgets[1] as ImpaktfullUiIconButton;
    expect(iconButton.color, red);
    expect(iconButton.size, 20);
    expect(iconButton.asset, asset);
  });

  test('keeps the color of widgets that already have one', () {
    const assetWidget = ImpaktfullUiAssetWidget(asset: asset, color: blue);
    final iconButton =
        ImpaktfullUiIconButton(onTap: () {}, asset: asset, color: blue);
    final widgets =
        <Widget>[assetWidget, iconButton].overrideColorOnWidgets(red);
    expect(widgets[0], same(assetWidget));
    expect(widgets[1], same(iconButton));
  });

  test('keeps other widgets as they are', () {
    const text = Text('text');
    const box = SizedBox();
    final widgets = <Widget>[text, box].overrideColorOnWidgets(red);
    expect(widgets, [same(text), same(box)]);
  });

  test('returns an empty list for an empty list', () {
    expect(<Widget>[].overrideColorOnWidgets(red), isEmpty);
  });
}

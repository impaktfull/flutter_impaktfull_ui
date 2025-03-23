import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/models/asset.dart';

class ImpaktfullUiListViewPlaceholderData {
  final ImpaktfullUiAsset? asset;
  final bool showAsset;
  final String? title;
  final String? subtitle;
  final bool showRefreshBtn;
  final List<Widget> actions;

  const ImpaktfullUiListViewPlaceholderData({
    required this.title,
    this.subtitle,
    this.asset,
    this.showAsset = true,
    this.showRefreshBtn = true,
    this.actions = const [],
  });
}

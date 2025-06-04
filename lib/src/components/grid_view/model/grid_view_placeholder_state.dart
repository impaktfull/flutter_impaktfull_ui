import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/models/asset.dart';

class ImpaktfullUiGridViewPlaceholderData {
  final ImpaktfullUiAsset? asset;
  final bool showAsset;
  final String? title;
  final String? subtitle;
  final bool showRefreshBtn;
  final List<Widget> actions;

  const ImpaktfullUiGridViewPlaceholderData({
    required this.title,
    this.subtitle,
    this.asset,
    this.showAsset = true,
    this.showRefreshBtn = true,
    this.actions = const [],
  });
}

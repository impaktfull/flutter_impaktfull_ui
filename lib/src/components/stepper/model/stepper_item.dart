import 'package:impaktfull_ui/src/models/asset.dart';

class ImpaktfullUiStepperItem {
  final bool isCompleted;
  final String? title;
  final String? subtitle;
  final ImpaktfullUiAsset? asset;

  const ImpaktfullUiStepperItem({
    required this.isCompleted,
    this.title,
    this.subtitle,
    this.asset,
  });
}

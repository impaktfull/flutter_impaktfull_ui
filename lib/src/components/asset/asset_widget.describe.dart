part of 'asset_widget.dart';

String _describeInstance(
    BuildContext context, ImpaktfullUiAssetWidget instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('asset', instance.asset);
  descriptor.add('color', instance.color);
  descriptor.add('height', instance.height);
  descriptor.add('width', instance.width);
  return descriptor.describe();
}

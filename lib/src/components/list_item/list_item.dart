import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/asset/asset_widget.dart';
import 'package:impaktfull_ui/src/components/list_item/list_item.dart';
import 'package:impaktfull_ui/src/components/loading_indicator/loading_indicator.dart';
import 'package:impaktfull_ui/src/components/simple_list_item/simple_list_item.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/util/descriptor/component_descriptor_mixin.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'list_item_style.dart';
export 'list_item_type.dart';

part 'list_item.describe.dart';

class ImpaktfullUiListItem extends StatefulWidget
    with ComponentDescriptorMixin {
  final String title;
  final String? subtitle;
  final ImpaktfullUiAsset? leading;
  final ImpaktfullUiAsset? trailing;
  final VoidCallback? onTap;
  final AsyncCallback? onAsyncTap;
  final ImpaktfullUiListItemType type;
  final ImpaktfullUiListItemTheme? theme;

  const ImpaktfullUiListItem({
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
    this.onAsyncTap,
    this.type = ImpaktfullUiListItemType.neutral,
    this.theme,
    super.key,
  });

  @override
  State<ImpaktfullUiListItem> createState() => _ImpaktfullUiListItemState();

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}

class _ImpaktfullUiListItemState extends State<ImpaktfullUiListItem> {
  var _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      component: widget,
      overrideComponentTheme: widget.theme,
      builder: (context, componentTheme) {
        final isClickable = widget.onTap != null || widget.onAsyncTap != null;
        return ImpaktfullUiSimpleListItem(
          title: widget.title,
          subtitle: widget.subtitle,
          onTap: isClickable ? _onTap : null,
          type: widget.type.simpleLisItemType,
          leadingWidgetBuilder: widget.leading == null
              ? null
              : (context) => ImpaktfullUiAssetWidget(
                    asset: widget.leading,
                    color: _getIconColor(componentTheme),
                    size: componentTheme.dimens.leadingSize,
                  ),
          trailingWidgetBuilder: isClickable
              ? (context) {
                  if (_isLoading) {
                    return SizedBox(
                      width: widget.subtitle == null ? 24 : 32,
                      height: widget.subtitle == null ? 24 : 32,
                      child: ImpaktfullUiLoadingIndicator(
                        color: componentTheme.colors.icons,
                      ),
                    );
                  }
                  if (widget.trailing != null) {
                    return ImpaktfullUiAssetWidget(
                      asset: widget.trailing,
                      color: _getIconColor(componentTheme),
                    );
                  }
                  return ImpaktfullUiAssetWidget(
                    asset: componentTheme.assets.chevronRight,
                    color: componentTheme.colors.icons,
                  );
                }
              : widget.trailing == null
                  ? null
                  : (context) => ImpaktfullUiAssetWidget(
                        asset: widget.trailing,
                        color: _getIconColor(componentTheme),
                      ),
        );
      },
    );
  }

  void _onTap() {
    if (widget.onTap != null) {
      widget.onTap!();
      return;
    }
    _onAsyncTap();
  }

  Future<void> _onAsyncTap() async {
    _isLoading = true;
    setState(() {});
    try {
      await widget.onAsyncTap!();
      if (!mounted) return;
      _isLoading = false;
      setState(() {});
    } catch (error) {
      if (!mounted) return;
      _isLoading = false;
      setState(() {});
      rethrow;
    }
  }

  Color _getIconColor(ImpaktfullUiListItemTheme componentTheme) {
    switch (widget.type) {
      case ImpaktfullUiListItemType.neutral:
        return componentTheme.colors.icons;
      case ImpaktfullUiListItemType.danger:
        return componentTheme.colors.danger;
    }
  }
}

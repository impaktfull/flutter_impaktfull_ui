import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/asset/asset_widget.dart';
import 'package:impaktfull_ui_2/src/components/list_item/list_item.dart';
import 'package:impaktfull_ui_2/src/components/loading_indicator/loading_indicator.dart';
import 'package:impaktfull_ui_2/src/components/simple_list_item/simple_list_item.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/models/asset.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';

export 'list_item_style.dart';
export 'list_item_type.dart';

part 'list_item.describe.dart';

class ImpaktfullUiListItem extends StatefulWidget with ComponentDescriptorMixin {
  final String title;
  final String? subtitle;
  final ImpaktfullUiAsset? leading;
  final VoidCallback? onTap;
  final AsyncCallback? onAsyncTap;
  final ImpaktfullUiListItemType type;
  final ImpaktfullUiListItemTheme? theme;

  const ImpaktfullUiListItem({
    required this.title,
    this.subtitle,
    this.leading,
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
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiListItemTheme>(
      overrideComponentTheme: widget.theme,
      builder: (context, theme, componentTheme) {
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
                  return ImpaktfullUiAssetWidget(
                    asset: componentTheme.assets.chevronRight,
                    color: componentTheme.colors.icons,
                  );
                }
              : null,
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

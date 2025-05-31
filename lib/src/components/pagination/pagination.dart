import 'dart:math';

import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/button/button.dart';
import 'package:impaktfull_ui/src/components/pagination/pagination_style.dart';
import 'package:impaktfull_ui/src/util/descriptor/component_descriptor_mixin.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component.dart';

export 'pagination_style.dart';

part 'pagination.describe.dart';

class ImpaktfullUiPagination extends StatelessWidget
    with ComponentDescriptorMixin {
  /// The page should be zero index based
  final int page;
  final int itemsPerPage;
  final int? _amountOfPages;
  final int? _amountOfItems;
  final ValueChanged<int> onLoadPage;
  final ImpaktfullUiPaginationTheme? theme;

  int get amountOfPages {
    final amountOfPages = _amountOfPages;
    if (amountOfPages != null) return amountOfPages;
    final amountOfItems = _amountOfItems;
    if (amountOfItems != null) return (amountOfItems / itemsPerPage).ceil();
    throw Exception('amountOfPages or amountOfItems is required');
  }

  bool get isFinalPage => page >= amountOfPages - 1;

  const ImpaktfullUiPagination({
    required this.page,
    required this.itemsPerPage,
    required int amountOfItems,
    required this.onLoadPage,
    this.theme,
    super.key,
  })  : _amountOfItems = amountOfItems,
        _amountOfPages = null;

  const ImpaktfullUiPagination.withAmountOfPages({
    required this.page,
    required this.itemsPerPage,
    required this.onLoadPage,
    required int amountOfPages,
    this.theme,
    super.key,
  })  : _amountOfPages = amountOfPages,
        _amountOfItems = null;

  @override
  Widget build(BuildContext context) {
    final humanReadablePage = page + 1;
    final humanReadableAmountOfPages = max(amountOfPages, 1);
    return ImpaktfullUiOverridableComponentBuilder(
      component: this,
      overrideComponentTheme: theme,
      builder: (context, componentTheme) => ImpaktfullUiAutoLayout.horizontal(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ImpaktfullUiButton(
            type: ImpaktfullUiButtonType.secondaryGrey,
            leadingAsset: componentTheme.assets.arrowLeft,
            onTap: page == 0 ? null : () => onLoadPage(page - 1),
          ),
          Expanded(
            child: Text(
              'Page $humanReadablePage of $humanReadableAmountOfPages',
              style: componentTheme.textStyles.text,
              textAlign: TextAlign.center,
            ),
          ),
          ImpaktfullUiButton(
            type: ImpaktfullUiButtonType.secondaryGrey,
            leadingAsset: componentTheme.assets.arrowRight,
            onTap: isFinalPage ? null : () => onLoadPage(page + 1),
          ),
        ],
      ),
    );
  }

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}

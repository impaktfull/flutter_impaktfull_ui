import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui_2/src/components/button/button.dart';
import 'package:impaktfull_ui_2/src/components/pagination/pagination_style.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';

export 'pagination_style.dart';

part 'pagination.describe.dart';

class ImpaktfullUiPagination extends StatelessWidget
    with ComponentDescriptorMixin {
  final int page;
  final int itemsPerPage;
  final int amountOfItems;
  final ValueChanged<int> onLoadPage;
  final ImpaktfullUiPaginationTheme? theme;

  int get amountOfPages => (amountOfItems / itemsPerPage).ceil();
  bool get isFinalPage => page >= amountOfPages;

  const ImpaktfullUiPagination({
    required this.page,
    required this.itemsPerPage,
    required this.amountOfItems,
    required this.onLoadPage,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiPaginationTheme>(
      overrideComponentTheme: theme,
      builder: (context, componentTheme) => ImpaktfullUiAutoLayout.horizontal(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ImpaktfullUiButton(
            type: ImpaktfullUiButtonType.secondaryGrey,
            leadingAsset: componentTheme.assets.arrowLeft,
            onTap: page == 1 ? null : () => onLoadPage(page - 1),
          ),
          Expanded(
            child: Text(
              'Page $page of $amountOfPages',
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

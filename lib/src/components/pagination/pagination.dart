import 'dart:math';

import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/button/button.dart';
import 'package:impaktfull_ui/src/components/pagination/pagination.localizations.dart';
import 'package:impaktfull_ui/src/components/pagination/pagination_style.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'pagination.localizations.dart';
export 'pagination_style.dart';

class ImpaktfullUiPagination extends StatelessWidget {
  /// The page should be zero index based
  final int page;
  final int itemsPerPage;
  final int? _amountOfPages;
  final int? _amountOfItems;
  final ValueChanged<int> onPageChanged;
  final ImpaktfullUiPaginationTheme? theme;

  /// The texts of the pagination. Defaults to the localizations of the app.
  final ImpaktfullUiPaginationLocalizations? localizations;

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
    // `onPageChanged` becomes `required` again in 1.0.0, when `onLoadPage` is
    // removed.
    ValueChanged<int>? onPageChanged,
    @Deprecated('Use onPageChanged instead. Will be removed in 1.0.0.')
    ValueChanged<int>? onLoadPage,
    this.theme,
    this.localizations,
    super.key,
  })  : _amountOfItems = amountOfItems,
        _amountOfPages = null,
        assert(onPageChanged != null || onLoadPage != null,
            'onPageChanged is required'),
        onPageChanged = (onPageChanged ?? onLoadPage) as ValueChanged<int>;

  const ImpaktfullUiPagination.withAmountOfPages({
    required this.page,
    required this.itemsPerPage,
    // `onPageChanged` becomes `required` again in 1.0.0, when `onLoadPage` is
    // removed.
    ValueChanged<int>? onPageChanged,
    @Deprecated('Use onPageChanged instead. Will be removed in 1.0.0.')
    ValueChanged<int>? onLoadPage,
    required int amountOfPages,
    this.theme,
    this.localizations,
    super.key,
  })  : _amountOfPages = amountOfPages,
        _amountOfItems = null,
        assert(onPageChanged != null || onLoadPage != null,
            'onPageChanged is required'),
        onPageChanged = (onPageChanged ?? onLoadPage) as ValueChanged<int>;

  @Deprecated('Use onPageChanged instead. Will be removed in 1.0.0.')
  ValueChanged<int> get onLoadPage => onPageChanged;

  @override
  Widget build(BuildContext context) {
    final humanReadablePage = page + 1;
    final humanReadableAmountOfPages = max(amountOfPages, 1);
    final localizations =
        this.localizations ?? ImpaktfullUiPaginationLocalizations.of(context);
    return ImpaktfullUiOverridableComponentBuilder(
      component: this,
      overrideComponentTheme: theme,
      builder: (context, componentTheme) => ImpaktfullUiAutoLayout.horizontal(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ImpaktfullUiButton(
            type: ImpaktfullUiButtonType.secondaryGrey,
            leadingAsset: componentTheme.assets.arrowLeft
                .copyWith(matchTextDirection: true),
            tooltip: localizations.previousPage,
            onTap: page == 0 ? null : () => onPageChanged(page - 1),
          ),
          Expanded(
            // Announces the new page when it changes.
            child: Semantics(
              liveRegion: true,
              child: Text(
                localizations.pageLabel(
                    humanReadablePage, humanReadableAmountOfPages),
                style: componentTheme.textStyles.text,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          ImpaktfullUiButton(
            type: ImpaktfullUiButtonType.secondaryGrey,
            leadingAsset: componentTheme.assets.arrowRight
                .copyWith(matchTextDirection: true),
            tooltip: localizations.nextPage,
            onTap: isFinalPage ? null : () => onPageChanged(page + 1),
          ),
        ],
      ),
    );
  }
}

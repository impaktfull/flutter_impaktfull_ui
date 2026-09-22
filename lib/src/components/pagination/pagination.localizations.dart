import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/util/localizations/localizations.dart';

class ImpaktfullUiPaginationLocalizations
    extends ImpaktfullUiComponentLocalizations {
  /// The label between the buttons, e.g. `Page 1 of 10`. [page] starts at 1.
  final String Function(int page, int amountOfPages) pageLabel;

  /// The tooltip and semantics label of the button to the previous page.
  final String previousPage;

  /// The tooltip and semantics label of the button to the next page.
  final String nextPage;

  const ImpaktfullUiPaginationLocalizations({
    this.pageLabel = _defaultPageLabel,
    this.previousPage = 'Previous page',
    this.nextPage = 'Next page',
  });

  static ImpaktfullUiPaginationLocalizations of(BuildContext context) =>
      ImpaktfullUiLocalizations.of<ImpaktfullUiPaginationLocalizations>(
          context);

  ImpaktfullUiPaginationLocalizations copyWith({
    String Function(int page, int amountOfPages)? pageLabel,
    String? previousPage,
    String? nextPage,
  }) =>
      ImpaktfullUiPaginationLocalizations(
        pageLabel: pageLabel ?? this.pageLabel,
        previousPage: previousPage ?? this.previousPage,
        nextPage: nextPage ?? this.nextPage,
      );
}

String _defaultPageLabel(int page, int amountOfPages) =>
    'Page $page of $amountOfPages';

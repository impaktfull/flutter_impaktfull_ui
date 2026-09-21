import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/util/localizations/localizations.dart';

class ImpaktfullUiPaginationLocalizations
    extends ImpaktfullUiComponentLocalizations {
  /// The label between the buttons, e.g. `Page 1 of 10`. [page] starts at 1.
  final String Function(int page, int amountOfPages) pageLabel;

  const ImpaktfullUiPaginationLocalizations({
    this.pageLabel = _defaultPageLabel,
  });

  static ImpaktfullUiPaginationLocalizations of(BuildContext context) =>
      ImpaktfullUiLocalizations.of<ImpaktfullUiPaginationLocalizations>(
          context);

  ImpaktfullUiPaginationLocalizations copyWith({
    String Function(int page, int amountOfPages)? pageLabel,
  }) =>
      ImpaktfullUiPaginationLocalizations(
        pageLabel: pageLabel ?? this.pageLabel,
      );
}

String _defaultPageLabel(int page, int amountOfPages) =>
    'Page $page of $amountOfPages';

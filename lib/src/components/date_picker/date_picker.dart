import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/button/button.dart';
import 'package:impaktfull_ui/src/components/date_picker/date_picker.localizations.dart';
import 'package:impaktfull_ui/src/components/date_picker/date_picker_active_type.dart';
import 'package:impaktfull_ui/src/components/date_picker/date_picker_style.dart';
import 'package:impaktfull_ui/src/components/date_picker/date_picker_type.dart';
import 'package:impaktfull_ui/src/components/date_picker/util/date_picker_bounds.dart';
import 'package:impaktfull_ui/src/components/date_picker/widgets/date_picker_page.dart';
import 'package:impaktfull_ui/src/components/modal/modal.dart';
import 'package:impaktfull_ui/src/util/extension/edge_insets_geometry_extension.dart';
import 'package:impaktfull_ui/src/util/locale/locale_util.dart';
import 'package:impaktfull_ui/src/util/localizations/localizations.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'date_picker.localizations.dart';
export 'date_picker_style.dart';
export 'date_picker_type.dart';

class ImpaktfullUiDatePicker extends StatefulWidget {
  final DateTime? selectedStartDate;
  final DateTime? selectedEndDate;
  final ValueChanged<DateTime?> onStartDateChanged;
  final ValueChanged<DateTime?>? onEndDateChanged;
  final ImpaktfullUiDatePickerType type;
  final EdgeInsetsGeometry margin;
  final ImpaktfullUiDatePickerTheme? theme;

  /// The texts of the date picker. Defaults to the localizations of the app.
  final ImpaktfullUiDatePickerLocalizations? localizations;

  /// The first day of the week ([DateTime.monday] ... [DateTime.sunday]).
  ///
  /// Defaults to the first day of the week of the locale (see
  /// `MaterialLocalizations.firstDayOfWeekIndex`), or Monday when the app has
  /// no localized material localizations.
  final int? firstDayOfWeek;

  /// The earliest date the user can pick, `null` (the default) for no limit.
  ///
  /// Named like `CalendarDatePicker.firstDate` of Flutter. Days before it are
  /// disabled and the picker can not navigate to a month, year or decade
  /// before it. Only the calendar day counts, the time of day is ignored.
  final DateTime? firstDate;

  /// The latest date the user can pick, `null` (the default) for no limit.
  ///
  /// Named like `CalendarDatePicker.lastDate` of Flutter. Days after it are
  /// disabled and the picker can not navigate to a month, year or decade
  /// after it. Only the calendar day counts, so a [lastDate] of 23/09/2026
  /// 10:00 still allows picking 23/09/2026.
  final DateTime? lastDate;

  const ImpaktfullUiDatePicker({
    required DateTime? selectedDate,
    required ValueChanged<DateTime?> onDateChanged,
    this.margin = EdgeInsets.zero,
    this.theme,
    this.localizations,
    this.firstDayOfWeek,
    this.firstDate,
    this.lastDate,
    super.key,
  })  : selectedStartDate = selectedDate,
        selectedEndDate = null,
        onStartDateChanged = onDateChanged,
        onEndDateChanged = null,
        type = ImpaktfullUiDatePickerType.single;

  const ImpaktfullUiDatePicker.range({
    required this.selectedStartDate,
    required this.selectedEndDate,
    required this.onStartDateChanged,
    required this.onEndDateChanged,
    this.margin = EdgeInsets.zero,
    this.theme,
    this.localizations,
    this.firstDayOfWeek,
    this.firstDate,
    this.lastDate,
    super.key,
  }) : type = ImpaktfullUiDatePickerType.range;

  @override
  State<ImpaktfullUiDatePicker> createState() => _ImpaktfullUiDatePickerState();

  static Future<DateTime?> showModal({
    required BuildContext context,
    DateTime? selectedDate,
    bool showDividers = false,
    bool hasBlurredBackground = false,
    bool isDismissible = false,
    bool rootNavigator = false,
    ImpaktfullUiDatePickerLocalizations? localizations,
    int? firstDayOfWeek,
    DateTime? firstDate,
    DateTime? lastDate,
  }) {
    assertValidDatePickerBounds(firstDate, lastDate);
    final datePickerLocalizations = localizations ??
        ImpaktfullUiLocalizations.of<ImpaktfullUiDatePickerLocalizations>(
            context);
    var newDate = selectedDate;
    return ImpaktfullUiModal.showSimple(
      context: context,
      hasClose: false,
      hasBlurredBackground: hasBlurredBackground,
      isDismissible: isDismissible,
      width: 310,
      rootNavigator: rootNavigator,
      showDividers: showDividers,
      childPadding: const EdgeInsets.only(top: 16),
      actions: [
        // Use the context of the modal route, not the caller's context:
        // with rootNavigator the modal is not on the caller's navigator.
        Builder(
          builder: (context) => ImpaktfullUiButton(
            type: ImpaktfullUiButtonType.secondaryGrey,
            title: datePickerLocalizations.cancelBtn,
            onTap: () => Navigator.of(context).pop(),
          ),
        ),
        Builder(
          builder: (context) => ImpaktfullUiButton(
            type: ImpaktfullUiButtonType.primary,
            title: datePickerLocalizations.applyBtn,
            onTap: () => Navigator.of(context).pop(newDate),
          ),
        ),
      ],
      child: StatefulBuilder(
        builder: (context, setState) => ImpaktfullUiDatePicker(
          selectedDate: newDate,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          localizations: datePickerLocalizations,
          firstDayOfWeek: firstDayOfWeek,
          firstDate: firstDate,
          lastDate: lastDate,
          onDateChanged: (value) {
            setState(() => newDate = value);
          },
        ),
      ),
    );
  }

  static Future<DateTimeRange?> showRangeModal({
    required BuildContext context,
    DateTime? selectedStartDate,
    DateTime? selectedEndDate,
    bool showDividers = false,
    bool hasBlurredBackground = false,
    bool isDismissible = false,
    bool rootNavigator = false,
    ImpaktfullUiDatePickerLocalizations? localizations,
    int? firstDayOfWeek,
    DateTime? firstDate,
    DateTime? lastDate,
  }) {
    assertValidDatePickerBounds(firstDate, lastDate);
    final datePickerLocalizations = localizations ??
        ImpaktfullUiLocalizations.of<ImpaktfullUiDatePickerLocalizations>(
            context);
    var newStartDate = selectedStartDate;
    var newEndDate = selectedEndDate;
    return ImpaktfullUiModal.showSimple(
      context: context,
      hasClose: false,
      hasBlurredBackground: hasBlurredBackground,
      isDismissible: isDismissible,
      rootNavigator: rootNavigator,
      showDividers: showDividers,
      width: 310,
      childPadding: const EdgeInsets.only(top: 16),
      actions: [
        Builder(
          builder: (context) => ImpaktfullUiButton(
            type: ImpaktfullUiButtonType.secondaryGrey,
            title: datePickerLocalizations.cancelBtn,
            onTap: () => Navigator.of(context).pop(),
          ),
        ),
        Builder(
          builder: (context) => ImpaktfullUiButton(
            type: ImpaktfullUiButtonType.primary,
            title: datePickerLocalizations.applyBtn,
            onTap: () {
              final startDate = newStartDate;
              final endDate = newEndDate;
              if (startDate == null || endDate == null) {
                Navigator.of(context).pop();
                return;
              }
              final dateTimeRange =
                  DateTimeRange(start: startDate, end: endDate);
              Navigator.of(context).pop(dateTimeRange);
            },
          ),
        ),
      ],
      child: StatefulBuilder(
        builder: (context, setState) => ImpaktfullUiDatePicker.range(
          selectedStartDate: newStartDate,
          selectedEndDate: newEndDate,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          localizations: datePickerLocalizations,
          firstDayOfWeek: firstDayOfWeek,
          firstDate: firstDate,
          lastDate: lastDate,
          onStartDateChanged: (value) => setState(() => newStartDate = value),
          onEndDateChanged: (value) => setState(() => newEndDate = value),
        ),
      ),
    );
  }
}

class _ImpaktfullUiDatePickerState extends State<ImpaktfullUiDatePicker> {
  /// The amount of pages before and after the page of [_initialStartDay] when
  /// there is no [ImpaktfullUiDatePicker.firstDate] / `lastDate`.
  static const int _unboundedPages = 10000;

  late PageController _pageController;

  /// The controllers of the pages that are being replaced this frame: the old
  /// [PageView] still holds them until the next frame.
  final _staleControllers = <PageController>[];

  /// Changes whenever the [PageView] needs a fresh scroll position, so it
  /// starts at the page of the new controller instead of keeping its pixels.
  var _pageViewGeneration = 0;
  late int _pageIndex;
  var _activeType = ImpaktfullUiDatePickerActiveType.days;
  late DateTime _initialStartDay;
  late DateTime _activeDate;

  ImpaktfullUiDatePickerBounds get _bounds => ImpaktfullUiDatePickerBounds(
        firstDate: widget.firstDate,
        lastDate: widget.lastDate,
      );

  @override
  void initState() {
    super.initState();
    assertValidDatePickerBounds(widget.firstDate, widget.lastDate);
    // A selected date outside the bounds does not crash: the picker opens on
    // the closest date inside the bounds.
    final startDay = _bounds.clamp(widget.selectedStartDate ?? DateTime.now());
    _initialStartDay = startDay;
    _activeDate = startDay;
    _pageIndex = _anchorPage;
    _pageController = PageController(initialPage: _pageIndex)
      ..addListener(_onPageControllerUpdated);
  }

  @override
  void didUpdateWidget(covariant ImpaktfullUiDatePicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.firstDate != oldWidget.firstDate ||
        widget.lastDate != oldWidget.lastDate) {
      assertValidDatePickerBounds(widget.firstDate, widget.lastDate);
      // Every page is indexed from `_initialStartDay` and the first date, so
      // new bounds mean new page indexes: start the page view over.
      _initialStartDay = _bounds.clamp(_initialStartDay);
      _activeDate = _bounds.clamp(_activeDate);
      _resetPageView(_activeType, _activeDate);
      return;
    }
    final selectedStartDate = widget.selectedStartDate;
    if (selectedStartDate != null &&
        selectedStartDate != oldWidget.selectedStartDate) {
      final oldActiveDate = _activeDate;
      if (oldActiveDate != selectedStartDate) {
        _activeDate = _bounds.clamp(selectedStartDate);
        _setCorrectPage();
      }
    }
  }

  @override
  void dispose() {
    _disposeStaleControllers();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      component: widget,
      overrideComponentTheme: widget.theme,
      // Only the pages have a fixed height: a header with a title that wraps
      // (a long month name, a large text scale) makes the picker taller
      // instead of cutting off the last week of the month.
      builder: (context, componentTheme) => SizedBox(
        width: 280 + widget.margin.horizontal,
        child: ImpaktfullUiAutoLayout.vertical(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 8,
          children: [
            Padding(
              padding: widget.margin,
              child: ImpaktfullUiAutoLayout.horizontal(
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 8,
                children: [
                  ImpaktfullUiButton(
                    type: ImpaktfullUiButtonType.tertiaryGrey,
                    leadingAsset: componentTheme.assets.arrowLeft
                        .copyWith(matchTextDirection: true),
                    onTap: _hasPreviousPage ? _onPreviousTapped : null,
                  ),
                  Expanded(
                    child: ImpaktfullUiButton(
                      type: ImpaktfullUiButtonType.tertiaryGrey,
                      title: _formatDate(_activeDate),
                      onTap: _onHeaderTitleTapped,
                    ),
                  ),
                  ImpaktfullUiButton(
                    type: ImpaktfullUiButtonType.tertiaryGrey,
                    leadingAsset: componentTheme.assets.arrowRight
                        .copyWith(matchTextDirection: true),
                    onTap: _hasNextPage ? _onNextTapped : null,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 260,
              child: PageView.builder(
                key: ValueKey(_pageViewGeneration),
                controller: _pageController,
                itemCount: _pageCount,
                itemBuilder: (context, index) {
                  final date = _getPageDate(index);
                  return ImpaktfullUiDatePickerPage(
                    date: date,
                    activeType: _activeType,
                    selectedStartDate: widget.selectedStartDate,
                    selectedEndDate: widget.selectedEndDate,
                    margin: EdgeInsetsDirectional.only(
                      start: widget.margin.start,
                      end: widget.margin.end,
                    ),
                    onStartDateChanged: widget.onStartDateChanged,
                    onEndDateChanged: widget.onEndDateChanged,
                    onChangeActiveType: _onActiveTypeChanged,
                    theme: componentTheme,
                    firstDayOfWeek: widget.firstDayOfWeek,
                    localizations: widget.localizations,
                    bounds: _bounds,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// The page of [_initialStartDay] for the active type.
  ///
  /// Without a `firstDate` every type keeps [_unboundedPages] pages in front
  /// of it. With a `firstDate` the first page of the [PageView] is the first
  /// month, year or decade inside the bounds, so the user can not scroll or
  /// swipe before it.
  int get _anchorPage => _anchorPageFor(_activeType);

  int _anchorPageFor(ImpaktfullUiDatePickerActiveType type) {
    switch (type) {
      case ImpaktfullUiDatePickerActiveType.days:
        return _bounds.monthsSinceFirstDate(_initialStartDay) ??
            _unboundedPages;
      case ImpaktfullUiDatePickerActiveType.months:
        return _bounds.yearsSinceFirstDate(_initialStartDay) ?? _unboundedPages;
      case ImpaktfullUiDatePickerActiveType.years:
        return _bounds.decadesSinceFirstDate(_initialStartDay) ??
            _unboundedPages;
    }
  }

  /// The amount of pages of the [PageView] for the active type: the last page
  /// is the month, year or decade of the `lastDate`.
  int get _pageCount {
    final int pagesAfterAnchor;
    switch (_activeType) {
      case ImpaktfullUiDatePickerActiveType.days:
        pagesAfterAnchor =
            _bounds.monthsUntilLastDate(_initialStartDay) ?? _unboundedPages;
        break;
      case ImpaktfullUiDatePickerActiveType.months:
        pagesAfterAnchor =
            _bounds.yearsUntilLastDate(_initialStartDay) ?? _unboundedPages;
        break;
      case ImpaktfullUiDatePickerActiveType.years:
        pagesAfterAnchor =
            _bounds.decadesUntilLastDate(_initialStartDay) ?? _unboundedPages;
        break;
    }
    return _anchorPage + pagesAfterAnchor + 1;
  }

  bool get _hasPreviousPage => _pageIndex > 0;

  bool get _hasNextPage => _pageIndex < _pageCount - 1;

  /// The page that shows [date] with [type] active.
  int _pageIndexFor(ImpaktfullUiDatePickerActiveType type, DateTime date) {
    final anchor = _anchorPageFor(type);
    switch (type) {
      case ImpaktfullUiDatePickerActiveType.days:
        final yearsOffset = (date.year - _initialStartDay.year) * 12;
        final monthsOffset = date.month - _initialStartDay.month;
        return anchor + yearsOffset + monthsOffset;
      case ImpaktfullUiDatePickerActiveType.months:
        return anchor + (date.year - _initialStartDay.year);
      case ImpaktfullUiDatePickerActiveType.years:
        return anchor + (date.year ~/ 10) - (_initialStartDay.year ~/ 10);
    }
  }

  DateTime _getPageDate(int page) {
    final offset = page - _anchorPage;
    switch (_activeType) {
      // Always use the first day of the month: DateTime overflows days that do
      // not exist in the target month (Jan 31 + 1 month would be Mar 3).
      case ImpaktfullUiDatePickerActiveType.days:
        return DateTime(
          _initialStartDay.year,
          _initialStartDay.month + offset,
          1,
        );
      case ImpaktfullUiDatePickerActiveType.months:
        return DateTime(
          _initialStartDay.year + offset,
          _initialStartDay.month,
          1,
        );
      case ImpaktfullUiDatePickerActiveType.years:
        return DateTime(
          _initialStartDay.year + (offset * 10),
          _initialStartDay.month,
          1,
        );
    }
  }

  String _formatDate(DateTime date) {
    switch (_activeType) {
      case ImpaktfullUiDatePickerActiveType.days:
        return ImpaktfullUiLocaleUtil.formatMonthYear(context, date);
      case ImpaktfullUiDatePickerActiveType.months:
        return ImpaktfullUiLocaleUtil.formatYear(context, date);
      case ImpaktfullUiDatePickerActiveType.years:
        final localizations = widget.localizations ??
            ImpaktfullUiLocalizations.of<ImpaktfullUiDatePickerLocalizations>(
                context);
        return localizations.selectYearTitle;
    }
  }

  void _onPreviousTapped() {
    if (!_hasPreviousPage) return;
    final newPageIndex = _pageIndex - 1;
    _pageController.jumpToPage(newPageIndex);
  }

  void _onNextTapped() {
    if (!_hasNextPage) return;
    final newPageIndex = _pageIndex + 1;
    _pageController.jumpToPage(newPageIndex);
  }

  void _onHeaderTitleTapped() {
    if (_activeType == ImpaktfullUiDatePickerActiveType.days ||
        _activeType == ImpaktfullUiDatePickerActiveType.years) {
      _resetPageView(ImpaktfullUiDatePickerActiveType.months, _activeDate);
    } else if (_activeType == ImpaktfullUiDatePickerActiveType.months) {
      _resetPageView(ImpaktfullUiDatePickerActiveType.years, _activeDate);
    }
  }

  void _onPageControllerUpdated() {
    final page = _pageController.page;
    if (page == null) return;
    final value = page.toInt();
    if (page % 1 != 0) return;
    setState(() {
      _pageIndex = value;
      _activeDate = _getPageDate(value);
    });
  }

  void _onActiveTypeChanged(
          ImpaktfullUiDatePickerActiveType value, DateTime date) =>
      _resetPageView(value, date);

  void _setCorrectPage() =>
      _pageController.jumpToPage(_pageIndexFor(_activeType, _activeDate));

  /// Shows [date] with [type] active.
  ///
  /// A page is a month, a year or a decade depending on the active type, and
  /// with a `firstDate` / `lastDate` each of them has its own amount of pages,
  /// so switching between them can not `jumpToPage`: the page view starts over
  /// with a controller on the right page.
  void _resetPageView(
      ImpaktfullUiDatePickerActiveType type, DateTime activeDate) {
    final oldController = _pageController;
    oldController.removeListener(_onPageControllerUpdated);
    _staleControllers.add(oldController);
    setState(() {
      _activeType = type;
      _activeDate = activeDate;
      _pageIndex = _pageIndexFor(type, activeDate);
      _pageViewGeneration++;
      _pageController = PageController(initialPage: _pageIndex)
        ..addListener(_onPageControllerUpdated);
    });
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _disposeStaleControllers());
  }

  void _disposeStaleControllers() {
    for (final controller in _staleControllers) {
      controller.dispose();
    }
    _staleControllers.clear();
  }
}

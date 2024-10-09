import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui_2/src/components/button/button.dart';
import 'package:impaktfull_ui_2/src/components/date_picker/date_picker_active_type.dart';
import 'package:impaktfull_ui_2/src/components/date_picker/date_picker_style.dart';
import 'package:impaktfull_ui_2/src/components/date_picker/date_picker_type.dart';
import 'package:impaktfull_ui_2/src/components/date_picker/widgets/date_picker_page.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';
import 'package:intl/intl.dart';

export 'date_picker_style.dart';

part 'date_picker.describe.dart';

class ImpaktfullUiDatePicker extends StatefulWidget
    with ComponentDescriptorMixin {
  final DateTime? selectedStartDate;
  final DateTime? selectedEndDate;
  final ValueChanged<DateTime?> onStartDateChanged;
  final ValueChanged<DateTime?>? onEndDateChanged;
  final ImpaktfullUiDatePickerType type;
  final EdgeInsetsGeometry margin;
  final ImpaktfullUiDatePickerTheme? theme;

  const ImpaktfullUiDatePicker({
    required DateTime? selectedDate,
    required ValueChanged<DateTime?> onDateChanged,
    this.margin = EdgeInsets.zero,
    this.theme,
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
    super.key,
  }) : type = ImpaktfullUiDatePickerType.range;

  @override
  State<ImpaktfullUiDatePicker> createState() => _ImpaktfullUiDatePickerState();

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}

class _ImpaktfullUiDatePickerState extends State<ImpaktfullUiDatePicker> {
  static const int initialPage = 10000;

  late final PageController _pageController;

  var _pageIndex = initialPage;
  var _activeType = ImpaktfullUiDatePickerActiveType.days;
  late DateTime _initialStartDay;
  late DateTime _activeDate;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: initialPage);
    _pageController.addListener(_onPageControllerUpdated);
    _initialStartDay = widget.selectedStartDate ?? DateTime.now();
    _activeDate = widget.selectedStartDate ?? DateTime.now();
  }

  @override
  void didUpdateWidget(covariant ImpaktfullUiDatePicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    final selectedStartDate = widget.selectedStartDate;
    if (selectedStartDate != null &&
        selectedStartDate != oldWidget.selectedStartDate) {
      final oldActiveDate = _activeDate;
      if (oldActiveDate != selectedStartDate) {
        _activeDate = selectedStartDate;
        _setCorrectPage();
      }
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiDatePickerTheme>(
      overrideComponentTheme: widget.theme,
      builder: (context, theme, componentTheme) {
        return SizedBox(
          width: 280 + widget.margin.horizontal,
          height: 312 + widget.margin.vertical,
          child: ImpaktfullUiAutoLayout.vertical(
            spacing: 8,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: widget.margin,
                child: ImpaktfullUiAutoLayout.horizontal(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 8,
                  children: [
                    ImpaktfullUiButton(
                      type: ImpaktfullUiButtonType.tertiaryGrey,
                      leadingIcon: componentTheme.assets.arrowLeft,
                      onTap: _onPreviousTapped,
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
                      leadingIcon: componentTheme.assets.arrowRight,
                      onTap: _onNextTapped,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: initialPage * 2,
                  itemBuilder: (context, index) {
                    final date = _getPageDate(index);
                    return ImpaktfullUiDatePickerPage(
                      date: date,
                      activeType: _activeType,
                      selectedStartDate: widget.selectedStartDate,
                      selectedEndDate: widget.selectedEndDate,
                      margin: widget.margin,
                      onStartDateChanged: widget.onStartDateChanged,
                      onEndDateChanged: widget.onEndDateChanged,
                      onChangeActiveType: _onActiveTypeChanged,
                      theme: componentTheme,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  DateTime _getPageDate(int page) {
    final offset = page - initialPage;
    switch (_activeType) {
      case ImpaktfullUiDatePickerActiveType.days:
        return DateTime(
          _initialStartDay.year,
          _initialStartDay.month + offset,
          _initialStartDay.day,
        );
      case ImpaktfullUiDatePickerActiveType.months:
        return DateTime(
          _initialStartDay.year + offset,
          _initialStartDay.month,
          _initialStartDay.day,
        );
      case ImpaktfullUiDatePickerActiveType.years:
        return DateTime(
          _initialStartDay.year + (offset * 10),
          _initialStartDay.month,
          _initialStartDay.day,
        );
    }
  }

  String _formatDate(DateTime date) {
    switch (_activeType) {
      case ImpaktfullUiDatePickerActiveType.days:
        return DateFormat.yMMMM().format(date);
      case ImpaktfullUiDatePickerActiveType.months:
        return DateFormat.y().format(date);
      case ImpaktfullUiDatePickerActiveType.years:
        return 'Select a year';
    }
  }

  void _onPreviousTapped() {
    final newPageIndex = _pageIndex - 1;
    _pageController.jumpToPage(newPageIndex);
  }

  void _onNextTapped() {
    final newPageIndex = _pageIndex + 1;
    _pageController.jumpToPage(newPageIndex);
  }

  void _onHeaderTitleTapped() {
    if (_activeType == ImpaktfullUiDatePickerActiveType.days ||
        _activeType == ImpaktfullUiDatePickerActiveType.years) {
      setState(() {
        _activeType = ImpaktfullUiDatePickerActiveType.months;
      });
      final offset = _activeDate.year - _initialStartDay.year;
      _pageController.jumpToPage(initialPage + offset);
    } else if (_activeType == ImpaktfullUiDatePickerActiveType.months) {
      setState(() {
        _activeType = ImpaktfullUiDatePickerActiveType.years;
      });
      final currentDecade = (_initialStartDay.year ~/ 10) * 10;
      final activeDecade = (_activeDate.year ~/ 10) * 10;
      final decadeOffset = (activeDecade - currentDecade) ~/ 10;
      if (decadeOffset != 0) {
        _pageController.jumpToPage(initialPage + decadeOffset);
      }
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
      ImpaktfullUiDatePickerActiveType value, DateTime date) {
    setState(() {
      _activeType = value;
      _activeDate = date;
    });
    _setCorrectPage();
  }

  void _setCorrectPage() {
    switch (_activeType) {
      case ImpaktfullUiDatePickerActiveType.days:
        final yearsOffset = (_activeDate.year - _initialStartDay.year) * 12;
        final monthsOffset = _activeDate.month - _initialStartDay.month;
        _pageController.jumpToPage(initialPage + yearsOffset + monthsOffset);
        break;
      case ImpaktfullUiDatePickerActiveType.months:
        _pageController.jumpToPage(
            initialPage + (_activeDate.year - _initialStartDay.year));
        break;
      case ImpaktfullUiDatePickerActiveType.years:
        throw UnimplementedError();
    }
  }
}
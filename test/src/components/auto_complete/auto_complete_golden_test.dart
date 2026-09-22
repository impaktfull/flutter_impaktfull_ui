import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/scheduler.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui/src/components/auto_complete/widget/auto_complete_overlay.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';
import '../_inputs_test_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  final icons = ImpaktfullUiTheme.getDefault().assets.icons;

  Widget autoComplete({
    String? placeholder,
    Widget? Function()? leadingBuilder,
    List<Widget> Function()? topBuilder,
  }) =>
      goldenSized(ImpaktfullUiAutoComplete<String>(
        placeholder: placeholder,
        noDataLabel: 'No results',
        leadingBuilder: leadingBuilder,
        topBuilder: topBuilder,
        onSearchChanged: (query) => [],
        itemBuilder: (context, item, index, controller) => Text(item),
      ));

  runComponentTest(
    fileName: 'impaktfull_ui_auto_complete',
    columns: 2,
    goldenTests: () => [
      GoldenTest(child: autoComplete()),
      GoldenTest(child: autoComplete(placeholder: 'Search a country')),
      GoldenTest(
        child: autoComplete(
          placeholder: 'Search',
          leadingBuilder: () => ImpaktfullUiAssetWidget(
            asset: icons.search,
            size: 20,
          ),
        ),
      ),
      GoldenTest(
        child: autoComplete(
          placeholder: 'Add a tag',
          topBuilder: () => [
            for (final label in [
              'Belgium',
              'The Netherlands',
              'Luxembourg',
              'A very long tag name',
            ])
              ImpaktfullUiBadge(
                type: ImpaktfullUiBadgeType.neutral,
                title: label,
              ),
          ],
        ),
      ),
    ],
  );

  runComponentTest(
    fileName: 'impaktfull_ui_auto_complete_overlay',
    columns: 2,
    goldenTests: () => [
      GoldenTest(
        description: 'results',
        child: const _Overlay(highlightSteps: 0),
      ),
      GoldenTest(
        description: 'second result highlighted with the arrow keys',
        child: const _Overlay(highlightSteps: 2),
      ),
    ],
  );
}

/// The overlay of the auto complete, with the arrow down key pressed
/// [highlightSteps] times once the results are loaded.
class _Overlay extends StatefulWidget {
  final int highlightSteps;

  const _Overlay({required this.highlightSteps});

  @override
  State<_Overlay> createState() => _OverlayState();
}

class _OverlayState extends State<_Overlay> {
  final _key = GlobalKey<ImpaktfullUiAutoCompleteOverlayState<String>>();
  var _steps = 0;

  @override
  void initState() {
    super.initState();
    _highlightAfterFrame();
  }

  void _highlightAfterFrame() {
    if (_steps >= widget.highlightSteps) return;
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final state = _key.currentState;
      if (!mounted) return;
      if (state != null && !state.isLoading) {
        state.moveHighlight(forward: true);
        _steps++;
      }
      SchedulerBinding.instance.scheduleFrame();
      _highlightAfterFrame();
    });
  }

  @override
  Widget build(BuildContext context) => SizedBox(
        width: 320,
        height: 320,
        child: ImpaktfullUiAutoCompleteOverlay<String>(
          key: _key,
          initialSearchQuery: 'b',
          onSearchChanged: (query) => ['Belgium', 'Bulgaria', 'Brazil'],
          itemBuilder: (context, item, index) =>
              ImpaktfullUiSimpleListItem(title: item, onTap: () {}),
          noDataLabel: 'No results',
          isShownAboveInputField: false,
          debounceDuration: Duration.zero,
        ),
      );
}

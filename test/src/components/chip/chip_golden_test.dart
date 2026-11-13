import 'package:material_ui/material_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';

void main() {
  setUp(() => setupComponentTest());

  runComponentTest(
    fileName: 'impaktfull_ui_chip',
    columns: 2,
    goldenTests: () => [
      for (final enabled in [true, false]) ...[
        for (final value in [false, true]) ...[
          GoldenTest(
            description: '${enabled ? 'enabled' : 'disabled'}, '
                '${value ? 'selected' : 'unselected'}',
            child: _cell(ImpaktfullUiChip(
              title: 'Unread',
              value: value,
              onTap: enabled ? () {} : null,
            )),
          ),
          GoldenTest(
            description: '${enabled ? 'enabled' : 'disabled'}, '
                '${value ? 'selected' : 'unselected'}, with a leading icon',
            child: _cell(ImpaktfullUiChip(
              title: 'Starred',
              value: value,
              leading: const ImpaktfullUiAsset.icon(Icons.star),
              onTap: enabled ? () {} : null,
            )),
          ),
        ],
      ],
      GoldenTest(
        description: 'a long title is truncated in a narrow width',
        child: _cell(SizedBox(
          width: 140,
          child: ImpaktfullUiChip(
            title: 'With attachments from last week',
            value: true,
            leading: const ImpaktfullUiAsset.icon(Icons.attach_file),
            onTap: () {},
          ),
        )),
      ),
      GoldenTest(
        description: 'chips in a Wrap',
        child: _cell(SizedBox(
          width: 220,
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final (index, title)
                  in ['Unread', 'Starred', 'Today', 'Mentions'].indexed)
                ImpaktfullUiChip(
                  title: title,
                  value: index.isEven,
                  onTap: () {},
                ),
            ],
          ),
        )),
      ),
    ],
  );
}

/// The chip at its own size, with some space around it.
Widget _cell(Widget child) => Padding(
      padding: const EdgeInsets.all(8),
      child: Align(
        alignment: AlignmentDirectional.centerStart,
        widthFactor: 1,
        heightFactor: 1,
        child: child,
      ),
    );

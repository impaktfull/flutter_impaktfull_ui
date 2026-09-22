import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../_layout_test_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  final action = ImpaktfullUiButton(
    type: ImpaktfullUiButtonType.secondaryGrey,
    size: ImpaktfullUiButtonSize.small,
    title: 'Action',
    leadingAsset: testAsset,
    onTap: () {},
  );

  runComponentTest(
    fileName: 'impaktfull_ui_cms_header',
    columns: 2,
    goldenTests: () => [
      layoutGoldenCase(
        'Title',
        const ImpaktfullUiCmsHeader(title: 'Title'),
        width: 600,
      ),
      layoutGoldenCase(
        'Title, subtitle and badge',
        const ImpaktfullUiCmsHeader(
          title: 'Title',
          subtitle: 'Subtitle',
          badge: 'Beta',
        ),
        width: 600,
      ),
      layoutGoldenCase(
        'Back and actions',
        ImpaktfullUiCmsHeader(
          title: 'Title',
          onBackTapped: () {},
          actions: [action, action],
        ),
        width: 600,
      ),
      layoutGoldenCase(
        'Drawer',
        ImpaktfullUiCmsHeader(
          title: 'Title',
          onDrawerTapped: () {},
        ),
        width: 600,
      ),
      layoutGoldenCase(
        'Bottom child',
        ImpaktfullUiCmsHeader(
          title: 'Title',
          bottomChild: ImpaktfullUiHorizontalTabs<int>(
            value: 0,
            onChanged: (_) {},
            tabs: [
              ImpaktfullUiHorizontalTabConfig(title: 'Tab 1', value: 0),
              ImpaktfullUiHorizontalTabConfig(title: 'Tab 2', value: 1),
            ],
          ),
        ),
        width: 600,
      ),
      layoutGoldenCase(
        'Empty',
        const ImpaktfullUiCmsHeader(),
        width: 600,
      ),
    ],
  );
}

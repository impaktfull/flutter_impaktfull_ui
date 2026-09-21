import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui/src/components/dropdown/widget/dropdown_overlay.dart';

import '../../util/test_util.dart';

/// Pumps [widget] in a left-to-right or a right-to-left layout.
Future<void> _pump(
  WidgetTester tester,
  TextDirection textDirection,
  Widget widget,
) =>
    pumpAndSettleComponent(
      tester,
      Directionality(textDirection: textDirection, child: widget),
    );

/// Runs [body] once for a left-to-right and once for a right-to-left layout.
void _testBothDirections(
  String description,
  Future<void> Function(WidgetTester tester, TextDirection textDirection) body,
) {
  for (final textDirection in TextDirection.values) {
    testWidgets('$description (${textDirection.name})',
        (tester) => body(tester, textDirection));
  }
}

bool _isRtl(TextDirection textDirection) => textDirection == TextDirection.rtl;

/// The distance between the start edge of [outer] and the start edge of
/// [inner], in the reading direction.
double _startInset(Rect outer, Rect inner, TextDirection textDirection) =>
    _isRtl(textDirection) ? outer.right - inner.right : inner.left - outer.left;

const _icon = ImpaktfullUiAsset.icon(Icons.star);

void main() {
  _testBothDirections('switch: the enabled thumb is at the end',
      (tester, textDirection) async {
    await _pump(
      tester,
      textDirection,
      Center(child: ImpaktfullUiSwitch(value: true, onChanged: (_) {})),
    );
    final switchRect = tester.getRect(find.byType(ImpaktfullUiSwitch));
    final thumbCenter = tester.getCenter(find
        .descendant(
          of: find.byType(ImpaktfullUiSwitch),
          matching: find.byType(AnimatedContainer),
        )
        .last);
    if (_isRtl(textDirection)) {
      expect(thumbCenter.dx, lessThan(switchRect.center.dx));
    } else {
      expect(thumbCenter.dx, greaterThan(switchRect.center.dx));
    }
  });

  _testBothDirections(
      'segmented control: the indicator is under the selected segment',
      (tester, textDirection) async {
    for (final value in ['A', 'B', 'C']) {
      await _pump(
        tester,
        textDirection,
        Center(
          child: SizedBox(
            width: 300,
            child: ImpaktfullUiSegmentedControl<String>(
              value: value,
              items: const ['A', 'B', 'C'],
              onChanged: (_) {},
            ),
          ),
        ),
      );
      final indicator = tester.getRect(find
          .descendant(
            of: find.byType(AnimatedAlign),
            matching: find.byType(Container),
          )
          .first);
      expect(indicator.contains(tester.getCenter(find.text(value))), isTrue,
          reason: 'indicator is not under $value');
    }
    final aCenter = tester.getCenter(find.text('A')).dx;
    final cCenter = tester.getCenter(find.text('C')).dx;
    expect(aCenter < cCenter, !_isRtl(textDirection));
  });

  _testBothDirections('input field: the leading icon is at the start',
      (tester, textDirection) async {
    await _pump(
      tester,
      textDirection,
      Center(
        child: SizedBox(
          width: 300,
          child: ImpaktfullUiInputField(
            value: 'Value',
            onChanged: (_) {},
            leadingIcon: _icon,
          ),
        ),
      ),
    );
    final field = tester.getRect(find.byType(ImpaktfullUiInputField));
    final icon = tester.getRect(find.byIcon(Icons.star));
    expect(_startInset(field, icon, textDirection), closeTo(16, 1));
  });

  _testBothDirections('badge: the leading asset is at the start',
      (tester, textDirection) async {
    await _pump(
      tester,
      textDirection,
      const Center(
        child: ImpaktfullUiBadge(
          type: ImpaktfullUiBadgeType.primary,
          label: 'Label',
          leadingAsset: _icon,
        ),
      ),
    );
    final badge = tester.getRect(find.byType(ImpaktfullUiBadge));
    final icon = tester.getRect(find.byIcon(Icons.star));
    final label = tester.getCenter(find.text('Label'));
    expect(icon.center.dx < label.dx, !_isRtl(textDirection));
    // The padding before the leading asset is the smaller one.
    final endInset = _isRtl(textDirection)
        ? tester.getRect(find.text('Label')).left - badge.left
        : badge.right - tester.getRect(find.text('Label')).right;
    expect(_startInset(badge, icon, textDirection), lessThan(endInset));
  });

  _testBothDirections('slider: the minimum is at the start',
      (tester, textDirection) async {
    final values = <double>[];
    await _pump(
      tester,
      textDirection,
      Center(
        child: SizedBox(
          width: 200,
          child: ImpaktfullUiSlider(
            value: 0,
            min: 0,
            max: 100,
            onChanged: values.add,
          ),
        ),
      ),
    );
    final slider = tester.getRect(find.byType(ImpaktfullUiSlider));
    final thumb = tester.getCenter(find.descendant(
      of: find.byType(ImpaktfullUiSlider),
      matching: find.byType(PositionedDirectional),
    ));
    expect(
        _startInset(slider, Rect.fromCenter(center: thumb, width: 0, height: 0),
            textDirection),
        closeTo(0, 1));

    // Tap at a quarter of the width, from the left.
    await tester
        .tapAt(Offset(slider.left + slider.width / 4, slider.center.dy));
    await tester.pumpAndSettle();
    expect(values.last, closeTo(_isRtl(textDirection) ? 75 : 25, 1));
  });

  _testBothDirections('notification badge: topRight is the top end corner',
      (tester, textDirection) async {
    await _pump(
      tester,
      textDirection,
      const Center(
        child: ImpaktfullUiNotificationBadge(
          show: true,
          color: Colors.red,
          child: SizedBox(width: 40, height: 40),
        ),
      ),
    );
    final child = tester.getRect(find.byType(SizedBox).last);
    final badge = tester.getCenter(find.byType(AnimatedOpacity));
    // The dot is centered 6px inside the corner of the child.
    final expectedX = _isRtl(textDirection) ? child.left + 6 : child.right - 6;
    expect(badge.dx, closeTo(expectedX, 1));
    expect(badge.dy, closeTo(child.top + 6, 1));
  });

  for (final alignment in [
    ImpaktfullUiDropdownAlignment.bottomLeft,
    ImpaktfullUiDropdownAlignment.bottomRight,
  ]) {
    _testBothDirections('dropdown: $alignment follows the reading direction',
        (tester, textDirection) async {
      await _pump(
        tester,
        textDirection,
        Center(
          child: ImpaktfullUiDropdown<void>(
            buttonText: 'Open',
            childWidth: 300,
            alignment: alignment,
            child: const Text('Dropdown content'),
          ),
        ),
      );
      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();
      final button = tester.getRect(find.byType(ImpaktfullUiButton));
      final overlay = tester.getRect(find.byType(ImpaktfullUiDropdownOverlay));
      expect(overlay.width, 300);
      expect(overlay.top, greaterThanOrEqualTo(button.bottom));
      // bottomLeft is aligned with the start edge of the button, bottomRight
      // with the end edge.
      final alignedToLeft =
          (alignment == ImpaktfullUiDropdownAlignment.bottomLeft) !=
              _isRtl(textDirection);
      if (alignedToLeft) {
        expect(overlay.left, closeTo(button.left, 1));
      } else {
        expect(overlay.right, closeTo(button.right, 1));
      }
    });
  }

  _testBothDirections('chat: my own messages are at the end',
      (tester, textDirection) async {
    const me = ImpaktfullUiChatSender(id: 'me');
    const other = ImpaktfullUiChatSender(id: 'other');
    await _pump(
      tester,
      textDirection,
      SizedBox(
        width: 800,
        height: 600,
        child: ImpaktfullUiChat(
          senderConfig: const ImpaktfullUiChatSenderConfig.oneToOne(
            me: me,
            other: other,
          ),
          items: [
            ImpaktfullUiChatItem(
              senderId: me.id,
              message: 'Mine',
              timestamp: DateTime(2024, 1, 1, 12, 1),
            ),
            ImpaktfullUiChatItem(
              senderId: other.id,
              message: 'Theirs',
              timestamp: DateTime(2024, 1, 1, 12),
            ),
          ],
        ),
      ),
    );
    final mine = tester.getCenter(find.text('Mine')).dx;
    final theirs = tester.getCenter(find.text('Theirs')).dx;
    expect(mine > theirs, !_isRtl(textDirection));
  });

  _testBothDirections('table row item: the badge is at the start',
      (tester, textDirection) async {
    await _pump(
      tester,
      textDirection,
      const Center(
        child: SizedBox(
          width: 400,
          child: ImpaktfullUiTableRowItem.badge(title: 'Badge'),
        ),
      ),
    );
    final row = tester.getRect(find.byType(ImpaktfullUiTableRowItem));
    final badge = tester.getRect(find.byType(ImpaktfullUiBadge));
    expect(_startInset(row, badge, textDirection), closeTo(16, 1));
  });

  _testBothDirections('modal: the close button is at the top end',
      (tester, textDirection) async {
    await _pump(
      tester,
      textDirection,
      const Center(child: ImpaktfullUiModal(title: 'Title')),
    );
    final title = tester.getCenter(find.text('Title')).dx;
    final close = tester.getCenter(find.byType(ImpaktfullUiIconButton)).dx;
    expect(close > title, !_isRtl(textDirection));
  });

  _testBothDirections('metric: the more button is at the top end',
      (tester, textDirection) async {
    await _pump(
      tester,
      textDirection,
      Center(
        child: SizedBox(
          width: 300,
          child: ImpaktfullUiMetric(
            title: 'Title',
            value: '10',
            onMoreTapped: () {},
          ),
        ),
      ),
    );
    final metric = tester.getRect(find.byType(ImpaktfullUiMetric));
    final more = tester.getCenter(find.byType(ImpaktfullUiIconButton)).dx;
    expect(more > metric.center.dx, !_isRtl(textDirection));
  });

  _testBothDirections('screen: the fab is at the bottom end by default',
      (tester, textDirection) async {
    const fabKey = Key('fab');
    await _pump(
      tester,
      textDirection,
      const ImpaktfullUiScreen(
        fab: SizedBox(key: fabKey, width: 40, height: 40),
        child: SizedBox(),
      ),
    );
    final screen = tester.getRect(find.byType(ImpaktfullUiScreen));
    final fab = tester.getCenter(find.byKey(fabKey));
    expect(fab.dx > screen.center.dx, !_isRtl(textDirection));
    expect(fab.dy, greaterThan(screen.center.dy));
  });

  _testBothDirections(
      'adaptive screen: the fab is at the bottom end by default',
      (tester, textDirection) async {
    const fabKey = Key('fab');
    await _pump(
      tester,
      textDirection,
      ImpaktfullUiAdaptiveScreen(
        fab: const SizedBox(key: fabKey, width: 40, height: 40),
        builder: (context) => const SizedBox(),
      ),
    );
    final screen = tester.getRect(find.byType(ImpaktfullUiAdaptiveScreen));
    final fab = tester.getCenter(find.byKey(fabKey));
    expect(fab.dx > screen.center.dx, !_isRtl(textDirection));
  });

  _testBothDirections(
      'gallery full screen: close at the end, arrow keys follow the pages',
      (tester, textDirection) async {
    const items = [
      ImpaktfullUiGalleryItem(title: 'Red', child: SizedBox(width: 50)),
      ImpaktfullUiGalleryItem(title: 'Blue', child: SizedBox(width: 50)),
    ];
    final theme = ImpaktfullUiTheme.getDefault().components.gallery;
    await _pump(
      tester,
      textDirection,
      ImpaktfullUiGalleryFullScreen(
        items: items,
        initialItem: items.first,
        theme: theme,
      ),
    );
    Finder iconButton(ImpaktfullUiAsset asset) => find.byWidgetPredicate(
        (widget) => widget is ImpaktfullUiIconButton && widget.asset == asset);

    final screen = tester.getRect(find.byType(ImpaktfullUiGalleryFullScreen));
    final close = tester.getCenter(iconButton(theme.assets.close)).dx;
    expect(close > screen.center.dx, !_isRtl(textDirection));

    // Only the "next" arrow is shown on the first page.
    expect(find.byType(ImpaktfullUiIconButton), findsNWidgets(2));
    final nextKey = _isRtl(textDirection)
        ? LogicalKeyboardKey.arrowLeft
        : LogicalKeyboardKey.arrowRight;
    await tester.sendKeyEvent(nextKey);
    await tester.pumpAndSettle();
    // The second page shows the "previous" arrow and no "next" arrow.
    expect(find.byType(ImpaktfullUiIconButton), findsNWidgets(2));
    final previous = tester
        .getCenter(find.byWidgetPredicate((widget) =>
            widget is ImpaktfullUiIconButton &&
            widget.asset != theme.assets.close))
        .dx;
    expect(previous < screen.center.dx, !_isRtl(textDirection));
  });

  group('matchTextDirection', () {
    Finder mirrored() => find.descendant(
          of: find.byType(ImpaktfullUiAssetWidget),
          matching: find.byType(Transform),
        );

    _testBothDirections('mirrors the asset in right-to-left only',
        (tester, textDirection) async {
      await _pump(
        tester,
        textDirection,
        const ImpaktfullUiAssetWidget(
          asset: ImpaktfullUiAsset.icon(
            Icons.arrow_back,
            matchTextDirection: true,
          ),
        ),
      );
      expect(mirrored(), _isRtl(textDirection) ? findsOneWidget : findsNothing);
    });

    testWidgets('an asset without matchTextDirection is never mirrored',
        (tester) async {
      await _pump(
        tester,
        TextDirection.rtl,
        const ImpaktfullUiAssetWidget(asset: _icon),
      );
      expect(mirrored(), findsNothing);
    });

    testWidgets('an icon that mirrors itself is not mirrored twice',
        (tester) async {
      await _pump(
        tester,
        TextDirection.rtl,
        const ImpaktfullUiAssetWidget(
          asset: ImpaktfullUiAsset.icon(
            IconData(0xe000, matchTextDirection: true),
            matchTextDirection: true,
          ),
        ),
      );
      // The Transform of Icon itself, not a second one.
      expect(mirrored(), findsOneWidget);
    });

    test('copyWith keeps the asset', () {
      const asset = ImpaktfullUiAsset.svg(
        'arrow.svg',
        directory: 'assets',
        package: 'package',
        suffix: 'dark',
      );
      final copy = asset.copyWith(matchTextDirection: true);
      expect(copy.matchTextDirection, isTrue);
      expect(copy.getFullSvgAsset(), asset.getFullSvgAsset());
      expect(copy.package, asset.package);
      expect(asset.matchTextDirection, isFalse);
      expect(copy.copyWith().matchTextDirection, isTrue);
    });

    _testBothDirections('pagination arrows point in the reading direction',
        (tester, textDirection) async {
      await _pump(
        tester,
        textDirection,
        ImpaktfullUiPagination(
          page: 1,
          itemsPerPage: 10,
          amountOfItems: 100,
          onLoadPage: (_) {},
        ),
      );
      expect(
        mirrored(),
        _isRtl(textDirection) ? findsNWidgets(2) : findsNothing,
      );
    });

    _testBothDirections('list item chevron points in the reading direction',
        (tester, textDirection) async {
      await _pump(
        tester,
        textDirection,
        ImpaktfullUiListItem(title: 'Title', onTap: () {}),
      );
      expect(
        mirrored(),
        _isRtl(textDirection) ? findsOneWidget : findsNothing,
      );
    });
  });
}

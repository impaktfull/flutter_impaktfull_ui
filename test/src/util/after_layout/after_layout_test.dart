import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/src/util/after_layout/after_layout.dart';

class _AfterLayoutWidget extends StatefulWidget {
  final void Function(BuildContext context, Size? size) onAfterFirstLayout;
  final VoidCallback onBuild;

  const _AfterLayoutWidget({
    required this.onAfterFirstLayout,
    required this.onBuild,
  });

  @override
  State<_AfterLayoutWidget> createState() => _AfterLayoutWidgetState();
}

class _AfterLayoutWidgetState extends State<_AfterLayoutWidget>
    with AfterLayout {
  @override
  void afterFirstLayout(BuildContext context) =>
      widget.onAfterFirstLayout(context, context.size);

  @override
  Widget build(BuildContext context) {
    widget.onBuild();
    return const SizedBox(width: 40, height: 20);
  }
}

void main() {
  testWidgets('afterFirstLayout is called once, after the first layout',
      (tester) async {
    final events = <String>[];
    Size? size;
    Widget buildWidget() => Center(
          child: _AfterLayoutWidget(
            onBuild: () => events.add('build'),
            onAfterFirstLayout: (context, layoutSize) {
              events.add('afterFirstLayout');
              size = layoutSize;
            },
          ),
        );

    await tester.pumpWidget(buildWidget());
    expect(events, ['build', 'afterFirstLayout']);
    expect(size, const Size(40, 20));

    // A rebuild does not call afterFirstLayout again.
    await tester.pumpWidget(buildWidget());
    await tester.pump();
    expect(events, ['build', 'afterFirstLayout', 'build']);
  });

  testWidgets('afterFirstLayout gets a mounted context', (tester) async {
    BuildContext? context;
    await tester.pumpWidget(
      _AfterLayoutWidget(
        onBuild: () {},
        onAfterFirstLayout: (c, _) => context = c,
      ),
    );
    expect(context, isNotNull);
    expect(context!.mounted, isTrue);
  });
}

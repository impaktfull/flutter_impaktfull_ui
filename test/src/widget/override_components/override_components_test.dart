import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../_core_test_helpers.dart';

ImpaktfullUiOverridableComponent<ImpaktfullUiButton, ImpaktfullUiButtonTheme>
    _buttonOverride(String prefix) => ImpaktfullUiOverridableComponent<
            ImpaktfullUiButton, ImpaktfullUiButtonTheme>(
          builder: (context, component, theme) =>
              Text('$prefix: ${component.title}'),
        );

ImpaktfullUiOverridableComponent<ImpaktfullUiDivider, ImpaktfullUiDividerTheme>
    _dividerOverride() => ImpaktfullUiOverridableComponent<ImpaktfullUiDivider,
            ImpaktfullUiDividerTheme>(
          builder: (context, component, theme) => const Text('divider'),
        );

Widget _button() => ImpaktfullUiButton(
      type: ImpaktfullUiButtonType.primary,
      title: 'Save',
      onTap: () {},
    );

void main() {
  testWidgets('without overrides the component builds itself', (tester) async {
    await pumpImpaktfullUiApp(tester, _button());
    expect(find.text('Save'), findsOneWidget);
    expect(find.byType(ImpaktfullUiTouchFeedback), findsOneWidget);
  });

  testWidgets('an override of ImpaktfullUiApp replaces the component',
      (tester) async {
    await pumpImpaktfullUiApp(
      tester,
      _button(),
      overrideComponents: [_buttonOverride('app')],
    );
    expect(find.text('app: Save'), findsOneWidget);
    expect(find.byType(ImpaktfullUiTouchFeedback), findsNothing);
  });

  testWidgets('the override gets the component and its theme', (tester) async {
    final theme = ImpaktfullUiTheme.getDefault();
    ImpaktfullUiButton? component;
    ImpaktfullUiButtonTheme? componentTheme;
    final button = _button() as ImpaktfullUiButton;
    await pumpImpaktfullUiApp(
      tester,
      button,
      theme: theme,
      overrideComponents: [
        ImpaktfullUiOverridableComponent<ImpaktfullUiButton,
            ImpaktfullUiButtonTheme>(
          builder: (context, c, t) {
            component = c;
            componentTheme = t;
            return const SizedBox();
          },
        ),
      ],
    );
    expect(component, same(button));
    expect(componentTheme, same(theme.components.button));
  });

  testWidgets('the override gets the theme of the component when it is set',
      (tester) async {
    final buttonTheme =
        ImpaktfullUiTheme.getDefault().components.button.copyWith();
    ImpaktfullUiButtonTheme? componentTheme;
    await pumpImpaktfullUiApp(
      tester,
      ImpaktfullUiButton(
        type: ImpaktfullUiButtonType.primary,
        title: 'Save',
        theme: buttonTheme,
        onTap: () {},
      ),
      overrideComponents: [
        ImpaktfullUiOverridableComponent<ImpaktfullUiButton,
            ImpaktfullUiButtonTheme>(
          builder: (context, c, t) {
            componentTheme = t;
            return const SizedBox();
          },
        ),
      ],
    );
    expect(componentTheme, same(buttonTheme));
  });

  testWidgets('an override only applies to its own component type',
      (tester) async {
    await pumpImpaktfullUiApp(
      tester,
      Column(children: [_button(), const ImpaktfullUiDivider()]),
      overrideComponents: [_dividerOverride()],
    );
    expect(find.text('Save'), findsOneWidget);
    expect(find.text('divider'), findsOneWidget);
  });

  testWidgets('the nearest override wins', (tester) async {
    await pumpImpaktfullUiApp(
      tester,
      Column(
        children: [
          _button(),
          ImpaktfullUiOverridableComponentConfigurator(
            overrideComponents: [_buttonOverride('nested')],
            child: Column(
              children: [
                _button(),
                ImpaktfullUiOverridableComponentConfigurator(
                  overrideComponents: [_buttonOverride('deepest')],
                  child: _button(),
                ),
              ],
            ),
          ),
        ],
      ),
      overrideComponents: [_buttonOverride('app')],
    );
    expect(find.text('app: Save'), findsOneWidget);
    expect(find.text('nested: Save'), findsOneWidget);
    expect(find.text('deepest: Save'), findsOneWidget);
  });

  testWidgets('a nested configurator without the component uses the parent',
      (tester) async {
    await pumpImpaktfullUiApp(
      tester,
      ImpaktfullUiOverridableComponentConfigurator(
        overrideComponents: [_dividerOverride()],
        child: Column(children: [_button(), const ImpaktfullUiDivider()]),
      ),
      overrideComponents: [_buttonOverride('app')],
    );
    expect(find.text('app: Save'), findsOneWidget);
    expect(find.text('divider'), findsOneWidget);
  });

  testWidgets('the first matching override of a configurator is used',
      (tester) async {
    await pumpImpaktfullUiApp(
      tester,
      _button(),
      overrideComponents: [_buttonOverride('first'), _buttonOverride('second')],
    );
    expect(find.text('first: Save'), findsOneWidget);
    expect(find.text('second: Save'), findsNothing);
  });

  testWidgets('getOverrideComponent returns null without a configurator',
      (tester) async {
    late BuildContext context;
    await tester.pumpWidget(Builder(builder: (c) {
      context = c;
      return const SizedBox();
    }));
    expect(
      ImpaktfullUiOverridableComponentConfigurator.getOverrideComponent<
          ImpaktfullUiButton, ImpaktfullUiButtonTheme>(context),
      isNull,
    );
  });

  test('build forwards to the builder', () {
    final override = _buttonOverride('x');
    final result = override.build(
      _FakeContext(),
      _button() as ImpaktfullUiButton,
      ImpaktfullUiTheme.getDefault().components.button,
    );
    expect(result, isA<Text>());
    expect((result as Text).data, 'x: Save');
  });
}

class _FakeContext extends Fake implements BuildContext {}

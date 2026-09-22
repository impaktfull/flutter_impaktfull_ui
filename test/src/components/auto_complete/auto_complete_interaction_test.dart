import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui/src/components/auto_complete/widget/auto_complete_overlay.dart';

import '../../../util/test_util.dart';
import '../_inputs_test_helpers.dart';

void main() {
  const countries = ['Belgium', 'Bulgaria', 'France', 'The Netherlands'];
  const debounce = Duration(milliseconds: 300);

  /// Waits for the post frame search and the debounce of the overlay.
  Future<void> waitForSearch(WidgetTester tester) async {
    await tester.pump();
    await tester.pump(debounce);
    await tester.pump();
  }

  Widget buildSut({
    List<String>? searches,
    ImpaktfullUiAutoCompleteController? controller,
    ImpaktfullUiAutoCompleteTheme? theme,
    void Function(String item)? onItemTapped,
    void Function(String item, ImpaktfullUiAutoCompleteController controller)?
        onItemSelected,
  }) =>
      Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          width: 400,
          child: ImpaktfullUiAutoComplete<String>(
            placeholder: 'Search',
            noDataLabel: 'No results',
            controller: controller,
            theme: theme,
            onItemSelected: onItemSelected,
            onSearchChanged: (query) {
              searches?.add(query);
              return countries
                  .where((country) =>
                      country.toLowerCase().contains(query.toLowerCase()))
                  .toList();
            },
            itemBuilder: (context, item, index, controller) =>
                ImpaktfullUiSimpleListItem(
              title: item,
              onTap: () {
                onItemTapped?.call(item);
                controller.close(clear: true);
              },
            ),
          ),
        ),
      );

  testWidgets('no overlay is shown without text', (tester) async {
    await pumpComponent(tester, buildSut());
    expect(find.byType(ImpaktfullUiAutoCompleteOverlay<String>), findsNothing);
  });

  testWidgets('typing shows the matching items', (tester) async {
    final searches = <String>[];
    await pumpComponent(tester, buildSut(searches: searches));
    await tester.enterText(find.byType(TextField), 'b');
    await waitForSearch(tester);
    expect(
        find.byType(ImpaktfullUiAutoCompleteOverlay<String>), findsOneWidget);
    expect(find.text('Belgium'), findsOneWidget);
    expect(find.text('Bulgaria'), findsOneWidget);
    expect(find.text('France'), findsNothing);
    expect(searches, ['b']);
  });

  testWidgets('the search is debounced', (tester) async {
    final searches = <String>[];
    await pumpComponent(tester, buildSut(searches: searches));
    await tester.enterText(find.byType(TextField), 'b');
    await waitForSearch(tester);
    await tester.enterText(find.byType(TextField), 'be');
    await tester.pump(const Duration(milliseconds: 100));
    await tester.enterText(find.byType(TextField), 'bel');
    await tester.pump(const Duration(milliseconds: 100));
    expect(searches, ['b']);
    await waitForSearch(tester);
    expect(searches, ['b', 'bel']);
    expect(find.text('Belgium'), findsOneWidget);
    expect(find.text('Bulgaria'), findsNothing);
  });

  testWidgets('no results shows the no data label', (tester) async {
    await pumpComponent(tester, buildSut());
    await tester.enterText(find.byType(TextField), 'xyz');
    await waitForSearch(tester);
    expect(find.text('No results'), findsOneWidget);
  });

  testWidgets('clearing the text closes the overlay', (tester) async {
    await pumpComponent(tester, buildSut());
    await tester.enterText(find.byType(TextField), 'b');
    await waitForSearch(tester);
    await tester.enterText(find.byType(TextField), '');
    await tester.pump();
    expect(find.byType(ImpaktfullUiAutoCompleteOverlay<String>), findsNothing);
  });

  testWidgets('escape closes the overlay', (tester) async {
    await pumpComponent(tester, buildSut());
    await tester.enterText(find.byType(TextField), 'b');
    await waitForSearch(tester);
    await tester.sendKeyEvent(LogicalKeyboardKey.escape);
    await tester.pump();
    expect(find.byType(ImpaktfullUiAutoCompleteOverlay<String>), findsNothing);
  });

  testWidgets('tapping an item can close and clear via the controller',
      (tester) async {
    final tapped = <String>[];
    await pumpComponent(tester, buildSut(onItemTapped: tapped.add));
    await tester.enterText(find.byType(TextField), 'fr');
    await waitForSearch(tester);
    await tester.tap(find.text('France'));
    await tester.pump();
    expect(tapped, ['France']);
    expect(find.byType(ImpaktfullUiAutoCompleteOverlay<String>), findsNothing);
    expect(tester.widget<TextField>(find.byType(TextField)).controller!.text,
        isEmpty);
  });

  testWidgets('controller.close closes the overlay and keeps the text',
      (tester) async {
    final controller = ImpaktfullUiAutoCompleteController();
    await pumpComponent(tester, buildSut(controller: controller));
    await tester.enterText(find.byType(TextField), 'b');
    await waitForSearch(tester);
    controller.close();
    await tester.pump();
    expect(find.byType(ImpaktfullUiAutoCompleteOverlay<String>), findsNothing);
    expect(
        tester.widget<TextField>(find.byType(TextField)).controller!.text, 'b');
  });

  testWidgets('controller.clear clears the text', (tester) async {
    final controller = ImpaktfullUiAutoCompleteController();
    await pumpComponent(tester, buildSut(controller: controller));
    await tester.enterText(find.byType(TextField), 'b');
    await tester.pump();
    controller.clear();
    await tester.pump();
    expect(tester.widget<TextField>(find.byType(TextField)).controller!.text,
        isEmpty);
  });

  testWidgets('disposing with an open overlay does not throw', (tester) async {
    await pumpComponent(tester, buildSut());
    await tester.enterText(find.byType(TextField), 'b');
    await waitForSearch(tester);
    await pumpComponent(tester, const SizedBox());
    await tester.pump(debounce);
    expect(tester.takeException(), isNull);
  });

  testWidgets('the theme override is used by the input field', (tester) async {
    final theme = defaultComponentsTheme.autoComplete;
    await pumpComponent(tester, buildSut(theme: theme));
    expect(tester.takeException(), isNull);
    expect(find.byType(ImpaktfullUiInputField), findsOneWidget);
  });

  group(
    'theme override of the overlay',
    () {
      testWidgets('the overlay shadow of the theme override is used',
          (tester) async {
        final theme = defaultComponentsTheme.autoComplete;
        const shadow = BoxShadow(color: customTestColor, blurRadius: 3);
        await pumpComponent(
          tester,
          buildSut(
            theme: theme.copyWith(
              shadows: theme.shadows.copyWith(overlay: [shadow]),
            ),
          ),
        );
        await tester.enterText(find.byType(TextField), 'b');
        await waitForSearch(tester);
        final card = tester.widget<ImpaktfullUiCard>(find.descendant(
          of: find.byType(ImpaktfullUiAutoCompleteOverlay<String>),
          matching: find.byType(ImpaktfullUiCard),
        ));
        expect(card.shadow, [shadow]);
      });
    },
  );

  Finder overlayFinder() =>
      find.byType(ImpaktfullUiAutoCompleteOverlay<String>);

  group('closing', () {
    testWidgets('tapping outside closes the overlay', (tester) async {
      await pumpComponent(tester, buildSut());
      await tester.enterText(find.byType(TextField), 'b');
      await waitForSearch(tester);
      expect(overlayFinder(), findsOneWidget);
      await tester.tapAt(const Offset(10, 590));
      await tester.pump();
      expect(overlayFinder(), findsNothing);
      // The text is kept.
      expect(tester.widget<TextField>(find.byType(TextField)).controller!.text,
          'b');
    });

    testWidgets('tapping the input field keeps the overlay open',
        (tester) async {
      await pumpComponent(tester, buildSut());
      await tester.enterText(find.byType(TextField), 'b');
      await waitForSearch(tester);
      await tester.tap(find.byType(TextField));
      await tester.pump();
      expect(overlayFinder(), findsOneWidget);
    });

    testWidgets('tapping an item does not close the overlay by itself',
        (tester) async {
      final tapped = <String>[];
      await pumpComponent(
        tester,
        Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            width: 400,
            child: ImpaktfullUiAutoComplete<String>(
              noDataLabel: 'No results',
              onSearchChanged: (query) => countries,
              itemBuilder: (context, item, index, controller) =>
                  ImpaktfullUiSimpleListItem(
                title: item,
                onTap: () => tapped.add(item),
              ),
            ),
          ),
        ),
      );
      await tester.enterText(find.byType(TextField), 'b');
      await waitForSearch(tester);
      await tester.tap(find.text('France'));
      await tester.pump();
      expect(tapped, ['France']);
      expect(overlayFinder(), findsOneWidget);
    });

    testWidgets('losing the focus closes the overlay', (tester) async {
      await pumpComponent(tester, buildSut());
      await tester.enterText(find.byType(TextField), 'b');
      await waitForSearch(tester);
      expect(overlayFinder(), findsOneWidget);
      FocusManager.instance.primaryFocus?.unfocus();
      await tester.pump();
      await tester.pump();
      expect(overlayFinder(), findsNothing);
    });
  });

  group('keyboard', () {
    Color? highlightOf(WidgetTester tester, String item) {
      final container = tester.widgetList<Container>(find.ancestor(
        of: find.text(item),
        matching: find.byType(Container),
      ));
      for (final widget in container) {
        final decoration = widget.foregroundDecoration;
        if (decoration is BoxDecoration && decoration.color != null) {
          return decoration.color;
        }
      }
      return null;
    }

    testWidgets('arrow down and up move the highlight and wrap around',
        (tester) async {
      await pumpComponent(tester, buildSut());
      await tester.enterText(find.byType(TextField), 'b');
      await waitForSearch(tester);
      expect(highlightOf(tester, 'Belgium'), isNull);
      expect(highlightOf(tester, 'Bulgaria'), isNull);

      await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
      await tester.pump();
      expect(highlightOf(tester, 'Belgium'), isNotNull);
      expect(highlightOf(tester, 'Bulgaria'), isNull);

      await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
      await tester.pump();
      expect(highlightOf(tester, 'Belgium'), isNull);
      expect(highlightOf(tester, 'Bulgaria'), isNotNull);

      await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
      await tester.pump();
      expect(highlightOf(tester, 'Belgium'), isNotNull);

      await tester.sendKeyEvent(LogicalKeyboardKey.arrowUp);
      await tester.pump();
      expect(highlightOf(tester, 'Bulgaria'), isNotNull);
    });

    testWidgets('arrow up without a highlight highlights the last item',
        (tester) async {
      await pumpComponent(tester, buildSut());
      await tester.enterText(find.byType(TextField), 'b');
      await waitForSearch(tester);
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowUp);
      await tester.pump();
      expect(highlightOf(tester, 'Bulgaria'), isNotNull);
      expect(highlightOf(tester, 'Belgium'), isNull);
    });

    testWidgets('enter selects the highlighted item', (tester) async {
      final selected = <String>[];
      await pumpComponent(
        tester,
        buildSut(
          onItemSelected: (item, controller) {
            selected.add(item);
            controller.close(clear: true);
          },
        ),
      );
      await tester.enterText(find.byType(TextField), 'b');
      await waitForSearch(tester);
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
      await tester.pump();
      await tester.sendKeyEvent(LogicalKeyboardKey.enter);
      await tester.pump();
      expect(selected, ['Bulgaria']);
      expect(overlayFinder(), findsNothing);
      expect(tester.widget<TextField>(find.byType(TextField)).controller!.text,
          isEmpty);
    });

    testWidgets('enter without a highlighted item selects nothing',
        (tester) async {
      final selected = <String>[];
      await pumpComponent(
        tester,
        buildSut(onItemSelected: (item, controller) => selected.add(item)),
      );
      await tester.enterText(find.byType(TextField), 'b');
      await waitForSearch(tester);
      await tester.sendKeyEvent(LogicalKeyboardKey.enter);
      await tester.pump();
      expect(selected, isEmpty);
    });

    testWidgets('a new search removes the highlight', (tester) async {
      final selected = <String>[];
      await pumpComponent(
        tester,
        buildSut(onItemSelected: (item, controller) => selected.add(item)),
      );
      await tester.enterText(find.byType(TextField), 'b');
      await waitForSearch(tester);
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
      await tester.pump();
      await tester.enterText(find.byType(TextField), 'fr');
      await waitForSearch(tester);
      expect(highlightOf(tester, 'France'), isNull);
      await tester.sendKeyEvent(LogicalKeyboardKey.enter);
      await tester.pump();
      expect(selected, isEmpty);
    });

    testWidgets('the arrow keys do nothing without an overlay', (tester) async {
      await pumpComponent(tester, buildSut());
      await tester.tap(find.byType(TextField));
      await tester.pump();
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
      await tester.pump();
      expect(overlayFinder(), findsNothing);
      expect(tester.takeException(), isNull);
    });

    testWidgets('the highlight uses the color of the theme', (tester) async {
      final theme = defaultComponentsTheme.autoComplete;
      await pumpComponent(
        tester,
        buildSut(
          theme: theme.copyWith(
            colors: theme.colors.copyWith(highlightedItem: customTestColor),
          ),
        ),
      );
      await tester.enterText(find.byType(TextField), 'b');
      await waitForSearch(tester);
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
      await tester.pump();
      expect(highlightOf(tester, 'Belgium'), customTestColor);
    });
  });
}

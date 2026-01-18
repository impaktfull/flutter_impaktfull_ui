import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiKanbanBoardTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiKanbanBoardAssetsTheme assets;
  final ImpaktfullUiKanbanBoardColorTheme colors;
  final ImpaktfullUiKanbanBoardDimensTheme dimens;
  final ImpaktfullUiKanbanBoardTextStyleTheme textStyles;
  final ImpaktfullUiKanbanBoardShadowsTheme shadows;

  const ImpaktfullUiKanbanBoardTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
    required this.shadows,
  });

  static ImpaktfullUiKanbanBoardTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.kanbanBoard;

  static ImpaktfullUiKanbanBoardTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiKanbanBoardTheme(
        assets: const ImpaktfullUiKanbanBoardAssetsTheme(),
        colors: ImpaktfullUiKanbanBoardColorTheme(
          boardBackground: colors.canvas,
          columnBackground: colors.card,
          columnBorder: colors.border,
          cardBackground: colors.card,
          cardBorder: colors.border,
        ),
        dimens: ImpaktfullUiKanbanBoardDimensTheme(
          boardPadding: const EdgeInsets.all(16),
          columnWidth: 300,
          columnSpacing: 16,
          columnBorderRadius: BorderRadius.circular(8),
          columnBorderWidth: 1,
          columnHeaderPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          columnContentPadding: const EdgeInsets.all(12),
          cardBorderRadius: BorderRadius.circular(8),
          cardBorderWidth: 1,
          cardPadding: const EdgeInsets.all(12),
          cardSpacing: 4,
          cardImageHeight: 120,
          itemSpacing: 8,
        ),
        textStyles: ImpaktfullUiKanbanBoardTextStyleTheme(
          columnTitle: textStyles.onCanvas.text.medium.copyWith(
            fontWeight: FontWeight.w600,
          ),
          columnCount: textStyles.onCanvas.text.small.copyWith(
            fontWeight: FontWeight.w600,
          ),
          cardTitle: textStyles.onCard.text.medium.copyWith(
            fontWeight: FontWeight.w500,
          ),
          cardDescription: textStyles.onCardSecondary.text.small,
        ),
        shadows: ImpaktfullUiKanbanBoardShadowsTheme(
          card: shadows.small,
        ),
      );
}

class ImpaktfullUiKanbanBoardColorTheme {
  final Color boardBackground;
  final Color columnBackground;
  final Color? columnBorder;
  final Color cardBackground;
  final Color? cardBorder;

  const ImpaktfullUiKanbanBoardColorTheme({
    required this.boardBackground,
    required this.columnBackground,
    required this.columnBorder,
    required this.cardBackground,
    required this.cardBorder,
  });
}

class ImpaktfullUiKanbanBoardDimensTheme {
  final EdgeInsets boardPadding;
  final double columnWidth;
  final double columnSpacing;
  final BorderRadius columnBorderRadius;
  final double columnBorderWidth;
  final EdgeInsets columnHeaderPadding;
  final EdgeInsets columnContentPadding;
  final BorderRadius cardBorderRadius;
  final double cardBorderWidth;
  final EdgeInsets cardPadding;
  final double cardSpacing;
  final double cardImageHeight;
  final double itemSpacing;

  const ImpaktfullUiKanbanBoardDimensTheme({
    required this.boardPadding,
    required this.columnWidth,
    required this.columnSpacing,
    required this.columnBorderRadius,
    required this.columnBorderWidth,
    required this.columnHeaderPadding,
    required this.columnContentPadding,
    required this.cardBorderRadius,
    required this.cardBorderWidth,
    required this.cardPadding,
    required this.cardSpacing,
    required this.cardImageHeight,
    required this.itemSpacing,
  });
}

class ImpaktfullUiKanbanBoardTextStyleTheme {
  final TextStyle columnTitle;
  final TextStyle? columnCount;
  final TextStyle cardTitle;
  final TextStyle? cardDescription;

  const ImpaktfullUiKanbanBoardTextStyleTheme({
    required this.columnTitle,
    required this.columnCount,
    required this.cardTitle,
    required this.cardDescription,
  });
}

class ImpaktfullUiKanbanBoardShadowsTheme {
  final List<BoxShadow> card;

  const ImpaktfullUiKanbanBoardShadowsTheme({
    required this.card,
  });
}

class ImpaktfullUiKanbanBoardAssetsTheme {
  const ImpaktfullUiKanbanBoardAssetsTheme();
}

import 'package:flutter/painting.dart';
import 'package:impaktfull_ui/src/theme/presets/shadcn_theme.dart';

/// The colour tokens of a shadcn/ui theme: the CSS variables of the `:root`
/// (or `.dark`) block in the `globals.css` of a shadcn/ui project.
///
/// shadcn/ui is themed by replacing those variables, so a project that has a
/// web app on shadcn/ui copies its variables into an
/// [ImpaktfullUiShadcnColors] and passes it to
/// [ImpaktfullUiShadcnTheme.light] or [ImpaktfullUiShadcnTheme.dark]: the
/// Flutter app then follows the same palette.
///
/// ```dart
/// ImpaktfullUiShadcnTheme.light(
///   colors: ImpaktfullUiShadcnColors.light.copyWith(
///     primary: const Color(0xFF0E1726), // --primary
///     ring: const Color(0xFF2563EB), // --ring
///   ),
/// );
/// ```
///
/// [light] and [dark] are the `default` base color of shadcn/ui. The
/// variables are `oklch` values in CSS; convert them to sRGB for a [Color].
class ImpaktfullUiShadcnColors {
  /// `--background`: the canvas behind everything.
  final Color background;

  /// `--foreground`: the text on [background] and on [card].
  final Color foreground;

  /// `--card`: the surface of a card, a dialog and a sheet.
  final Color card;

  /// `--primary`: the background of a primary button, a checked control and
  /// a tooltip.
  final Color primary;

  /// `--primary-foreground`: the text and icons on [primary].
  final Color primaryForeground;

  /// `--secondary`: the background of a secondary badge.
  final Color secondary;

  /// `--secondary-foreground`: the text on [secondary].
  final Color secondaryForeground;

  /// `--muted`: the second surface (tab lists, segmented controls,
  /// skeletons).
  final Color muted;

  /// `--muted-foreground`: secondary and tertiary text.
  final Color mutedForeground;

  /// `--accent`: the surface of a hovered outline or ghost button and of a
  /// highlighted item in a list.
  final Color accent;

  /// `--destructive`: the colour of a destructive action and of an error.
  final Color destructive;

  /// `--border`: every border and divider.
  final Color border;

  /// `--ring`: the border of a focused field. The focus ring is this colour
  /// at 50 % (`ring-ring/50`).
  final Color ring;

  /// The colour of a warning. shadcn/ui has no variable for it; the default
  /// is Tailwind's `amber-500`, which its blocks use.
  final Color warning;

  /// The colour of a success. shadcn/ui has no variable for it; the default
  /// is Tailwind's `green-600`.
  final Color success;

  /// The colour of information. shadcn/ui has no variable for it; the
  /// default is Tailwind's `blue-600`.
  final Color info;

  const ImpaktfullUiShadcnColors({
    required this.background,
    required this.foreground,
    required this.card,
    required this.primary,
    required this.primaryForeground,
    required this.secondary,
    required this.secondaryForeground,
    required this.muted,
    required this.mutedForeground,
    required this.accent,
    required this.destructive,
    required this.border,
    required this.ring,
    this.warning = ImpaktfullUiShadcnTheme.warning,
    this.success = ImpaktfullUiShadcnTheme.success,
    this.info = ImpaktfullUiShadcnTheme.info,
  });

  /// The `:root` block of the `default` base color of shadcn/ui.
  static const light = ImpaktfullUiShadcnColors(
    background: ImpaktfullUiShadcnTheme.background,
    foreground: ImpaktfullUiShadcnTheme.foreground,
    card: ImpaktfullUiShadcnTheme.card,
    primary: ImpaktfullUiShadcnTheme.primary,
    primaryForeground: ImpaktfullUiShadcnTheme.primaryForeground,
    // `--secondary-foreground: oklch(0.205 0 0)`, the same as `--primary`.
    secondary: ImpaktfullUiShadcnTheme.muted,
    secondaryForeground: ImpaktfullUiShadcnTheme.primary,
    muted: ImpaktfullUiShadcnTheme.muted,
    mutedForeground: ImpaktfullUiShadcnTheme.mutedForeground,
    accent: ImpaktfullUiShadcnTheme.muted,
    destructive: ImpaktfullUiShadcnTheme.destructive,
    border: ImpaktfullUiShadcnTheme.border,
    ring: ImpaktfullUiShadcnTheme.ring,
  );

  /// The `.dark` block of the `default` base color of shadcn/ui.
  static const dark = ImpaktfullUiShadcnColors(
    background: ImpaktfullUiShadcnTheme.backgroundDark,
    foreground: ImpaktfullUiShadcnTheme.foregroundDark,
    card: ImpaktfullUiShadcnTheme.cardDark,
    primary: ImpaktfullUiShadcnTheme.primaryDark,
    primaryForeground: ImpaktfullUiShadcnTheme.primaryForegroundDark,
    // `--secondary-foreground: oklch(0.985 0 0)`, the same as `--foreground`.
    secondary: ImpaktfullUiShadcnTheme.mutedDark,
    secondaryForeground: ImpaktfullUiShadcnTheme.foregroundDark,
    muted: ImpaktfullUiShadcnTheme.mutedDark,
    mutedForeground: ImpaktfullUiShadcnTheme.mutedForegroundDark,
    accent: ImpaktfullUiShadcnTheme.mutedDark,
    destructive: ImpaktfullUiShadcnTheme.destructiveDark,
    border: ImpaktfullUiShadcnTheme.borderDark,
    ring: ImpaktfullUiShadcnTheme.ringDark,
  );

  ImpaktfullUiShadcnColors copyWith({
    Color? accent,
    Color? background,
    Color? border,
    Color? card,
    Color? destructive,
    Color? foreground,
    Color? info,
    Color? muted,
    Color? mutedForeground,
    Color? primary,
    Color? primaryForeground,
    Color? ring,
    Color? secondary,
    Color? secondaryForeground,
    Color? success,
    Color? warning,
  }) =>
      ImpaktfullUiShadcnColors(
        accent: accent ?? this.accent,
        background: background ?? this.background,
        border: border ?? this.border,
        card: card ?? this.card,
        destructive: destructive ?? this.destructive,
        foreground: foreground ?? this.foreground,
        info: info ?? this.info,
        muted: muted ?? this.muted,
        mutedForeground: mutedForeground ?? this.mutedForeground,
        primary: primary ?? this.primary,
        primaryForeground: primaryForeground ?? this.primaryForeground,
        ring: ring ?? this.ring,
        secondary: secondary ?? this.secondary,
        secondaryForeground: secondaryForeground ?? this.secondaryForeground,
        success: success ?? this.success,
        warning: warning ?? this.warning,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiShadcnColors &&
          accent == other.accent &&
          background == other.background &&
          border == other.border &&
          card == other.card &&
          destructive == other.destructive &&
          foreground == other.foreground &&
          info == other.info &&
          muted == other.muted &&
          mutedForeground == other.mutedForeground &&
          primary == other.primary &&
          primaryForeground == other.primaryForeground &&
          ring == other.ring &&
          secondary == other.secondary &&
          secondaryForeground == other.secondaryForeground &&
          success == other.success &&
          warning == other.warning;

  @override
  int get hashCode => Object.hash(
        accent,
        background,
        border,
        card,
        destructive,
        foreground,
        info,
        muted,
        mutedForeground,
        primary,
        primaryForeground,
        ring,
        secondary,
        secondaryForeground,
        success,
        warning,
      );
}

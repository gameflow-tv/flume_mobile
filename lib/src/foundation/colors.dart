import 'package:flume/src/foundation/palette.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';

/// {@category Foundation}
/// {@subCategory Colors}
/// Color scheme defined by Flume.
class Colors {
  const Colors({
    required this.brightness,
    required this.primary,
    required this.onPrimary,
    required this.secondary,
    required this.tertiary,
    required this.quaternary,
    required this.header,
    required this.body,
    required this.subtitle,
    required this.icon,
    required this.buttonFocus,
    required this.signal,
    required this.onSignal,
    required this.success,
    required this.onSuccess,
    required this.warning,
    required this.onWarning,
    required this.error,
    required this.onError,
    required this.draw,
    required this.highlight10,
    required this.highlight30,
    required this.inactive,
    required this.overlay30,
    required this.overlay50,
    required this.overlay70,
    required this.shadow,
  });

  /// {@category Foundation}
  /// {@subCategory Colors}
  /// The [Brightness] of the palette
  final Brightness brightness;

  /// {@category Foundation}
  /// {@subCategory Colors}
  /// The primary/brand color.
  final Color primary;

  /// {@category Foundation}
  /// {@subCategory Colors}
  /// Contrast color to the primary color.
  final Color onPrimary;

  /// {@category Foundation}
  /// {@subCategory Colors}
  /// Complementary color to the primary color.
  final Color secondary;

  /// {@category Foundation}
  /// {@subCategory Colors}
  /// Third complementary color to the primary color.
  final Color tertiary;

  /// {@category Foundation}
  /// {@subCategory Colors}
  /// Contrast color to the secondary color.
  final Color quaternary;

  /// {@category Foundation}
  /// {@subCategory Colors}
  /// Text color for headings.
  final Color header;

  /// {@category Foundation}
  /// {@subCategory Colors}
  /// Text color for body text.
  final Color body;

  /// {@category Foundation}
  /// {@subCategory Colors}
  /// Text color for small/footer text.
  final Color subtitle;

  /// {@category Foundation}
  /// {@subCategory Colors}
  /// Color for icons.
  final Color icon;

  /// {@category Foundation}
  /// {@subCategory Colors}
  /// Color for button borders when focues
  final Color buttonFocus;

  /// {@category Foundation}
  /// {@subCategory Colors}
  /// Sharp, bright signaling color that contrasts most of the other colors.
  final Color signal;

  /// {@category Foundation}
  /// {@subCategory Colors}
  /// Contrast color to the signal color.
  final Color onSignal;

  /// {@category Foundation}
  /// {@subCategory Colors}
  /// Color signaling success or positive outcome.
  final Color success;

  /// {@category Foundation}
  /// {@subCategory Colors}
  /// Contrast color to the success color.
  final Color onSuccess;

  /// {@category Foundation}
  /// {@subCategory Colors}
  /// Color signaling warning or caution.
  final Color warning;

  /// {@category Foundation}
  /// {@subCategory Colors}
  /// Contrast color to the warning color.
  final Color onWarning;

  /// {@category Foundation}
  /// {@subCategory Colors}
  /// Color signaling error or negative outcome.
  final Color error;

  /// {@category Foundation}
  /// {@subCategory Colors}
  /// Contrast color to the error color.
  final Color onError;

  /// {@category Foundation}
  /// {@subCategory Colors}
  /// Color signaling neutral outcome.
  final Color draw;

  /// {@category Foundation}
  /// {@subCategory Colors}
  /// Subtle highlight color (overlay).
  final Color highlight10;

  /// {@category Foundation}
  /// {@subCategory Colors}
  /// Stronger highlight color (overlay).
  final Color highlight30;

  /// {@category Foundation}
  /// {@subCategory Colors}
  /// Colors signaling inactive/disabled elements.
  final Color inactive;

  /// {@category Foundation}
  /// {@subCategory Colors}
  /// Subtle dim overlay (overlay).
  final Color overlay30;

  /// {@category Foundation}
  /// {@subCategory Colors}
  /// Stronger dim overlay (overlay).
  final Color overlay50;

  /// {@category Foundation}
  /// {@subCategory Colors}
  /// Strongest dim overlay (overlay).
  final Color overlay70;

  /// {@category Foundation}
  /// {@subCategory Colors}
  /// Base color for shadows.
  final Color shadow;

  /// {@category Foundation}
  /// {@subCategory Colors}
  /// Default color scheme.
  factory Colors.fallback() => const Colors(
        brightness: Brightness.dark,
        primary: FlumePalette.amberOrange,
        onPrimary: FlumePalette.abbeyBlue,
        secondary: FlumePalette.abbeyBlue,
        tertiary: FlumePalette.emperorGray,
        quaternary: FlumePalette.white,
        header: FlumePalette.white,
        body: FlumePalette.white85,
        subtitle: FlumePalette.white75,
        icon: FlumePalette.white85,
        buttonFocus: FlumePalette.white,
        signal: FlumePalette.punchRed,
        onSignal: FlumePalette.white,
        success: FlumePalette.ufoGreen,
        onSuccess: FlumePalette.parsleyGreen,
        warning: FlumePalette.lightningYellow,
        onWarning: FlumePalette.mustardYellow,
        error: FlumePalette.cinnabarRed,
        onError: FlumePalette.faluRed,
        draw: FlumePalette.dustyGray,
        highlight10: FlumePalette.white10,
        highlight30: FlumePalette.white30,
        inactive: FlumePalette.white50,
        overlay30: FlumePalette.black30,
        overlay50: FlumePalette.black50,
        overlay70: FlumePalette.black70,
        shadow: FlumePalette.black,
      );
}

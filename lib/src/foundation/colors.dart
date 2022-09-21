import 'package:flume/src/foundation/palette.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';

/// {@category Foundation}
/// Color scheme defined by Flume.
class Colors {
  const Colors({
    /// The [Brightness] of the palette
    required Brightness brightness,

    /// The primary/brand color.
    required Color primary,

    /// Contrast color to the primary color.
    required Color onPrimary,

    /// Complementary color to the primary color.
    required Color secondary,

    /// Third complementary color to the primary color.
    required Color tertiary,

    /// Contrast color to the secondary color.
    required Color quaternary,

    /// Text color for headings.
    required Color header,

    /// Text color for body text.
    required Color body,

    /// Text color for small/footer text.
    required Color subtitle,

    /// Color for icons.
    required Color icon,

    /// Color for button borders when focues
    required Color buttonFocus,

    /// Sharp, bright signaling color that contrasts most of the other colors.
    required Color signal,

    /// Contrast color to the signal color.
    required Color onSignal,

    /// Color signaling success or positive outcome.
    required Color success,

    /// Contrast color to the success color.
    required Color onSuccess,

    /// Color signaling warning or caution.
    required Color warning,

    /// Contrast color to the warning color.
    required Color onWarning,

    /// Color signaling error or negative outcome.
    required Color error,

    /// Contrast color to the error color.
    required Color onError,

    /// Color signaling neutral outcome.
    required Color draw,

    /// Subtle highlight color (overlay).
    required Color highlight10,

    /// Stronger highlight color (overlay).
    required Color highlight30,

    /// Colors signaling inactive/disabled elements.
    required Color inactive,

    /// Subtle dim overlay (overlay).
    required Color overlay30,

    /// Stronger dim overlay (overlay).
    required Color overlay50,

    /// Strongest dim overlay (overlay).
    required Color overlay70,

    /// Base color for shadows.
    required Color shadow,
  });

  /// {@category Foundation}
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

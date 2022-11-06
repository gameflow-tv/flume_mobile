import 'package:equatable/equatable.dart';
import 'package:flume/flume.dart';
import 'package:flutter/rendering.dart';

/// {@category Ambiance}
/// Palette of ambiance colors.
class AmbiancePalette extends Equatable {
  /// The darkest color, corresponding to a 0.02 luminance value.
  final Color dark;

  /// The next darkest color, corresponding to a 0.04 luminance value.
  final Color mediumDark;

  /// The medium luminance, corresponding to a 0.06 luminance value.
  final Color medium;

  /// The next lightest color, corresponding to a 0.09 luminance value.
  final Color mediumLight;

  /// The lightest color, run through the [lightColor] algorithm.
  final Color light;

  const AmbiancePalette({
    required this.dark,
    required this.mediumDark,
    required this.medium,
    required this.mediumLight,
    required this.light,
  });

  /// Creates a palette from a given [Color].
  factory AmbiancePalette.fromColor(Color color) {
    final hsv = HSVColor.fromColor(color);
    final converted = HSVColor.fromAHSV(
      1,
      hsv.hue >= 360 ? 360 : hsv.hue,
      hsv.saturation >= 0.45 ? 0.45 : hsv.saturation,
      0.4,
    );

    final source = converted.toColor();

    final dark = source.luminance(0.02);
    final mediumDark = source.luminance(0.04);
    final medium = source.luminance(0.06);
    final mediumLight = source.luminance(0.09);
    final light = lightColor(source);

    return AmbiancePalette(
      dark: dark,
      mediumDark: mediumDark,
      medium: medium,
      mediumLight: mediumLight,
      light: light,
    );
  }

  @override
  List<Object> get props => [dark, mediumDark, medium, mediumLight, light];
}

/// {@category Ambiance}
/// The lightest color, tweaked by a custom algorithm.
Color lightColor(Color color) {
  final hsv = HSVColor.fromColor(color);
  if (hsv.saturation > 0.12) {
    return color.saturate(0.6).brighten(2.8);
  } else {
    return color.brighten(2.5);
  }
}

import 'dart:ui';
import 'package:equatable/equatable.dart';
import 'package:flume/flume.dart';

/// {@category Ambiance}
/// Palette of ambiance colors.
class AmbientPalette extends Equatable {
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

  const AmbientPalette({
    required this.dark,
    required this.mediumDark,
    required this.medium,
    required this.mediumLight,
    required this.light,
  });

  /// Creates a palette from a given [Color].
  factory AmbientPalette.fromColor(Color color) => AmbientPalette(
        dark: color.luminance(0.02),
        mediumDark: color.luminance(0.04),
        medium: color.luminance(0.06),
        mediumLight: color.luminance(0.09),
        light: lightColor(color),
      );

  @override
  List<Object> get props => [dark, mediumDark, medium, mediumLight, light];
}

/// {@category Ambiance}
/// The lightest color, tweaked by a custom algorithm.
Color lightColor(Color color) {
  final hsv = HSV.fromColor(color);
  if (hsv.s > 0.12) {
    return color.saturate(0.6).brighten(2.8);
  } else {
    return color.brighten(2.5);
  }
}

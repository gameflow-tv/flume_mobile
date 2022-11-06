import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flume/flume.dart';

/// {@category Ambiance}
/// Class representing the HSL colorspace.
class HSL extends Equatable {
  /// Hue, in degrees.
  /// _Minimum_ 0, _maximum_ 360.
  final double h;

  /// Saturation, as a percentage.
  /// _Minimum_ 0, _maximum_ 1.
  final double s;

  /// Lightness value, as a percentage.
  /// _Minimum_ 0, _maximum_ 1.
  final double l;

  const HSL(this.h, this.s, this.l)
      : assert(h <= 360, 'Hue must be between 0 and 360'),
        assert(s <= 1, 'Saturation must be between 0 and 1'),
        assert(l <= 1, 'Lightness must be between 0 and 1');

  /// Converts [Color] to [HSL] color.
  factory HSL.fromColor(Color color) {
    return HSL.fromRGB(RGB(color.red, color.green, color.blue));
  }

  /// Converts [RGB] color to [HSL] color.
  factory HSL.fromRGB(RGB color) {
    final r = color.r / 255;
    final g = color.g / 255;
    final b = color.b / 255;

    final max = r > g ? (r > b ? r : b) : (g > b ? g : b);
    final min = r < g ? (r < b ? r : b) : (g < b ? g : b);

    final double h = max == min
        ? 0
        : max == r
            ? 60 * (g - b) / (max - min)
            : max == g
                ? 60 * (b - r) / (max - min) + 120
                : 60 * (r - g) / (max - min) + 240;

    final l = (max + min) / 2;

    final double s = max == min
        ? 0
        : l < 0.5
            ? (max - min) / (max + min)
            : (max - min) / (2 - max - min);

    return HSL(h, s, l);
  }

  /// Converts hex string to [HSL] color.
  factory HSL.fromHex(String hex) {
    final rgb = RGB.fromHex(hex);
    return HSL.fromRGB(rgb);
  }

  /// Converts [HSL] color to [Color].
  Color toColor() {
    return RGB.fromHSL(this).toColor();
  }

  @override
  List<Object> get props => [h, s, l];
}

/// {@category Ambiance}
/// Extension that adds [HSL] conversion methods to [Color].
extension HSLColorExtension on Color {
  /// Converts [Color] to [HSL] color.
  HSL toHSL() {
    return HSL.fromColor(this);
  }

  /// Converts [HSL] color to [Color].
  static Color fromHSL(HSL hsl) {
    return hsl.toColor();
  }
}

import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flume/flume.dart';

/// {@category Ambiance}
/// Class representing the HSV/HSB colorspace.
class HSV extends Equatable {
  /// Hue, in degrees.
  /// _Minimum_ 0, _maximum_ 360.
  final double h;

  /// Saturation, as a percentage.
  /// _Minimum_ 0, _maximum_ 1.
  final double s;

  /// Brightness value, as a percentage.
  /// _Minimum_ 0, _maximum_ 1.
  final double v;

  const HSV(this.h, this.s, this.v)
      : assert(h <= 360, 'Hue must be between 0 and 360'),
        assert(s <= 1, 'Saturation must be between 0 and 1'),
        assert(v <= 1, 'Brightness must be between 0 and 1');

  /// Converts [Color] to [HSV] color.
  factory HSV.fromColor(Color color) {
    return HSV.fromRGB(RGB(color.red, color.green, color.blue));
  }

  /// Converts [RGB] color to [HSV] color.
  factory HSV.fromRGB(RGB color) {
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

    final double s = max == 0 ? 0 : (max - min) / max;

    return HSV(h, s, max);
  }

  /// Converts [HSV] color to [Color].
  Color toColor() {
    final rgb = RGB.fromHSV(this);

    return Color.fromARGB(
      rgb.a,
      rgb.r,
      rgb.g,
      rgb.b,
    );
  }

  @override
  List<Object> get props => [h, s, v];
}

/// {@category Ambiance}
/// Extension that adds [HSV] conversion methods to [Color].
extension HSVExtension on Color {
  /// Converts [HSV] color to [Color].
  static Color fromHSV(HSV hsv) {
    return hsv.toColor();
  }

  /// Converts [Color] to [HSV] color.
  HSV toHSV() => HSV.fromColor(this);
}

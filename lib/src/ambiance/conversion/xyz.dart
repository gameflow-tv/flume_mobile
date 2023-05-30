import 'dart:math';
import 'dart:ui';

import 'package:equatable/equatable.dart';

/// {@category Ambiance}
/// Class representing the CIEXYZ colorspace.
class CIEXYZ extends Equatable {
  /// X value.
  final double x;

  /// Y value.
  final double y;

  /// Z value.
  final double z;

  const CIEXYZ(this.x, this.y, this.z);

  // Conversion from RGB to XYZ based on the sRGB color space.
  static CIEXYZ fromColor(Color color) {
    num r = color.red / 255;
    num g = color.green / 255;
    num b = color.blue / 255;

    // Apply inverse gamma correction.
    r = r > 0.04045 ? pow((r + 0.055) / 1.055, 2.4) : r / 12.92;
    g = g > 0.04045 ? pow((g + 0.055) / 1.055, 2.4) : g / 12.92;
    b = b > 0.04045 ? pow((b + 0.055) / 1.055, 2.4) : b / 12.92;

    // Convert to XYZ using the sRGB matrix.
    return CIEXYZ(
      r * 0.4124 + g * 0.3576 + b * 0.1805,
      r * 0.2126 + g * 0.7152 + b * 0.0722,
      r * 0.0193 + g * 0.1192 + b * 0.9505,
    );
  }

  Color toColor() {
    // Convert to sRGB
    double r = x * 3.2406 - y * 1.5372 - z * 0.4986;
    double g = -x * 0.9689 + y * 1.8758 + z * 0.0415;
    double b = x * 0.0557 - y * 0.2040 + z * 1.0570;

    // Apply gamma correction
    r = r > 0.0031308 ? 1.055 * pow(r, 1 / 2.4) - 0.055 : 12.92 * r;
    g = g > 0.0031308 ? 1.055 * pow(g, 1 / 2.4) - 0.055 : 12.92 * g;
    b = b > 0.0031308 ? 1.055 * pow(b, 1 / 2.4) - 0.055 : 12.92 * b;

    // Ensure the values are within the valid range
    r = (r * 255).clamp(0, 255);
    g = (g * 255).clamp(0, 255);
    b = (b * 255).clamp(0, 255);

    return Color.fromARGB(255, r.round(), g.round(), b.round());
  }

  @override
  List<Object?> get props => [x, y, z];
}

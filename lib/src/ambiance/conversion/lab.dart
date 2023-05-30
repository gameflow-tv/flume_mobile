import 'dart:math';
import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flume/src/ambiance/conversion/xyz.dart';

/// {@category Ambiance}
/// A color in the CIELAB color space.
class CIELAB extends Equatable {
  /// Perceptual lightness value.
  final double l;

  /// Red-green value.
  final double a;

  /// Yellow-blue value.
  final double b;

  const CIELAB(this.l, this.a, this.b);

  /// Converts from [CIEXYZ] to [CIELAB].
  static CIELAB fromXYZ(CIEXYZ xyz) {
    const double xn = 0.95047;
    const double yn = 1.0;
    const double zn = 1.08883;

    num f(double t) {
      return t > pow(6 / 29, 3)
          ? pow(t, 1 / 3.0)
          : t / (3 * pow(29 / 6, 2)) + 4 / 29;
    }

    double fx = f(xyz.x / xn).toDouble();
    double fy = f(xyz.y / yn).toDouble();
    double fz = f(xyz.z / zn).toDouble();

    double l = 116 * fy - 16;
    double a = 500 * (fx - fy);
    double b = 200 * (fy - fz);

    return CIELAB(l, a, b);
  }

  /// Converts from [Color] to [CIELAB].
  static CIELAB fromColor(Color color) {
    return CIELAB.fromXYZ(CIEXYZ.fromColor(color));
  }

  /// Converts from [CIELAB] to [XYZ].
  CIEXYZ toXYZ() {
    const double xn = 0.95047;
    const double yn = 1.0;
    const double zn = 1.08883;

    double fy = (l + 16) / 116;
    double fx = fy + a / 500;
    double fz = fy - b / 200;

    double xr =
        fx * fx * fx > 0.008856 ? fx * fx * fx : (116 * fx - 16) / 903.3;
    double yr = l > 7.9996 ? fy * fy * fy : l / 903.3;
    double zr =
        fz * fz * fz > 0.008856 ? fz * fz * fz : (116 * fz - 16) / 903.3;

    return CIEXYZ(xr * xn, yr * yn, zr * zn);
  }

  /// Converts from [CIELAB] to [Color].
  Color toColor() {
    return toXYZ().toColor();
  }

  @override
  List<Object?> get props => [l, a, b];
}

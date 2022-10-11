import 'dart:math';
import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flume/flume.dart';
import 'package:flume/src/ambiance/conversion/constants.dart';

/// {@category Ambiance}
/// Class representing the RGB colorspace.
class RGB extends Equatable {
  /// Red channel value.
  /// _Minimum_ 0, _maximum_ 255.
  final int r;

  /// Green channel value.
  /// _Minimum_ 0, _maximum_ 255.
  final int g;

  /// Blue channel value.
  /// _Minimum_ 0, _maximum_ 255.
  final int b;

  /// Alpha channel value.
  /// _Minimum_ 0, _maximum_ 255.
  final int a;

  const RGB(this.r, this.g, this.b, [this.a = 255])
      : assert(r <= 255, 'Red must be between 0 and 255'),
        assert(g <= 255, 'Green must be between 0 and 255'),
        assert(b <= 255, 'Blue must be between 0 and 255');

  /// Converts [Color] to [RGB] color.
  factory RGB.fromColor(Color color) {
    return RGB(color.red, color.green, color.blue, color.alpha);
  }

  /// Converts hex string to [RGB] color.
  factory RGB.fromHex(String hex) {
    final color = Color(int.parse(hex.substring(1, 7), radix: 16) + 0xFF000000);
    return RGB(color.red, color.green, color.blue, color.alpha);
  }

  /// Converts [HSV] color to [RGB] color.
  factory RGB.fromHSV(HSV color) {
    final h = color.h / 60;
    final s = color.s;
    final v = color.v;

    final i = h.floor();
    final f = h - i;
    final p = v * (1 - s);
    final q = v * (1 - s * f);
    final t = v * (1 - s * (1 - f));

    switch (i) {
      case 0:
        return RGB((v * 255).round(), (t * 255).round(), (p * 255).round());
      case 1:
        return RGB((q * 255).round(), (v * 255).round(), (p * 255).round());
      case 2:
        return RGB((p * 255).round(), (v * 255).round(), (t * 255).round());
      case 3:
        return RGB((p * 255).round(), (q * 255).round(), (v * 255).round());
      case 4:
        return RGB((t * 255).round(), (p * 255).round(), (v * 255).round());
      default:
        return RGB((v * 255).round(), (p * 255).round(), (q * 255).round());
    }
  }

  /// Converts [HSL] color to [RGB] color.
  factory RGB.fromHSL(HSL color) {
    final h = color.h / 360;
    final s = color.s;
    final l = color.l;

    final q = l < 0.5 ? l * (1 + s) : l + s - l * s;
    final p = 2 * l - q;

    double hueToRgb(double t) {
      if (t < 0) t += 1;
      if (t > 1) t -= 1;
      if (t < 1 / 6) return p + (q - p) * 6 * t;
      if (t < 1 / 2) return q;
      if (t < 2 / 3) return p + (q - p) * (2 / 3 - t) * 6;
      return p;
    }

    final r = (hueToRgb(h + 1 / 3) * 255).round();
    final g = (hueToRgb(h) * 255).round();
    final b = (hueToRgb(h - 1 / 3) * 255).round();

    return RGB(r, g, b);
  }

  /// Converts [LCH] color to [RGB] color.
  factory RGB.fromLCH(LCH color) {
    return color.toRGB();
  }

  /// Converts [CIELAB] color to [RGB] color.
  factory RGB.fromCIELAB(CIELAB color) {
    double labToXYZ(double t) {
      return t > t1 ? t * t * t : t2 * (t - t0);
    }

    double xyzToRGB(double t) {
      return 255 * (t <= 0.00304 ? 12.92 * t : 1.055 * pow(t, 1 / 2.4) - 0.055);
    }

    double x, y, z, r, g, b;

    y = (color.l + 16) / 116;
    x = color.a / 500 + y;
    z = y - color.b / 200;

    y = yn * labToXYZ(y);
    x = xn * labToXYZ(x);
    z = zn * labToXYZ(z);

    r = xyzToRGB(x * 3.2406 + y * -1.5372 + z * -0.4986);
    g = xyzToRGB(x * -0.9689 + y * 1.8758 + z * 0.0415);
    b = xyzToRGB(x * 0.0557 + y * -0.2040 + z * 1.0570);

    return RGB(r.round(), g.round(), b.round());
  }

  /// Converts color to hex string.
  String toHex() {
    return '#${r.toRadixString(16).padLeft(2, '0')}${g.toRadixString(16).padLeft(2, '0')}${b.toRadixString(16).padLeft(2, '0')}${a.toRadixString(16).padLeft(2, '0')}';
  }

  /// Converts color to [Color].
  Color toColor() {
    return Color.fromARGB(a, r, g, b);
  }

  /// Converts [RGB] to [CIEXYZ] coordinates.
  CIEXYZ toCIEXYZ() {
    double singleCoordToLAB(double t) {
      if (t > t3) {
        return pow(t, 1 / 3).toDouble();
      } else {
        return t / t2 + t0;
      }
    }

    double valueToXyz(double r) {
      if ((r /= 255) <= 0.04045) return r / 12.92;
      return pow((r + 0.055) / 1.055, 2.4).toDouble();
    }

    final rx = valueToXyz(r.toDouble());
    final gx = valueToXyz(g.toDouble());
    final bx = valueToXyz(b.toDouble());

    final double x = singleCoordToLAB(
        (0.4124564 * rx + 0.3575761 * gx + 0.1804375 * bx) / xn);
    final double y = singleCoordToLAB(
        (0.2126729 * rx + 0.7151522 * gx + 0.0721750 * bx) / yn);
    final double z = singleCoordToLAB(
        (0.0193339 * rx + 0.1191920 * gx + 0.9503041 * bx) / zn);

    return CIEXYZ(x, y, z);
  }

  @override
  List<Object> get props => [r, g, b, a];
}

/// {@category Ambiance}
/// Extension that adds [RGB] conversion methods to [Color].
extension RGBExtension on Color {
  /// Converts [RGB] color to [Color].
  static Color fromRGB(RGB color) {
    return Color.fromARGB(color.a, color.r, color.g, color.b);
  }

  /// Converts [Color] to [RGB] color.
  RGB toRGB() {
    return RGB.fromColor(this);
  }
}

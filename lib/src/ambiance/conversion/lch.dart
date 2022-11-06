import 'dart:math';
import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flume/flume.dart';

/// {@category Ambiance}
/// Class representing the LCH colorspace.
class LCH extends Equatable {
  /// Lightness value, as a percentage.
  final double l;

  /// Chroma value, as a percentage.
  final double c;

  /// Hue, in degrees.
  final double h;

  const LCH(this.l, this.c, this.h);

  factory LCH.fromCIELAB(CIELAB lab) {
    final double l = lab.l;
    final double a = lab.a;
    final double b = lab.b;

    final double c = sqrt(a * a + b * b);
    final double h = (atan2(b, a) * 180 + 360) % 360;

    return LCH(l, c, h);
  }

  /// Converts [RGB] color to [LCH] color.
  factory LCH.fromRGB(RGB color) {
    return LCH.fromCIELAB(CIELAB.fromRGB(color));
  }

  /// Converts [Color] to [LCH] color.
  factory LCH.fromColor(Color color) {
    return LCH.fromRGB(RGB(color.red, color.green, color.blue));
  }

  /// Converts [LCH] color to [CIELAB] color.
  CIELAB toCIELAB() {
    final double a = c * cos(h * pi / 180);
    final double b = c * sin(h * pi / 180);

    return CIELAB(l, a, b);
  }

  /// Converts [LCH] color to [RGB] color.
  RGB toRGB() {
    return toColor().toRGB();
  }

  /// Converts [LCH] color to [Color].
  Color toColor() {
    return toCIELAB().toColor();
  }

  @override
  List<Object> get props => [l, c, h];
}

/// {@category Ambiance}
/// Extension that adds [LCH] conversion methods to [Color].
extension LCHExtension on Color {
  /// Converts [Color] to [LCH] color.
  LCH toLCH() {
    return LCH.fromColor(this);
  }

  /// Converts [LCH] color to [Color].
  static Color fromLCH(LCH color) {
    return color.toColor();
  }
}

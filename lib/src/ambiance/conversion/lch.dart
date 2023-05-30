import 'dart:math' as math;

import 'package:equatable/equatable.dart';
import 'package:flume/src/ambiance/conversion/lab.dart';

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

  // Conversion from CIELAB to LCH.
  static LCH fromCIELAB(CIELAB cielab) {
    double c = math.sqrt(cielab.a * cielab.a + cielab.b * cielab.b);
    double h = (180 / math.pi) * math.atan2(cielab.b, cielab.a);
    if (h < 0) h = h + 360;
    return LCH(cielab.l, c, h);
  }

  // Conversion from LCH to CIELAB.
  CIELAB toCIELAB() {
    double a = c * math.cos(h * math.pi / 180);
    double b = c * math.sin(h * math.pi / 180);
    return CIELAB(l, a, b);
  }

  @override
  List<Object?> get props => [l, c, h];
}

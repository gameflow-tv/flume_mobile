import 'dart:ui';

import 'package:flume/flume.dart';

/// {@category Ambiance}
/// Extension on [Color] that adds saturation methods.
extension SaturateExtension on Color {
  /// Returns a saturated version of this color.
  Color saturate(double amount) {
    final lch = LCH.fromCIELAB(CIELAB.fromRGB(RGB(red, blue, green)));
    var c = lch.c;
    c += amount * 18;
    if (c < 0) c = 0;

    return LCH(lch.l, c, lch.h).toColor();
  }
}

import 'dart:ui';

import 'package:flume/flume.dart';
import 'package:flume/src/ambiance/conversion/constants.dart';

/// {@category Ambiance}
/// Extension on [Color] that adds saturation methods.
extension SaturateExtension on Color {
  /// Returns a saturated version of this color.
  Color saturate(double amount) {
    final lch = LCH.fromColor(this);
    var c = lch.c;
    c += amount * kn;
    if (c < 0) c = 0;

    return LCH(lch.l, c, lch.h).toColor();
  }
}

import 'dart:ui';

import 'package:flume/flume.dart';

/// {@category Ambiance}
/// Extension on [Color] to add brightness algorithm.
extension BrightenExtension on Color {
  /// Returns a new color with the given [amount] of brightness added.
  ///
  /// The [amount] must be between -1 and 1, where -1 is the darkest and 1 is
  /// the brightest. If the [amount] is 0, the original color is returned.
  Color brighten(double amount) {
    if (amount == 0) return this;

    final lab = CIELAB.fromColor(this);
    var l = lab.l;
    l -= 18 * amount;
    return CIELAB(l, lab.a, lab.b).toColor();
  }
}

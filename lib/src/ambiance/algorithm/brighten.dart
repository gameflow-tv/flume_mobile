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
    if (amount < -1 || amount > 1) {
      throw ArgumentError.value(amount, 'amount', 'must be between -1 and 1');
    }
    final hsl = HSL.fromRGB(RGB(red, green, blue)).toColor();
    final lum = hsl.computeLuminance() + amount;
    return hsl.luminance(lum);
  }
}

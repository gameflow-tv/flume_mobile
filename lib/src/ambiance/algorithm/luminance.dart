import 'dart:ui';

const eps = 1e-7;
const maxIter = 20;

// In-memory cache of luminance values to avoid
// expensive re-compute.
final lumCache = <Color, Color>{};

/// {@category Ambiance}
/// Extension on [Color] to get luminance values.
extension LuminanceExtension on Color {
  Color luminance(num lum) {
    if (0 == lum) {
      return const Color(0xff000000).withOpacity(opacity);
    } else if (1 == lum) {
      return const Color(0xffffffff).withOpacity(opacity);
    }

    final currentLuminance = computeLuminance();
    int mi = maxIter;

    Color test(Color low, Color high) {
      final mid = Color.lerp(high, low, 0.5);
      if (mid == null) {
        throw Exception('Color.lerp returned null');
      }

      final lm = mid.computeLuminance();

      if ((lum - lm).abs() < eps || 0 == mi--) {
        return mid;
      }
      return lm > lum ? test(low, mid) : test(mid, high);
    }

    final rgb = (currentLuminance > lum
        ? test(const Color(0x00000000), this)
        : test(this, const Color(0xffffffff)));

    // Add back the alpha value.
    final result = rgb.withOpacity(opacity);

    // Cache the result.
    lumCache[this] = result;

    return result;
  }
}

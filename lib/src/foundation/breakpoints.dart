/// {@category Foundation}
/// {@subCategory Breakpoints}
/// Breakpoints defined by Flume.
class Breakpoints {
  const Breakpoints({
    required double xs,
    required double sm,
    required double md,
    required double lg,
    required double xl,
    required double xxl,
  });

  /// {@category Foundation}
  /// {@subCategory Breakpoints}
  /// Default breakpoints defined by Flume.
  factory Breakpoints.fallback() => const Breakpoints(
        xs: 464,
        sm: 576,
        md: 768,
        lg: 992,
        xl: 1200,
        xxl: 1440,
      );
}

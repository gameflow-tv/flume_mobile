/// {@category Foundation}
/// {@subCategory Shapes}
/// Shapes and borders defined by Flume.
class Shapes {
  const Shapes({
    required double xs,
    required double sm,
    required double md,
    required double lg,
  });

  /// {@category Foundation}
  /// {@subCategory Shapes}
  /// Default shapes defined by Flume.
  factory Shapes.fallback() => const Shapes(
        xs: 2,
        sm: 4,
        md: 6,
        lg: 12,
      );
}

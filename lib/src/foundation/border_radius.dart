/// {@category Foundation}
/// Border radii defined by Flume.
class BorderRadius {
  const BorderRadius({
    required double xs,
    required double sm,
    required double md,
    required double lg,
  });

  /// {@category Foundation}
  /// Default border radii defined by Flume.
  factory BorderRadius.fallback() => const BorderRadius(
        xs: 2,
        sm: 4,
        md: 6,
        lg: 12,
      );
}

/// {@category Foundation}
/// {@subCategory Shapes}
/// Shapes and borders defined by Flume.
class FlumeShapes {
  const FlumeShapes({
    required this.xs,
    required this.sm,
    required this.md,
    required this.lg,
  });

  /// {@category Foundation}
  /// {@subCategory Shapes}
  /// Extra small border radius.
  final double xs;

  /// {@category Foundation}
  /// {@subCategory Shapes}
  /// Small border radius.
  final double sm;

  /// {@category Foundation}
  /// {@subCategory Shapes}
  /// Medium border radius.
  final double md;

  /// {@category Foundation}
  /// {@subCategory Shapes}
  /// Large border radius.
  final double lg;

  /// {@category Foundation}
  /// {@subCategory Shapes}
  /// Default shapes defined by Flume.
  factory FlumeShapes.fallback() => const FlumeShapes(
        xs: 2,
        sm: 4,
        md: 6,
        lg: 12,
      );
}

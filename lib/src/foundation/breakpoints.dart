/// {@category Foundation}
/// {@subCategory Breakpoints}
/// Breakpoints defined by Flume.
class FlumeBreakpoints {
  const FlumeBreakpoints({
    required this.xs,
    required this.sm,
    required this.md,
    required this.lg,
    required this.xl,
    required this.xxl,
  });

  /// {@category Foundation}
  /// {@subCategory Breakpoints}
  /// Extra small breakpoint.
  final double xs;

  /// {@category Foundation}
  /// {@subCategory Breakpoints}
  /// Small breakpoint.
  final double sm;

  /// {@category Foundation}
  /// {@subCategory Breakpoints}
  /// Medium breakpoint.
  final double md;

  /// {@category Foundation}
  /// {@subCategory Breakpoints}
  /// Large breakpoint.
  final double lg;

  /// {@category Foundation}
  /// {@subCategory Breakpoints}
  /// Extra large breakpoint.
  final double xl;

  /// {@category Foundation}
  /// {@subCategory Breakpoints}
  /// Extra extra large breakpoint.
  final double xxl;

  /// {@category Foundation}
  /// {@subCategory Breakpoints}
  /// Default breakpoints defined by Flume.
  factory FlumeBreakpoints.fallback() => const FlumeBreakpoints(
        xs: 464,
        sm: 576,
        md: 768,
        lg: 992,
        xl: 1200,
        xxl: 1440,
      );
}

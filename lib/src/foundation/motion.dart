/// {@category Foundation}
/// {@subCategory Motion}
/// Motion durations defined by Flume.
class FlumeMotion {
  const FlumeMotion({
    required this.enabled,
    required this.short,
    required this.medium,
    required this.long,
  });

  /// {@category Foundation}
  /// {@subCategory Motion}
  /// Whether motion is enabled or not (e.g. with reduced motion).
  final bool enabled;

  /// {@category Foundation}
  /// {@subCategory Motion}
  /// Short motion duration for micro-interactions.
  final Duration short;

  /// {@category Foundation}
  /// {@subCategory Motion}
  /// Medium motion duration for transitions.
  final Duration medium;

  /// {@category Foundation}
  /// {@subCategory Motion}
  /// Long motion duration for longer transitions.
  final Duration long;

  /// {@category Foundation}
  /// {@subCategory Motion}
  /// Default motion durations defined by Flume.
  factory FlumeMotion.fallback() => const FlumeMotion(
        enabled: true,
        short: Duration(milliseconds: 100),
        medium: Duration(milliseconds: 200),
        long: Duration(milliseconds: 300),
      );

  /// {@category Foundation}
  /// {@subCategory Motion}
  /// Returns a disabled motion instance.
  /// Used for devices with reduced motion.
  factory FlumeMotion.disabled() => const FlumeMotion(
        enabled: false,
        short: Duration(milliseconds: 0),
        medium: Duration(milliseconds: 0),
        long: Duration(milliseconds: 0),
      );
}

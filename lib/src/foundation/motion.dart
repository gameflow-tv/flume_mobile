/// {@category Foundation}
/// {@subCategory Motion}
/// Motion durations defined by Flume.
class Motion {
  const Motion({
    required bool enabled,
    required Duration short,
    required Duration medium,
    required Duration long,
  });

  /// {@category Foundation}
  /// {@subCategory Motion}
  /// Default motion durations defined by Flume.
  factory Motion.fallback() => const Motion(
        enabled: true,
        short: Duration(milliseconds: 100),
        medium: Duration(milliseconds: 200),
        long: Duration(milliseconds: 300),
      );

  /// {@category Foundation}
  /// {@subCategory Motion}
  /// Returns a disabled motion instance.
  /// Used for devices with reduced motion.
  factory Motion.disabled() => const Motion(
        enabled: false,
        short: Duration(milliseconds: 0),
        medium: Duration(milliseconds: 0),
        long: Duration(milliseconds: 0),
      );
}

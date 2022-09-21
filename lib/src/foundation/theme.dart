import 'package:flume/src/foundation/border_radius.dart';
import 'package:flume/src/foundation/breakpoints.dart';
import 'package:flume/src/foundation/colors.dart';
import 'package:flume/src/foundation/motion.dart';
import 'package:flume/src/foundation/shadows.dart';
import 'package:flume/src/foundation/spacing.dart';
import 'package:flume/src/foundation/typography.dart';

/// {@category Foundation}
/// A theme instance containing all Flume design tokens.
class Theme {
  const Theme({
    required this.breakpoints,
    required this.borderRadius,
    required this.colors,
    required this.motion,
    required this.shadows,
    required this.spacing,
    required this.typography,
  });

  /// {@category Foundation}
  /// Breakpoints defined by Flume.
  final Breakpoints breakpoints;

  /// {@category Foundation}
  /// Border radii defined by Flume.
  final BorderRadius borderRadius;

  /// {@category Foundation}
  /// Color scheme defined by Flume.
  final Colors colors;

  /// {@category Foundation}
  /// Motion durations defined by Flume.
  final Motion motion;

  /// {@category Foundation}
  /// Shadows defined by Flume.
  final Shadows shadows;

  /// {@category Foundation}
  /// Spacing defined by Flume.
  final Spacing spacing;

  /// {@category Foundation}
  /// Typography defined by Flume.
  final Typography typography;

  /// {@category Foundation}
  /// Default theme defined by Flume.
  factory Theme.fallback() => Theme(
        breakpoints: Breakpoints.fallback(),
        borderRadius: BorderRadius.fallback(),
        colors: Colors.fallback(),
        motion: Motion.fallback(),
        shadows: Shadows.fallback(),
        spacing: Spacing.fallback(),
        typography: Typography.fallback(),
      );
}

import 'package:flume/src/foundation/shapes.dart';
import 'package:flume/src/foundation/breakpoints.dart';
import 'package:flume/src/foundation/colors.dart';
import 'package:flume/src/foundation/motion.dart';
import 'package:flume/src/foundation/shadows.dart';
import 'package:flume/src/foundation/spacing.dart';
import 'package:flume/src/foundation/typography.dart';

/// {@category Foundation}
/// {@subCategory Theme}
/// A theme instance containing all Flume design tokens.
class Theme {
  const Theme({
    required this.breakpoints,
    required this.shapes,
    required this.colors,
    required this.motion,
    required this.shadows,
    required this.spacing,
    required this.typography,
  });

  /// {@category Foundation}
  /// {@subCategory Breakpoints}
  /// Breakpoints defined by Flume.
  final Breakpoints breakpoints;

  /// {@category Foundation}
  /// {@subCategory Shapes}
  /// Border radii defined by Flume.
  final Shapes shapes;

  /// {@category Foundation}
  /// {@subCategory Colors}
  /// Color scheme defined by Flume.
  final Colors colors;

  /// {@category Foundation}
  /// {@subCategory Motion}
  /// Motion durations defined by Flume.
  final Motion motion;

  /// {@category Foundation}
  /// {@subCategory Shadows}
  /// Shadows defined by Flume.
  final Shadows shadows;

  /// {@category Foundation}
  /// {@subCategory Spacing}
  /// Spacing defined by Flume.
  final Spacing spacing;

  /// {@category Foundation}
  /// {@subCategory Typography}
  /// Typography defined by Flume.
  final Typography typography;

  /// {@category Foundation}
  /// {@subCategory Theme}
  /// Default theme defined by Flume.
  factory Theme.fallback() => Theme(
        breakpoints: Breakpoints.fallback(),
        shapes: Shapes.fallback(),
        colors: Colors.fallback(),
        motion: Motion.fallback(),
        shadows: Shadows.fallback(),
        spacing: Spacing.fallback(),
        typography: Typography.fallback(),
      );
}

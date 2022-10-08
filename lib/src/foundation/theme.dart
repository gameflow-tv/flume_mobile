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
class FlumeTheme {
  const FlumeTheme({
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
  final FlumeBreakpoints breakpoints;

  /// {@category Foundation}
  /// {@subCategory Shapes}
  /// Border radii defined by Flume.
  final FlumeShapes shapes;

  /// {@category Foundation}
  /// {@subCategory Colors}
  /// Color scheme defined by Flume.
  final FlumeColors colors;

  /// {@category Foundation}
  /// {@subCategory Motion}
  /// Motion durations defined by Flume.
  final FlumeMotion motion;

  /// {@category Foundation}
  /// {@subCategory Shadows}
  /// Shadows defined by Flume.
  final FlumeShadows shadows;

  /// {@category Foundation}
  /// {@subCategory Spacing}
  /// Spacing defined by Flume.
  final FlumeSpacing spacing;

  /// {@category Foundation}
  /// {@subCategory Typography}
  /// Typography defined by Flume.
  final FlumeTypography typography;

  /// {@category Foundation}
  /// {@subCategory Theme}
  /// Default theme defined by Flume.
  factory FlumeTheme.fallback() => FlumeTheme(
        breakpoints: FlumeBreakpoints.fallback(),
        shapes: FlumeShapes.fallback(),
        colors: FlumeColors.fallback(),
        motion: FlumeMotion.fallback(),
        shadows: FlumeShadows.fallback(),
        spacing: FlumeSpacing.fallback(),
        typography: FlumeTypography.fallback(),
      );
}

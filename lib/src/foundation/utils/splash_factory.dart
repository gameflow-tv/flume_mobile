import 'package:flutter/material.dart';

/// {@category Foundation}
/// Splash factory that disables all ripple effects
class NoSplashFactory extends InteractiveInkFeatureFactory {
  const NoSplashFactory();

  @override
  InteractiveInkFeature create({
    required MaterialInkController controller,
    required RenderBox referenceBox,
    required Offset position,
    required Color color,
    required TextDirection textDirection,
    bool containedInkWell = false,
    RectCallback? rectCallback,
    BorderRadius? borderRadius,
    ShapeBorder? customBorder,
    double? radius,
    VoidCallback? onRemoved,
  }) {
    return NoSplash(
      controller: controller,
      referenceBox: referenceBox,
      color: color,
    );
  }
}

/// A splash effect that disables all ripple effects
class NoSplash extends InteractiveInkFeature {
  NoSplash({
    required MaterialInkController controller,
    required RenderBox referenceBox,
    required Color color,
  }) : super(
          controller: controller,
          referenceBox: referenceBox,
          color: color,
        );

  @override
  void paintFeature(Canvas canvas, Matrix4 transform) {}
}

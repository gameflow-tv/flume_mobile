import 'package:flume/flume.dart';
import 'package:flutter/material.dart';

class Blueprint extends StatelessWidget {
  const Blueprint({
    super.key,
    required this.child,
    this.spacing,
    this.lineColor,
  });

  final Widget child;
  final double? spacing;
  final Color? lineColor;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _BlueprintPainter(
        lineColor:
            lineColor ?? context.ambiance.palette.light.withOpacity(0.05),
        spacing: spacing ?? context.theme.spacing.md,
      ),
      child: child,
    );
  }
}

class _BlueprintPainter extends CustomPainter {
  _BlueprintPainter({required this.lineColor, required this.spacing});

  final Color lineColor;
  final double spacing;

  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    final paint = Paint()
      ..color = lineColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.1;

    // Paint a grid of squares with a spacing of `spacing` that fills the entire canvas.
    // The squares' outlines are painted with `lineColor`.

    for (var x = 0.0; x < width; x += spacing) {
      for (var y = 0.0; y < height; y += spacing) {
        canvas.drawRect(
          Rect.fromLTWH(x, y, spacing, spacing),
          paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(_BlueprintPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(_BlueprintPainter oldDelegate) => false;
}

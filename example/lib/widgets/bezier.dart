import 'package:flume/flume.dart';
import 'package:flutter/material.dart';

class BezierCurvePainter extends CustomPainter {
  final double animation;
  final Color curveColor;
  final Color handleColor;
  final Color handleDotColor;
  final Color dotColor;

  BezierCurvePainter({
    required this.animation,
    required this.curveColor,
    required this.handleColor,
    required this.handleDotColor,
    required this.dotColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Define control points for the Bézier curve
    Offset startPoint = Offset(50, size.height - 100);
    Offset endPoint = Offset(size.width - 50, 100);
    Offset controlPoint1 = Offset(size.width / 3, size.height - 200);
    Offset controlPoint2 = Offset(2 * size.width / 3, 200);

    // Draw the Bézier curve
    final curvePaint = Paint()
      ..color = curveColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    final curvePath = Path()
      ..moveTo(startPoint.dx, startPoint.dy)
      ..cubicTo(controlPoint1.dx, controlPoint1.dy, controlPoint2.dx,
          controlPoint2.dy, endPoint.dx, endPoint.dy);

    canvas.drawPath(curvePath, curvePaint);

    // Draw handles with dotted lines
    final handlePaint = Paint()
      ..color = handleColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..strokeMiterLimit = 4.0
      ..isAntiAlias = true;

    final startPointHandle = startPoint + (controlPoint1 - startPoint) * 0.5;
    final endPointHandle = endPoint + (controlPoint2 - endPoint) * 0.5;

    canvas.drawLine(startPoint, startPointHandle, handlePaint);
    canvas.drawLine(endPoint, endPointHandle, handlePaint);

    // Draw dots at the end of the handles
    final handleDotPaint = Paint()..color = handleDotColor;
    canvas.drawCircle(startPointHandle, 5.0, handleDotPaint);
    canvas.drawCircle(endPointHandle, 5.0, handleDotPaint);

    // Calculate the position of the dot along the curve based on the animation value
    double t = Curves.easeInOut.transform(animation);
    double x = _calculateBezierCoordinate(
        startPoint.dx, controlPoint1.dx, controlPoint2.dx, endPoint.dx, t);
    double y = _calculateBezierCoordinate(
        startPoint.dy, controlPoint1.dy, controlPoint2.dy, endPoint.dy, t);

    // Draw the animated dot
    final dotPaint = Paint()..color = dotColor;
    canvas.drawCircle(Offset(x, y), 10.0, dotPaint);
  }

  double _calculateBezierCoordinate(
      double p0, double p1, double p2, double p3, double t) {
    double mt = 1 - t;
    return mt * mt * mt * p0 +
        3 * mt * mt * t * p1 +
        3 * mt * t * t * p2 +
        t * t * t * p3;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class BezierCurveAnimation extends StatefulWidget {
  const BezierCurveAnimation({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BezierCurveAnimationState createState() => _BezierCurveAnimationState();
}

class _BezierCurveAnimationState extends State<BezierCurveAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, _) {
        return CustomPaint(
          painter: BezierCurvePainter(
            animation: _animation.value,
            curveColor: context.ambiance.palette.light.withOpacity(0.7),
            handleColor: context.ambiance.palette.light.withOpacity(0.3),
            handleDotColor: context.ambiance.palette.light.withOpacity(0.7),
            dotColor: context.ambiance.palette.light,
          ),
          size: const Size(double.infinity, double.infinity),
        );
      },
    );
  }
}

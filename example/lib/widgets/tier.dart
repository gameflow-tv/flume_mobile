import 'package:flume/flume.dart';
import 'package:flume/material.dart';

class Tier extends StatelessWidget {
  const Tier({
    super.key,
    required this.stars,
    this.size = 16,
  });

  final double size;
  final int stars;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var i = 0; i < 3; i++)
          Icon(
            i + 1 > stars ? FlumeIcons.star : FlumeIcons.star_filled,
            size: size,
          ),
      ].spaced(context.theme.spacing.xxs),
    );
  }
}

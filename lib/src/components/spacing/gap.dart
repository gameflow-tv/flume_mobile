import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

/// {@category Components}
/// An empty spacing widget used to create padding or space.
/// Requires a [Provider] of [Axis] to determine the direction.
class Gap extends StatelessWidget {
  final double? vertical;
  final double? horizontal;
  final double space;

  const Gap(
    this.space, {
    super.key,
  })  : vertical = null,
        horizontal = null;

  @override
  Widget build(BuildContext context) {
    var horizontal = this.horizontal;
    var vertical = this.vertical;

    if (horizontal == null && vertical == null) {
      final axis = Provider.of<Axis>(context);
      if (axis == Axis.horizontal) {
        horizontal = space;
      } else {
        vertical = space;
      }
    }

    return SizedBox(
      width: horizontal ?? 0.0,
      height: vertical ?? 0.0,
    );
  }
}

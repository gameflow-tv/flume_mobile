import 'package:flume/material.dart';

// Spacing widget for uniquely identifying a gap provided by `.spaced` in a list of widgets.
class _Gap extends StatelessWidget {
  const _Gap({
    required this.space,
  });

  final double? space;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: space, height: space);
  }
}

/// {@category Components}
/// {@subCategory Spacing}
extension WidgetIterableExtension on Iterable<Widget> {
  List<Widget> spaced(double? space) {
    if (isEmpty) {
      return const <Widget>[];
    }

    return <Widget>[
      first,
      ...skip(1).expand((child) {
        return <Widget>[
          _Gap(space: space),
          child,
        ];
      }),
    ];
  }

  List<Widget> divided(double thickness, Color color) {
    if (isEmpty) {
      return const <Widget>[];
    }

    // Skip the first element because we don't want a divider above the first,
    // and then add a divider between each element, except _Gap widgets.
    return <Widget>[
      first,
      ...skip(1).expand((child) {
        return <Widget>[
          if (child.runtimeType != _Gap) ...{
            Divider(thickness: thickness, color: color, height: thickness),
          },
          child,
        ];
      })
    ];
  }
}

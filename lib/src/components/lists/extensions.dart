import 'package:flutter/widgets.dart';

/// {@category Spacing}
/// {@macro eufemia.extension}
extension WidgetIterableExtension on Iterable<Widget> {
  List<Widget> spaced(double space) {
    if (isEmpty) {
      return const <Widget>[];
    }

    return <Widget>[
      first,
      ...skip(1).expand((child) {
        return <Widget>[
          // TODO: Gap(space),
          SizedBox(width: space, height: space),
          child,
        ];
      }),
    ];
  }
}

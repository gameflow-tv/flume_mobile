import 'package:flutter/material.dart';

/// {@category Spacing}
/// {@macro flume.extension}
extension WidgetIterableExtension on Iterable<Widget> {
  List<Widget> spaced(double? space) {
    if (isEmpty) {
      return const <Widget>[];
    }

    return <Widget>[
      first,
      ...skip(1).expand((child) {
        return <Widget>[
          SizedBox(width: space, height: space),
          child,
        ];
      }),
    ];
  }

  List<Widget> divided(double thickness, Color color) {
    if (isEmpty) {
      return const <Widget>[];
    }

    return <Widget>[
      first,
      ...skip(1).expand((child) {
        return <Widget>[
          Divider(thickness: thickness, color: color),
          child,
        ];
      })
    ];
  }
}

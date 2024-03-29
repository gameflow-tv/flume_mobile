import 'package:flume/src/ambiance.dart';
import 'package:flutter/widgets.dart';

/// {@category Ambiance}
/// {@subCategory Types}
/// A callback that returns a [Color].
typedef ColorCallback = Color Function();

/// {@category Ambiance}
/// {@subCategory Types}
/// A callback that takes an [int] argument and returns a [Color].
typedef ColorCallbackWithArg = Color Function(int);

/// {@category Foundation}
/// A provider wrapper around [FlumeTheme] allowing its children
/// to be notified and rebuilt when the theme changes.
class AmbianceProvider extends InheritedWidget {
  final AmbianceState state;

  const AmbianceProvider({
    super.key,
    required super.child,
    required this.state,
  });

  static AmbianceProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AmbianceProvider>();
  }

  @override
  bool updateShouldNotify(AmbianceProvider oldWidget) {
    return state.elevation != oldWidget.state.elevation ||
        state.color != oldWidget.state.color ||
        state.source != oldWidget.state.source;
  }
}

import 'package:flutter/widgets.dart';

/// {@category Foundation}
/// A provider wrapper around [FlumeTheme] allowing its children
/// to be notified and rebuilt when the theme changes.
class AmbianceProvider extends InheritedWidget {
  final Color color;
  final int elevation;
  final Color source;

  const AmbianceProvider({
    super.key,
    required this.elevation,
    required Widget child,
    required this.color,
    required this.source,
  }) : super(child: child);

  static AmbianceProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AmbianceProvider>();
  }

  @override
  bool updateShouldNotify(AmbianceProvider oldWidget) {
    return elevation != oldWidget.elevation ||
        color != oldWidget.color ||
        source != oldWidget.source;
  }
}

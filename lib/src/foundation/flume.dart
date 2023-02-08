import 'package:flutter/material.dart';
import 'package:flume/flume.dart';

import 'adapter.dart';

/// {@category Foundation}
/// A widget wrapping its child with [FlumeTheme] and providing an accessor to
/// a context's nearest [FlumeTheme] parent.
class Flume extends StatelessWidget {
  /// The [FlumeTheme] to provide to the widget's children.
  final FlumeTheme theme;

  /// The child of the widgets.
  final Widget? child;

  /// A builder function providing [ThemeData] from [FlumeThemeAdapter].
  final Widget Function(BuildContext context, ThemeData data)? builder;

  const Flume({
    super.key,
    required this.theme,
    this.child,
    this.builder,
  }) : assert(builder != null || child != null);

  static FlumeTheme of(BuildContext context) {
    final provider =
        context.dependOnInheritedWidgetOfExactType<FlumeThemeProvider>();
    if (provider == null) {
      throw Exception('No FlumeThemeProvider found in the widget tree');
    }
    return provider.data;
  }

  @override
  Widget build(BuildContext context) {
    return _MediaQueryFromWindow(
      child: Builder(
        builder: (context) {
          return FlumeThemeProvider(
            data: theme,
            child: Builder(
              builder: (context) {
                final adapter = FlumeThemeAdapter(context);
                return builder?.call(context, adapter.theme) ?? child!;
              },
            ),
          );
        },
      ),
    );
  }
}

class _MediaQueryFromWindow extends StatefulWidget {
  final Widget child;

  const _MediaQueryFromWindow({required this.child});

  @override
  _MediaQueryFromWindowState createState() => _MediaQueryFromWindowState();
}

class _MediaQueryFromWindowState extends State<_MediaQueryFromWindow>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeMetrics() {
    setState(() {
      // The properties of window have changed. We use them in our build
      // function, so we need setState(), but we don't cache anything locally.
    });
  }

  @override
  void didChangePlatformBrightness() {
    setState(() {
      // The platformBrightness property of window has changed. We reference
      // window in our build function, so we need to call setState(), but
      // we don't need to cache anything locally.
    });
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      // TODO(arnemolland): Migrate deprecated method and remove todo, #22
      // ignore: deprecated_member_use
      data: MediaQueryData.fromWindow(WidgetsBinding.instance.window),
      child: widget.child,
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}

/// {@category Foundation}
/// A provider wrapper around [FlumeTheme] allowing its children
/// to be notified and rebuilt when the theme changes.
class FlumeThemeProvider extends InheritedWidget {
  final FlumeTheme data;

  const FlumeThemeProvider({
    super.key,
    required this.data,
    required Widget child,
  }) : super(child: child);

  @override
  bool updateShouldNotify(FlumeThemeProvider oldWidget) {
    return data != oldWidget.data;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'flume.dart';
import 'utils/splash_factory.dart';

/// {@category Foundation}
/// An adapter bridging [Flume] and [ThemeData].
class FlumeThemeAdapter {
  /// The current context.
  final BuildContext context;

  /// The [Color] to set the system status bar to.
  Color? statusBarColor;

  FlumeThemeAdapter(this.context, [this.statusBarColor]);

  /// Returns a [ThemeData] instance created from the context's current
  /// [Flume] theme.
  ThemeData get theme {
    final flume = Flume.of(context);
    final colors = flume.colors;

    if (statusBarColor != null) {
      setStatusBarColor(
        statusBarColor: statusBarColor ?? colors.secondary,
        brightness: colors.brightness,
      );
    }

    return ThemeData(
      colorScheme: ColorScheme(
        brightness: colors.brightness,
        primary: colors.primary,
        onPrimary: colors.onPrimary,
        secondary: colors.secondary,
        onSecondary: colors.body,
        error: colors.error,
        onError: colors.onError,
        background: colors.secondary,
        onBackground: colors.body,
        surface: colors.secondary,
        onSurface: colors.body,
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: colors.primary,
        selectionColor: colors.primary.withOpacity(0.5),
        selectionHandleColor: colors.primary,
      ),
      iconTheme: IconThemeData(
        color: colors.icon,
        size: 22.0,
      ),
      appBarTheme: AppBarTheme(
        color: colors.secondary,
        elevation: 0,
        iconTheme: IconThemeData(
          color: colors.icon,
          size: 22.0,
        ),
        actionsIconTheme: IconThemeData(
          color: colors.icon,
          size: 22.0,
        ),
      ),
      splashFactory: const NoSplashFactory(),
    );
  }

  /// Returns a [SystemUiOverlayStyle] object which can be used with [SystemChrome] to
  /// well, set the System UI overlay style.
  ///
  /// [brightness]: The brightness of the status bar. Affects the icon brightness accordingly.
  /// [statusBarColor]: The color of the status bar. Should reflect the brightness given, e.g.
  /// a dark color for [Brightness.dark] to make the icons visible.
  static SystemUiOverlayStyle getOverlayStyle(
    Brightness brightness,
    Color statusBarColor,
  ) {
    if (brightness == Brightness.dark) {
      return SystemUiOverlayStyle(
        // Only affects Android
        statusBarColor: statusBarColor,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
      );
    } else {
      return SystemUiOverlayStyle(
        // Only affects Android
        statusBarColor: statusBarColor,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
      );
    }
  }

  /// Sets the system's status bar color.
  /// [statusBarColor]: Sets the status bar color. Defaults to [Colors.transparent]
  static void setStatusBarColor({
    required Color statusBarColor,
    required Brightness brightness,
  }) {
    SystemChrome.setSystemUIOverlayStyle(
      getOverlayStyle(
        brightness,
        statusBarColor,
      ),
    );
  }
}

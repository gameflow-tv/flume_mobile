import 'package:flume/flume.dart';
import 'package:flume/material.dart';

/// {@category Components}
/// {@subCategory Extensions}
/// Quality-of-life extensions on [BuildContext].
extension FlumeContextExtension on BuildContext {
  /// If the current context brightness is [Brightness.light].
  bool get bright => brightness == Brightness.light;

  /// If the current context brightness is [Brightness.dark].
  bool get dark => !bright;

  /// If the current platform system-wide brightness is [Brightness.light].
  bool get platformBright => mediaQuery.platformBrightness == Brightness.light;

  /// If the current platform system-wide brightness is [Brightness.dark].
  bool get platformDark => !platformBright;

  /// If the current theme's [TargetPlatform] is [TargetPlatform.iOS].
  bool get iOS => platform == TargetPlatform.iOS;

  /// If the current theme's [TargetPlatform] is [TargetPlatform.macOS].
  bool get macOS => platform == TargetPlatform.macOS;

  /// If the current theme's [TargetPlatform] is either [TargetPlatform.iOS]
  /// or [TargetPlatform.macOS] and should default to Cupertino design.
  bool get cupertino => iOS || macOS;

  /// If the current theme's [TargetPlatform] is [TargetPlatform.android]
  bool get android => platform == TargetPlatform.android;

  /// If the current theme's [TargetPlatform] is [TargetPlatform.fuchsia]
  bool get fuchsia => platform == TargetPlatform.fuchsia;

  /// If the current theme's [TargetPlatform] should default to Material Design.
  bool get material => !cupertino;

  /// Returns the current [ThemeData] of this context.
  FlumeTheme get theme => Flume.of(this);

  ThemeData get materialTheme => Theme.of(this);

  /// Returns the current [MediaQueryData] of this context.
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// Returns the current [TargetPlatform] of this context's theme.
  TargetPlatform get platform => materialTheme.platform;

  /// Returns the current context's [ThemeData] brightness
  Brightness get brightness => materialTheme.brightness;

  /// Returns the current context's [ThemeData] [TextTheme] textTheme.
  TextTheme get textTheme => materialTheme.textTheme;
}

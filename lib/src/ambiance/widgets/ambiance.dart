import 'package:flume/flume.dart';
import 'package:flutter/widgets.dart';

class Ambiance extends StatelessWidget {
  final Color? source;
  final Color? color;
  final Widget? child;
  final int? elevation;
  final Widget Function(BuildContext, Color, int)? builder;

  const Ambiance({
    super.key,
    this.child,
    this.builder,
    this.color,
    this.elevation,
    this.source,
  }) : assert(child != null || builder != null);

  static AmbianceProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AmbianceProvider>();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Flume.of(context);
    final parent = of(context);
    final computedElevation =
        elevation ?? (parent != null ? parent.elevation + 1 : 0);
    final computedColor = getColorFromElevation(
        color ?? parent?.source ?? theme.colors.secondary, computedElevation);

    return AmbianceProvider(
      elevation: computedElevation,
      color: computedColor,
      source: color ?? parent?.source ?? theme.colors.secondary,
      child: Proxy(
        builder: (ctx) {
          return child ?? builder!(ctx, computedColor, computedElevation);
        },
      ),
    );
  }
}

class Proxy extends StatelessWidget {
  final Widget Function(BuildContext) builder;
  const Proxy({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return builder(context);
  }
}

Map<Color, AmbiancePalette> _computedPalettes = {};

Color getColorFromElevation(Color color, int elevation) {
  AmbiancePalette palette;

  if (_computedPalettes.containsKey(color)) {
    palette = _computedPalettes[color]!;
  } else {
    palette = AmbiancePalette.fromColor(color);
  }

  switch (elevation) {
    case 0:
      return palette.dark;
    case 1:
      return palette.mediumDark;
    case 2:
      return palette.medium;
    case 3:
      return palette.mediumLight;
    case 4:
    default:
      return palette.light;
  }
}

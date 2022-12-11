import 'package:flume/flume.dart';
import 'package:flutter/widgets.dart';

class AmbianceState {
  final Color color;
  final int elevation;
  final Color source;
  final Color Function() down;
  final Color Function() up;
  final Color Function(int) at;

  AmbianceState({
    required this.color,
    required this.elevation,
    required this.source,
    required this.down,
    required this.up,
    required this.at,
  });
}

class Ambiance extends StatelessWidget {
  final Color? source;
  final Color? color;
  final Widget? child;
  final int? elevation;
  final Widget Function(BuildContext, AmbianceState)? builder;

  const Ambiance({
    super.key,
    this.child,
    this.builder,
    this.color,
    this.elevation,
    this.source,
  }) : assert(child != null || builder != null);

  static AmbianceState? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<AmbianceProvider>()
        ?.state;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Flume.of(context);
    final parent = of(context);
    final computedElevation =
        elevation ?? (parent != null ? parent.elevation + 1 : 0);
    final computedColor = getColorFromElevation(
        color ?? parent?.source ?? theme.colors.secondary, computedElevation);
    final source = color ?? parent?.source ?? theme.colors.secondary;

    final state = AmbianceState(
      color: computedColor,
      elevation: computedElevation,
      source: source,
      down: () => getColorFromElevation(source, computedElevation + 1),
      up: () => getColorFromElevation(source, computedElevation - 1),
      at: (elevation) => getColorFromElevation(source, elevation),
    );

    return AmbianceProvider(
      state: state,
      child: Proxy(
        builder: (ctx) {
          return child ??
              builder!(
                ctx,
                state,
              );
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

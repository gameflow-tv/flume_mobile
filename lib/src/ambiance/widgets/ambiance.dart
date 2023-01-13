import 'package:flume/flume.dart';
import 'package:flutter/widgets.dart';

class AmbianceState {
  final AmbiancePalette palette;
  final Color color;
  final int elevation;
  final Color source;
  final Color Function() down;
  final Color Function() up;
  final Color Function(int) at;

  AmbianceState({
    required this.palette,
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

  static AmbianceState of(BuildContext context) {
    final instance =
        context.dependOnInheritedWidgetOfExactType<AmbianceProvider>();

    if (instance == null) {
      throw Exception('No AmbianceProvider found in the widget tree.');
    }

    return instance.state;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Flume.of(context);
    int computedElevation;
    Color computedColor;
    Color source;

    try {
      final parent = of(context);

      computedElevation = elevation ?? parent.elevation + 1;
      computedColor =
          getColorFromElevation(color ?? parent.source, computedElevation);
      source = color ?? parent.source;
    } catch (e) {
      computedElevation = elevation ?? 0;
      computedColor = getColorFromElevation(
          color ?? theme.colors.secondary, computedElevation);
      source = color ?? theme.colors.secondary;
    }

    final state = AmbianceState(
      palette: getPaletteFromColor(source),
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
          return child ?? builder!(ctx, state);
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

AmbiancePalette getPaletteFromColor(Color color) {
  if (_computedPalettes.containsKey(color)) {
    return _computedPalettes[color]!;
  } else {
    return AmbiancePalette.fromColor(color);
  }
}

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

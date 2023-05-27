import 'dart:io';
import 'dart:math' as math;

import 'package:flume/flume.dart';
import 'package:flume/material.dart';
import 'package:flume_example/widgets/category_card.dart';
import 'package:flume_example/widgets/card_grid.dart';
import 'package:flume_example/widgets/layout.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AmbiancePage extends StatelessWidget {
  const AmbiancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      builder: (context, ambiance) {
        return CardGrid(
          children: [
            const CategoryCard(
              title: 'Algorithm',
              banner: AlgorithmBanner(),
              subtitle: 'Color palettes are generated on the fly',
            ),
            const CategoryCard(
              title: 'Elevation',
              banner: ElevationBanner(),
              subtitle:
                  'Brings depth to your UI by leveraging contrast and color',
            ),
            const CategoryCard(
              title: 'Dynamic schemes',
              banner: DynamicSchemesBanner(),
              subtitle: 'Seamlessly switch between color palettes',
            ),
            if (kIsWeb || Platform.isAndroid || Platform.isIOS) ...{
              const CategoryCard(
                title: 'Try it out',
                banner: PhoneBanner(),
                subtitle: 'Shake your device to change the color scheme',
              ),
            }
          ],
        );
      },
    );
  }
}

class PhoneBanner extends StatefulWidget {
  const PhoneBanner({
    super.key,
  });

  @override
  State<PhoneBanner> createState() => _PhoneBannerState();
}

class _PhoneBannerState extends State<PhoneBanner>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _angle;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);

    _angle = Tween<double>(
      begin: 0,
      end: math.pi / 14,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOutCubic,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RotationTransition(
        turns: _angle,
        child: Icon(
          FlumeIcons.hardware_mobile,
          size: 56,
          color: context.ambiance.palette.light,
        ),
      ),
    );
  }
}

class DynamicSchemesBanner extends StatefulWidget {
  const DynamicSchemesBanner({
    super.key,
  });

  @override
  State<DynamicSchemesBanner> createState() => _DynamicSchemesBannerState();
}

class _DynamicSchemesBannerState extends State<DynamicSchemesBanner>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> _opacity;
  late Animation<double> _translate;

  final _duration = const Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: _duration,
    )..forward();

    _opacity = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _translate = Tween<double>(
      begin: 48,
      end: 0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return AnimatedBuilder(
          animation: _controller,
          builder: (context, _) {
            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Transform.translate(
                  offset: Offset(0, _translate.value),
                  child: Opacity(
                    opacity: _opacity.value,
                    child: Container(
                      height: constraints.maxHeight * 0.9,
                      width: constraints.maxWidth * 0.5,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: context.ambiance.color,
                        boxShadow: [context.theme.shadows.md],
                        border: Border.all(
                          color: context.theme.colors.highlight10,
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                            context.theme.shapes.lg,
                          ),
                          topRight: Radius.circular(
                            context.theme.shapes.lg,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(0, _translate.value),
                  child: Opacity(
                    opacity: _opacity.value,
                    child: ConstraintsTransformBox(
                      clipBehavior: Clip.antiAlias,
                      constraintsTransform:
                          ConstraintsTransformBox.maxHeightUnconstrained,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 56),
                        child: Transform.scale(
                          scale: 0.45,
                          child: DatePicker(
                            date: DateTime(2023, 5, 1),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

class ElevationBanner extends StatelessWidget {
  const ElevationBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Transform.rotate(
        angle: 0.2,
        child: Transform.scale(
          scale: 1.5,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: AnimationConfiguration.toStaggeredList(
              duration: const Duration(milliseconds: 500),
              childAnimationBuilder: (widget) {
                return SlideAnimation(
                  verticalOffset: 48,
                  child: FadeInAnimation(
                    child: widget,
                  ),
                );
              },
              children: const [
                AmbianceBox(elevation: 0),
                AmbianceBox(elevation: 1),
                AmbianceBox(elevation: 2),
                AmbianceBox(elevation: 3),
                AmbianceBox(elevation: 4),
              ].map((b) {
                return SizedBox(
                  height: constraints.maxHeight,
                  width: constraints.maxWidth / 5,
                  child: b,
                );
              }).toList(growable: false),
            ),
          ),
        ),
      );
    });
  }
}

class AmbianceBox extends StatelessWidget {
  final int elevation;

  const AmbianceBox({
    super.key,
    required this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return Ambiance(
      elevation: elevation,
      builder: (context, ambiance) {
        return Container(
          decoration: BoxDecoration(
            color: ambiance.color,
            boxShadow: [context.theme.shadows.md],
          ),
        );
      },
    );
  }
}

class AlgorithmBanner extends StatefulWidget {
  const AlgorithmBanner({
    super.key,
  });

  @override
  State<AlgorithmBanner> createState() => _AlgorithmBannerState();
}

class _AlgorithmBannerState extends State<AlgorithmBanner>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> _opacity;
  late Animation<double> _translate;

  final _duration = const Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: _duration,
    )..forward();

    _opacity = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _translate = Tween<double>(
      begin: 48,
      end: 102,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ColorLoop(
      begin: context.ambiance.palette.dark,
      end: context.ambiance.palette.light,
      duration: const Duration(seconds: 10),
      child: AnimatedBuilder(
          animation: _controller,
          builder: (context, _) {
            return Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    right: _translate.value,
                    child: Opacity(
                      opacity: _opacity.value,
                      child: Spin(
                        duration: const Duration(seconds: 50),
                        direction: Direction.counterClockwise,
                        child: Icon(
                          FlumeIcons.settings,
                          size: 128,
                          color:
                              context.ambiance.palette.light.withOpacity(0.5),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: _translate.value,
                    child: Opacity(
                      opacity: _opacity.value,
                      child: Spin(
                        duration: const Duration(seconds: 50),
                        child: Icon(
                          FlumeIcons.settings_filled,
                          size: 128,
                          color: context.ambiance.palette.light.withOpacity(1),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

enum Direction {
  clockwise,
  counterClockwise,
}

class Spin extends StatefulWidget {
  const Spin({
    super.key,
    required this.child,
    this.direction = Direction.clockwise,
    this.delay,
    required this.duration,
  });

  final Widget child;
  final Direction direction;
  final Duration? delay;
  final Duration duration;

  @override
  State<Spin> createState() => SpinState();
}

class SpinState extends State<Spin> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    if (widget.delay != null) {
      Future.delayed(widget.delay!, () {
        _controller.repeat();
      });
    } else {
      _controller.repeat();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, child) {
        return Transform.rotate(
          angle: (widget.direction == Direction.clockwise ? 1 : -1) *
              _controller.value *
              2 *
              math.pi,
          child: child,
        );
      },
      child: widget.child,
    );
  }
}

class ColorLoop extends StatefulWidget {
  const ColorLoop({
    super.key,
    required this.child,
    required this.begin,
    required this.end,
    required this.duration,
  });

  final Widget child;
  final Color begin;
  final Color end;
  final Duration duration;

  @override
  State<ColorLoop> createState() => _ColorLoopState();
}

class _ColorLoopState extends State<ColorLoop>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      })
      ..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        return Container(
          color: ColorTween(
            begin: widget.begin,
            end: widget.end,
          ).evaluate(_controller),
          child: widget.child,
        );
      },
    );
  }
}

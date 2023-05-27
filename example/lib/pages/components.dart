import 'package:flume/flume.dart';
import 'package:flume/material.dart';
import 'package:flume_example/widgets/category_card.dart';
import 'package:flume_example/widgets/card_grid.dart';
import 'package:flume_example/widgets/layout.dart';
import 'package:flume_example/widgets/tier.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ComponentsPage extends StatelessWidget {
  const ComponentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      builder: (context, ambiance) {
        return const CardGrid(
          children: [
            CategoryCard(
              title: 'Buttons',
              path: '/components/buttons',
              banner: ButtonsBanner(),
              subtitle: 'All different variations of buttons',
            ),
            CategoryCard(
              title: 'Input',
              path: '/components/input',
              banner: InputBanner(),
              subtitle: 'User input components for forms',
            ),
            CategoryCard(
              title: 'Controls',
              path: '/components/controls',
              banner: ControlsBanner(),
              subtitle: 'Controls used to e.g. navigate or select',
            ),
            CategoryCard(
              title: 'Icons',
              path: '/components/icons',
              banner: IconsBanner(),
              subtitle: 'All Flume icons',
            ),
            CategoryCard(
              title: 'Layout',
              path: '/components/layout',
              banner: LayoutBanner(),
              subtitle: 'Layout widgets for building your UI',
            ),
          ],
        );
      },
    );
  }
}

class LayoutBanner extends StatelessWidget {
  const LayoutBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Ambiance(
      child: Transform.scale(
        scale: 2,
        child: Transform.rotate(
          angle: 0.45,
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: FlumeIcons.all.keys.length,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 128,
              mainAxisExtent: 64,
              crossAxisSpacing: context.theme.spacing.xxs,
              mainAxisSpacing: context.theme.spacing.xxs,
            ),
            itemBuilder: (context, i) {
              return AnimationConfiguration.staggeredGrid(
                duration: const Duration(milliseconds: 500),
                position: i,
                columnCount: FlumeIcons.all.keys.length ~/ 3,
                child: ScaleAnimation(
                  child: FadeInAnimation(
                    child: Container(
                      decoration: BoxDecoration(
                        color: context.ambiance.lighter(),
                        borderRadius: BorderRadius.circular(
                          context.theme.shapes.xs,
                        ),
                        border: Border.all(
                          color: context.theme.colors.highlight10,
                          width: 0.5,
                        ),
                        boxShadow: [context.theme.shadows.sm],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class IconsBanner extends StatelessWidget {
  const IconsBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Transform.rotate(
        angle: 0.45,
        child: Transform.scale(
          scale: 2,
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: FlumeIcons.all.keys.length,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 31,
              mainAxisExtent: 31,
              crossAxisSpacing: context.theme.spacing.xxxs,
              mainAxisSpacing: context.theme.spacing.xxxs,
            ),
            itemBuilder: (context, i) {
              return AnimationConfiguration.staggeredGrid(
                duration: context.theme.motion.medium,
                position: i,
                columnCount: FlumeIcons.all.keys.length ~/ 5,
                child: ScaleAnimation(
                  child: FadeInAnimation(
                    child: Icon(
                      FlumeIcons.all.values.toList().reversed.toList()[i],
                      size: 12,
                      color: context.ambiance.palette.light,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class ControlsBanner extends StatefulWidget {
  const ControlsBanner({super.key});

  @override
  State<ControlsBanner> createState() => _ControlsBannerState();
}

class _ControlsBannerState extends State<ControlsBanner>
    with TickerProviderStateMixin {
  late AnimationController _entryController;
  late AnimationController _stepController;

  late Animation<double> _entryFade;

  late Animation<int> _stepAnimation;

  @override
  void initState() {
    super.initState();
    _entryController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..forward();

    _stepController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..forward();

    _entryFade = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _entryController,
        curve: Curves.easeOut,
      ),
    );

    _stepAnimation = IntTween(
      begin: 0,
      end: 5,
    ).animate(
      CurvedAnimation(
        parent: _stepController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _entryController.dispose();
    _stepController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Ambiance(
      child: AnimatedBuilder(
        animation: _stepAnimation,
        builder: (context, _) {
          return FadeTransition(
            opacity: _entryFade,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: AnimationConfiguration.toStaggeredList(
                duration: const Duration(milliseconds: 500),
                childAnimationBuilder: (widget) {
                  return SlideAnimation(
                    duration: context.theme.motion.medium,
                    verticalOffset: 50,
                    child: FadeInAnimation(
                      child: widget,
                    ),
                  );
                },
                children: List.generate(
                  3,
                  (i) => DecoratedBox(
                    decoration: BoxDecoration(
                      boxShadow: [context.theme.shadows.md],
                    ),
                    child: TabButton(
                      selected: _stepAnimation.value >= i,
                      child: Tier(
                        stars: i,
                      ),
                    ),
                  ),
                ).spaced(context.theme.spacing.md),
              ),
            ),
          );
        },
      ),
    );
  }
}

class InputBanner extends StatefulWidget {
  const InputBanner({super.key});

  @override
  State<InputBanner> createState() => _InputBannerState();
}

class _InputBannerState extends State<InputBanner>
    with TickerProviderStateMixin {
  late AnimationController _entryController;
  late AnimationController _typewriterController;

  late Animation<Offset> _entrySlide;
  late Animation<double> _entryFade;

  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _entryController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..forward();

    _typewriterController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();

    _entrySlide = Tween<Offset>(
      begin: const Offset(0, 1),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _entryController,
        curve: Curves.easeOut,
      ),
    );

    _entryFade = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _entryController,
        curve: Curves.easeOut,
      ),
    );

    _textController = TextEditingController();
  }

  @override
  void dispose() {
    _entryController.dispose();
    _typewriterController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Ambiance(
      child: Padding(
        padding: EdgeInsets.all(context.theme.spacing.md),
        child: SlideTransition(
          position: _entrySlide,
          child: FadeTransition(
            opacity: _entryFade,
            child: AnimatedBuilder(
              animation: _typewriterController,
              builder: (context, _) {
                const text = 'Searching for golden nuggets...';
                _textController.text = text.substring(
                  0,
                  (_typewriterController.value * text.length).toInt(),
                );

                return SearchBar(
                  controller: _textController,
                  cancelText: 'Cancel',
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class ButtonsBanner extends StatelessWidget {
  const ButtonsBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Ambiance(
      child: Transform.scale(
        scale: 2,
        child: Transform.rotate(
          angle: 0.45,
          child: GridView(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 96,
              mainAxisExtent: 56,
              crossAxisSpacing: 0,
            ),
            children: AnimationConfiguration.toStaggeredList(
              duration: const Duration(milliseconds: 500),
              childAnimationBuilder: (widget) {
                return SlideAnimation(
                  child: FadeInAnimation(
                    child: widget,
                  ),
                );
              },
              children: [
                ...ButtonVariant.values.expand((variant) {
                  return ButtonState.values.expand((state) {
                    return [
                      Button(
                        size: ButtonSize.medium,
                        variant: variant,
                        state: state != ButtonState.loading ? state : null,
                        child: const Text('💅'),
                        onPressed: () {},
                      ),
                    ];
                  });
                }).toList()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

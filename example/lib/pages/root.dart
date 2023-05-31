// ignore_for_file: prefer_const_constructors

import 'package:flume/flume.dart';
import 'package:flume/material.dart';
import 'package:flume_example/pages/foundation.dart';
import 'package:flume_example/widgets/category_card.dart';
import 'package:flume_example/widgets/card_grid.dart';
import 'package:flume_example/widgets/layout.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class RootPage extends StatelessWidget {
  const RootPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Layout(
      builder: (context, ambiance) {
        return CardGrid(
          children: const [
            CategoryCard(
              title: 'Ambiance',
              subtitle: 'See how Flume\'s dynamic color system works',
              path: '/ambiance',
              banner: AmbianceBanner(),
            ),
            CategoryCard(
              title: 'Components',
              subtitle: 'All the UI components you need to build an app',
              path: '/components',
              banner: ComponentsBanner(),
            ),
            CategoryCard(
              title: 'Foundation',
              subtitle: 'All of Flume\'s design tokens',
              path: '/foundation',
              banner: FoundationBanner(),
            ),
            CategoryCard(
              title: 'Licenses',
              subtitle: 'See the licenses for all of Flume\'s dependencies',
              path: '/licenses',
              banner: LicensesBanner(),
            ),
          ],
        );
      },
    );
  }
}

class LicensesBanner extends StatefulWidget {
  const LicensesBanner({
    super.key,
  });

  @override
  State<LicensesBanner> createState() => _LicensesBannerState();
}

class _LicensesBannerState extends State<LicensesBanner>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> _opacity;
  late Animation<double> _translate;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 500,
      ),
    );

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
        curve: Curves.easeInOut,
      ),
    );

    _controller
      ..forward()
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            right: _translate.value,
            child: Opacity(
              opacity: _opacity.value,
              child: Container(
                width: 128,
                height: 128,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.ambiance.palette.light.withOpacity(0.5),
                  border: Border.all(
                    color: context.ambiance.palette.light,
                    width: 0.5,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: _translate.value,
            child: Opacity(
              opacity: _opacity.value,
              child: Container(
                width: 128,
                height: 128,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.ambiance.palette.mediumLight.withOpacity(0.5),
                  border: Border.all(
                    color: context.ambiance.palette.light,
                    width: 0.5,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ComponentsBanner extends StatelessWidget {
  const ComponentsBanner({
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
                      FlumeIcons.all.values.toList()[i],
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

class AmbianceBanner extends StatelessWidget {
  const AmbianceBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: AnimationConfiguration.toStaggeredList(
        duration: const Duration(milliseconds: 500),
        childAnimationBuilder: (child) {
          return Flexible(
            child: SlideAnimation(
              horizontalOffset: 50,
              child: FadeInAnimation(
                child: child,
              ),
            ),
          );
        },
        children: List.generate(5, (index) {
          final color = context.ambiance.palette.colors[index];

          return Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(
                context.theme.shapes.sm,
              ),
              border: Border.all(
                color: context.theme.colors.highlight10,
              ),
            ),
          );
        }).spaced(context.theme.spacing.md),
      ),
    );
  }
}

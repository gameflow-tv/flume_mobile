import 'package:flume_example/pages/ambiance.dart';
import 'package:flume_example/pages/foundation.dart';
import 'package:flume_example/pages/foundation/breakpoints.dart';
import 'package:flume_example/pages/foundation/colors.dart';
import 'package:flume_example/pages/foundation/motion.dart';
import 'package:flume_example/pages/foundation/shadows.dart';
import 'package:flume_example/pages/foundation/shapes.dart';
import 'package:flume_example/pages/foundation/typography.dart';

import 'package:flutter/material.dart';
import 'package:flume/flume.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(const FlumeExample());
}

class FlumeExample extends StatelessWidget {
  const FlumeExample({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Flume(
      theme: FlumeTheme.fallback(),
      builder: (context, theme) {
        final spacing = Flume.of(context).spacing;

        return MaterialApp(
          title: 'Flume',
          theme: theme,
          routes: {
            '/ambiance': (context) => const AmbiancePage(),
            '/foundation': (context) => const FoundationPage(),
            '/foundation/breakpoints': (context) => const BreakpointsPage(),
            '/foundation/colors': (context) => const ColorsPage(),
            '/foundation/motion': (context) => const MotionPage(),
            '/foundation/shadows': (context) => const ShadowsPage(),
            '/foundation/shapes': (context) => const ShapesPage(),
            '/foundation/typography': (context) => const TypographyPage(),
          },
          home: Ambiance(
            builder: (context, ambiance) {
              final theme = Flume.of(context);
              return Scaffold(
                backgroundColor: ambiance.color,
                appBar: TopBar(
                  leading: Padding(
                    padding: EdgeInsets.all(spacing.sm),
                    child: SvgPicture.asset(
                      'assets/icon/flume.svg',
                      color: theme.colors.primary,
                    ),
                  ),
                  title: const Text('Flume'),
                ),
                body: ListView(
                  children: [
                    Cell(
                      title: const Text('Ambiance'),
                      onTap: () => Navigator.pushNamed(context, '/ambiance'),
                    ),
                    Cell(
                      title: const Text('Foundation'),
                      onTap: () => Navigator.pushNamed(context, '/foundation'),
                    ),
                    Cell(
                      title: const Text('Components'),
                      onTap: () => Navigator.pushNamed(context, '/ambiance'),
                    ),
                  ]
                      .map(
                        (e) => Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: theme.spacing.xs,
                            vertical: theme.spacing.xxs,
                          ),
                          child: e,
                        ),
                      )
                      .toList(),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

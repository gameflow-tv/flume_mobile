import 'package:flume_example/pages/ambiance.dart';
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
          },
          home: Ambiance(
            builder: (context, color, elevation) {
              return Scaffold(
                backgroundColor: color,
                appBar: TopBar(
                  leading: Padding(
                    padding: EdgeInsets.all(spacing.sm),
                    child: SvgPicture.asset(
                      'assets/icon/flume.svg',
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  title: const Text('Flume'),
                ),
                body: Builder(
                  builder: (context) {
                    final theme = Flume.of(context);

                    return ListView(
                      children: [
                        Cell(
                          title: const Text('Ambiance'),
                          onTap: () =>
                              Navigator.pushNamed(context, '/ambiance'),
                        ),
                        Cell(
                          title: const Text('Foundation'),
                          onTap: () =>
                              Navigator.pushNamed(context, '/ambiance'),
                        ),
                        Cell(
                          title: const Text('Components'),
                          onTap: () =>
                              Navigator.pushNamed(context, '/ambiance'),
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
                    );
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}

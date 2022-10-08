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
          home: Scaffold(
            appBar: AppBar(
              leading: Padding(
                padding: EdgeInsets.all(spacing.sm),
                child: SvgPicture.asset(
                  'assets/icon/flume.svg',
                  color: theme.colorScheme.primary,
                ),
              ),
              title: const Text('Flume'),
            ),
            body: ListView(),
          ),
        );
      },
    );
  }
}

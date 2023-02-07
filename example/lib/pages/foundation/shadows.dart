import 'package:flume/flume.dart';
import 'package:flume_example/widgets/blueprint.dart';
import 'package:flutter/material.dart';

extension PrettyShadow on BoxShadow {
  String get pretty =>
      'color: ${color.toRGB().toHex()}, offset: (x: ${offset.dx}, y: ${offset.dy}), blurRadius: $blurRadius';
}

class ShadowsPage extends StatelessWidget {
  const ShadowsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shadows = context.theme.shadows;

    return Ambiance(
      builder: (context, ambiance) {
        return Scaffold(
          appBar: TopBar(
            title: const Text('Shadows'),
          ),
          backgroundColor: ambiance.color,
          body: Blueprint(
            child: Ambiance(
              child: SafeArea(
                bottom: false,
                child: GridView(
                  padding: EdgeInsets.all(context.theme.spacing.md),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: context.theme.spacing.md,
                    crossAxisSpacing: context.theme.spacing.md,
                  ),
                  children: [
                    _ShadowBox(
                      shadow: shadows.xs,
                      child: const Text('xs'),
                    ),
                    _ShadowBox(
                      shadow: shadows.sm,
                      child: const Text('sm'),
                    ),
                    _ShadowBox(
                      shadow: shadows.md,
                      child: const Text('md'),
                    ),
                    _ShadowBox(
                      shadow: shadows.lg,
                      child: const Text('lg'),
                    ),
                    _ShadowBox(
                      shadow: shadows.text,
                      child: Text(
                        'text',
                        style: TextStyle(
                          shadows: [shadows.text],
                        ),
                      ),
                    ),
                    _ShadowBox(
                      shadow: shadows.focus,
                      child: const Text('focus'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ShadowBox extends StatelessWidget {
  const _ShadowBox({
    required this.shadow,
    required this.child,
  });

  final BoxShadow shadow;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.theme.spacing.md),
      decoration: BoxDecoration(
        color: context.ambiance.color,
        borderRadius: BorderRadius.circular(context.theme.shapes.sm),
        boxShadow: [shadow],
      ),
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: child,
            ),
          ),
          Text(
            shadow.pretty,
            textAlign: TextAlign.center,
            style: context.theme.typography.body3,
          ),
        ],
      ),
    );
  }
}

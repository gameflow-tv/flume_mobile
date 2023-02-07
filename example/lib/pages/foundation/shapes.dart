import 'package:flume/flume.dart';
import 'package:flume_example/widgets/blueprint.dart';
import 'package:flutter/material.dart';

class ShapesPage extends StatelessWidget {
  const ShapesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Flume.of(context);
    final shapes = theme.shapes;

    return Ambiance(
      builder: (context, ambiance) {
        return Scaffold(
          appBar: TopBar(
            title: const Text('Shapes'),
          ),
          backgroundColor: ambiance.color,
          body: Blueprint(
            child: SafeArea(
              bottom: false,
              child: GridView(
                padding: EdgeInsets.all(context.theme.spacing.md),
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: context.theme.spacing.md,
                  mainAxisSpacing: context.theme.spacing.md,
                ),
                children: [
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(shapes.xs),
                      color: ambiance.at(1),
                    ),
                    child: Center(
                      child: Text(
                        'xs',
                        style: TextStyle(
                          color: ambiance.at(5),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(shapes.sm),
                      color: ambiance.at(1),
                    ),
                    child: Center(
                      child: Text(
                        'sm',
                        style: TextStyle(
                          color: ambiance.at(5),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(shapes.md),
                      color: ambiance.at(1),
                    ),
                    child: Center(
                      child: Text(
                        'md',
                        style: TextStyle(
                          color: ambiance.at(5),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(shapes.lg),
                      color: ambiance.at(1),
                    ),
                    child: Center(
                      child: Text(
                        'lg',
                        style: TextStyle(
                          color: ambiance.at(5),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

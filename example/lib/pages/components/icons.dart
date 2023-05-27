import 'package:flume/flume.dart';
import 'package:flume/material.dart';
import 'package:flume_example/widgets/layout.dart';
import 'package:flume_example/widgets/top_bar.dart';

class IconsPage extends StatelessWidget {
  const IconsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      builder: (context, ambiance) {
        return GridView(
          padding: EdgeInsets.all(
            context.theme.spacing.md,
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: context.theme.spacing.xs,
            crossAxisSpacing: context.theme.spacing.xs,
          ),
          children: FlumeIcons.all
              .map<String, Widget>(
                (key, value) {
                  return MapEntry(
                    key,
                    Ambiance(builder: (context, ambiance) {
                      return Container(
                        height: 100,
                        decoration: BoxDecoration(
                          color: ambiance.color,
                          borderRadius: BorderRadius.circular(
                            context.theme.shapes.xs,
                          ),
                          border: Border.all(
                            color: context.theme.colors.highlight10,
                            width: 0.5,
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            value,
                            color: ambiance.palette.light,
                            size: 24,
                          ),
                        ),
                      );
                    }),
                  );
                },
              )
              .values
              .toList(),
        );
      },
    );
  }
}

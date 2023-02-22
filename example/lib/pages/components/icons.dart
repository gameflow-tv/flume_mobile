import 'package:flume/flume.dart';
import 'package:flume/material.dart';

class IconsPage extends StatelessWidget {
  const IconsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Ambiance(
      builder: (context, ambiance) {
        return Scaffold(
          backgroundColor: ambiance.color,
          appBar: TopBar(
            title: const Text('Icons'),
          ),
          body: GridView(
            padding: EdgeInsets.all(
              context.theme.spacing.md,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 8,
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
          ),
        );
      },
    );
  }
}

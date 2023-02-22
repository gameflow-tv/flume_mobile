import 'package:flume/flume.dart';
import 'package:flume/material.dart';

class ColorsPage extends StatelessWidget {
  const ColorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Flume.of(context);

    return Ambiance(
      builder: (context, ambiance) {
        return Scaffold(
          appBar: TopBar(
            title: const Text('Colors'),
          ),
          backgroundColor: ambiance.color,
          body: SafeArea(
            bottom: false,
            child: GridView(
              scrollDirection: Axis.vertical,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              children: theme.colors.all.keys.map((name) {
                final color = theme.colors.all[name];

                if (color == null) {
                  return Container();
                }

                return Ambiance(
                    color: color,
                    builder: (context, ambiance) {
                      return Container(
                        height: 100,
                        color: color,
                        child: Center(
                          child: Text(
                            name,
                            style: TextStyle(
                              color: color.computeLuminance() > 0.5
                                  ? ambiance.at(0)
                                  : ambiance.at(5),
                            ),
                          ),
                        ),
                      );
                    });
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}

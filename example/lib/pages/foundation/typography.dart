import 'package:flume/flume.dart';
import 'package:flume_example/widgets/blueprint.dart';
import 'package:flume/material.dart';
import 'package:flume_example/widgets/top_bar.dart';

class TypographyPage extends StatelessWidget {
  const TypographyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Flume.of(context);
    final typography = theme.typography;

    return Ambiance(
      builder: (context, ambiance) {
        return Scaffold(
          appBar: TopBar(
            title: const Text('Typography'),
          ),
          backgroundColor: ambiance.color,
          body: Blueprint(
            child: SizedBox(
              height: double.infinity,
              child: ScrollableList.static(
                padding: EdgeInsets.all(
                  context.theme.spacing.md,
                ),
                divided: false,
                children: [
                  Text(
                    'header1',
                    style: typography.header1,
                  ),
                  Text(
                    'header2',
                    style: typography.header2,
                  ),
                  Text(
                    'header3',
                    style: typography.header3,
                  ),
                  Text(
                    'header4',
                    style: typography.header4,
                  ),
                  Text(
                    'header5',
                    style: typography.header5,
                  ),
                  Text(
                    'body1',
                    style: typography.body1,
                  ),
                  Text(
                    'body2',
                    style: typography.body2,
                  ),
                  Text(
                    'body3',
                    style: typography.body3,
                  ),
                  Text(
                    'button',
                    style: typography.button,
                  ),
                  Text(
                    'link',
                    style: typography.link,
                  ),
                  Text(
                    'label1',
                    style: typography.label1,
                  ),
                  Text(
                    'label2',
                    style: typography.label2,
                  ),
                  Text(
                    'label3',
                    style: typography.label3,
                  ),
                ].spaced(context.theme.spacing.md),
              ),
            ),
          ),
        );
      },
    );
  }
}

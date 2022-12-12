import 'package:flume/flume.dart';
import 'package:flutter/material.dart';

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
          body: Center(
            child: Column(
              children: [
                Text(
                  'header1',
                  style: typography.header1.toTextStyle(),
                ),
                Text(
                  'header2',
                  style: typography.header2.toTextStyle(),
                ),
                Text(
                  'header3',
                  style: typography.header3.toTextStyle(),
                ),
                Text(
                  'header4',
                  style: typography.header4.toTextStyle(),
                ),
                Text(
                  'header5',
                  style: typography.header5.toTextStyle(),
                ),
                Text(
                  'body1',
                  style: typography.body1.toTextStyle(),
                ),
                Text(
                  'body2',
                  style: typography.body2.toTextStyle(),
                ),
                Text(
                  'body3',
                  style: typography.body3.toTextStyle(),
                ),
                Text(
                  'button',
                  style: typography.button.toTextStyle(),
                ),
                Text(
                  'link',
                  style: typography.link.toTextStyle(),
                ),
                Text(
                  'label1',
                  style: typography.label1.toTextStyle(),
                ),
                Text(
                  'label2',
                  style: typography.label2.toTextStyle(),
                ),
                Text(
                  'label3',
                  style: typography.label3.toTextStyle(),
                ),
              ]
                  .map(
                    (e) => Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: theme.spacing.xs,
                        vertical: theme.spacing.xs,
                      ),
                      child: e,
                    ),
                  )
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}

import 'package:flume/flume.dart';
import 'package:flume/material.dart';
import 'package:flume_example/widgets/card_grid.dart';
import 'package:flume_example/widgets/component_card.dart';
import 'package:flume_example/widgets/layout.dart';

class TypographyPage extends StatelessWidget {
  const TypographyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Flume.of(context);
    final typography = theme.typography;

    return Layout(
      builder: (context, ambiance) {
        return CardGrid(
          children: typography.toMap().entries.map((entry) {
            final style = entry.value.copyWith(
              color: entry.key.startsWith('header')
                  ? context.theme.colors.header
                  : entry.key.startsWith('body')
                      ? context.theme.colors.body
                      : context.theme.colors.subtitle,
            );

            return ComponentCard(
              title: entry.key,
              banner: Text(
                'The quick brown fox jumps over the lazy dog',
                textAlign: TextAlign.center,
                overflow: TextOverflow.visible,
                style: style,
              ),
              subtitle: style.toPrettyString(),
            );
          }).toList(),
        );
      },
    );
  }
}

extension PrettyPrint on TextStyle {
  String toPrettyString() {
    final buffer = StringBuffer();
    buffer.write(
      'size: ${fontSize}px, ',
    );
    buffer.write(
      'weight: ${fontWeight.toString().split('w').last}, ',
    );
    buffer.write(
      'family: ${fontFamily.toString().split('/').last}, ',
    );
    buffer.write(
      'color: #${color.toString().split('Color(0x').last.split(')').first}',
    );
    return buffer.toString();
  }
}

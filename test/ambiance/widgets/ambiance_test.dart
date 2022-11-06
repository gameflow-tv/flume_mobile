import 'package:flume/flume.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('getColorFromElevation() should return a color based on the elevation',
      () {
    final dark = getColorFromElevation(const Color(0xff242729), 0);
    final mediumDark = getColorFromElevation(const Color(0xff242729), 1);
    final medium = getColorFromElevation(const Color(0xff242729), 2);
    final mediumLight = getColorFromElevation(const Color(0xff242729), 3);
    final light = getColorFromElevation(const Color(0xff242729), 4);

    expect(dark, const Color(0xff242729));
    expect(mediumDark, const Color(0xff34383b));
    expect(medium, const Color(0xff41464a));
    expect(mediumLight, const Color(0xff4f555a));
    expect(light, const Color(0xffcfd7dd));
  });

  testWidgets('Ambiance generates correct color values', (tester) async {
    final List<BuildContext> contexts = [];

    await tester.pumpWidget(
      Flume(
        theme: FlumeTheme.fallback(),
        child: Ambiance(
          color: const Color(0xff242729),
          builder: (context, _, __) {
            contexts.add(context);
            return Ambiance(
              builder: (context, _, __) {
                contexts.add(context);
                return Ambiance(
                  builder: (context, _, __) {
                    contexts.add(context);
                    return Ambiance(
                      builder: (context, _, __) {
                        contexts.add(context);
                        return Ambiance(
                          builder: (context, _, __) {
                            contexts.add(context);
                            return Ambiance(
                              child: Container(),
                            );
                          },
                        );
                      },
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );

    final List<Color?> colors = contexts
        .map((context) => Ambiance.of(context)?.color)
        .toList(growable: false);

    for (var i = 0; i <= colors.length - 1; i++) {
      final color = colors[i];

      switch (i) {
        case 0:
          expect(color, const Color(0xff242729));
          break;
        case 1:
          expect(color, const Color(0xff34383b));
          break;
        case 2:
          expect(color, const Color(0xff41464a));
          break;
        case 3:
          expect(color, const Color(0xff4f555a));
          break;
        case 4:
          expect(color, const Color(0xffcfd7dd));
          break;
      }
    }
  });
}

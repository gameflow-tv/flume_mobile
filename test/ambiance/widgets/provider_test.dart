import 'package:flume/flume.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('AmbianceProvider exposes given values', (tester) async {
    await tester.pumpWidget(AmbianceProvider(
      state: AmbianceState(
        palette: getPaletteFromColor(const Color(0xff00ff00)),
        source: const Color(0xff00ff00),
        color: const Color(0xff00ff00),
        elevation: 0,
        up: () => const Color(0xff00ff00),
        down: () => const Color(0xff00ff00),
        at: (p0) => const Color(0xff00ff00),
      ),
      child: Container(),
    ));

    final finder = find.byType(AmbianceProvider);

    finder.evaluate().forEach((element) {
      final provider = element.widget as AmbianceProvider;
      expect(provider.state.color, const Color(0xff00ff00));
      expect(provider.state.elevation, 0);
    });
  });
}

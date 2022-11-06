import 'package:flume/flume.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('AmbianceProvider exposes given values', (tester) async {
    await tester.pumpWidget(AmbianceProvider(
      source: const Color(0xff00ff00),
      color: const Color(0xff00ff00),
      elevation: 0,
      child: Container(),
    ));

    final finder = find.byType(AmbianceProvider);

    finder.evaluate().forEach((element) {
      final provider = element.widget as AmbianceProvider;
      expect(provider.color, const Color(0xff00ff00));
      expect(provider.elevation, 0);
    });
  });
}

import 'package:flume/flume.dart';
import 'package:test/test.dart';

void main() {
  test('Theme.fallback() is not null (smoke test)', () {
    var theme = Theme.fallback();
    expect(theme, isNotNull);
  });

  test('Theme.fallback() is a Theme (smoke test)', () {
    var theme = Theme.fallback();
    expect(theme, isA<Theme>());
  });
}

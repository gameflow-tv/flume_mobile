import 'dart:ui';

import 'package:flume/flume.dart';
import 'package:test/test.dart';

void main() {
  test('mean returns the mean average color from an image', () async {
    // Draw a 10x10 image with a single red pixel in the center
    final recorder = PictureRecorder();
    final canvas = Canvas(recorder);
    canvas.drawRect(const Rect.fromLTWH(0, 0, 10, 10),
        Paint()..color = const Color(0xff0000ff));
    final picture = recorder.endRecording();
    final img = await picture.toImage(10, 10);
    final color = await mean(img);
    expect(color, const Color(0xff0000ff));
  });

  test('mean ignores very light values', () async {
    // Draw a 10x10 image with a white background and a single blue pixel in the
    // center

    final recorder = PictureRecorder();
    final canvas = Canvas(recorder);
    canvas.drawRect(const Rect.fromLTWH(0, 0, 10, 10),
        Paint()..color = const Color(0xffffffff));

    canvas.drawRect(const Rect.fromLTWH(4, 4, 2, 2),
        Paint()..color = const Color(0xff0000ff));
    final picture = recorder.endRecording();
    final img = await picture.toImage(10, 10);
    final color = await mean(img);
    expect(color, const Color(0xff0000ff));
  });

  test('mean ignores very dark values', () async {
    // Draw a 10x10 image with a black background and a single blue pixel in the
    // center

    final recorder = PictureRecorder();
    final canvas = Canvas(recorder);
    canvas.drawRect(const Rect.fromLTWH(0, 0, 10, 10),
        Paint()..color = const Color(0xff000000));

    canvas.drawRect(const Rect.fromLTWH(4, 4, 2, 2),
        Paint()..color = const Color(0xff0000ff));
    final picture = recorder.endRecording();
    final img = await picture.toImage(10, 10);
    final color = await mean(img);
    expect(color, const Color(0xff0000ff));
  });

  test('mean mixes colors as expected', () async {
    // Draw a 10x0 image with half blue, half red
    final recorder = PictureRecorder();
    final canvas = Canvas(recorder);
    canvas.drawRect(const Rect.fromLTWH(0, 0, 10, 10),
        Paint()..color = const Color(0xff0000ff));
    canvas.drawRect(const Rect.fromLTWH(5, 0, 10, 10),
        Paint()..color = const Color(0xffff0000));
    final picture = recorder.endRecording();
    final img = await picture.toImage(10, 10);
    final color = await mean(img);
    expect(color, const Color(0xff800080));
  });

  test('modal returns the mode average color from an image', () async {
    // Draw a 10x10 image with 51% blue and 49% red
    final recorder = PictureRecorder();
    final canvas = Canvas(recorder);
    canvas.drawRect(const Rect.fromLTWH(0, 0, 10, 10),
        Paint()..color = const Color(0xff0000ff));

    canvas.drawRect(const Rect.fromLTWH(0, 0, 4.9, 4.9),
        Paint()..color = const Color(0xffff0000));

    final picture = recorder.endRecording();
    final img = await picture.toImage(10, 10);
    final color = await modal(img);
    expect(color, const Color(0xff0000ff));
  });

  test('modal ignores very light values', () async {
    // Draw a 10x10 image with a white background and a single blue pixel in the
    // center

    final recorder = PictureRecorder();
    final canvas = Canvas(recorder);
    canvas.drawRect(const Rect.fromLTWH(0, 0, 10, 10),
        Paint()..color = const Color(0xffffffff));

    canvas.drawRect(const Rect.fromLTWH(4, 4, 2, 2),
        Paint()..color = const Color(0xff0000ff));
    final picture = recorder.endRecording();
    final img = await picture.toImage(10, 10);
    final color = await modal(img);
    expect(color, const Color(0xff0000ff));
  });

  test('modal ignores very dark values', () async {
    // Draw a 10x10 image with a black background and a single blue pixel in the
    // center

    final recorder = PictureRecorder();
    final canvas = Canvas(recorder);
    canvas.drawRect(const Rect.fromLTWH(0, 0, 10, 10),
        Paint()..color = const Color(0xff000000));

    canvas.drawRect(const Rect.fromLTWH(4, 4, 2, 2),
        Paint()..color = const Color(0xff0000ff));
    final picture = recorder.endRecording();
    final img = await picture.toImage(10, 10);
    final color = await modal(img);
    expect(color, const Color(0xff0000ff));
  });
}

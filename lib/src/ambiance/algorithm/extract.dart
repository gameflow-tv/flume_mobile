import 'dart:isolate';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';

/// Returns the mean average color from an image (average of all colors).
/// If [squared] is true, the mean is calculated using the squared value of each
/// color channel. This is useful for calculating the mean of a color palette.
/// If [squared] is false, the mean is calculated using the raw value of each
/// color channel. This is useful for calculating the mean of an image.
/// All colors with an alpha value less than 5 are ignored, as well as colors
/// that are very close to white or black: `(r > 245 && g > 245 && b > 245) ||
/// (r < 15 && g < 15 && b < 15)`
Future<Color> mean(Image img, [bool squared = false]) async {
  final width = img.width;
  final height = img.height;
  final size = width * height;
  var redTotal = 0.0, greenTotal = 0.0, blueTotal = 0.0;
  var ignored = 0;

  final ByteData? byteData = await img.toByteData();

  if (byteData == null) {
    throw Exception('Failed to convert image to byte data');
  }

  final pixelData = byteData.buffer.asUint32List();

  for (var i = 0; i < size; i++) {
    final pixel = pixelData[i];
    final r = pixel & 0xFF;
    final g = (pixel >> 8) & 0xFF;
    final b = (pixel >> 16) & 0xFF;
    final a = (pixel >> 24) & 0xFF;

    if ((r > 245 && g > 245 && b > 245) ||
        (r < 15 && g < 15 && b < 15) ||
        a < 5) {
      ignored++;
      continue;
    }

    if (squared) {
      redTotal += r * r.toDouble();
      greenTotal += g * g.toDouble();
      blueTotal += b * b.toDouble();
    } else {
      redTotal += r.toDouble();
      greenTotal += g.toDouble();
      blueTotal += b.toDouble();
    }
  }

  final pixels = size - ignored;
  final red =
      squared ? sqrt(redTotal / pixels).round() : (redTotal / pixels).round();
  final green = squared
      ? sqrt(greenTotal / pixels).round()
      : (greenTotal / pixels).round();
  final blue =
      squared ? sqrt(blueTotal / pixels).round() : (blueTotal / pixels).round();

  return Color.fromRGBO(red, green, blue, 1.0);
}

/// Returns the mode average color from an image (most commonly occurring color).
/// If [squared] is true, the mode is calculated using the squared value of each
/// color channel. This is useful for calculating the mode of a color palette.
/// If [squared] is false, the mode is calculated using the raw value of each
/// color channel. This is useful for calculating the mode of an image.
/// All colors with an alpha value less than 5 are ignored, as well as colors
/// that are very close to white or black: `(r > 245 && g > 245 && b > 245) ||
/// (r < 15 && g < 15 && b < 15)`
/// If there are multiple colors with the same frequency, the first color
/// encountered is returned.
///
/// This function can be very slow, especially for large images. Consider using
/// [mean] if you need a faster alternative.
Future<Color> modal(Image img, [bool squared = false]) async {
  final width = img.width;
  final height = img.height;
  final size = width * height;
  final colorCounts = <Color, int>{};

  final byteData = await img.toByteData();

  if (byteData == null) {
    throw Exception('Failed to convert image to byte data');
  }

  final pixels = byteData.buffer.asUint32List();

  for (var i = 0; i < size; i++) {
    final pixel = pixels[i];
    final r = pixel & 0xFF;
    final g = (pixel >> 8) & 0xFF;
    final b = (pixel >> 16) & 0xFF;
    final a = (pixel >> 24) & 0xFF;

    if ((r > 245 && g > 245 && b > 245) ||
        (r < 15 && g < 15 && b < 15) ||
        a < 5) {
      continue;
    }

    final rgba = Color.fromARGB(a, r, g, b);
    colorCounts[rgba] = (colorCounts[rgba] ?? 0) + 1;
  }

  var modalColors = <Color>[];
  var modalCount = 0;

  for (var color in colorCounts.keys) {
    final count = colorCounts[color]!;
    if (count > modalCount) {
      modalCount = count;
      modalColors.clear();
    }
    if (count >= modalCount) {
      modalColors.add(color);
    }
  }

  var redTotal = 0.0, greenTotal = 0.0, blueTotal = 0.0;

  for (var m in modalColors) {
    final r = m.red;
    final g = m.green;
    final b = m.blue;
    if (squared) {
      redTotal += r * r.toDouble();
      greenTotal += g * g.toDouble();
      blueTotal += b * b.toDouble();
    } else {
      redTotal += r.toDouble();
      greenTotal += g.toDouble();
      blueTotal += b.toDouble();
    }
  }

  final modalColorsTotal = modalColors.length.toDouble();

  int red, green, blue;

  if (squared) {
    red = sqrt(redTotal / modalColorsTotal).round();
    green = sqrt(greenTotal / modalColorsTotal).round();
    blue = sqrt(blueTotal / modalColorsTotal).round();
  } else {
    red = (redTotal / modalColorsTotal).round();
    green = (greenTotal / modalColorsTotal).round();
    blue = (blueTotal / modalColorsTotal).round();
  }

  return Color.fromRGBO(red, green, blue, 1.0);
}

/// Returns the same result as [modal], but runs in an isolate.
Future<Color> computeModal(Image img, [bool squared = false]) async {
  return await Isolate.run(() => modal(img, squared));
}

/// Returns the same result as [mean], but runs in an isolate.
Future<Color> computeMean(Image img, [bool squared = false]) async {
  return await Isolate.run(() => mean(img, squared));
}

Future<Uint8List> _loadNetworkImage(String url) async {
  final file = await DefaultCacheManager().getSingleFile(url);
  if (file is FileResponse) {
    final bytes = await file.readAsBytes();
    return Uint8List.fromList(bytes);
  }
  throw Exception('Failed to load network image: $url');
}

Future<Image> _imageFromUrl(String url, [bool squared = false]) async {
  final bytes = await _loadNetworkImage(url);
  final codec = await instantiateImageCodec(bytes);
  final frame = await codec.getNextFrame();

  return frame.image;
}

/// Loads an image from a network url and returns the [mean] average color.
Future<Color> meanFromUrl(String url, [bool squared = false]) async {
  final img = await _imageFromUrl(url, squared);
  return await mean(img, squared);
}

/// Loads an image from a network url and returns the [modal] average color.
Future<Color> modalFromUrl(String url, [bool squared = false]) async {
  final img = await _imageFromUrl(url, squared);
  return await modal(img, squared);
}

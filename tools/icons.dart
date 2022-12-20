// ignore_for_file: avoid_print

library tools;

import 'dart:io';

import 'package:args/args.dart';
import 'package:figma/figma.dart';
import 'package:http/http.dart';
import 'package:progress_bar/progress_bar.dart';

/// {@category Tools}
/// {@subCategory Figma}
/// Returns true if the given file is an SVG file.
bool isSvg(File f) {
  return f.path.endsWith('.svg');
}

/// {@category Tools}
/// {@subCategory Figma}
/// Returns true if the given FileSystemEntity is an SVG file.
bool isSvgFile(FileSystemEntity e) {
  return e is File && isSvg(e);
}

/// {@category Tools}
/// {@subCategory Figma}
/// Runs SVGO on all SVG files in the given directory.
Future<void> optimize(Directory dir) async {
  // Check if SVGO is in path.
  final svgo = Process.runSync('which', ['svgo']).stdout;

  if (svgo.isEmpty) {
    throw Exception('SVGO not found in path, skipping optimization');
  }

  final list = dir.listSync();
  // Progress bar.
  final bar =
      ProgressBar('[:bar] :percent :etas', total: list.where(isSvgFile).length)
        ..tick();

  bar.render({});

  // Optimize SVGs.
  List<Future> svgoFutures = [];

  // Loop through SVG files and optimize them.
  for (final element in list.where(isSvgFile)) {
    svgoFutures.add(
      Process.run('svgo', ['-i', element.path, '-o', element.path])
          .then((_) => bar.tick()),
    );
  }

  // Execute SVGO in parallel.
  Future.wait(svgoFutures).then((_) {
    print('Optimized ${svgoFutures.length} icons');

    // Clear progress bar.
    bar.terminate();
  });
}

/// {@category Tools}
/// {@subCategory Figma}
/// Downloads all icons from Figma and saves them to the given directory.
Future<void> download(
  Directory dir,
  String ref,
  String accessToken,
) async {
// Create a Figma client.
  final client = FigmaClient(accessToken);

  // Retrieve Flume Web file.
  final file = await client.getFile(ref).catchError((e) {
    if (e is FigmaError) {
      switch (e.code) {
        case 403:
          throw Exception('Invalid access token');
        case 404:
          throw Exception('File not found');
        default:
          throw Exception('Could not retrieve file');
      }
    }
  });

  // Retrieve icon canvas.
  final canvas =
      file.document?.children?.where((node) => node?.name == 'Icon').single;

  if (canvas?.id == null) {
    throw Exception('Could not find icon canvas');
  }

  // Get nodes from icon canvas.
  final node = await client.getFileNodes(
      ref,
      FigmaQuery(
        ids: [canvas!.id],
        format: 'svg',
      ));

  final components = node.nodes?[canvas.id]?.components;
  final ids = components?.keys.toList();

  if (ids == null) {
    throw Exception('Could not find any icons');
  }

  // Retrieve SVG for each component.
  final res = await client.getImages(
    ref,
    FigmaQuery(
      ids: ids,
      format: 'svg',
      svgIncludeId: true,
    ),
  );

  if (res.err != null || res.images == null) {
    throw Exception('Could not retrieve images');
  }

  // Progress bar.
  final bar = ProgressBar('[:bar] :percent :etas', total: ids.length)..tick();

  bar.render({});

  // Future list for parallel execution.
  List<Future> futures = [];

  // Loop through each URL and download the SVG.
  for (var url in res.images!.entries) {
    final component = components?[url.key];

    if (component == null || component.name == null) {
      throw Exception('Could not find component for ${url.key}');
    }

    // Remove eventual "some_" prefix from the name.
    final name = component.name!.replaceAll('some_', '');

    // Add future to list.
    final future = get(Uri.parse(url.value)).then((svgRes) async {
      if (svgRes.statusCode == 200) {
        final path = '${dir.path}/$name.svg';
        final file = File(path);

        // Create file if it doesn't exist.
        if (!file.existsSync()) {
          file.createSync(recursive: true);
        }

        // Write SVG contents to file.
        file.writeAsStringSync(svgRes.body);

        // Tick progress bar.
        bar.tick();
      }
    });

    futures.add(future);
  }

  // Execute requests in parallel.
  await Future.wait(futures).then((_) async {
    print('Saved ${res.images!.length} icons');

    // Clear progress bar.
    bar.terminate();
  });
}

/// {@category Tools}
/// {@subCategory Figma}
/// Generates an icon font from all SVGs within
/// the given directory.
Future<void> generateIconFont(
  Directory dir,
  String className,
  String ttfOut,
  String dartOut,
) async {
  // Check if icon_font_generator is in path.
  final binary = Process.runSync('which', ['icon_font_generator']).stdout;

  if (!binary.isNotEmpty) {
    throw Exception(
        'icon_font_generator not found in path, skipping font generation');
  }

  if (!File(dartOut).existsSync()) {
    File(dartOut).createSync(recursive: true);
  }

  if (!File(ttfOut).existsSync()) {
    File(ttfOut).createSync(recursive: true);
  }

  Process.run('icon_font_generator', [
    '--from=${dir.path}',
    '--class-name=$className',
    '--out-font=$ttfOut',
    '--out-flutter=$dartOut'
  ]).then((res) {
    if (res.exitCode == 0) {
      print('Generated icon font at $ttfOut');
      print('Generated Flutter icon class at $dartOut');
    } else {
      throw Exception('Failed to generate icon font: $res');
    }
  });
}

/// Downloads all icons from Figma, optimizes and
/// saves them to the assets folder.
Future<void> main(List<String> args) async {
  final parser = ArgParser();

  parser.addOption(
    'file',
    abbr: 'f',
    defaultsTo: '4aGRieJsOTu9aqMPFGFf2u',
  );

  parser.addOption(
    'access-token',
    abbr: 'a',
    defaultsTo: 'figd_WHj1ryknfvPbkmyJ4kFR00I7OM0_sn7KZ58QaEKR',
  );

  // Parse arguments.
  final results = parser.parse(args);

  // Get file reference.
  final ref = results['file'];
  final accessToken = results['access-token'];

  final dir = Directory('${Directory.current.path}/.cache');

  // Download icons.
  await download(dir, ref, accessToken).catchError((e) {
    print(e);
    exit(1);
  });

  // Optimize icons.
  await optimize(dir).catchError((e) {
    print(e);
    exit(1);
  });

  // Generate icon font.
  await generateIconFont(
    dir,
    'FlumeIcon',
    '${Directory.current.path}/lib/fonts/FlumeIcons.ttf',
    '${Directory.current.path}/lib/icons.dart',
  ).catchError((e) {
    print(e);
    exit(1);
  });
}

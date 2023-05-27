import 'package:flume/flume.dart';
import 'package:flume/material.dart';

typedef ModalBuilder = Widget Function(
  BuildContext context,
  ScrollController controller,
);

Future<T?> showSheet<T>({
  required BuildContext context,
  required ModalBuilder builder,
  double initialLandscapeChildSize = 1.0,
  double initialChildSize = 0.9,
  double minChildSize = 0.5,
  double minLandscapeChildSize = 0.5,
  double maxChildSize = 1.0,
  double maxLandscapeChildSize = 1.0,
}) {
  // Clamp parameters to valid ranges.
  if (initialChildSize < minChildSize) {
    initialChildSize = minChildSize;
  }

  if (initialChildSize > maxChildSize) {
    initialChildSize = maxChildSize;
  }

  if (minChildSize > initialChildSize) {
    minChildSize = initialChildSize;
  }

  if (minLandscapeChildSize > initialLandscapeChildSize) {
    minLandscapeChildSize = initialLandscapeChildSize;
  }

  if (minLandscapeChildSize > maxLandscapeChildSize) {
    minLandscapeChildSize = maxLandscapeChildSize;
  }

  if (maxLandscapeChildSize < minLandscapeChildSize) {
    maxLandscapeChildSize = minLandscapeChildSize;
  }

  if (maxLandscapeChildSize < initialLandscapeChildSize) {
    maxLandscapeChildSize = initialLandscapeChildSize;
  }

  if (initialLandscapeChildSize < minLandscapeChildSize) {
    initialLandscapeChildSize = minLandscapeChildSize;
  }

  if (initialLandscapeChildSize > maxLandscapeChildSize) {
    initialLandscapeChildSize = maxLandscapeChildSize;
  }

  return showModalBottomSheet(
    // Avoid borders in landscape mode.
    backgroundColor: Colors.transparent,
    context: context,
    useRootNavigator: true,
    builder: (context) {
      final orientation = MediaQuery.of(context).orientation;

      return SafeArea(
        bottom: false,
        child: DraggableScrollableSheet(
          initialChildSize: orientation == Orientation.landscape
              ? initialLandscapeChildSize
              : initialChildSize,
          minChildSize: orientation == Orientation.landscape
              ? minLandscapeChildSize
              : minChildSize,
          maxChildSize: orientation == Orientation.landscape
              ? maxLandscapeChildSize
              : maxChildSize,
          builder: (context, controller) {
            return builder(context, controller);
          },
        ),
      );
    },
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(context.theme.shapes.lg),
        topRight: Radius.circular(context.theme.shapes.lg),
      ),
    ),
  );
}

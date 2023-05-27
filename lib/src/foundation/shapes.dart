/// {@category Foundation}
/// {@subCategory Shapes}
/// Shapes and borders defined by Flume.
class FlumeShapes {
  const FlumeShapes({
    required this.xs,
    required this.sm,
    required this.md,
    required this.lg,
  });

  /// {@category Foundation}
  /// {@subCategory Shapes}
  /// Use an xs shape on elements that are short in height. Used primarily on
  /// slim shapes (less than 32px height), like labels and smaller tags.
  final double xs;

  /// {@category Foundation}
  /// {@subCategory Shapes}
  /// Standard shape for buttons. Use a [sm] border radius on elements that
  /// don’t take up much space in the UI. Used primarily on buttons, tiles and
  /// cards.
  final double sm;

  /// {@category Foundation}
  /// {@subCategory Shapes}
  /// The standard border radius size. Commonly used for larger elements in the
  /// UI, such as containers, modals, images and large boxes.
  final double md;

  /// {@category Foundation}
  /// {@subCategory Shapes}
  /// Used to round off the top corners of a modal sheet, creating a softer
  /// appearance of an element that takes up the full viewport width.
  final double lg;

  /// {@category Foundation}
  /// {@subCategory Shapes}
  /// Default shapes defined by Flume.
  factory FlumeShapes.fallback() => const FlumeShapes(
        xs: 2,
        sm: 4,
        md: 6,
        lg: 12,
      );

  /// {@category Foundation}
  /// {@subCategory Shapes}
  /// Map of shape names to shape values.
  Map<String, double> toMap() => {
        'xs': xs,
        'sm': sm,
        'md': md,
        'lg': lg,
      };

  /// {@category Foundation}
  /// {@subCategory Shapes}
  /// List of all shapes defined by Flume, from lowest to highest.
  List<double> get values => [xs, sm, md, lg];
}

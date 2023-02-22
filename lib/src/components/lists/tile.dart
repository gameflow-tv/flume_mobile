import 'package:flume/flume.dart';
import 'package:flume/material.dart';

/// {@category Components}
/// {@subCategory Lists}
/// A list cell from the Flume design system.
class Tile extends StatelessWidget {
  /// A widget on the left-hand side of this [Tile]'s title.
  final Widget? leading;

  /// The main widget to display in this [Tile]. Should be the relevant
  /// information this cell is supposed to convey.
  final Widget title;

  /// A subtitle for this [Tile] that is display beneath the [title].
  final Widget? subtitle;

  /// A trailing widget on the right-hand side of this [Tile]'s title.
  final Widget? trailing;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool? autofocus;

  /// {@macro flume.gestures.onTap}
  final GestureTapCallback? onTap;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;

  const Tile({
    super.key,
    required this.title,
    this.leading,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.autofocus,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Flume.of(context);

    return Ambiance(
      builder: (context, ambiance) {
        return GestureDetector(
          onTap: onTap,
          child: Container(
            padding: theme.spacing.insets.md,
            decoration: BoxDecoration(
              color: ambiance.color,
              borderRadius: BorderRadius.circular(theme.shapes.md),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      if (leading != null) leading!,
                      Flexible(
                        child: Column(
                          children: [
                            title,
                            if (subtitle != null) subtitle!,
                          ],
                        ),
                      ),
                    ].spaced(context.theme.spacing.sm),
                  ),
                ),
                if (trailing != null)
                  trailing!
                else if (onTap != null)
                  const Icon(
                    FlumeIcons.chevron_right,
                    size: 14,
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

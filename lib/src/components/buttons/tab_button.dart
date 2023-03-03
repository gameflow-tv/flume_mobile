import 'package:flume/flume.dart';
import 'package:flutter/gestures.dart';
import 'package:flume/material.dart';

/// {@category Components}
/// {@subCategory Buttons}
/// A tab button that can be tabbed (selected or unselected).
class TabButton extends StatefulWidget {
  /// Whether the button is selected.
  final bool selected;

  /// Optional state to override the default initial state.
  final ButtonState? state;

  /// Optional callback to be called when the button is pressed.
  final ValueChanged<bool>? onChanged;

  /// The child widget to render.
  final Widget child;

  const TabButton({
    super.key,
    required this.selected,
    required this.child,
    this.state,
    this.onChanged,
  });

  @override
  State<TabButton> createState() => _TabButtonState();
}

class _TabButtonState extends State<TabButton> {
  late ButtonState state;
  late Color backgroundColor;
  late Color foregroundColor;

  @override
  initState() {
    super.initState();
    state = widget.state ?? ButtonState.normal;
  }

  void handleTapDown(TapDownDetails _) {
    setState(() {
      state = ButtonState.pressed;
    });
  }

  void handlePointerEnter([PointerEnterEvent? _]) {
    setState(() {
      state = ButtonState.hover;
    });
  }

  void handlePointerExit([PointerExitEvent? _]) {
    setState(() {
      state = ButtonState.normal;
    });
  }

  void handleTapUp([TapUpDetails? _]) {
    setState(() {
      state = ButtonState.normal;
    });
  }

  void handleFocus(bool hasFocus) {
    setState(() {
      state = hasFocus ? ButtonState.focus : ButtonState.normal;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Flume.of(context);

    return Ambiance(
      builder: (context, ambiance) {
        backgroundColor = getBackgroundColor(context);
        foregroundColor = getForegroundColor(context);

        return Focus(
          onFocusChange: handleFocus,
          child: Wrap(
            children: [
              MouseRegion(
                onEnter: handlePointerEnter,
                onExit: handlePointerExit,
                child: GestureDetector(
                  onTapDown: handleTapDown,
                  onTapUp: handleTapUp,
                  onTapCancel: handleTapUp,
                  onTap: state == ButtonState.disabled
                      ? null
                      : () => widget.onChanged?.call(!widget.selected),
                  child: AnimatedContainer(
                    padding: EdgeInsets.symmetric(
                      vertical: context.theme.spacing.xs,
                      horizontal: context.theme.spacing.xs,
                    ),
                    duration: theme.motion.short,
                    decoration: getBoxDecoration(theme),
                    child: AnimatedDefaultTextStyle(
                      duration: context.theme.motion.short,
                      style: context.theme.typography.button
                          .copyWith(color: foregroundColor),
                      child: IconTheme(
                        data: IconThemeData(
                          color: foregroundColor,
                          size: 22.0,
                        ),
                        child: state != ButtonState.loading
                            ? widget.child
                            : getProgressIndicator(theme),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget getProgressIndicator(FlumeTheme theme) {
    return Padding(
      padding: EdgeInsets.all(theme.spacing.sm),
      child: SizedBox(
        width: 16.0,
        height: 16.0,
        child: CircularProgressIndicator(
          strokeWidth: 2.0,
          color: foregroundColor,
        ),
      ),
    );
  }

  BoxDecoration getBoxDecoration(FlumeTheme theme) {
    return BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(theme.shapes.sm),
      boxShadow: [
        if (state == ButtonState.focus) ...{
          theme.shadows.focus,
        }
      ],
      border: state == ButtonState.focus
          ? Border.all(
              color: theme.colors.buttonFocus,
              width: 1.0,
            )
          : null,
    );
  }

  Color getBackgroundColor(BuildContext context) {
    final ambiance = Ambiance.of(context);
    final base = widget.selected ? ambiance.palette.light : ambiance.color;

    switch (state) {
      case ButtonState.normal:
      case ButtonState.focus:
        return base;
      case ButtonState.hover:
        return base.brighten(0.2);
      case ButtonState.pressed:
        return base.brighten(0.6);
      case ButtonState.disabled:
      case ButtonState.loading:
        return base.withOpacity(0.4);
    }
  }

  Color getForegroundColor(BuildContext context) {
    final theme = Flume.of(context);
    final ambiance = Ambiance.of(context);

    var base = widget.selected ? ambiance.palette.dark : ambiance.palette.light;

    switch (state) {
      case ButtonState.focus:
      case ButtonState.normal:
        return base;
      case ButtonState.hover:
        return base;
      case ButtonState.pressed:
        return base.withOpacity(0.4);
      case ButtonState.disabled:
      case ButtonState.loading:
        base = theme.colors.icon;
        return base.withOpacity(0.4);
    }
  }
}

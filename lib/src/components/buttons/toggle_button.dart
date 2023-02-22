import 'package:flume/flume.dart';
import 'package:flutter/gestures.dart';
import 'package:flume/material.dart';

/// {@category Components}
/// {@subCategory Buttons}
/// A button that can be toggled on and off.
class ToggleButton extends StatefulWidget {
  /// The variant of the button.
  final ToggleButtonVariant variant;

  /// Whether the button is selected.
  final bool selected;

  /// Optional state to override the default initial state.
  final ButtonState? state;

  /// Optional callback to be called when the button is pressed.
  final ValueChanged<bool>? onChange;

  /// The child widget to render.
  final Widget child;

  const ToggleButton({
    super.key,
    required this.variant,
    required this.selected,
    required this.child,
    this.state,
    this.onChange,
  });

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
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
                  onTap: () => widget.onChange?.call(!widget.selected),
                  child: AnimatedContainer(
                    width: 40.0,
                    height: 40.0,
                    duration: theme.motion.short,
                    decoration: getBoxDecoration(theme),
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
    final base = ambiance.up();

    switch (state) {
      case ButtonState.normal:
      case ButtonState.focus:
        return base;
      case ButtonState.hover:
        if (widget.variant == ToggleButtonVariant.tonal) {
          return ambiance.color;
        }
        return base;
      case ButtonState.pressed:
        return base.withOpacity(0.6);
      case ButtonState.disabled:
      case ButtonState.loading:
        return base.withOpacity(0.4);
    }
  }

  Color getForegroundColor(BuildContext context) {
    final theme = Flume.of(context);
    final ambiance = Ambiance.of(context);

    Color base;

    switch (widget.variant) {
      case ToggleButtonVariant.standard:
        base = widget.selected ? theme.colors.primary : theme.colors.icon;
        break;
      case ToggleButtonVariant.tonal:
        base = widget.selected ? theme.colors.primary : ambiance.at(5);
        break;
    }

    switch (state) {
      case ButtonState.focus:
      case ButtonState.normal:
        return base;
      case ButtonState.hover:
        if (widget.variant == ToggleButtonVariant.standard) {
          return theme.colors.primary;
        }
        return base;
      case ButtonState.pressed:
        if (widget.variant == ToggleButtonVariant.standard) {
          base = theme.colors.primary;
        }
        return base.withOpacity(0.4);
      case ButtonState.disabled:
      case ButtonState.loading:
        base = theme.colors.icon;
        return base.withOpacity(0.4);
    }
  }
}

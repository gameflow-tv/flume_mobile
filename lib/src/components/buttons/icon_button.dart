import 'package:flume/flume.dart';
import 'package:flutter/gestures.dart';
import 'package:flume/material.dart';

/// {@category Components}
/// {@subCategory Buttons}
/// A button that displays an icon.
class IconButton extends StatefulWidget {
  /// The size of the button.
  final ButtonSize size;

  /// The variant of the button.
  final ButtonVariant variant;

  /// The main content of the button.
  final Widget child;

  /// Optional state to override the default initial state.
  final ButtonState? state;

  /// Optional callback to be called when the button is pressed.
  final VoidCallback? onPressed;

  const IconButton({
    super.key,
    required this.size,
    required this.variant,
    required this.child,
    this.state,
    this.onPressed,
  });

  @override
  State<IconButton> createState() => _IconButtonState();
}

class _IconButtonState extends State<IconButton> {
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
                  onTap: widget.onPressed,
                  child: AnimatedContainer(
                    width: widget.size == ButtonSize.large ? 48.0 : 40.0,
                    height: widget.size == ButtonSize.large ? 48.0 : 40.0,
                    duration: theme.motion.short,
                    decoration: getBoxDecoration(theme),
                    child: IconTheme(
                      data: IconThemeData(
                        color: foregroundColor,
                        size: 24.0,
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

  EdgeInsets getPadding(BuildContext context) {
    final theme = Flume.of(context);

    switch (widget.size) {
      case ButtonSize.medium:
        return EdgeInsets.all(theme.spacing.xs);
      case ButtonSize.large:
      case ButtonSize.expand:
        return EdgeInsets.all(theme.spacing.sm);
    }
  }

  Color getBackgroundColor(BuildContext context) {
    final theme = Flume.of(context);
    final ambiance = Ambiance.of(context);

    Color base;

    switch (widget.variant) {
      case ButtonVariant.primary:
        base = theme.colors.primary;
        break;
      case ButtonVariant.tonal:
        base = ambiance.color;
        break;
      case ButtonVariant.signal:
        base = theme.colors.signal;
        break;
      case ButtonVariant.light:
        base = ambiance.palette.light;
        break;
    }

    switch (state) {
      case ButtonState.normal:
        break;
      case ButtonState.hover:
        base = base.withOpacity(0.8);
        break;
      case ButtonState.pressed:
        base = base.withOpacity(0.6);
        break;
      case ButtonState.focus:
        base = base.withOpacity(0.8);
        break;
      case ButtonState.disabled:
        base = base.withOpacity(0.4);
        break;
      case ButtonState.loading:
        base = base.withOpacity(0.4);
        break;
    }

    return base;
  }

  Color getForegroundColor(BuildContext context) {
    final theme = Flume.of(context);
    final ambiance = Ambiance.of(context);

    Color base;

    switch (widget.variant) {
      case ButtonVariant.primary:
        base = theme.colors.onPrimary;
        break;
      case ButtonVariant.tonal:
        base = ambiance.at(5);
        break;
      case ButtonVariant.signal:
        base = theme.colors.onSignal;
        break;
      case ButtonVariant.light:
        base = ambiance.palette.dark;
        break;
    }

    switch (state) {
      case ButtonState.normal:
        break;
      case ButtonState.hover:
        break;
      case ButtonState.pressed:
        break;
      case ButtonState.focus:
        break;
      case ButtonState.disabled:
        base = base.withOpacity(0.4);
        break;
      case ButtonState.loading:
        base = base.withOpacity(0.4);
        break;
    }

    return base;
  }
}

/// Backwards-compatible alias for [IconButton].
class SymbolButton extends IconButton {
  const SymbolButton({
    super.key,
    required super.child,
    required super.size,
    required super.variant,
    super.state,
    super.onPressed,
  });
}

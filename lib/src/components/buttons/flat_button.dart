import 'package:flume/flume.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class FlatButton extends StatefulWidget {
  /// Optional state to override the default initial state.
  final ButtonState? state;

  /// Optional callback to be called when the button is pressed.
  final VoidCallback? onPressed;

  /// The child widget to render.
  final Widget child;

  const FlatButton({
    super.key,
    required this.child,
    this.state,
    this.onPressed,
  });

  @override
  State<FlatButton> createState() => _FlatButtonState();
}

class _FlatButtonState extends State<FlatButton> {
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
                    duration: theme.motion.short,
                    decoration: getBoxDecoration(theme),
                    padding: EdgeInsets.symmetric(
                      vertical: theme.spacing.xxs,
                      horizontal: theme.spacing.xxs,
                    ),
                    child: DefaultTextStyle(
                      style: theme.typography.link.toTextStyle().copyWith(
                            color: foregroundColor,
                          ),
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
              ),
            ],
          ),
        );
      },
    );
  }

  Widget getProgressIndicator(FlumeTheme theme) {
    return Padding(
      padding: EdgeInsets.all(theme.spacing.xs),
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
    const base = Colors.transparent;

    switch (state) {
      case ButtonState.normal:
      case ButtonState.focus:
        return base;
      case ButtonState.hover:
        return base.withOpacity(0.1);
      case ButtonState.pressed:
        return base.withOpacity(0.25);
      case ButtonState.disabled:
      case ButtonState.loading:
        return base.withOpacity(0.4);
    }
  }

  Color getForegroundColor(BuildContext context) {
    final theme = Flume.of(context);
    final base = theme.colors.body;

    switch (state) {
      case ButtonState.normal:
      case ButtonState.focus:
        return base;
      case ButtonState.hover:
        return base.darken(0.25);
      case ButtonState.pressed:
        return base.darken(0.5);
      case ButtonState.disabled:
      case ButtonState.loading:
        return base.withOpacity(0.4);
    }
  }
}

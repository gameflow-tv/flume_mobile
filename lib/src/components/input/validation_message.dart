import 'package:flume/flume.dart';
import 'package:flutter/material.dart';

enum ValidationState {
  success,
  warning,
  error,
}

class ValidationMessage extends StatelessWidget {
  final ValidationState state;
  final Widget child;

  const ValidationMessage({
    super.key,
    required this.child,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Flume.of(context);

    final foregroundColor = getForegroundColor(theme);
    final backgroundColor = getBackgroundColor(theme);

    return Container(
      padding: EdgeInsets.all(theme.spacing.xs),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(theme.shapes.sm),
        border: Border.all(
          color: foregroundColor,
          width: 1,
        ),
      ),
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Icon(
            icon,
            size: 16,
            color: foregroundColor,
          ),
          DefaultTextStyle(
            style: theme.typography.body2
                .toTextStyle()
                .copyWith(color: foregroundColor),
            child: child,
          ),
        ].spaced(theme.spacing.xxs),
      ),
    );
  }

  IconData get icon {
    switch (state) {
      case ValidationState.success:
        return FlumeIcons.check;
      case ValidationState.warning:
        return FlumeIcons.warning;
      case ValidationState.error:
        return FlumeIcons.warning_filled;
    }
  }

  Color getBackgroundColor(FlumeTheme theme) {
    switch (state) {
      case ValidationState.success:
        return const Color(0xFFC3FFD1);
      case ValidationState.warning:
        return const Color(0xFFFFF5B1);
      case ValidationState.error:
        return const Color(0xFFFFD9D9);
    }
  }

  Color getForegroundColor(FlumeTheme theme) {
    switch (state) {
      case ValidationState.success:
        return theme.colors.onSuccess;
      case ValidationState.warning:
        return theme.colors.onWarning;
      case ValidationState.error:
        return theme.colors.onError;
    }
  }
}

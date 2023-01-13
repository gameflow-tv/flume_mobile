import 'package:flume/flume.dart';
import 'package:flutter/material.dart';

class Cell extends StatelessWidget {
  final Widget? leading;
  final Widget title;
  final Widget? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  const Cell({
    super.key,
    required this.title,
    this.leading,
    this.subtitle,
    this.trailing,
    this.onTap,
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
                if (leading != null) leading!,
                Flexible(
                  child: Column(
                    children: [
                      title,
                      if (subtitle != null) subtitle!,
                    ],
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

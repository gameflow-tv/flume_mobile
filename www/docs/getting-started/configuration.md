---
title: Configuration
sidebar_position: 3
---

# Configuration

The Flume theming system is configurable within its bounds. All UI components will adapt to any given theme instance. The following parts of the theme can be swapped out independently:

- Breakpoints
- Colors
- Motion
- Shadows
- Shapes
- Spacing
- Typography

In order to plug in your own configuration, just pass your own `FlumeBreakpoints`, `FlumeColors` etc.:

```dart title=app.dart
return Flume(
  // ...
  theme: FlumeTheme(
    breakpoints: FlumeBreakpoints(
        // ...
    ),
    colors: FlumeColors(
        // ...
    ),
    motion: FlumeMotion(
        // ...
    ),
    shadows: FlumeShadows(
        // ...
    ),
    shapes: FlumeShapes(
        // ...
    ),
    spacing: FlumeSpacing(
        // ...
    ),
    typography: FlumeTypography(
        // ...
    ),
  ),
);
```

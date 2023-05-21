---
title: Installation
sidebar_position: 1
---

# Installation

Flume for Flutter is distributed through [pub.dev](https://pub.dev/packages/flume). To add flume as a dependency, run the following command:

```bash title=bash
flutter pub add flume
```

## Adding Flume to your app

In order to make use of Flume, wrap your `MaterialApp` with a `Flume` widget:

```dart title=app.dart
return Flume(
  theme: FlumeTheme.fallback(),
  builder: (context, theme) {
    return Ambiance(
      child: MaterialApp(
        title: 'Example',
        theme: theme,
      ),
    );
  },
);
```

As you might have noticed, we're also wrapping our `MaterialApp` with the `Ambiance` widget. This provides a fallback ambiance provider. Most UI components need an `Ambiance` widget in the tree.

:::info
We're actively working to get rid of the `MaterialApp` glue. This approach will be deprecated in the future in favor of `FlumeApp`.
:::

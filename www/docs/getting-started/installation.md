---
title: 🤹‍♀️ Installation
sidebar_position: 1
---

# 🤹‍♀️ Installation

Flume for Flutter is distributed through [pub.dev](https://pub.dev/packages/flume). To add flume as a dependency, run the following command:

```bash title=bash
flutter pub add flume
```

## Adding Flume to your app

All you need is a `Flume` widget;

```dart title=app.dart
return Flume(
  theme: FlumeTheme.fallback(),
  child: Ambiance(
    child: Placeholder(),
  ),
);
```

As you might have noticed, we're also using the `Ambiance` widget. This provides a fallback ambiance provider used for generating dynamic color schemes. Most UI components need an `Ambiance` widget in the tree.

### Using Flume with Material

Use the included Material adapter to get sensible defaults when utilizing Material widgets. This is not required but recommended.

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

:::info
We're actively working to get rid of the `MaterialApp` glue. This approach will be deprecated in the future in favor of `FlumeApp`.
:::

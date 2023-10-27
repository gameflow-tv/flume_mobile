---
title: 📦 Importing assets
sidebar_position: 3
---

# 📦 Importing assets

Flume distributes both its default fonts and an icon font. In order to use Flume icons and/or built-in fonts, add the following to your `pubspec.yaml`:

```yaml title=pubspec.yaml
flutter:
  fonts:
    - family: FlumeIcons
      fonts:
        - asset: packages/flume/fonts/FlumeIcons.ttf

    - family: Sora
      fonts:
        - asset: packages/flume/fonts/Sora.ttf

    - family: Mulish
      fonts:
        - asset: packages/flume/fonts/MulishMedium.ttf
          weight: 500
```

:::tip
Alternatively, use the [google_fonts](https://pub.dev/packages/google_fonts) package to avoid manually importing the Sora and Mulish fonts.
:::

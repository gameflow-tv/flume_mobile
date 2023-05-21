---
title: Importing assets
sidebar_position: 2
---

# Importing assets

Flume distributes both its default fonts and an icon font. In order to use Flume icons and/or built-in fonts, add the following to your `pubspec.yaml`:

```yaml title=pubspec.yaml
flutter:
  fonts:
    - family: FlumeIcons
      fonts:
        - asset: packages/flume/fonts/FlumeIcons.ttf

    - family: Montserrat
      fonts:
        - asset: packages/flume/fonts/MontserratMedium.ttf
          weight: 500
        - asset: packages/flume/fonts/MontserratSemiBold.ttf
          weight: 600

    - family: Mulish
      fonts:
        - asset: packages/flume/fonts/MulishMedium.ttf
          weight: 500
```

:::tip
Alternatively, use the [google_fonts](https://pub.dev/packages/google_fonts) package to avoid manually importing the Montserrat and Mulish fonts.
:::

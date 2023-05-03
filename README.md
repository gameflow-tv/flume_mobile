# <img src="https://github.com/gameflow-tv/flume_mobile/blob/main/assets/docs/cover.png?raw=true" style="width: 100%;"/>

Implementation of the Flume design system written from scratch in Dart and UI Components built with Flutter.

## Getting started

Use the included Material adapter to get sensible defaults when utilizing Material widgets. This is not required but recommended.

```dart
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

To retrieve the theme object, use its inherited widget provier or the pre-made shorthand extensions;

```dart
// Either retrieve the inherited widget
final theme = Flume.of(context);

// .. or use the shorthand extension
final theme = context.theme;
```

## Ambiance

Automated color schemes for a dynamic and colorful experience. The description below demonstrates how image-generated colors are created and implemented in a UI.

### Usage

First and foremost, provide an `Ambiance` widget with a seed color to generate the palette. If no color is provided, it defaults to `FlumeColors.secondary` from the theme. The `Ambiance` widget takes either a `child` or a `builder` property.

```dart
return Ambiance(
  // Seed color, defaults to `FlumeColors.secondary`
  color: Colors.red,
  builder: (context, ambiance) {
    // Use ambiance data provided by builder
    return Container(
      color: ambiance.color,
      child: Container(
        // Or retrieve ambiance from context,
        // alternatively Ambiance.of(context).color
        color: context.ambiance.color, 
      ),
    );
  }
)
```

This will correspond to a single ambiance "layer". If we check out the elevation property from the example above, this will start at 0;

```dart
print(ambiance.elevation); // 0
```

However, if we stack Ambiance widgets in the tree, we also increase the elevation for each layer;

```dart
return Ambiance(
  builder: (context, ambiance1) {
    return Ambiance(
      builder: (context, ambiance2) {
        return Ambiance(
          builder: (context, ambiance3) {
            return null;
          },
        );
      },
    );
  },
);
```

Which will result in the following values;

```dart
print(ambiance1.elevation); // 0
print(ambiance2.elevation); // 1
print(ambiance3.elevation); // 2
print(ambiance1.color); // dark variant
print(ambiance2.color); // mediumDark variant
print(ambiance3.color); // medium variant
```

> Many of the Flume UI components use this system to set its own background and foreground colors in order to reflects its place in the ambiance layer tree.

In order to retrieve a color for a specific elevation, we can use `ambiance.at(n)`;

```dart
return Container(
  color: context.ambiance.at(5) // light
);
```

We can also use the palette directly;

```dart
return Container(
  color: context.ambiance.palette.mediumDark // mediumDark
);
```

### Colors from images

A team’s or tournament’s main logo is the basis for the color extraction algorithm (Ambiance) to build a color scheme that’s applied to an entire UI or individual components that utilize dynamic color.

The goal is to give every team and tournament a distinct look, and to emphasize the uniqueness of each. Using Ambiance in web development results in a visually unified, refreshed and modern appearance whilst embracing the diversity of content and giving it visual context.

<p align="center">
  <img src="https://github.com/gameflow-tv/flume_mobile/blob/main/assets/docs/ambiance_process.png?raw=true">
</p>


A single source color is used to derive five tones that provide the basis for any web development use case. The dynamic color system is built using luminance. Meaning that if the hue and saturation were removed, we'd be able to see the contrast through shades. The colors ensure colorful and rich palettes while adhering to the WCAG color contrast guidelines.

Combining color based on tonality, rather than hex value or hue, is one of the key systems that make any color output accessible. Layouts using dynamic color will meet requirements because the algorithmic combinations that a user can experience are designed to meet accessibility standards.

### Dynamic colors schemes for UI

The Ambiance color algorithm generates five colors for each identity: _dark_, _mediumDark_, _medium_, _mediumLight_ and _light_. The colors represent different levels of elevation:

* _dark_ (elevation: 0) is used as the background-color on a page, and as text-color on light backgrounds.

* _mediumDark_ (elevation: 1) serves as background-color for elements that sit on top of _dark_.

* _medium_ (elevation: 2) is mostly used as hover state for _mediumDark_, or as background-color for elements that sit on top of _mediumDark_.

* _mediumLight_ (elevation: 3) is used as hover state for _medium_.

* _light_ (elevation: 4) is used for selected states, and generally as visual flourish to complement the overall color scheme of each identity.

Avoid stacking more than three layers on top of each other (not including hover states) as this will clutter the UI. Always make sure layers that are stacked on top of each other are distinguished using elevation in chronological order.

<p align="center">
  <figure align="center">
    <img src="https://github.com/gameflow-tv/flume_mobile/blob/main/assets/docs/elevation_example.png?raw=true">
      <figcaption>
        0 = <i>dark</i> (background)
        1 = <i>mediumDark</i> (container)
        2 = <i>medium</i> (hover)
      </figcaption>
  </figure>
</p>

## Foundation

Flume Foundation is the shared design foundation for Gameflow. This is where we keep things like color, type styles, motion, spacing and other design tokens.

It aims to create a recognisable and consistent user experience and speed up design development with common principles. These are things everyone should use — it’s what makes Gameflow look like Gameflow.

All design tokens are gathered in a `FlumeTheme` class, and all design token classes are dead simple, as they only hold raw data.

## Components

The components library is a set of Flutter widgets that implements components from the Flume design system. This is a library that very likely will change a lot until the first stable release, and the API surface _is_ unstable.

All components _require_ a `Flume` parent present in the tree, and most components also _require_  an `Ambiance` parent in the tree as well in order to use dynamic color palettes.

## Licenses

Both the [Mulish](https://fonts.google.com/specimen/Mulish/about) and [Montserrat](https://fonts.google.com/specimen/Montserrat/about) fonts are utilized by Flume. Since fonts aren't automatically added to the license registry, Flume bundles the required license entries. For example:

```dart
import 'package:flume/licenses.dart';

void main() {
  LicenseRegistry.addLicense(licenses);
}
```

Or, alternatively, generate yourself:

```dart
void main() {
  LicenseRegistry.addLicense(() async* {
  final mulish = await rootBundle.loadString('packages/flume/lib/licenses/Mulish.txt');
  final montserrat = await rootBundle.loadString('packages/flume/lib/licenses/Montserrat.txt');

  yield LicenseEntryWithLineBreaks(<String>['Montserrat'], montserrat);
  yield LicenseEntryWithLineBreaks(<String>['Mulish'], mulish);
  })
}
```

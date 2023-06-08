## 0.4.2

* Added average color extraction functions; `mean` and `modal`

## 0.4.1

* Add `package` parameter to `FlumeTypographyData`

## 0.4.0

* **BREAKING:** Set lower SDK constraint to ">=3.0.0" to make use of new language features
* Added `range` option to DatePicker

## 0.3.2

* Fixed `AmbiancePalette.light` algorithm that sometimes computed very off colors

## 0.3.1

* Added extra step to `tool/icons.dart` for stripping <defs>/<g> nodes from SVGs
* Introduced `lighter()` and `darker()` functions to `AmbianceState`
* Marked `up()` and `down()` as deprecated, replaced by the above.
* Added `toMap()` and `values` to all `FlumeTheme` subclasses
* Fixed expanded `InputField` sizing issues
* Wrapped `Button` children with `Flexible` to avoid clipping on overflow
* Redesigned and overhauled example app

## 0.3.0

* **BREAKING:** Removed `showBorders` from ScrollableList
* Added DatePicker component
* Added `spacing` prop to ScrollableList

## 0.2.23

* Removed all dart:io imports

## 0.2.22

* Migrated back from `MediaQueryData.fromView` to `MediaQueryData.fromWindow` for backwards compatibility

## 0.2.21

* Branched out web condition to fully support web

## 0.2.20+1

* Update broken README link

## 0.2.20

* Migrated docs from README to [flume.gameflow.dev](https://flume.gameflow.dev)
* Updated screenshots

## 0.2.19

* Added screenshots to `pubspec.yaml`
* Migrated from `MediaQueryData.fromWindow` to `MediaQueryData.fromView`

## 0.2.18

* Shrunk `Checkbox` size to 20x20 (was 24x24)

## 0.2.17

* Fix analyzer issues

## 0.2.16

* Add `titlePadding` to `ScrollableList`
* Set default `color` and `overflow` on typography data

## 0.2.15

* Set `Divider` height to its thickness

## 0.2.14

* Add `padding` property to `Cell` for overriding `dense` behavior

## 0.2.13

* Updated colors of tonal buttons to match specification

## 0.2.12

* Added license generator for font licenses

## 0.2.11

* Brightened active thumb color of `TonalSwitch`

## 0.2.10

* Hid `SearchBar` export from material

## 0.2.9

* Changed `Skeleton` behaviur to expand (fill parent) by default

## 0.2.8

* Set `Skeleton` `width` and `height` paremeters as nullable

## 0.2.7

* **BREAKING:** Renamed `Shimmer` to `Skeleton`

## 0.2.6

* Changed ScrollableList to wrap children in SafeArea by default, can be disabled with the `wrapWithSafeArea` parameter

## 0.2.5

* Added multiline support to `ValidationMessage`

## 0.2.4

* Disabled `onPressed` and `onSelected` callbacks for buttons in disabled state

## 0.2.3

* Removed `TopBar` component, as it's too much to abstract away (e.g. different routing, navigators etc.)

## 0.2.2

* Changed `Checkbox` to use tonal colors

## 0.2.1

* **BREAKING:** Renamed `onChange` params to `onChanged` to align with the familiar Material API
* **BREAKING:** Renamed `checked` to `value` for Checkbox
* Increased `Checkbox` icon size

## 0.2.0

* Added `Checkbox` component
* Renamed `SymbolButton` to `IconButton`, but kept backwards-compatible SymbolButton
* Added re-export of `package:flutter/material.dart` with pre-hidden conflicting symbols. Use `package:flume/material.dart` to avoid conflict imports.

## 0.1.7

* Added `TabButton` component

## 0.1.6

* Changed back to old release workflow

## 0.1.5

* Changed repository visibility to public
* Removed revoked, hard-coded Figma access token
* Changed `tools/icons.dart` to _require_ `--token` option

## 0.1.4

* Loosened Dart version constraints

## 0.1.3

* Added README
* Changed docs to include more details
* Changed required SDK version to >=3.0.0-204.0.dev for compatibility reasons

## 0.1.2

* Changed `ScrollableList` to set default `padding` value in constructor instead of inside `build`
* Added `hintText` param to SearchBar

## 0.1.1

* **BREAKING**: Removed `spaceBetween` due to conflict with divided and use of `.spaced`extension in ScrollableList
* **BREAKING**: Changed `InputField`'s `maxLines` behavior to depend on the `expands` property. If non-expandable, `maxLines` defaults to 1 as always, but if `expands` is `true`, `maxLines` is set to `null`. These are mutually exclusive.
* Changed `Cell` to wrap its children inside a `SafeArea` to avoid overlapping with physical borders.
* Added `ScrollableList.static` factory for non-scrollable, shrink-wrapped use
* Added `FormGroup` widget
* Added `SearchBar` widget

## 0.1.0

* **BREAKING**: Changed `FlumeTypography` getter types to return `TextStyle`

## 0.0.12

* Changed `Button` to only render icon if one is passed

## 0.0.11

* Changed `InputField` text alignment to be centered

## 0.0.10

* Removed divider for empty children in `ScrollableList`

## 0.0.9

* Added `onTapOutside` property to `InputField`

## 0.0.8

* Added padding to leading widget in `TopBar`

## 0.0.7

* Implemented `TonalSwitch` component
* Added `dense` property on Cell

## 0.0.6

* Added opacity for enabled state on `InputField`

## 0.0.5

* Added `enabled` property on `InputField`

## 0.0.4

* Added `leadingLabel` to `TopBar`
* Fixed divider issuer in `ScrollableList`
* Refactored `InputField` suffix/prefix icons

## 0.0.3+1

* Formatted files
* Updated package description
* Updated package homepage

## 0.0.3

* Added opacity animation on `Cell` when pressed
* Exposed `prefixIcon` for `InputField` component

## 0.0.2

* Implemented `ScrollableList`
* Implemented `FlumeFlex`, `FlumeColumn`, `FlumeRow`, `FlumeWrap`
* Implemented `Tile` component for use with lists
* Updated `Cell` implementation
* Implemented `Shimmer` component
* Updated documentation and templates
* Added new `BuildContext` extensions

## 0.0.1

* Initial release containing baselines for the most essential components. Everything, including Ambiance and Widget APIs are subject to breaking changes.

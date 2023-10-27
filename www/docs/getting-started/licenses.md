---
title: 📜 Licenses
sidebar_position: 5
---

# 📜 Licenses

Flutter automatically registers the licenses used by all your packages in its [_LicenseRegistry_](https://api.flutter.dev/flutter/foundation/LicenseRegistry-class.html). However, Flume re-distributes assets subject to their own licenses. If you choose to use the bundled _Mulish_ and/or _Sora_ fonts, you need to register the fonts' licenses as well:

```dart {5}
import 'package:flume/licenses.dart';

void main() {
  // Registers both Mulish and Sora font licenses
  LicenseRegistry.addLicense(licenses);
  runApp(Placeholder());
}
```

Or, alternatively, generate yourself:

```dart
void main() {
  LicenseRegistry.addLicense(() async* {
  final mulish = await rootBundle.loadString('packages/flume/lib/licenses/Mulish.txt');
  final sora = await rootBundle.loadString('packages/flume/lib/licenses/Sora.txt');

  yield LicenseEntryWithLineBreaks(<String>['Sora'], sora);
  yield LicenseEntryWithLineBreaks(<String>['Mulish'], mulish);
  });
}
```

:::note
If you use the [google_fonts](https://pub.dev/packages/google_fonts) package, follow [their instructions](https://pub.dev/packages/google_fonts#licensing-fonts) on licensing fonts instead.
:::

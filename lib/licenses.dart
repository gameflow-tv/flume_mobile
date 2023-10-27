import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;

const _kLicenseRoot = 'packages/flume/lib/licenses';

Stream<LicenseEntry> licenses() async* {
  final sora = await rootBundle.loadString(
    '$_kLicenseRoot/Sora.txt',
  );
  final mulish = await rootBundle.loadString(
    '$_kLicenseRoot/Mulish.txt',
  );

  yield LicenseEntryWithLineBreaks(<String>['Sora'], sora);
  yield LicenseEntryWithLineBreaks(<String>['Mulish'], mulish);
}

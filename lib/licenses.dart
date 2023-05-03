import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;

const _kLicenseRoot = 'packages/flume/lib/licenses';

Stream<LicenseEntry> licenses() async* {
  final montserrat = await rootBundle.loadString(
    '$_kLicenseRoot/Montserrat.txt',
  );
  final mulish = await rootBundle.loadString(
    '$_kLicenseRoot/Mulish.txt',
  );

  yield LicenseEntryWithLineBreaks(<String>['Montserrat'], montserrat);
  yield LicenseEntryWithLineBreaks(<String>['Mulish'], mulish);
}

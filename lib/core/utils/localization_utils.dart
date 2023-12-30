import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_en.dart';
import 'package:flutter/widgets.dart';

extension AppLocalizationExtensions on BuildContext {
  ///Retrieves the localizations for the app. If no matching [Locale] is found, then
  ///English is used by default
  AppLocalizations get appLocalizations =>
      AppLocalizations.of(this) ?? AppLocalizationsEn();
}

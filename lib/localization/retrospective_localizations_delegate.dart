import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:retrospektive/localization/retrospective_localization.dart';

class RetrospectiveLocalizationsDelegate extends LocalizationsDelegate<RetrospectiveLocalization> {
  const RetrospectiveLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'tr'].contains(locale.languageCode);

  @override
  Future<RetrospectiveLocalization> load(Locale locale) {
    return SynchronousFuture<RetrospectiveLocalization>(RetrospectiveLocalization(locale));
  }

  @override
  bool shouldReload(LocalizationsDelegate old) => false;
}
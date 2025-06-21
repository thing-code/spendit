import 'package:flutter/material.dart';

class SILocalization extends DefaultMaterialLocalizations {
  @override
  List<String> get narrowWeekdays => ['M', 'S', 'S', 'R', 'K', 'J', 'S'];

  @override
  int get firstDayOfWeekIndex => 1;
}

class SILocalizationsDelegate extends LocalizationsDelegate<MaterialLocalizations> {
  const SILocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'id';

  @override
  Future<SILocalization> load(Locale locale) async => SILocalization();

  @override
  bool shouldReload(LocalizationsDelegate<MaterialLocalizations> old) => false;
}

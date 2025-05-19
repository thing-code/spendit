import 'package:flutter/material.dart';

class SpendItLocalization extends DefaultMaterialLocalizations {
  @override
  List<String> get narrowWeekdays => ['M', 'S', 'S', 'R', 'K', 'J', 'S'];

  @override
  int get firstDayOfWeekIndex => 1;
}

class SpendItLocalizationsDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const SpendItLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'id';

  @override
  Future<SpendItLocalization> load(Locale locale) async =>
      SpendItLocalization();

  @override
  bool shouldReload(LocalizationsDelegate<MaterialLocalizations> old) => false;
}

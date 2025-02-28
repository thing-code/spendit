import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';

enum IncomeType {
  salary('Salary', SolarIconsOutline.banknote2),
  investment('Invesment', SolarIconsOutline.graphUp),
  bonus('Bonus', SolarIconsOutline.dollar),
  freelance('Freelance', SolarIconsOutline.billList);

  final String label;
  final IconData icon;

  const IncomeType(this.label, this.icon);
}

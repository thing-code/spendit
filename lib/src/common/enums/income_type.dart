import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';

enum IncomeType {
  salary('Salary', SolarIconsOutline.banknote2, Colors.blue),
  investment('Invesment', SolarIconsOutline.graphUp, Colors.green),
  bonus('Bonus', SolarIconsOutline.dollar, Colors.amber),
  freelance('Freelance', SolarIconsOutline.billList, Colors.red);

  final String label;
  final IconData icon;
  final Color color;

  const IncomeType(this.label, this.icon, this.color);
}

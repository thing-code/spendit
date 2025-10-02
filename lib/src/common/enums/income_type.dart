import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';

enum IncomeType {
  salary('Salary', SolarIconsOutline.banknote2, Colors.green),
  investment('Invesment', SolarIconsOutline.graphUp, Colors.blueAccent),
  bonus('Bonus', SolarIconsOutline.dollar, Colors.amber),
  freelance('Freelance', SolarIconsOutline.billList, Colors.red);

  final String label;
  final IconData icon;
  final Color color;

  const IncomeType(this.label, this.icon, this.color);
}

import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';

enum BudgetType {
  family('Family', SolarIconsBold.userHeart, Colors.cyan),
  foods('Foods', SolarIconsBold.chefHat, Colors.amber),
  health('Health', SolarIconsBold.heartPulse, Colors.pink),
  internet('Internet', SolarIconsBold.simCard, Colors.teal),
  transportation('Transportation', SolarIconsBold.gasStation, Colors.indigoAccent),
  shopping('Shopping', SolarIconsBold.cartLarge, Colors.orange),
  investment('Investment', SolarIconsBold.graphNewUp, Colors.green),
  livingcost('Living Cost', SolarIconsBold.home1, Colors.deepPurpleAccent),
  emergency('Emergency', SolarIconsBold.danger, Colors.red),
  others('Others', SolarIconsBold.widget_5, Colors.blueGrey);

  final String label;
  final IconData icon;
  final Color color;
  const BudgetType(this.label, this.icon, this.color);

  bool get isOthers => this == BudgetType.others;
}

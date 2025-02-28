import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';

enum BudgetType {
  family('Family', SolarIconsBold.userHeart, Colors.pinkAccent),
  foods('Foods', SolarIconsBold.chefHat, Colors.amber),
  internet('Internet', SolarIconsBold.simCard, Colors.teal),
  livingcost('Living Cost', SolarIconsBold.home1, Colors.brown),
  shopping('Shopping', SolarIconsBold.cartLarge, Colors.orange),
  transportation('Transportation', SolarIconsBold.gasStation, Colors.blue),
  saving('Saving', SolarIconsBold.wallet, Colors.deepPurpleAccent),
  emergency('Emergency', SolarIconsBold.danger, Colors.red),
  investment('Investment', SolarIconsBold.graphNewUp, Colors.green),
  others('Others', SolarIconsBold.widget_5, Colors.blueGrey);

  final String label;
  final IconData icon;
  final Color color;
  const BudgetType(this.label, this.icon, this.color);

  bool get isOthers => this == BudgetType.others;
}

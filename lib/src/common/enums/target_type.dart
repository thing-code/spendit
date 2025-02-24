import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';

enum TargetType {
  family('Family', SolarIconsOutline.userHeart, Colors.pinkAccent),
  dailyneeds('Daily Needs', SolarIconsOutline.cart_3, Colors.amber),
  internet('Internet', SolarIconsOutline.simCard, Colors.teal),
  livingcost('Living Cost', SolarIconsOutline.home1, Colors.pink),
  transportation('Transportation', SolarIconsOutline.gasStation, Colors.blue),
  saving('Saving', SolarIconsOutline.wallet, Colors.deepPurpleAccent),
  emergency('Emergency', SolarIconsOutline.danger, Colors.red),
  investment('Investment', SolarIconsOutline.diagramUp, Colors.green),
  others('Others', SolarIconsOutline.widget_5, Colors.blueGrey);

  final String label;
  final IconData icon;
  final Color color;
  const TargetType(this.label, this.icon, this.color);
}

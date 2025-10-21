import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';

enum TransactionType {
  income('Income'),
  expense('Expense'),
  goals('Goals');

  final String title;

  const TransactionType(this.title);
}

enum IncomeCategory {
  salary('Salary', SolarIconsBold.walletMoney),
  investment('Investment', SolarIconsBold.graphUp),
  freelance('Freelance', SolarIconsBold.moneyBag);

  final String title;
  final IconData icon;

  const IncomeCategory(this.title, this.icon);
}

enum ExpenseCategory {
  family('Family', SolarIconsBold.home1),
  shopping('Shopping', SolarIconsBold.cartLarge),
  reward('Reward', SolarIconsBold.confetti),
  health('Health', SolarIconsBold.heartPulse),
  bill('Bill', SolarIconsBold.bill),
  transport('Transport', SolarIconsBold.scooter),
  food('Food', SolarIconsBold.chefHatMinimalistic),
  other('Other', SolarIconsBold.widget_2);

  final String title;
  final IconData icon;

  const ExpenseCategory(this.title, this.icon);
}

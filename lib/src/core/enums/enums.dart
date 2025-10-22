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

/// Pastel Income Category Colors
final Map<IncomeCategory, Color> incomeCategoryColors = {
  IncomeCategory.salary: const Color(0xFF81C784), // Soft Green
  IncomeCategory.investment: const Color(0xFF64B5F6), // Soft Blue
  IncomeCategory.freelance: const Color(0xFFFFD54F), // Soft Yellow
};

/// Pastel Expense Category Colors
final Map<ExpenseCategory, Color> expenseCategoryColors = {
  ExpenseCategory.family: const Color(0xFFBA68C8), // Soft Purple
  ExpenseCategory.shopping: const Color(0xFFF48FB1), // Soft Pink
  ExpenseCategory.reward: const Color(0xFFFFB74D), // Soft Orange
  ExpenseCategory.health: const Color(0xFFE57373), // Soft Red
  ExpenseCategory.bill: const Color(0xFF4DD0E1), // Soft Cyan
  ExpenseCategory.transport: const Color(0xFF7986CB), // Soft Indigo
  ExpenseCategory.food: const Color(0xFFFF8A65), // Soft Deep Orange
  ExpenseCategory.other: const Color(0xFFB0BEC5), // Soft Grey Blue
};

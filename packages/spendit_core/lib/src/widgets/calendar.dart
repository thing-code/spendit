import 'package:flutter/material.dart';

class SpendItCalendar extends StatefulWidget {
  const SpendItCalendar({super.key});

  @override
  State<SpendItCalendar> createState() => _SpendItCalendarState();
}

class _SpendItCalendarState extends State<SpendItCalendar> {
  final _today = DateTime.now();
  final _monthCells = <int, List<DateTime>>{};

  @override
  void initState() {
    super.initState();
    List.generate(12, (index) {
      generateMonthCells(DateTime(_today.year, index + 1, 1));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  void generateMonthCells(DateTime month) {
    List<DateTime> cells = [];
    var totalDaysInMonth = DateUtils.getDaysInMonth(month.year, month.month);
    var firstDayDate = DateTime(month.year, month.month, 1);
    var prevMonthDate = firstDayDate.subtract(const Duration(days: 1));
    var nextMonthDate = DateTime(month.year, month.month, totalDaysInMonth);
    var firstDayOfWeek = firstDayDate.weekday;
    var prevMonthDays = DateUtils.getDaysInMonth(
      prevMonthDate.year,
      prevMonthDate.month,
    );
    var prevMonthCells = List.generate(
      firstDayOfWeek - 1,
      (index) => DateTime(
        prevMonthDate.year,
        prevMonthDate.month,
        prevMonthDays - index,
      ),
    );
    cells.addAll(prevMonthCells.reversed);
    var currentMonthCells = List.generate(
      totalDaysInMonth,
      (index) => DateTime(month.year, month.month, index + 1),
    );
    cells.addAll(currentMonthCells);
    var remainingCellCount = 35 - cells.length;
    if (cells.length > 35) {
      remainingCellCount = 42 - cells.length;
    }
    var nextMonthCells = List.generate(
      remainingCellCount,
      (index) => DateTime(nextMonthDate.year, nextMonthDate.month, index + 1),
    );
    cells.addAll(nextMonthCells);
    _monthCells[month.month] = cells;
  }
}

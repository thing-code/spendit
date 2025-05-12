import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:spendit_core/spendit_core.dart';

class SpendItCalendar extends StatefulWidget {
  const SpendItCalendar({
    super.key,
    required this.startDate,
    required this.endDate,
  });

  final DateTime startDate;
  final DateTime endDate;

  @override
  State<SpendItCalendar> createState() => _SpendItCalendarState();
}

class _SpendItCalendarState extends State<SpendItCalendar> {
  final _today = DateTime.now();
  final _monthCells = <int, List<DateTime>>{};
  final _controller = PageController(initialPage: DateTime.now().month - 1);

  @override
  void initState() {
    super.initState();
    List.generate(_generateCalendarLength(), (index) {
      generateMonthCells(DateTime(_today.year, index + 1, 1));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calendar Custom')),
      body: PageView.builder(
        controller: _controller,
        onPageChanged: (value) {
          logger.log(value);
        },
        itemCount: _generateCalendarLength(),
        itemBuilder: (context, index) {
          var month = DateTime(_today.year, index + 1, 1);
          var cells = _monthCells[index + 1] ?? [];
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton.filledTonal(
                    onPressed:
                        _isStartDate(month)
                            ? null
                            : () {
                              _controller.previousPage(
                                duration: Durations.medium1,
                                curve: Curves.bounceInOut,
                              );
                            },
                    icon: Icon(Icons.arrow_back_ios_rounded),
                  ),
                  Text(month.title).onTap(
                    onTap: () {
                      logger.info(_generateCalendarLength());
                    },
                  ),
                  IconButton.filledTonal(
                    onPressed: () {
                      _controller.nextPage(
                        duration: Durations.medium1,
                        curve: Curves.bounceInOut,
                      );
                    },
                    icon: Icon(Icons.arrow_forward_ios_rounded),
                  ),
                ],
              ),
              _WeekHeaders(),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7,
                    childAspectRatio: .9,
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 2,
                  ),
                  itemCount: cells.length,
                  itemBuilder: (context, index) {
                    var item = cells[index];
                    var isToday = item.isToday;
                    var isSameMonth = item.month == month.month;

                    Color? textColor;
                    Color? bgColor;

                    if (item.isSunday) {
                      textColor = Colors.red;
                    }

                    if (isToday) {
                      bgColor = SpendItColors.primaryColor;
                      textColor = SpendItColors.primaryColor.shade50;
                    }

                    return Card(
                      color: bgColor,
                      child: Center(
                        child: Opacity(
                          opacity: isSameMonth ? 1 : .3,
                          child: Text(
                            item.day.toString(),
                            textAlign: TextAlign.center,
                            style: SpendItTextStyles.medium.copyWith(
                              fontSize: 18,
                              color: textColor,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  bool _isStartDate(DateTime date) {
    return widget.startDate.year == date.year &&
        widget.startDate.month == date.month;
  }

  int _generateCalendarLength() {
    var now = DateTime.now();
    if (widget.startDate.month == 1) {
      return DateUtils.monthDelta(widget.startDate, widget.endDate) + 1;
    }
    return DateUtils.monthDelta(widget.startDate, widget.endDate) +
        (now.month + 1);
  }

  void generateMonthCells(DateTime month) {
    List<DateTime> cells = [];
    var totalDaysInMonth = DateUtils.getDaysInMonth(month.year, month.month);
    var firstDayDate = DateTime(month.year, month.month, 1);
    var prevMonthDate = firstDayDate.subtract(const Duration(days: 1));
    var nextMonthDate = DateTime(
      month.year,
      month.month,
      totalDaysInMonth,
    ).add(Duration(days: 1));
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

class _WeekHeaders extends StatelessWidget {
  const _WeekHeaders();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:
            ["Sen", "Sel", "Rab", "Kam", "Jum", "Sab", "Min"]
                .mapIndexed(
                  (i, item) => Expanded(
                    child: Text(
                      item,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: _getTitleColor(i),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
                .toList(),
      ),
    );
  }

  _getTitleColor(int index) {
    if (index == 6) {
      return SpendItColors.errorColor;
    }

    return SpendItColors.primaryColor;
  }
}

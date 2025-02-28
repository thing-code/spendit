import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:spendit/src/common/common.dart';

class COSDateTimeInput extends COSTextInput<DateTime> {
  COSDateTimeInput({super.key, required super.control, super.validationMessages, super.label})
    : super(
        hint: 'Choose Date',
        prefixIcon: Icon(SolarIconsOutline.calendarMark),
        selectable: false,
        keyboardType: TextInputType.none,
        valueAccessor: DateTimeValueAccessor(dateTimeFormat: DateFormat('dd MMM yyyy')),
        onTap: (ctrl, ctx) async {
          final date = await showModalBottomSheet<DateTime>(
            context: ctx,
            constraints: BoxConstraints(maxHeight: .4.sh),
            builder: (context) => COSDateTimePicker(),
          );
          ctrl.updateValue(date);
        },
      );
}

class COSDateTimePicker extends StatelessWidget {
  const COSDateTimePicker({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<DateTime?> date = ValueNotifier(now);
    return Container(
      constraints: BoxConstraints(maxHeight: .4.sh, maxWidth: 1.sw),
      padding: EdgeInsets.all(20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Select Date', style: kSemiBoldTextStyle.copyWith(fontSize: 16.sp)),
              GestureDetector(onTap: () => context.pop(), child: Icon(Icons.close)),
            ],
          ),
          SizedBox(
            height: .22.sh,
            width: 1.sw,
            child: CupertinoDatePicker(
              initialDateTime: now,
              minimumDate: DateTime(now.year, now.month - 2),
              maximumDate: now,
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (value) {
                date.value = value;
              },
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: IconButton.filled(
              onPressed: () => context.pop(date.value),
              icon: Icon(Icons.check),
            ),
          ),
        ],
      ),
    );
  }
}

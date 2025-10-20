import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:spendit/src/core/core.dart';

class IncomeCategoryInput extends SiBaseInput<IncomeCategory> {
  IncomeCategoryInput({
    super.key,
    required super.control,
    super.label,
    ValueChanged<IncomeCategory?>? onChanged,
  }) : super(
         readOnly: true,
         valueAccessor: IncomeCategoryValueAccessor(),
         suffixIcon: Icon(SolarIconsOutline.altArrowDown),
         onTap: (ctrl, context) async {
           final selected = await _showOptions(context, control);

           if (selected != null) {
             control.updateValue(selected);
             onChanged?.call(selected);
           }
         },
         inputType: TextInputType.none,
         placeholder: 'Select Income Category',
       );

  static Future<IncomeCategory?> _showOptions(
    BuildContext context,
    FormControl<IncomeCategory> control,
  ) {
    return SiBottomSheet<IncomeCategory>(context).show(
      showIndicator: true,
      showCloseButton: false,
      title: Text('Select Income Category'),
      builder: (close) {
        return ReactiveValueListenableBuilder(
          formControl: control,
          builder: (context, _, _) => Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              spacing: 8,
              children: IncomeCategory.values
                  .map(
                    (category) => GestureDetector(
                      onTap: () => close(category),
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: control.value == category
                                ? SiColors.secondary
                                : SiColors.grayscale2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          spacing: 8,
                          children: [
                            Text(
                              category.title,
                              style: context.textTheme.bodyLarge,
                            ),
                            if (control.value == category)
                              Icon(
                                SolarIconsOutline.unread,
                                size: 16,
                                color: SiColors.secondary,
                              ),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}

class IncomeCategoryValueAccessor
    extends ControlValueAccessor<IncomeCategory, String> {
  @override
  String? modelToViewValue(IncomeCategory? modelValue) {
    if (modelValue == null) return '';
    return modelValue.title;
  }

  @override
  IncomeCategory? viewToModelValue(String? viewValue) => null;
}

class ExpenseCategoryInput extends SiBaseInput<ExpenseCategory> {
  ExpenseCategoryInput({
    super.key,
    required super.control,
    super.label,
    ValueChanged<ExpenseCategory?>? onChanged,
  }) : super(
         readOnly: true,
         valueAccessor: ExpenseCategoryValueAccessor(),
         suffixIcon: Icon(SolarIconsOutline.altArrowDown),
         onTap: (ctrl, context) async {
           final selected = await _showOptions(context, control);

           if (selected != null) {
             control.updateValue(selected);
             onChanged?.call(selected);
           }
         },
         inputType: TextInputType.none,
         placeholder: 'Select Expense Category',
       );

  static Future<ExpenseCategory?> _showOptions(
    BuildContext context,
    FormControl<ExpenseCategory> control,
  ) {
    return SiBottomSheet<ExpenseCategory>(context).show(
      showIndicator: true,
      showCloseButton: false,
      title: Text('Select Expense Category'),
      builder: (close) {
        return ReactiveValueListenableBuilder(
          formControl: control,
          builder: (context, _, _) => Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              spacing: 8,
              children: ExpenseCategory.values
                  .map(
                    (category) => GestureDetector(
                      onTap: () => close(category),
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: control.value == category
                                ? SiColors.secondary
                                : SiColors.grayscale2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          spacing: 8,
                          children: [
                            Text(
                              category.title,
                              style: context.textTheme.bodyLarge,
                            ),
                            if (control.value == category)
                              Icon(
                                SolarIconsOutline.unread,
                                size: 16,
                                color: SiColors.secondary,
                              ),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}

class ExpenseCategoryValueAccessor
    extends ControlValueAccessor<ExpenseCategory, String> {
  @override
  String? modelToViewValue(ExpenseCategory? modelValue) {
    if (modelValue == null) return '';
    return modelValue.title;
  }

  @override
  ExpenseCategory? viewToModelValue(String? viewValue) => null;
}

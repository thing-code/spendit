import '../../../../common/common.dart';
import '../../../../common/widgets/inputs/datetime_input.dart';
import '../providers/saving.dart';

part 'saving_form.g.dart';

@riverpod
SavingFormGroup savingFg(Ref ref) {
  return SavingFormGroup();
}

class SavingFormGroup extends FormGroup {
  SavingFormGroup()
    : super({
        'amount': FormControl<String>(validators: [Validators.required]),
        'date': FormControl<DateTime>(validators: [Validators.required]),
      });

  FormControl<String> get amount => control('amount') as FormControl<String>;
  FormControl<DateTime> get date => control('date') as FormControl<DateTime>;

  Saving convert() {
    return Saving(value: amount.value!.parseThousand, date: date.value!);
  }
}

class SavingForm extends ConsumerWidget {
  const SavingForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fg = ref.watch(savingFgProvider);
    return COSBottomSheetWrapper(
      title: 'Add Saving',
      onSave: () async {
        fg.markAllAsTouched();
        if (fg.valid) {
          final created = await ref.read(savingStateProvider.notifier).add(fg.convert());
          if (created && context.mounted) {
            context.pop();
            COSSnackBar.success(context, message: 'New saving has been created.');
          }
        }
      },
      child: ReactiveForm(
        formGroup: fg,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            spacing: 16.h,
            children: [
              COSNumberInput(
                control: fg.amount,
                label: 'Saving Amount',
                hint: 'Amount',
                prefixIcon: Icon(SolarIconsOutline.walletMoney),
                validationMessages: {
                  ValidationMessage.required: (_) => "Saving amount is required.",
                },
              ),
              COSDateTimeInput(
                control: fg.date,
                label: 'Saving Date',
                validationMessages: {ValidationMessage.required: (_) => "Saving date is required."},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

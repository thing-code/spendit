import '../../../../common/common.dart';
import '../providers/funds.dart';
import '../providers/goals.dart';
import 'funds_history.dart';

part 'funds_form.g.dart';

@riverpod
FundsFormGroup fundsFg(Ref ref) {
  return FundsFormGroup();
}

class FundsFormGroup extends FormGroup {
  FundsFormGroup()
    : super({
        'fund': FormControl<String>(validators: [Validators.required]),
      });

  FormControl<String> get fund => control('fund') as FormControl<String>;

  Funds convert(int id) => Funds(value: fund.value!.parseThousand, date: now, goalsId: id);
}

class FundsForm extends ConsumerWidget {
  const FundsForm(this.goals, {super.key});

  final Goals goals;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fg = ref.watch(fundsFgProvider);

    return COSBottomSheetWrapper(
      title: 'Add Funds',
      onSave: () async {
        fg.markAllAsTouched();
        if (fg.valid) {
          final updatedGoals = goals.copyWith(
            progress: goals.progress + fg.fund.value!.parseThousand,
          );
          final funds = fg.convert(goals.id!);
          final fundsAdded = await ref.read(goalsStateProvider.notifier).edit(updatedGoals);
          final recorded = await ref.read(fundsStateProvider(goals.id!).notifier).add(funds);

          if (fundsAdded && recorded && context.mounted) {
            context.pop(true);
            COSSnackBar.success(context, message: 'New funds has been added to ${goals.name}.');
          }
        }
      },
      child: ReactiveForm(
        formGroup: fg,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: COSNumberInput(
                control: fg.fund,
                label: 'Funds',
                hint: 'Amount of funds',
                prefixIcon: Icon(SolarIconsOutline.handMoney),
                validationMessages: {
                  ValidationMessage.required: (_) => 'Funds amount is required.',
                },
              ),
            ),
            24.verticalSpace,
            Text('Fund History', style: kMediumTextStyle.copyWith(fontSize: 14.sp)),
            Padding(padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 0), child: Divider(height: 1)),
            Expanded(child: FundsHistory(goals.id!)),
          ],
        ),
      ),
    );
  }
}

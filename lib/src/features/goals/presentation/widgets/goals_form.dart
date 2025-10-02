import 'package:spendit/src/features/goals/presentation/providers/goals.dart';

import '../../../../common/common.dart';
import '../../../../common/widgets/inputs/datetime_input.dart';

part 'goals_form.g.dart';

@riverpod
GoalsFormGroup goalsFg(Ref ref, {Goals? goals}) {
  return GoalsFormGroup(goals);
}

class GoalsFormGroup extends FormGroup {
  final Goals? goals;

  GoalsFormGroup(this.goals)
    : super({
        'name': FormControl<String>(value: goals?.name, validators: [Validators.required]),
        'target': FormControl<String>(
          value: goals?.target.thousand,
          validators: [Validators.required],
        ),
        'deadline': FormControl<DateTime>(
          value: goals?.deadline,
          validators: [Validators.required],
        ),
      });

  FormControl<String> get name => control('name') as FormControl<String>;
  FormControl<String> get target => control('target') as FormControl<String>;
  FormControl<DateTime> get deadline => control('deadline') as FormControl<DateTime>;

  Goals convert() =>
      Goals(name: name.value!, target: target.value!.parseThousand, deadline: deadline.value!);
}

class GoalsForm extends ConsumerWidget {
  const GoalsForm({super.key, this.goals});

  final Goals? goals;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fg = ref.watch(GoalsFgProvider(goals: goals));
    return COSBottomSheetWrapper(
      title: goals == null ? 'Create New Goals' : 'Update Goals',
      onSave: () {
        fg.markAllAsTouched();
        if (fg.valid) {
          final g = fg.convert();
          context.pop(g);
        }
      },
      child: ReactiveForm(
        formGroup: fg,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 12.h,
            children: [
              COSTextInput(
                control: fg.name,
                label: 'Name',
                hint: 'Your goals name',
                prefixIcon: Icon(SolarIconsOutline.flag_2),
                validationMessages: {ValidationMessage.required: (_) => 'Name is required.'},
              ),
              COSDateTimeInput(
                control: fg.deadline,
                label: 'Deadline',
                maxDate: DateTime(2050, 12, 31),
                validationMessages: {ValidationMessage.required: (_) => 'Deadline is required.'},
              ),
              COSNumberInput(
                control: fg.target,
                label: 'Target',
                hint: 'Your goals target',
                prefixIcon: Icon(SolarIconsOutline.dollarMinimalistic),
                validationMessages: {ValidationMessage.required: (_) => 'Target is required.'},
              ),
              if (goals != null)
                Container(
                  width: 1.sw,
                  padding: EdgeInsets.only(top: 8.h),
                  child: FilledButton.icon(
                    onPressed: () async {
                      final deleted = await ref.read(goalsStateProvider.notifier).remove(goals!);
                      if (deleted && context.mounted) {
                        context.pop();
                        COSSnackBar.success(context, message: '${goals!.name} has been removed.');
                      }
                    },
                    label: Text('Remove'),
                    icon: Icon(SolarIconsBold.trashBin2),
                    style: FilledButton.styleFrom(backgroundColor: context.colorScheme.error),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

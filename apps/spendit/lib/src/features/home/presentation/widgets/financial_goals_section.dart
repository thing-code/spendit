import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:spendit/src/features/financial_goals/domain/models/financial_goal_model.dart';
import 'package:spendit/src/features/financial_goals/presentation/controllers/financial_goals_controller.dart';
import 'package:spendit/src/features/financial_goals/presentation/widgets/financial_goal_card.dart';
import 'package:spendit_core/spendit_core.dart';

class FinancialGoalsSection extends ConsumerWidget {
  const FinancialGoalsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final financialGoals = ref.watch(financialGoalsControllerProvider);
    return switch (financialGoals) {
      AsyncData(:final value) => _FinancialGoalsData(financialGoals: value),
      AsyncError(:final error) => _FinancialGoalsError(error: error),
      _ => _FinancialGoalsLoading(),
    };
  }
}

class _FinancialGoalsLoading extends StatelessWidget {
  _FinancialGoalsLoading();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(child: const Placeholder());
  }

  final card = FinancialGoalCard(
    goal: FinancialGoalModel(name: 'Aerox Alpha', targetAmount: 32000000),
  );
}

class _FinancialGoalsData extends StatelessWidget {
  const _FinancialGoalsData({required this.financialGoals});

  final List<FinancialGoalModel> financialGoals;

  @override
  Widget build(BuildContext context) {
    return financialGoals.isEmpty
        ? buildEmpty()
        : SliverList.separated(
            itemBuilder: (context, index) => FinancialGoalCard(goal: financialGoals[index]),
            separatorBuilder: (context, index) => Gap(8),
            itemCount: 5,
          );
  }

  Widget buildEmpty() {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        spacing: 12,
        children: [
          Icon(IconsaxPlusBold.note_remove, color: SIColors.text, size: 48),
          Text(
            'Belum ada rencana keuangan.',
            style: SITextStyles.regular.copyWith(color: SIColors.text),
          ),
        ],
      ),
    );
  }
}

class _FinancialGoalsError extends StatelessWidget {
  const _FinancialGoalsError({required this.error});

  final Object error;

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(child: const Placeholder());
  }
}

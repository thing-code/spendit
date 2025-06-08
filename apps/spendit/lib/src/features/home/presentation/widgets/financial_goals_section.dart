import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spendit/src/features/financial_goals/domain/models/financial_goal_model.dart';
import 'package:spendit/src/features/financial_goals/presentation/controllers/financial_goals_controller.dart';

class FinancialGoalsSection extends ConsumerWidget {
  const FinancialGoalsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final financialGoals = ref.watch(financialGoalsControllerProvider);
    return switch (financialGoals) {
      AsyncData(:final value) => _FinancialGoalsData(financialGoals: value),
      AsyncError(:final error) => Container(),
      _ => _FinancialGoalsLoading(),
    };
  }
}

class _FinancialGoalsLoading extends StatelessWidget {
  const _FinancialGoalsLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _FinancialGoalsData extends StatelessWidget {
  const _FinancialGoalsData({super.key, required this.financialGoals});

  final List<FinancialGoalModel> financialGoals;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

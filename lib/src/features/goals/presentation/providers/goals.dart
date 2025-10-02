import '../../../../common/common.dart';
import '../../data/repository/goals_repository_impl.dart';

part 'goals.g.dart';

@riverpod
class GoalsState extends _$GoalsState {
  @override
  FutureOr<List<Goals>> build() async {
    final result = await ref.read(goalsRepositoryProvider).read();
    return result.r;
  }

  Future<bool> add(Goals goals) async {
    final result = await ref.read(goalsRepositoryProvider).create(goals);
    ref.invalidateSelf();
    return result.r != null;
  }
  Future<bool> edit(Goals goals) async {
    final result = await ref.read(goalsRepositoryProvider).update(goals);
    ref.invalidateSelf();
    return result.r != null;
  }
  Future<bool> remove(Goals goals) async {
    final result = await ref.read(goalsRepositoryProvider).delete(goals);
    ref.invalidateSelf();
    return result.r != null;
  }
}

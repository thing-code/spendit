import '../../../../common/common.dart';
import '../../domain/repository/goals_repository.dart';
import '../datasource/goals_datasource.dart';

part 'goals_repository_impl.g.dart';

@riverpod
GoalsRepository goalsRepository(Ref ref) {
  final datasource = ref.watch(goalsDatasourceProvider);
  return GoalsRepositoryImpl(datasource);
}

class GoalsRepositoryImpl implements GoalsRepository {
  final GoalsDatasource datasource;

  GoalsRepositoryImpl(this.datasource);

  @override
  Future<({String? e, int? r})> create(Goals value) async {
    try {
      final res = await datasource.create(value);
      return (e: null, r: res);
    } catch (e) {
      return (e: e.toString(), r: null);
    }
  }

  @override
  Future<({String? e, int? r})> delete(Goals value) async {
    try {
      final res = await datasource.delete(value);
      return (e: null, r: res);
    } catch (e) {
      return (e: e.toString(), r: null);
    }
  }

  @override
  Future<({String? e, List<Goals> r})> read() async {
    try {
      final res = await datasource.read();
      return (e: null, r: res);
    } catch (e) {
      return (e: e.toString(), r: <Goals>[]);
    }
  }

  @override
  Future<({String? e, int? r})> update(Goals value) async {
    try {
      final res = await datasource.update(value);
      return (e: null, r: res);
    } catch (e) {
      return (e: e.toString(), r: null);
    }
  }
}

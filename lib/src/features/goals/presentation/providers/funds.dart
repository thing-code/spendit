import '../../../../common/common.dart';
import '../../data/repository/funds_repository_impl.dart';

part 'funds.g.dart';

@riverpod
class FundsState extends _$FundsState {
  @override
  FutureOr<List<Funds>> build(int id) async {
    final result = await ref.read(fundsRepositoryProvider).read(id);
    return result.r;
  }

  Future<bool> add(Funds funds) async {
    final result = await ref.read(fundsRepositoryProvider).create(funds);
    ref.invalidateSelf();
    return result.r != null;
  }
}

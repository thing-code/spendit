import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spendit/src/common/common.dart';
import 'package:spendit/src/features/saving/data/repository/saving_repository_impl.dart';

part 'saving.g.dart';

@Riverpod(keepAlive: true)
class SavingState extends _$SavingState {
  @override
  FutureOr<List<Saving>> build({DateTime? date}) async {
    if (date != null) {
      final result = await ref.read(savingRepositoryProvider).readByMonth(date);
      return result.fold((l) => [], (r) => r);
    }
    final result = await ref.read(savingRepositoryProvider).read();
    return result.fold((l) => [], (r) => r);
  }

  Future<bool> add(Saving saving) async {
    final result = await ref.read(savingRepositoryProvider).create(saving);
    ref.invalidateSelf();
    return result.fold((l) => false, (r) => true);
  }

  Future<bool> edit(Saving saving) async {
    final result = await ref.read(savingRepositoryProvider).update(saving);
    ref.invalidateSelf();
    return result.fold((l) => false, (r) => true);
  }

  Future<bool> delete(Saving saving) async {
    final result = await ref.read(savingRepositoryProvider).delete(saving);
    ref.invalidateSelf();
    return result.fold((l) => false, (r) => true);
  }
}


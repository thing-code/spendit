import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spendit/src/common/common.dart';
import 'package:spendit/src/features/saving/data/repository/saving_repository_impl.dart';

part 'saving.g.dart';

@Riverpod(keepAlive: true)
class Saving extends _$Saving {
  @override
  FutureOr<List<SavingModel>> build() async {
    final result = await ref.read(savingRepositoryProvider).read();
    return result.fold((l) => [], (r) => r);
  }

  Future<bool> add(SavingModel saving) async {
    final result = await ref.read(savingRepositoryProvider).create(saving);
    ref.invalidateSelf();
    return result.fold((l) => false, (r) => true);
  }

  Future<bool> edit(SavingModel saving) async {
    final result = await ref.read(savingRepositoryProvider).update(saving);
    ref.invalidateSelf();
    return result.fold((l) => false, (r) => true);
  }

  Future<bool> delete(SavingModel saving) async {
    final result = await ref.read(savingRepositoryProvider).delete(saving);
    ref.invalidateSelf();
    return result.fold((l) => false, (r) => true);
  }
}

@Riverpod(keepAlive: true)
class PlannedSaving extends _$PlannedSaving {
  @override
  double? build() {
    return ref.watch(plannedSavingRepositoryProvider).value;
  }

  void save(double val) {
    ref.read(plannedSavingRepositoryProvider).save(val);
    ref.invalidateSelf();
  }
}

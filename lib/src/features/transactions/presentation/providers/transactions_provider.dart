import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/transactions_repository.dart';
import '../../domain/models/models.dart';

part 'transactions_provider.g.dart';

@riverpod
FutureOr<List<Transactions>> transactions(Ref ref) {
  final repository = ref.watch(transactionsRepositoryProvider);

  return repository.readAll();
}

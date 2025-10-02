import '../../../../common/common.dart';
import '../../domain/repository/funds_repository.dart';
import '../datasource/funds_datasource.dart';

part 'funds_repository_impl.g.dart';

@riverpod
FundsRepository fundsRepository(Ref ref) {
  final datasource = ref.watch(fundsDatasourceProvider);
  return FundsRepositoryImpl(datasource);
}

class FundsRepositoryImpl implements FundsRepository {
  final FundsDatasource datasource;

  FundsRepositoryImpl(this.datasource);

  @override
  Future<({String? e, int? r})> create(Funds value) async {
    try {
      final result = await datasource.create(value);
      return (e: null, r: result);
    } catch (e) {
      return (e: e.toString(), r: null);
    }
  }

  @override
  Future<({String? e, List<Funds> r})> read(int id) async {
    try {
      final result = await datasource.read(id);
      return (e: null, r: result);
    } catch (e) {
      return (e: e.toString(), r: <Funds>[]);
    }
  }
}

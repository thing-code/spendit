import 'package:spendit/src/common/common.dart';

abstract class FundsRepository {
  Future<({String? e, List<Funds> r})> read(int id);
  Future<({String? e, int? r})> create(Funds value);
}

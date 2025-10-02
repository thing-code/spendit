import '../../../../common/common.dart';

abstract class GoalsRepository {
  Future<({String? e, int? r})> create(Goals value);
  Future<({String? e, int? r})> update(Goals value);
  Future<({String? e, int? r})> delete(Goals value);
  Future<({String? e, List<Goals> r})> read();
}

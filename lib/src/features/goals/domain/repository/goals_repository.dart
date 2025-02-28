import '../../../../common/common.dart';

abstract class GoalsRepository {
  Future<({String? e, int? r})> create(Goals goals);
  Future<({String? e, int? r})> update(Goals goals);
  Future<({String? e, int? r})> delete(Goals goals);
  Future<({String? e, List<Goals> r})> read();
}

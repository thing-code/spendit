import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:native_storage/native_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'planned_saving_datasource.g.dart';

@riverpod
PlannedSavingDatasource plannedSavingDataSource(Ref ref) {
  return PlannedSavingDatasource();
}

class PlannedSavingDatasource {
  final _storage = NativeStorage();

  final _key = 'planned-saving';

  double? get value {
    final stored = _storage.read(_key);
    return stored == null ? null : double.parse(stored);
  }

  void save(double val) {
    _storage.write(_key, value.toString());
  }
}

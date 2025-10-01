import 'package:spendit/src/features/transactions/domain/models/models.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class BaseTransactionSource {
  Future<bool> create(Transaction req);
  Future<bool> update(Transaction req);
  Future<bool> delete(String id);
  Future<List<Transaction>> read();
}

class TransactionSource extends BaseTransactionSource {
  final SupabaseClient client;

  TransactionSource(this.client);

  @override
  Future<bool> create(Transaction req) async {
    final response = await client
        .from('transactions')
        .upsert(req.toJson())
        .select();
    return response.isNotEmpty;
  }

  @override
  Future<bool> delete(String id) async {
    final response = await client
        .from('transactions')
        .delete()
        .eq('id', id)
        .select();
    return response.isNotEmpty;
  }

  @override
  Future<List<Transaction>> read() async {
    // TODO: implement read
    throw UnimplementedError();
  }

  @override
  Future<bool> update(Transaction req) async {
    // TODO: implement update
    throw UnimplementedError();
  }
}

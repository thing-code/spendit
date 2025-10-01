import 'package:mock_supabase_http_client/mock_supabase_http_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'supabase.g.dart';

@riverpod
SupabaseClient client(Ref ref) {
  return Supabase.instance.client;
}

@riverpod
GoTrueClient auth(Ref ref) {
  return ref.watch(clientProvider).auth;
}

final mockSupabaseClient = SupabaseClient(
  'https:sofhaosdos.coshfsodssdosjdosc.com',
  'ocsjodasfosjfsodsdosdsjf',
  httpClient: MockSupabaseHttpClient(),
);

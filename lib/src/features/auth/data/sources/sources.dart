import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spendit/src/core/common.dart';
import 'package:spendit/src/features/profiles/domain/models/models.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'sources.g.dart';

@riverpod
AuthSource authSource(Ref ref) {
  final client = ref.watch(clientProvider);
  return AuthSource(client);
}

class AuthSource {
  final SupabaseClient client;

  AuthSource(this.client);

  Future<bool> login(String email, String password) async {
    try {
      final response = await client.auth.signInWithPassword(
        password: password,
        email: email,
      );
      return response.user != null;
    } catch (e) {
      return false;
    }
  }

  Future<bool> register(String name, String email, String password) async {
    try {
      final response = await client.auth.signUp(
        password: password,
        email: email,
        data: {'display_name': name},
      );

      debugPrint(response.toString());

      if (response.user == null) return false;

      final profile = Profile(
        name: name,
        email: email,
        createdAt: DateTime.now(),
        userId: response.user!.id,
      );

      await client.from('profiles').upsert(profile.toJson());
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  Future<void> logout() async {
    await client.auth.signOut();
  }
}

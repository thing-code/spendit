import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spendit/src/features/auth/data/sources/sources.dart';

part 'repositories.g.dart';

@riverpod
BaseAuthRepository authRepository(Ref ref) {
  final source = ref.watch(authSourceProvider);
  return AuthRepository(source);
}

abstract class BaseAuthRepository {
  Future<bool> login(String email, String password);
  Future<bool> register(String email, String password, String name);
  Future<void> logout();
}

class AuthRepository extends BaseAuthRepository {
  final AuthSource source;

  AuthRepository(this.source);

  @override
  Future<bool> login(String email, String password) {
    return source.login(email, password);
  }

  @override
  Future<bool> register(String email, String password, String name) {
    return source.register(name, email, password);
  }

  @override
  Future<void> logout() async {
    await source.logout();
  }
}

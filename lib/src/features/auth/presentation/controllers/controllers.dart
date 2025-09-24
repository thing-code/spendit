import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spendit/src/features/auth/data/repositories/repositories.dart';
import 'package:spendit/src/features/auth/domain/forms/forms.dart';

part 'controllers.g.dart';

@riverpod
FutureOr<bool> login(Ref ref) async {
  final form = ref.watch(loginFormProvider);

  final email = form.email.value;
  final password = form.password.value;

  if (email == null || password == null) return false;

  final result = await ref.read(authRepositoryProvider).login(email, password);

  return result;
}

@riverpod
FutureOr<bool> register(Ref ref) async {
  final form = ref.watch(registerFormProvider);

  final email = form.email.value;
  final password = form.password.value;
  final name = form.name.value;

  if (email == null || password == null || name == null) return false;

  final result = await ref
      .read(authRepositoryProvider)
      .register(email, password, name);

  return result;
}

@riverpod
class ShowPassword extends _$ShowPassword {
  @override
  bool build() => false;

  void toggle() {
    state = !state;
  }
}

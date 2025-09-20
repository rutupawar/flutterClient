import 'package:client/features/auth/model/user_md.dart';
import 'package:client/features/auth/repositories/auth_remote_repository.dart'
    as auth_remote_repository;
import 'package:fpdart/fpdart.dart' as fp;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_viewmodel.g.dart';

@riverpod
class AuthViewModel extends _$AuthViewModel {
  final auth_remote_repository.AuthRemoteRepository _authRemoteRepository =
      auth_remote_repository.AuthRemoteRepository();

  @override
  AsyncValue<UserMd>? build() {
    return null;
  }

  Future<void> signupUser({
    required String name,
    required String email,
    required String password,
  }) async {
    final res = await _authRemoteRepository.signup(
      email: email,
      password: password,
      name: name,
    );
    final val = switch (res) {
      fp.Left(value: final l) => l,
      fp.Right(value: final r) => r.name,
    };

    print(val);
  }
}

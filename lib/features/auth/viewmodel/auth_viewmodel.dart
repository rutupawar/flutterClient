import 'package:client/features/auth/model/user_md.dart';
import 'package:client/features/auth/repositories/auth_remote_repository.dart'
    as auth_remote_repository;
import 'package:fpdart/fpdart.dart' as fp;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_viewmodel.g.dart';

@riverpod
class AuthViewModel extends _$AuthViewModel {
  late auth_remote_repository.AuthRemoteRepository _authRemoteRepository =
      auth_remote_repository.AuthRemoteRepository();

  @override
  AsyncValue<UserMd>? build() {
    _authRemoteRepository = ref.watch(
      auth_remote_repository.authRemoteRepositoryProvider,
    );
    return null;
  }

  Future<void> signUpUser({
    required String name,
    required String email,
    required String password,
  }) async {
    state = const AsyncValue.loading();
    final res = await _authRemoteRepository.signup(
      email: email,
      password: password,
      name: name,
    );
    final val = switch (res) {
      fp.Left(value: final l) => state = AsyncValue.error(
        l.message,
        StackTrace.current,
      ),
      fp.Right(value: final r) => state = AsyncValue.data(r),
    };

    print(val);
  }

  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    state = const AsyncValue.loading();
    final res = await _authRemoteRepository.login(
      email: email,
      password: password,
    );
    final val = switch (res) {
      fp.Left(value: final l) => state = AsyncValue.error(
        l.message,
        StackTrace.current,
      ),
      fp.Right(value: final r) => state = AsyncValue.data(r),
    };

    print(val);
  }
}

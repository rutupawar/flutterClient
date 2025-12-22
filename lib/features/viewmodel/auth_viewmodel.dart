import 'package:client/features/model/user_md.dart' as user_md;
import 'package:client/features/repositories/auth_local_repository.dart'
    as auth_local_repository;
import 'package:client/features/repositories/auth_remote_repository.dart'
    as auth_remote_repository;
import 'package:fpdart/fpdart.dart' as fp;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_viewmodel.g.dart';

@riverpod
class AuthViewModel extends _$AuthViewModel {
  late auth_remote_repository.AuthRemoteRepository _authRemoteRepository;

  late auth_local_repository.AuthLocalRepository _authLocalRepository;

  @override
  AsyncValue<user_md.UserMd>? build() {
    _authRemoteRepository = ref.watch(
      auth_remote_repository.authRemoteRepositoryProvider,
    );

    _authLocalRepository = ref.watch(
      auth_local_repository.authRemoteRepositoryProvider,
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
      fp.Right(value: final r) => state = _loginSuccess(r),
    };

    print(val);
  }

  AsyncValue<user_md.UserMd>? _loginSuccess(user_md.UserMd user) {
    _authLocalRepository.setToken(user.token);
    return state = AsyncValue.data(user);
  }
}

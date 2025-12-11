import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart'
    as shared_preferences;

part 'auth_local_repository.g.dart';

@riverpod
AuthLocalRepository authRemoteRepository(Ref ref) {
  return AuthLocalRepository();
}

class AuthLocalRepository {
  late shared_preferences.SharedPreferences _sharedPreferences;

  Future<void> init() async {
    _sharedPreferences =
        await shared_preferences.SharedPreferences.getInstance();
  }

  void setToken(String? token) {
    if (token != null && token.isNotEmpty) {
      _sharedPreferences.setString('x-auth-token', token);
    }
  }

  String? getToken() {
    return _sharedPreferences.getString('x-auth-token');
  }
}

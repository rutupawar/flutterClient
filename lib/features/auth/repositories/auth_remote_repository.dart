import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:http/http.dart' as http;

class AuthRemoteRepository {
  static Future<void> login({
    required String name,
    required String email,
    required String password,
  }) async {
    firebase_auth.UserCredential userCredential = await firebase_auth
        .FirebaseAuth
        .instance
        .signInWithEmailAndPassword(email: email, password: password);
    print(userCredential);
  }

  Future<void> signup() async {}
}

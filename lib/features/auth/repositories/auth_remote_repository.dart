import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
// import 'package:http/http.dart' as http;

class AuthRemoteRepository {
  static Future<void> login({
    required String email,
    required String password,
  }) async {
    firebase_auth.UserCredential userCredential = await firebase_auth
        .FirebaseAuth
        .instance
        .signInWithEmailAndPassword(email: email, password: password);

    firebase_auth.User? user = userCredential.user;

    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification(); // optional resend
      throw Exception("Please verify your email first.");
    }
  }

  static Future<void> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    firebase_auth.UserCredential userCredential = await firebase_auth
        .FirebaseAuth
        .instance
        .createUserWithEmailAndPassword(email: email, password: password);

    // Send email verification
    if (!userCredential.user!.emailVerified) {
      await userCredential.user!.sendEmailVerification();
    }
  }
}

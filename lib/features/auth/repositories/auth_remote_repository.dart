import 'package:client/features/auth/model/failures/failure.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:fpdart/fpdart.dart' as fp;
import 'package:client/features/auth/model/user_md.dart';

class AuthRemoteRepository {
  static Future<fp.Either<AppFailure, UserMd>> login({
    required String email,
    required String password,
  }) async {
    try {
      firebase_auth.UserCredential userCredential = await firebase_auth
          .FirebaseAuth
          .instance
          .signInWithEmailAndPassword(email: email, password: password);

      firebase_auth.User? user = userCredential.user;

      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification(); // optional resend
      }

      return fp.Right(
        UserMd(
          name: user?.displayName ?? 'No Name',
          email: user?.email ?? 'No Email',
          id: user?.uid ?? 'No ID',
        ),
      );
      //
    } on Exception catch (e) {
      return fp.Left(AppFailure(message: e.toString()));
    }
  }

  static Future<fp.Either<AppFailure, UserMd>> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      firebase_auth.UserCredential userCredential = await firebase_auth
          .FirebaseAuth
          .instance
          .createUserWithEmailAndPassword(email: email, password: password);

      // Send email verification
      if (!userCredential.user!.emailVerified) {
        await userCredential.user!.sendEmailVerification();
      }
      return fp.Right(
        UserMd(
          name: name,
          email: userCredential.user?.email ?? 'No Email',
          id: userCredential.user?.uid ?? 'No ID',
        ),
      );
    } on Exception catch (e) {
      return fp.Left(AppFailure(message: e.toString()));
    }
  }
}

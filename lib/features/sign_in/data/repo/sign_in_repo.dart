import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInRepo {
  Future<Either<String, String>> signIn(
      {required String email, required String password}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return right('Success login');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return left('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        return left('Wrong password provided for that user.');
      } else {
        return left('Something went Wrong');
      }
    }
  }
}

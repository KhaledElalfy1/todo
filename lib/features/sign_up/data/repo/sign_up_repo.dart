import 'package:firebase_auth/firebase_auth.dart';

class SignUpRepo {
  Future<void> signIn({required String email, required String password}) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}

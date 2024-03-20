import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ResetPasswordRepo {
  Future<Either<String, String>> resetPassword({required String email}) async {
    if (email.isNotEmpty) {
      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
        return right('go to Your email to reset your password');
      } catch (e) {
        return left(e.toString());
      }
    } else {
      return left('this field can\'t be empty ');
    }
  }
}

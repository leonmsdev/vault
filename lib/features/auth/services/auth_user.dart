import 'package:firebase_auth/firebase_auth.dart' show User;

//defines the model class of the AuthUser.

class AuthUser {
  final bool isEmailVerified;
  final String? email;

  const AuthUser({required this.email, required this.isEmailVerified});

  //create Auth user from firebase logic
  factory AuthUser.fromFirebase(User user) => AuthUser(
        isEmailVerified: user.emailVerified,
        email: user.email,
      );
}

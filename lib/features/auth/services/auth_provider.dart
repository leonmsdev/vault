import 'auth_user.dart';

//holds abtract class of auth provider, defines all the
//functions that Auth Provider should execute with the AuthUser.
abstract class AuthProvider {
  AuthUser? get currentUser;
  String? get email;

  Future<void> initialize();

  Future<AuthUser> signIn({
    required String email,
    required String password,
  });

  Future<AuthUser> registerUser({
    required String email,
    required String password,
  });

  Future<void> signOut();
}

import 'package:firebase_auth/firebase_auth.dart' as firebase;

abstract class AuthRepository {
  Future<firebase.User> signUp(String emailAddress, String password);

  Future<firebase.User> signIn();
}
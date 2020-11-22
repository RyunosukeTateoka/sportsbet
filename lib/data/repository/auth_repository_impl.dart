import 'package:firebase_auth/firebase_auth.dart' as firebase;

import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final firebase.FirebaseAuth _firebaseAuth = firebase.FirebaseAuth.instance;

  @override
  Future<firebase.User> signUp(String emailAddress, String password) async {
    final firebase.UserCredential userCredential =
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password
    );
    final firebase.User signUpUser = userCredential.user;
    return signUpUser;
  }

  @override
  Future<firebase.User> signIn() {
    // TODO: implement signIn
    throw UnimplementedError();
  }
}
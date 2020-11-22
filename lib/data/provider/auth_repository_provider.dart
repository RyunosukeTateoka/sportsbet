import 'package:flutter/material.dart';

import 'package:sportsbet/data/repository/auth_repository.dart';
import 'package:sportsbet/data/repository/auth_repository_impl.dart';

class AuthRepositoryProvider with ChangeNotifier {
  AuthRepository repository;

  void connectRepository(){
    repository = AuthRepositoryImpl();
    notifyListeners();
  }
}
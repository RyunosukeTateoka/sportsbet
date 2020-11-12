import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sportsbet/ui/screens/initLoginSignUpScreen.dart';
import 'package:sportsbet/ui/screens/loginSignUpFormScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sports Bet App',
      home: InitLoginSignUpScreen(),
      routes: <String, WidgetBuilder>{
        '/init': (BuildContext context) => new InitLoginSignUpScreen(),
        '/loginSignUpFormScreen': (BuildContext context) => new LoginSignUpFormScreen()
      },
    );
  }
}


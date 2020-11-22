import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sportsbet/ui/screens/init_login_sign_up_screen.dart';
import 'package:sportsbet/ui/screens/login_sign_up_form_screen.dart';
import 'package:sportsbet/ui/screens/app_bottom_navigation_screens//app_home_screen.dart';

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
        '/loginSignUpFormScreen': (BuildContext context) => new LoginSignUpFormScreen(),
        '/appHomeScreen': (BuildContext context) => new AppBottomNavigationScreens()
      },
    );
  }
}


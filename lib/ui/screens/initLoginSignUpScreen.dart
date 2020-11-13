import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sportsbet/ui/components/loginSignUpBackground.dart';
import 'package:sportsbet/ui/components/button.dart';

class InitLoginSignUpScreen extends StatelessWidget {

  final _loginSignUpBackground = LoginSignUpBackground();
  final BaseButtonOnInitScreen _loginButton = LoginButtonOnInitScreen();
  final BaseButtonOnInitScreen _signUpButton = SignUpButtonOnInitScreen();

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: <Widget>[
          _loginSignUpBackground,
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              width: double.infinity,
              child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(
                        top: 130,
                      ),
                    ),
                    Image.asset('/Users/tateokaryuunosuke/AndroidStudioProjects/sportsbet/images/logo_feluni.png',
                      width: 220,
                      height: 74,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top: 550,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container( color: Colors.transparent, width: 20),
                        _loginButton,
                        _signUpButton,
                        Container( color: Colors.transparent, width: 20),
                      ],
                    ),
                  ]
              ),
            ),
          ),
        ]
    );
  }
}
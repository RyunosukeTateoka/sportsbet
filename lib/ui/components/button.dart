import 'package:flutter/material.dart';
import 'package:sportsbet/assets/color_configuration.dart';


const _loginInitIndex = 0;
const _signUpInitIndex = 1;
const _loginLabel = 'ログイン';
const _signUpLabel = '新規登録';

class BaseButtonOnInitScreen extends StatelessWidget {

  final int initialIndex;
  final String buttonLabel;

  BaseButtonOnInitScreen({this.initialIndex, this.buttonLabel});

  @override
  Widget build(BuildContext context) {
    return Container( color: Colors.transparent, width: 132, height:40,
      child: RaisedButton(
        color: whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          buttonLabel,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        textColor: textOnWhiteButtonColor,
        onPressed: () => Navigator.of(context).pushReplacementNamed("/loginSignUpFormScreen", arguments: initialIndex),
      ),
    );
  }
}

class LoginButtonOnInitScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BaseButtonOnInitScreen(initialIndex: _loginInitIndex, buttonLabel: _loginLabel,);
  }
}

class SignUpButtonOnInitScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseButtonOnInitScreen(
      initialIndex: _signUpInitIndex, buttonLabel: _signUpLabel,);
  }
}
